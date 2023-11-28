apt-get update
pip install -r requirements.txt

apt-get install -y libgl1-mesa-glx
#https://velog.io/@zxxzx1515/%EC%98%A4%EB%A5%98-%EB%85%B8%ED%8A%B8-libGL.so.1-cannot-open-shared-object-file-No-such-file-or-directory

apt-get install -y libglib2.0-0
apt-get install -y libgtk2.0-dev
#https://askubuntu.com/questions/1060903/importerror-libgthread-2-0-so-0-cannot-open-shared-object-file-no-such-file-o
#need to long time

pip install imageio-ffmpeg

cd /root/pytorch-AdaIN/

#image
python test.py --content input/content/cornell.jpg --style input/style/woman_with_hat_matisse.jpg

#video
python test_video.py --content_video input/videos/cutBunny.mp4 --style_path input/style/woman_with_hat_matisse.jpg


#decoder.pth
https://drive.google.com/file/d/1bMfhMMwPeXnYSQI6cDWElSZxOxc6aVyr/view
https://drive.google.com/file/d/1EpkBA2K2eYILDSyPTt0fztz59UjAIpZU/view

wget -no-check-certificate 'https://docs.google.com/uc?export=download&id=1bMfhMMwPeXnYSQI6cDWElSZxOxc6aVyr' -O decoder.pthvgg_normalised.pth
vgg_normalised.pth