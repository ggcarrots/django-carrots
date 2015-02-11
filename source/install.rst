============
Installation
============

Pendant nos ateliers, nous allons utiliser un interpréteur de langage Python, en version 3.4. Vous trouverez ci-dessous quelques conseils pour vérifier si vous avez déjà l'interpréteur ou, dans le cas contraire, pour l'installer ainsi que quelques outils complémentaires.

Windows
=======

Vous pouvez télécharger une version Windows de l'interpéteur Python directement depuis `python.org`_.
Une fois que vous avez récupéré le fichier d'installation, portant l'extension ``.msi``, il vous suffit de l'ouvrir et de suivre les instructions.
Prenez soin de garder en mémoire le chemin d'installation - c'est-à-dire le dossier dans lequel vous avez installé Python. Vous aurez besoin de cette information par la suite, au moment de l':ref:`installation des outils <tools>`.


Linux (Ubuntu, Fedora, etc.) ou Mac OS X
========================================

Pour vérifier la version de Python installée sur votre système, entrez la commande suivante dans votre terminal :

.. code-block:: sh

    $ python --version
    Python 3.4.0

Si la commande ``python`` n'est pas disponible, ou si une version inférieure est détectée :

Ubuntu
------

Entrez la commande suivante::

    sudo apt-get install python3.4

Fedora
------

Entrez la commande suivante::

    sudo yum install python3.4

Mac OS X
--------

Téléchargez et installez la version de Python correspondant à votre version d'OS X depuis `python.org`_ .


Autres
------

Utilisez le gestionnaire de paquets adapté à votre distribution. S'il n'existe pas de système adéquat, ou si vous n'y trouvez pas Python, vous pouvez l'installer en le compilant depuis les fichiers sources disponibles sur le site `python.org`_. Un compilateur sera alors requis, ainsi que la librairie ``readline``.

Officieusement, nous partons du principe que des utilisateurs de distributions moins populaires (mais tout aussi valables !) réussiront sans problème à accomplir cette tâche :)


.. _tools:

Outils complémentaires
======================

Console Windows
---------------

Nous allons effectuer la majeure partie de notre travail en saisissant des lignes de commande dans la console Windows.
Pour la démarrer, appuyez sur les touches ``Win+R``. Dans la fenêtre qui apparaît alors, tapez ``cmd`` puis cliquez sur ``OK``. Une nouvelle fenêtre fait alors son apparition, avec du texte blanc sur fond noir :

.. code-block:: bat

    Microsoft Windows [Version 6.1.7601]
    Copyright (c) 2009 Microsoft Corporation. All rights reserved.


    C:\Users\Name>

Le texte peut être légèrement différent selon la version de Windows que vous utilisez.

``C:\Users\Name>`` est une invite de commande, que l'on désigne aussi parfois par le terme anglophone "prompt". Cette invite nous informe du répertoire dans lequel nous nous trouvons actuellement et attend la saisie d'une commande.

.. note::

    Petite précision de vocabulaire : dans le cadre de notre atelier, nous emploierons de manière interchangeable les termes "dossier" et "répertoire".

Plus loin dans cette documentation, nous abrègerons ``C:\Users\Name>`` en ``~$``, qui est une forme canonique d'invite de commande dans les mondes Linux et Mac OS X.


À l'aide de ligne de commande, vous pouvez vous déplacer dans les contenus de votre disque dur, comme vous le feriez via l'icône ``Mon ordinateur``. Il suffit pour cela de saisir des commandes et d'appuyer sur ``Entrée``.
Les commandes suivantes seront utilisées au cours de l'atelier :

``dir``
    Affiche le contenu du répertoire courant. Par exemple, si l'invite de commande indique ``C:\Users\Name``, la commande ``dir`` affiche le contenu de votre répertoire personnel.

``cd directory``
    Change le répertoire courant. Par exemple, si vous êtes dans le répertoire ``C:\Users\Name``, le fait de saisir la commande ``cd Documents`` vous permettra d'accéder au répertoire contenant vos documents. Pour vous en convaincre, tapez alors la commande ``dir``, vous verrez alors des fichiers familiers.
    La commande ``cd..`` vous permet de remonter au répertoire supérieur dans l'arborescence.

