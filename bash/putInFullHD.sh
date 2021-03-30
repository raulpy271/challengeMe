#!bin/bash

# Description: This algorithm use ffmpeg cli to convert a video 
# to full hd resolution. To not reshape a video, 
# this script adds a blurred background.


#colecting user parameters
input=$1
output=$2


# final resolution of the video/photo
width="1920"
heigth="1080"


# some filterchains parameters
scale_filter="scale = w=$width : h=$heigth"
blur_filter="avgblur = sizeX=15 : sizeY=15"
bigest_aspect_ratio="max(iw / $width\, ih / $heigth)"
main_scene_size=\
"w = iw / $bigest_aspect_ratio : h = ih / $bigest_aspect_ratio"
centralizing_main=\
"x = ((main_w - overlay_w) / 2) : y = ((main_h - overlay_h) / 2)"


# creating filterchains
making_two_inputs="split [input][input_copy]"
making_main_scene="[input_copy] scale=$main_scene_size [main]"
making_background="[input] $scale_filter, $blur_filter [background]"
overlapping_chains="[background][main] overlay=$centralizing_main"


# conecting all filterchains 
filter="$making_two_inputs; $making_main_scene; "
filter="$filter $making_background; $overlapping_chains"


ffmpeg -y -i $input -filter_complex "$filter" $output

