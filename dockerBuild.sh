#!/bin/sh

# This script will build all the PDFs in the local directory if you have
# docker installed but not abcm2ps. Neat!

docker run --rm -it -v $(pwd):/zuleika \
 -w /zuleika pirateguillermo/zuleika:latest make
