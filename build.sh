#!/bin/sh

scads="base cover-theconqueror cover-republika cover-runtour cover-runtour-lupilu names"
for f in $scads ; do
    echo $f
    openscad --render -o "$f.stl" "$f.scad"
done
