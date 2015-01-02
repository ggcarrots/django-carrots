mkdir -p _build/locale
make -e SPHINXOPTS="-E -a" gettext
sphinx-intl update -d source/locale -p build/locale -l pl
