cmake_minimum_required(VERSION 3.21)
project(opensplat)

set(OPENSPLAT_BUILD_SIMPLE_TRAINER OFF CACHE BOOL "Build simple trainer applications")
set(GPU_RUNTIME "CPU" CACHE STRING "CPU")
set(OPENCV_DIR "OPENCV_DIR-NOTFOUND" CACHE PATH "Path to the OPENCV installation directory")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

# Read version
file(READ "VERSION" APP_VERSION)

# Read git commit
set(GIT_REV "")
execute_process(COMMAND git rev-parse --short HEAD
                WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}" 
                OUTPUT_VARIABLE GIT_REV 
                ERROR_QUIET)
string(REGEX REPLACE "\n$" "" GIT_REV "${GIT_REV}")
if (NOT "${GIT_REV}" STREQUAL "")
    set(DAPP_VERSION "${APP_VERSION} (git commit ${GIT_REV})")
    set(DAPP_REVISION "${GIT_REV}")
else()
    set(DAPP_VERSION "${APP_VERSION}")
    set(DAPP_REVISION "dev")
endif()

message("OpenSplat Version: ${DAPP_VERSION}")
add_compile_options("-DAPP_VERSION=\"${DAPP_VERSION}\"")
add_compile_options("-DAPP_REVISION=\"${DAPP_REVISION}\"")

# Don't complain about the override from NANOFLANN_BUILD_EXAMPLES
set(CMAKE_POLICY_DEFAULT_CMP0077 NEW)
# Use time-of-extraction for FetchContent'ed files modification time
if (CMAKE_VERSION VERSION_GREATER_EQUAL "3.24.0")
    cmake_policy(SET CMP0135 NEW)
endif()
# Suppress warning #20012-D (nvcc and glm)
set(CUDA_NVCC_FLAGS ${CUDA_NVCC_FLAGS} -diag-suppress=20012)

include(FetchContent)
FetchContent_Declare(nlohmann_json
    URL https://github.com/nlohmann/json/archive/refs/tags/v3.11.3.zip
)
set(NANOFLANN_BUILD_EXAMPLES OFF)
set(NANOFLANN_BUILD_TESTS OFF)
FetchContent_Declare(nanoflann
    URL https://github.com/jlblancoc/nanoflann/archive/refs/tags/v1.5.5.zip
)
FetchContent_Declare(cxxopts
    URL https://github.com/jarro2783/cxxopts/archive/refs/tags/v3.2.0.zip
)
FetchContent_MakeAvailable(nlohmann_json nanoflann cxxopts)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build, options are: Debug Release RelWithDebInfo MinSizeRel." FORCE)
endif()

set(GPU_RUNTIME "CPU")

set(CMAKE_CXX_STANDARD 17)

if (NOT WIN32 AND NOT APPLE)
    set(STDPPFS_LIBRARY stdc++fs)
endif()

find_package(Torch REQUIRED)
find_package(OpenCV HINTS "${OPENCV_DIR}" REQUIRED)

set(OpenCV_LIBS opencv_core opencv_imgproc opencv_highgui opencv_calib3d)

set(GSPLAT_LIBS gsplat_cpu)

add_library(gsplat_cpu rasterizer/gsplat-cpu/gsplat_cpu.cpp)
target_include_directories(gsplat_cpu PRIVATE ${TORCH_INCLUDE_DIRS})

add_executable(opensplat opensplat.cpp point_io.cpp nerfstudio.cpp model.cpp kdtree_tensor.cpp spherical_harmonics.cpp cv_utils.cpp utils.cpp project_gaussians.cpp rasterize_gaussians.cpp ssim.cpp optim_scheduler.cpp colmap.cpp opensfm.cpp input_data.cpp tensor_math.cpp)
install(TARGETS opensplat DESTINATION bin)
set_property(TARGET opensplat PROPERTY CXX_STANDARD 17)
target_include_directories(opensplat PRIVATE
    ${PROJECT_SOURCE_DIR}/rasterizer
)
target_link_libraries(opensplat PUBLIC ${STDPPFS_LIBRARY} ${GSPLAT_LIBS} ${TORCH_LIBRARIES} ${OpenCV_LIBS})
target_link_libraries(opensplat PRIVATE
    nlohmann_json::nlohmann_json
    cxxopts::cxxopts
    nanoflann::nanoflann
)
if (NOT WIN32)
    target_link_libraries(opensplat PUBLIC pthread)
endif()

if(OPENSPLAT_BUILD_SIMPLE_TRAINER)
    add_executable(simple_trainer simple_trainer.cpp project_gaussians.cpp rasterize_gaussians.cpp cv_utils.cpp)
    install(TARGETS simple_trainer DESTINATION bin)
    target_include_directories(simple_trainer PRIVATE
        ${PROJECT_SOURCE_DIR}/rasterizer
    )
    target_link_libraries(simple_trainer PUBLIC ${GSPLAT_LIBS} ${TORCH_LIBRARIES} ${OpenCV_LIBS})
    target_link_libraries(simple_trainer PRIVATE
        nlohmann_json::nlohmann_json
        cxxopts::cxxopts
        nanoflann::nanoflann
    )
    if (NOT WIN32)
        target_link_libraries(simple_trainer PUBLIC pthread)
    endif()
    set_property(TARGET simple_trainer PROPERTY CXX_STANDARD 17)
endif()

# The following code block is suggested to be used on Windows.
# According to https://github.com/pytorch/pytorch/issues/25457,
# the DLLs need to be copied to avoid memory errors.
if (MSVC)
    file(GLOB TORCH_DLLS "${TORCH_INSTALL_PREFIX}/lib/*.dll")
    file(GLOB OPENCV_DLL "${OPENCV_DIR}/x64/vc16/bin/opencv_world490.dll")
    set(DLLS_TO_COPY ${TORCH_DLLS} ${OPENCV_DLL})
    add_custom_command(TARGET opensplat
        POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${DLLS_TO_COPY}
        $<TARGET_FILE_DIR:opensplat>)
endif (MSVC)
