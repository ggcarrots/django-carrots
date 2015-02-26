=====================
Introduction à Django
=====================


Django, qu'est-ce que c'est ?
=============================

Nous avons jusqu'ici appris des rudiments de Python, mais Python est juste un langage -- accompagné de bibliothèques de code assez basiques -- permettant de créer des programmes. La création d'un site web interactif en Python demande un travail considérable, c'est pourquoi nous allons utiliser Django, qui nous fournit un ensemble d'outils, fonctions (comme celles que nous avons étudiées précédemment, mais plus élaborées) et classes qui facilitent beaucoup la création de sites.

Pour mettre en place un site web pleinement interactif, il nous faut ces quelques éléments :

* Un serveur d'application - ici nous allons utiliser Django.
* Des fichiers HTML et CSS, qui vont décrire l'apparence du site.
* Une base de données pour stocker les questions et réponses à nos sondages.

Commençons par créer le serveur d'application.


Création du projet
==================

Installation
------------

Installez Django en exécutant la commande suivante dans la console : ``pip install django==1.6.4``.

.. code-block:: sh

   (workshops) ~$ pip install django==1.6.4
   Downloading/unpacking django==1.6.4
     Downloading Django-1.6.4-py2.py3-none-any.whl (6.7MB): 6.7MB downloaded
   Installing collected packages: django
   Successfully installed django
   Cleaning up...

Le paquet adéquat est alors téléchargé depuis `PyPI <http://pypi.python.org>`_ - un dépôt centralisé de paquets de code où sont disponibles de nombreuses bibliothèques.


Démarrage du projet
-------------------

Django fournit le script d'administration ``django-admin.py`` qui permet entre autres choses de créer l'arborescence initiale du site. Pour démarrer le nouveau projet, exécutez la commande suivante : ``django-admin.py startproject carrots`` 

.. code-block:: sh

   # Linux

   (workshops) ~$ django-admin.py startproject carrots
   (workshops) ~$ tree carrots
   carrots/
   ├── carrots
   │   ├── __init__.py
   │   ├── settings.py
   │   ├── urls.py
   │   └── wsgi.py
   └── manage.py

   1 directory, 5 files

.. code-block:: bat

   # Windows

   (workshops) C:\Users\Alex> python -m django-admin startproject carrots
   (workshops) C:\Users\Alex> tree /f carrots
   Folder PATH listing
   Volume serial number is 00FA-07FF
   C:\USERS\ALEX\DOCUMENTS\CARROTS
   │   manage.py
   │
   └───carrots
           settings.py
           urls.py
           wsgi.py
           __init__.py


Structure du projet
-------------------

Le projet que nous venons de créer contient un répertoire ``carrots`` et quelques fichiers de base.

Le fichiers ``carrots/settings.py`` contient des paramètres de configurations tels que le langage, la connexion à la base de données ou encore la liste des applications installées dans le projet. Vous pouvez modifier ce fichier vous-même, il contient un paramétrage par défaut ainsi que des commentaires explicatifs.

Le fichier ``manage.py`` nous permet d'administrer le site web, créer ou effacer la base de données, démarrer un simple serveur d'application, etc... Nous verrons par la suite comment l'utiliser.

Le fichier ``carrots/urls.py`` contient des informations sur les chemins d'accès aux différentes pages du site.

Les autres fichiers présentent moins d'intérêt dans l'immédiat. De manière générale, on n'a pas besoin de les ouvrir ou de les modifier. Si ces fichiers vous intriguent, n'hésitez pas à rechercher sur Internet des informations supplémentaires à leur sujet.


Réglages de l'application
-------------------------

Modifiez ainsi dans le fichier ``carrots/settings.py`` les lignes suivantes pour régler la langue et le fuseau horaire utilisés par l'application ::

   LANGUAGE_CODE = 'fr_fr'

   TIME_ZONE = 'Europe/Paris'

Pour simplifier les choses nous allons désactiver la gestion avancée des fuseaux horaires dans la base de données car nous n'en aurons pas besoin pour ce projet. Localisez le paramètre ``USE_TZ`` et positionnez-le à ``False`` ::

   USE_TZ = False

La section ``INSTALLED_APPS`` contient des informations sur les applications installées. Un projet Django est en effet conposé de plusieurs applications, comme ici l'application ``auth`` qui sert à authentifier les utilisateurs, l'application ``sessions`` qui permet de gérer les sessions des utilisateurs, et ainsi de suite.

Comme vous pouvez le voir, ``INSTALLED_APPS`` est tout simplement un tuple de noms d'applications. En décommentant les deux dernières chaînes de caractères (c'est-à-dire en supprimant le caractère ``#`` en début de ligne), vous pouvez activer l'interface d'administration fournie par Django. Nous allons voir plus tard comment l'utiliser.


Base de données
---------------

Le moment est maintenant venu d'utiliser le fichier ``manage.py`` pour créer la base de données de notre site. Pour ce faire, nous allons utiliser l'option ``syncdb``. Lancez donc la commande ``python manage.py syncdb`` depuis le répertoire du projet

