#!/bin/bash
 
# this assumes you want to take an image every 5 minutes for 12 hours.
# ( 60 minutes / hour / 5 minutes * 12 hours = 144 images )
 
#
# get singleframe.py from here:
# https://gist.github.com/thequbit/a139f64d5cde952771f5
#
 
#
# to run this file, put the contents into a file named getframes.sh and
# then make it runable by typing the following:
#
# > chmod +x getframes.sh
#
# then simply run the file by typing:
#
# > ./getframes.sh
#
# the file will run until the end of the 12 hours.
#
 
# do the loop
for i in {00000..99999}
do
 
# download 256K of the video file
(ulimit -f 256; wget "http://66.66.237.38:45247/mjpg/video.mjpg")
 
# pull single frame from video and save it as the frame number
python singleframe.py video.mjpg frame-$i.jpg
 
# cleanup
rm video.mjpg
# wait for 5 minutes ( 300 seconds )
sleep 60
 
done
