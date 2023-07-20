#!/bin/bash

set -x
set -e

DIR=$(dirname "$0")

bash $DIR/scripts/make-tex.sh
git show -s --format=%as > $DIR/.tmp/date.tex
git rev-parse --short HEAD > $DIR/.tmp/hash.tex

cd $DIR/tex
xelatex -halt-on-error -output-directory ./.. ./psalms.tex

rm -rf $DIR/.tmp
