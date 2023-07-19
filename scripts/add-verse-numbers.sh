#!/bin/bash

DIR=$(dirname "$0")
echo $DIR

OUT=$DIR/../.tmp

rm -rf $OUT
mkdir $OUT

for f in $DIR/../src/*.txt
do
  F=$(basename "$f")
  #echo $F
  nl -w1 -s'    ' $f > $OUT/$F
done
