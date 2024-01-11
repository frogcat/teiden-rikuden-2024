#!/bin/bash

url1=https://www.rikuden.co.jp/nw/teiden/f2/now/otj030.html
temp=temp.html

curl -s $url1 > $temp
file=dist/$(xsltproc --html xsl/time.xsl $temp 2> /dev/null).csv

echo $file

(cat $temp | xsltproc --html xsl/level1.xsl - 2> /dev/null | while read url2 ; do
  curl -s $url2 | xsltproc --html xsl/level2.xsl - 2> /dev/null | while read url3 ; do
    curl -s $url3 | xsltproc --html xsl/level3.xsl - 2> /dev/null
  done
done) | sort > $file

rm $temp
cd dist
ls *.csv | sort > files.txt

