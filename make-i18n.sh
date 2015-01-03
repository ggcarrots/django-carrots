#!/usr/bin/env bash

L=${1-pl}
rm locale/$L/LC_MESSAGES/*.mo
rm -R build/doctrees
rm -R build/html
sphinx-intl -l $L -d source/locale build
make -e SPHINXOPTS="-E -a -v -D language='$L'" html
