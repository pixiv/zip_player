#!/bin/bash
convert "$1" -background none -alpha Background -depth 8 rgba:- | crc32 /dev/stdin