.. code-block:: sh

   (workshops) ~$ cd carrots
   (workshops) ~/carrots$ python manage.py syncdb

    Creating tables ...
    Creating table auth_permission
    Creating table auth_group_permissions
    Creating table auth_group
    Creating table auth_user_groups
    Creating table auth_user_user_permissions
    Creating table auth_user
    Creating table django_content_type
    Creating table django_session
    Creating table django_site
    Creating table django_admin_log

    You just installed Django's auth system, which means you don't have any superusers defined.
    Would you like to create one now? (yes/no): yes
    Username (leave blank to use 'alex'): admin
    Email address: alex@example.com
    Password:
    Password (again):
    Superuser created successfully.
    Installing custom SQL ...
    Installing indexes ...
    Installed 0 object(s) from 0 fixture(s)

Si tout se passe bien, Django vous demande alors de fournir quelques informations pour créer un compte administrateur pour l'application. Vous pouvez laisser le nom d'utilisateur qui vous est proposé et saisir n'importe quelle adresse email. Retenez bien ces informations, en particulier le nom d'utilisateur et le mot de passe ; elles vous seront nécessaires pour vous connecter à l'interface d'administration. Dans l'exemple décit ci-dessus, le nom d'utilisateur sera ``admin``.

Si vous voulez en apprendre davantage au sujet de ``manage.py``, vous pouvez exécuter la commande ``python manage.py help``.

.. code-block:: sh

    (workshops) ~/carrots$ python manage.py help

 Vous verrez alors la liste de toutes les commandes et options proposées par ``manage.py``. Pour obtenir de l'aide sur l'une de ces commandes, il suffit alors de taper ``python manage.py help``, suivi du nom de la commande en question -- par exemple

.. code-block:: sh

    (workshops) ~/carrots$ python manage.py help syncdb


Interface d'administration
--------------------------

Nous pouvons maintenant lancer notre application. Démarrez le serveur en tapant la commande ``python manage.py runserver``

.. code-block:: sh

   (workshops) ~/carrots$ python manage.py runserver
   Validating models...

   0 errors found
   April 19, 2013 - 20:14:37
   Django version 1.6.4, using settings 'carrots.settings'
   Development server is running at http://127.0.0.1:8000/
   Quit the server with CTRL-BREAK.

Notre site web est dès lors disponible à l'adresse http://127.0.0.1:8000/ ou encore http://localhost:8000/.

L'interface d'administration, quant à elle, peut être consultée au chemin ``admin/``, c'est pourquoi nous y accédons par l'adresse http://localhost:8000/admin/.


Créons une nouvelle application pour nos sondages
-------------------------------------------------

Nous avons jusqu'à présent créé un projet appelé ``carrots``. Les projets Django sont divisés en applications qui fournissent chacune des fonctions spécifiques.

Nous voulons publier des sondages sur notre site, nous allons donc créer une application nommée ``polls`` (ce qui signifie ``sondages`` en anglais -- l'anglais étant la langue la plus fréquemment utilisée au sein des projets informatiques).

Depuis l'invite de commandes, tapez ``python manage.py startapp polls`` 
::

   (workshops) ~/carrots$ python manage.py startapp polls
   (workshops) ~/carrots$ tree .
   .
   ├── carrots
   │   ├── __init__.py
   │   ├── settings.py
   │   ├── urls.py
   │   ├── wsgi.py
   ├── db.sqlite3
   ├── manage.py
   └── polls
       ├── __init__.py
       ├── admin.py
       ├── models.py
       ├── tests.py
       └── views.py

   2 directories, 14 files

Une fois l'application créée, elle doit être activée dans notre projet. Ajoutez-la donc dans la section ``INSTALLED_APPS`` du fichier ``carrots/settings.py``. Vous devriez parvenir à un résultat similaire à celui-ci ::

    INSTALLED_APPS = (
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.messages',
        'django.contrib.staticfiles',
        'polls'
    )

Les applications Django sont constituées de plusieurs fichiers :

* ``admin.py`` - permet de configurer l'interface d'administration,
* ``models.py`` - contient la définition des modèles de la base de données,
* ``tests.py`` - contient l'ensemble des tests permettant de valider le bon fonctionnement de l'application,
* ``views.py`` - contient le code des différentes vues de l'application.


En résumé
---------

Pour installer Django

.. code-block:: sh

   (workshops) ~$ pip install django==1.6.4

Pour créer un projet Django

.. code-block:: sh

   # Linux

   (workshops) ~$ django-admin.py startproject carrots

.. code-block:: bat

   # Windows

   (workshops) C:\Users\TeddyBear> python -m django-admin startproject carrots

Pour régler le langage et le fuseau horaire, dans le fichier ``carrots/settings.py`` 

.. code-block:: sh

   LANGUAGE_CODE = 'fr_fr'

   TIME_ZONE = 'Europe/Paris'

   USE_TZ = False

Pour créer ou mettre à jour la base de données, il faut lancer cette commande après avoir ajouté un nouveau modèle de données

.. code-block:: sh

   (workshops) ~/carrots$ python manage.py syncdb

Pour démarrer le serveur d'application 

.. code-block:: sh

   (workshops) ~/carrots$ python manage.py runserver

Pour créer une nouvelle application, par exemple nommée ``polls``

.. code-block:: sh

   (workshops) ~/carrots$ python manage.py startapp polls

N'oubliez alors pas de rajouter cette nouvelle application à la section ``INSTALLED_APPS``!
