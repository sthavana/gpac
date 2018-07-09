#!/bin/sh

test_begin "dash-m3u8-byterange"

do_test "$MP4BOX -add $EXTERNAL_MEDIA_DIR/counter/counter_30s_I25_baseline_1280x720_512kbps.264 -add $EXTERNAL_MEDIA_DIR/counter/counter_30s_audio.aac -new $TEMP_DIR/file.mp4" "input-preparation"
do_hash_test "$TEMP_DIR/file.mp4" "input-preparation"

do_test "$MP4BOX -dash-strict 1000 -rap -bs-switching no -profile dashavc264:onDemand $TEMP_DIR/file.mp4#video $TEMP_DIR/file.mp4#audio -m3u8-from-mpd $TEMP_DIR/hls.m3u8 -out $TEMP_DIR/file.mpd" "mpd-m3u8-byterange"

test_end