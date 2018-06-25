#!/usr/bin/env bash
infolder=$1
outfolder=$2
outputres="-1:720"

# Create output folder
mkdir -p $outfolder

# Transcode video files
for video in $infolder/*;
do ffmpeg \
-i "$video" \
-map 0:v \
-map 0:a \
-c:v prores_ks \
-profile:v 0 \
-qscale:v 12 \
-vendor apl0 \
-pix_fmt yuv422p10le \
-vf scale=$outputres \
-sws_flags lanczos \
-c:a pcm_s24le \
"$outfolder/$(basename "${video%.*}"_Proxy.mov)";
done

