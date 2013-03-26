#!/bin/bash

cd sourcedeps

for fn in `cat ../files.txt` ; do unzip -o -q $fn; done