``mkdir directory``
    Crée un nouveau répertoire.


Environnement virtuel
---------------------

Now we have to chose the directory for our virtual environment. The virtual environment will allow to
isolate our work from other system’s parts. For example you can choose the user home directory.

 For Windows 7 the path to the home directory for the user  ``Ala`` will look like this:
``C:\Users\Ala\`` . You can select a different directory but it is important to remember where the
file is saved. It must be easily accessible, because we will use it often. 

For example, if our home directory is ``C:\Users\lrekucki``, the command line would look like this:

.. code-block:: bat

    :: Windows
    C:\Users\lrekucki> C:\Python34\python -m venv workshops

.. code-block:: sh

    # Linux or Mac
    ~$ python3.4 -m venv workshops

.. note::
    Ubuntu 14.04 has a bug (https://bugs.launchpad.net/ubuntu/+source/python3.4/+bug/1290847) that causes Python3.4 `venv` module to fail when installing with `pip`.
    To work around this please use this command to create virtual environment::

        ~$ python -m venv --without-pip workshops
        ~$ source workshops/bin/activate
        ~$ wget https://bootstrap.pypa.io/get-pip.py
        ~$ python get-pip.py
        ~$ pip --version

    Checkout _`https://pip.pypa.io/en/latest/installing.html` for more information about installing pip.

In your home directory there will be created a directory ``workshops`` containing so called “virtual
environment”.
For now, it is important for us that after it is activated:

.. code-block:: bat

    :: Windows
    C:\Users\lrekucki> workshops\Scripts\activate

.. code-block:: sh

    # Linux or Mac
    ~$ source workshops/bin/activate

The ``python`` command will run the correct version of Python, so we will not have to enter the full
path at the beginning nor the version at the end.


Ensure your terminal is well configured:

.. code-block:: bat

    :: Windows
    (workshops) C:\Users\lrekucki>where python
    C:\Users\lrekucki\workshops\Scripts\python.exe
    ...

    (workshops) C:\Users\lrekucki>where pip
    C:\Users\lrekucki\workshops\Scripts\pip.exe
    ...

    (workshops) C:\Users\lrekucki>python --version
    3.4.0

.. code-block:: sh

    # Linux or Mac
    (workshops) ~$ which python
    /home/lrekucki/workshops/bin/python
    (workshops) ~$ which pip
    /home/lrekucki/workshops/bin/pip
    ...

    (workshops) ~$ python --version
    3.4.0


.. _python.org: http://python.org/download/releases/3.4.0/

.. note::
    You may already have ``pip`` command available on your system. Always check which pip you are using with command: ``pip --version``.
    You can do this by running one of these commands:

    .. code-block:: sh

        ~$ pip --version
        ~$ pip3 --version
        ~$ pip3.4 --version

    It will give you pip version and a path to your virtual environment directory.

    If you can't find your ``pip`` or there is any problem after typing ``which pip`` (``where pip`` on windows) there could be a need to reinstall pip:

    .. code-block:: sh

        ~$ python -m pip uninstall pip
        ~$ python -m ensurepip


Summary
-------

New virtual environment installation:

.. code-block:: bat

    :: Windows
    C:\Users\lrekucki> C:\Python34\python -m venv workshops

.. code-block:: sh

    # Linux or Mac
    ~$ python3.4 -m venv workshops

Virtual environment activation:

.. code-block:: bat

    :: Windows
    C:\Users\lrekucki> workshops\Scripts\activate

.. code-block:: sh

    # Linux or Mac
    ~$ source workshops/bin/activate

Just make sure that you use the proper Python version:

.. code-block:: sh

    (workshops) ~$ python --version
    3.4.0


IPython
-------

Optionally you can install ``IPython``, which improves the look and comfort when using Python
from the console.

``IPython`` installation:

.. code-block:: sh

    (workshops) ~$ pip install ipython
