#!/usr/bin/env bash
ffmpeg -framerate 30 -i "MyDir/myIm_%04d.png" -r 30 -vcodec libx264 -pix_fmt yuv420p -crf 23 myVid.mp4
