#!/bin/bash

set -x
set -e

DIR=$(dirname "$0")

bash $DIR/scripts/make-tex.sh

cd $DIR/tex
xelatex -halt-on-error -output-directory ./.. ./psalms.tex

rm -rf $DIR/.tmp
