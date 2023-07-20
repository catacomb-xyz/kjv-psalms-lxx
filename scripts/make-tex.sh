#!/bin/bash
set -x

DIR=$(dirname "$0")

SRCDIR=$DIR/../src
TMPDIR=$DIR/../.tmp

rm -rf $TMPDIR
mkdir $TMPDIR

# add verse numbers
for F in $SRCDIR/*.txt
do
  NAME=$(basename "$F")
  echo $TMPDIR $NAME
  nl -w1 -s'}\hspace{4ex}' $F > $TMPDIR/$NAME
  sed -i 's/^/\\textsuperscript{/' $TMPDIR/$NAME
done

# add title and spaces
for F in $TMPDIR/*.txt
do
  NAME=$(basename "$F")
  NUM=$((10#"${NAME%.*}"))
  echo $F $NUM
  STR="\\\section{Psalm $NUM}"
  sed -i "1s/^/$STR\n/" $F
  sed -u 'G' $F > $TMPDIR/$NAME.tex
done

cat $TMPDIR/*.tex > $TMPDIR/psalms.tex
