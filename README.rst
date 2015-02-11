========================
Django Carrots tutorials
========================

Le tutoriel Django Carrots présente pas-à-pas aux débutants la manière
de créer son premier site internet avec Python et Django

En quelques mots:

#. Installer Python et mettre en place son environnement de développement
#. Les bases de Python
#. "Snakes!" competition en ligne
#. Mettre en place une appli de sondage en Django
#. Déployer son application


Générer la documentation
========================

Lancer simplement::

    $ pip install -r requirements.txt
    $ make html

La document sera créée dans le répertoire ``build/html``.

Version imprimable
-------------

Pour générer une version imprimable, vous aurez besoin de XeTeX (car
PDFLatex ne supporte malheureusement pas l'unicode)::

    $ make latex
    $ cd build\latex

    # Open workshops.tex and remove '\DeclareCharacter' directive
    $ xelatex workshops.tex


Pourquoi avoir choisi Python 3 ?
================================

Parce que Python 3, c'est le futur. Et aussi pour la gestion native de
l'Unicode ce qui permet de sauter toute la formation à l'Unicode qui
serait nécessaire avec Python 2. Ça évite de faire peur aux
débutants dès le début.


Contribuer
==========

N'hésitez pas ! Vous y êtes même fortement encouragés.

Les guides et outils logiciels de Django Carrots sont libres:

Vous pouvez les redistribuer et/ou les modifier sous les termes de la licence GPL v3 de la FSF.
Voir le fichier ``LICENSE`` à la racine du dépôt pour plus d'informations.
