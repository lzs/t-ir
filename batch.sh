#!/bin/sh

for i in *.ir; do
    ./decode.pl $i > $(basename $i .ir).txt
done
