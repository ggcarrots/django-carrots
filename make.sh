#!/bin/bash

# Command file for Sphinx documentation

if [ "$SPHINXBUILD" == "" ]
then
    SPHINXBUILD=sphinx-build
fi

BUILDDIR=build
ALLSPHINXOPTS="-d $BUILDDIR/doctrees $SPHINXOPTS source"
I18NSPHINXOPTS="$SPHINXOPTS source"
if [ "$PAPER" != "" ]
then
    ALLSPHINXOPTS=-D latex_paper_size=$PAPER $ALLSPHINXOPTS
    I18NSPHINXOPTS=-D latex_paper_size=$PAPER $I18NSPHINXOPTS
fi


case "$1" in

    help )
        echo " Please use 'make ^<target^>' where ^<target^> is one of"
        echo "  html       to make standalone HTML files"
        echo "  dirhtml    to make HTML files named index.html in directories"
        echo "  singlehtml to make a single large HTML file"
        echo "  pickle     to make pickle files"
        echo "  json       to make JSON files"
        echo "  htmlhelp   to make HTML files and a HTML help project"
        echo "  qthelp     to make HTML files and a qthelp project"
        echo "  devhelp    to make HTML files and a Devhelp project"
        echo "  epub       to make an epub"
        echo "  latex      to make LaTeX files, you can set PAPER=a4 or PAPER=letter"
        echo "  text       to make text files"
        echo "  man        to make manual pages"
        echo "  texinfo    to make Texinfo files"
        echo "  gettext    to make PO message catalogs"
        echo "  changes    to make an overview over all changed/added/deprecated items"
        echo "  linkcheck  to check all external links for integrity"
        echo "  doctest    to run all doctests embedded in the documentation if enabled"
        ;;

    clean ) 
        rm -r $BUILDDIR/*
        ;;
 
    html )
        if $SPHINXBUILD -b html $ALLSPHINXOPTS $BUILDDIR/html
        then
            echo "Build finished. The HTML pages are in $BUILDDIR/html."
        fi
        ;;

    dirhtml )
        if $SPHINXBUILD -b dirhtml $ALLSPHINXOPTS $BUILDDIR/dirhtml 
        then
            echo "Build finished. The HTML pages are in $BUILDDIR/dirhtml."
        fi
        ;;
 
    singlehtml )
        if $SPHINXBUILD -b singlehtml $ALLSPHINXOPTS $BUILDDIR/singlehtml 
        then
            echo "Build finished. The HTML pages are in $BUILDDIR/singlehtml."
        fi
        ;;
 
    pickle )
        if $SPHINXBUILD -b pickle $ALLSPHINXOPTS $BUILDDIR/pickle
        then
            echo "Build finished; now you can process the pickle files."
        fi
        ;;
 
    json )
        if $SPHINXBUILD -b json $ALLSPHINXOPTS $BUILDDIR/json
        then
            echo "Build finished; now you can process the JSON files."
        fi
        ;;
 
    htmlhelp )
        if $SPHINXBUILD -b htmlhelp $ALLSPHINXOPTS $BUILDDIR/htmlhelp
        then
            echo "Build finished; now you can run HTML Help Workshop with the ^.hhp project file in $BUILDDIR/htmlhelp."
        fi
        ;;
 
    qthelp )
        if $SPHINXBUILD -b qthelp $ALLSPHINXOPTS $BUILDDIR/qthelp
        then
            echo 
            echo "Build finished; now you can run 'qcollectiongenerator' with the ^.qhcp project file in $BUILDDIR/qthelp, like this:"
            echo "> qcollectiongenerator $BUILDDIR\qthelp\WarsztatyDjango.qhcp"
            echo "To view the help file:"
            echo "> assistant -collectionFile $BUILDDIR\qthelp\WarsztatyDjango.ghc"
        fi
        ;;
 
    devhelp )  
        if $SPHINXBUILD -b devhelp $ALLSPHINXOPTS $BUILDDIR/devhelp
        then
            echo "Build finished."
        fi
        ;;
 
    epub )
        if $SPHINXBUILD -b epub $ALLSPHINXOPTS $BUILDDIR/epub
        then
            echo 
            echo "Build finished. The epub file is in $BUILDDIR/epub."
        fi
        ;;
 
    latex )
        if $SPHINXBUILD -b latex $ALLSPHINXOPTS $BUILDDIR/latex
        then
            echo 
            echo "Build finished; the LaTeX files are in $BUILDDIR/latex."
        fi
        ;;
 
    text )
        if $SPHINXBUILD -b text $ALLSPHINXOPTS $BUILDDIR/text
        then
            echo 
            echo "Build finished. The text files are in $BUILDDIR/text."
        fi
        ;;
 
    man )
        if $SPHINXBUILD -b man $ALLSPHINXOPTS $BUILDDIR/man
        then
            echo 
            echo "Build finished. The manual pages are in $BUILDDIR/man."
        fi
        ;;
 
    texinfo )
        if $SPHINXBUILD -b texinfo $ALLSPHINXOPTS $BUILDDIR/texinfo
        then
            echo 
            echo "Build finished. The Texinfo files are in $BUILDDIR/texinfo."
        fi
        ;;
 
    gettext )
        if $SPHINXBUILD -b gettext $I18NSPHINXOPTS $BUILDDIR/locale
        then
            echo 
            echo "Build finished. The message catalogs are in $BUILDDIR/locale."
        fi
        ;;
 
    changes )
        if $SPHINXBUILD -b changes $ALLSPHINXOPTS $BUILDDIR/changes
        then
            echo 
            echo "The overview file is in $BUILDDIR/changes."
        fi
        ;;
 
    linkcheck )
        if $SPHINXBUILD -b linkcheck $ALLSPHINXOPTS $BUILDDIR/linkcheck
        then
            echo 
            echo "Link check complete; look for any errors in the above output or in $BUILDDIR/linkcheck/output.txt."
        fi
        ;;
 
    doctest )
        if $SPHINXBUILD -b doctest $ALLSPHINXOPTS $BUILDDIR/doctest
        then
            echo 
            echo "Testing of doctests in the sources finished, look at the results in $BUILDDIR/doctest/output.txt."
        fi
        ;;
    * )
        echo "error: unknown command $1"
        echo
        echo "try: $(basename "$0") help"
        ;;
esac
