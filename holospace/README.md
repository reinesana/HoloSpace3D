on terminal:

Convert video to images (frames):
FFMPEG -i {path to video} -qscale:v 1 -qmin 1 -vf fps={frame extraction rate} %04d.jpg

convert input to COLMAP dataset:
python3 convert.py -s data/{folder}
