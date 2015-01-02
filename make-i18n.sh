#!/usr/bin/env bash

rm locale/*/LC_MESSAGES/*.mo
rm -R build/doctrees
rm -R build/html
sphinx-intl -l $1 -d source/locale build
make -e SPHINXOPTS="-E -a -v -D language='$1'" html

