# Holospace 3D 🌐 

### Demo:
![](")![terryfox](https://github.com/reinesana/HoloSpace3D/assets/153279125/22ba5223-8dd5-4f52-8b4b-847c1384137d)


<br>
## Purpose
HoloSpace is social media platform where users can engage, post and interact with hyper-realistic 3D experiences of their friends and family with the click of a simple, short 5 second video. The platform uses the latest research in AI-powered rendering to create photorealistic scenes whilst also connecting people through experiences. This platform leverages social media to new lengths, allowing integration with Apple Vision Pro to connect and share experiences like never before.

## How we built it
Holospace uses Gaussian Splatting, the latest research in 3D rendering published in 2023, to train videos with curves know as gaussions into photorealistic 3D scenes. By leveraging C++ and Neural Networks, we were capable of bringing an algorithm previously not compatible on mac to macOS, enabling multi-platform access and optimized rendering. The frontend is built in Swift and includes a custom camera connected to the firebase database, allowing seamless intergraiton with the backend and Apple technologies (Apple Vision Pro. etc) for interacting with 3D imageries posted on the platform. 

## Challenges
Due to being a very recent research, gaussian splatting is limited to Windows Computers with CUDA (which our team did not have access to). However, by researching and employing the algorithm in C++ and not python, we were able to create one of the first gaussian splatting platforms compatible on macOS, allowing future students interested in the tool to train 3D rendering models on less powerful computers. 

## Accomplishments that we're proud of
We successfully utilized the newest 3D rendering algorithm despite being limited by our tools and resources, whilst additionally making it accessible to students worldwide in only 24 hours. Additionally, we developed a Swift platform without prior knowledge in the language, successfully completing the project in a team of just two individuals.

## What we learned
We became very knowleged about the integration of AI in the rendering process (SfM, gaussian, optimization. etc) and acquired the skills necessary to develop a Swift application. The process of building a Swift app without prior experience has provided us with a comprehensive understanding of iOS development, enhancing our proficiency in mobile application development. The research on gaussian splats also enhanced our knowledge on the intergration of computer graphic with machine learning.

## What's next for HoloSpace 3D
With the increasing usage of Apple Vision Pro, we hope to bring photorealistic videos to the platform - allowing individuals to relive the experiences of their friends and family. We also look forward to enhancing the macOS compability in order to further develop and optimize our technology for increased accessibility of these tools across the globe.
