#!/bin/bash

grep sources /home/pbrant/v4workspace/ccap3/.idea/libraries/* | cut -f2 -d\" | sed -e 's/^.*ivy2/\/home\/pbrant\/.ivy2/' -e 's/!\/$//' | sort | uniq

