======================
Wprowadzenie do Django
======================


Co to jest Django?
==================

Do tej pory poznaliśmy Pythona. Python to tylko język (i zestaw podstawowych bibliotek), pozwalający tworzyć
programy. Stworzenie interaktywnej strony w samym Pythonie wymagałoby ogromnego nakładu pracy, dlatego użyjemy Django.
Django daje nam zestaw narzędzi, funkcji (takich jak poznaliśmy wcześniej, ale bardziej rozbudowanych) i klas
ułatwiających tworzenie stron.

Do w pełni internatywnej strony potrzebujemy kilku elementów:

* serwera aplikacji - tutaj wykorzystamy Django,
* plików HTML i CSS - odpowiedzialnych za wygląd strony,
* bazy danych - w niej przechowywane będą dane takie jak pytania, ankiety i odpowiedzi.

Zaczniemy od stworzenia serwera aplikacji.

Tworzenie nowego projektu
=========================

Instalacja
----------

Zainstaluj Django, uruchamiając z linii poleceń:

.. code-block:: sh

   (warsztaty) ~$ pip install django==1.6.2
   Downloading/unpacking django==1.6.2
     Downloading Django-1.6.2-py2.py3-none-any.whl (6.7MB): 6.7MB downloaded
   Installing collected packages: django
   Successfully installed django
   Cleaning up...

Odpowiednia paczka zostanie pobrana z PyPI_ - repozytorium pakietów Pythona,
gdzie można znaleźć wiele użytecznych bibliotek.


Początek projektu
-----------------

Django dostarcza skrypt administracyjny ``django-admin.py``. Pozwala on stworzyć szkielet naszej strony.

Aby stworzyć nowy projekt ze stroną, uruchamiamy :django:django-admin:`django-admin.py startproject carrots <django:startproject>`:

.. code-block:: sh

   # Linux

   (warsztaty) ~$ django-admin.py startproject carrots
   (warsztaty) ~$ tree carrots
   carrots/
   ├── carrots
   │   ├── __init__.py
   │   ├── settings.py
   │   ├── urls.py
   │   └── wsgi.py
   └── manage.py

   1 directory, 5 files


.. code-block:: bat

   :: Windows

   (warsztaty) C:\Users\TeddyBear>django-admin.py startproject carrots
   (warsztaty) C:\Users\TeddyBear> tree /f carrots
   Folder PATH listing
   Volume serial number is NNNN-MMMM
   C:\USERS\TEDDYBEAR\CARROTS
   │   manage.py
   │
   └───carrots
           settings.py
           urls.py
           wsgi.py
           __init__.py


Struktura projektu
------------------

Nowo utworzony projekt zawiera katalog "carrots" i kilka podstawowych plików.

W pliku ``carrots/settings.py`` znajdują się ustawienia strony, takie jak język, baza danych, zainstalowane aplikacje.
Plik ten możemy edytować sami. Na początku wewnątrz znajdziemy domyślne ustawienia i komentarze wyjaśniające.

Skrypt ``manage.py`` pozwala administrować stroną, czyli utworzyć lub wyczyścić bazę danych, uruchomić prosty serwer
aplikacji itp. Później zobaczymy, jak go używać.

Plik ``carrots/urls.py`` zawiera informacje o ścieżkach (URL'ach) na stronie.

Pozostałe pliki są mniej ciekawe, przeważnie w ogóle się do nich nie zagląda, ani się ich nie zmienia.

Ustawienia aplikacji
--------------------

W pliku ``carrots/settings.py`` znajdź :django:setting:`TIME_ZONE` oraz :django:setting:`LANGUAGE_CODE` i ustaw strefę czasową na
Warszawę i domyślny język na polski. Ostatecznie te dwie linie powinny wyglądać następująco:
::

   TIME_ZONE = 'Europe/Warsaw'

   LANGUAGE_CODE = 'pl'


Dla uproszczenia wyłączymy też zaawansowaną obsługę stref czasowych w bazie
danych - nie bedzie ona potrzebna w naszym projekcie. Znajdź :django:setting:`USE_TZ` w pliku
``settings.py`` i ustaw je na False::

   USE_TZ = False

..
.. ``INSTALLED_APPS`` zawiera informację o zainstalowanych aplikacjach. Projekty ``Django``
.. składają się z wielu aplikacji, w tym wypadku są to na przykład aplikacje: ``auth`` do
.. uwierzytelniania użytkowników, ``sessions`` do zarządzania sesją użytkownika itd.

..
.. Jak widać, ``INSTALLED_APPS`` jest po prostu krotką zawierającą napisy. Odkomentowanie
.. dwóch ostatnich napisów włączy aplikację do administracji. Później będziemy jej używać.

Baza danych
-----------

Teraz użyjemy opisanego wcześniej pliku ``manage.py`` do stworzenia
bazy danych. Służy do tego komenda  :django:django-admin:`syncdb <django:syncdb>`.

Uruchom ``python manage.py syncdb`` w katalogu projektu:

.. code-block:: sh

   (warsztaty) ~$ cd carrots
   (warsztaty) ~/carrots$ python manage.py syncdb

::

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
    Username (leave blank to use 'TeddyBear'):
    Email address: admin@example.com
    Password:
    Password (again):
    Superuser created successfully.
    Installing custom SQL ...
    Installing indexes ...
    Installed 0 object(s) from 0 fixture(s)

Jeśli wszystko poszło, dobrze Django poprosi Cię o podanie danych konta administratora.
Nazwę użytkownika możesz zostawić taką, jaka jest proponowana. Adres email może być dowolny.
Podane dane będą Ci później potrzebne any zalogować się do panelu administracyjnego.

Jeżeli chcesz dowiedzieć się więcej na temat dostępnych komend skryptu ``manage.py``,
uruchom :django:django-admin:`python manage.py help <django:help>`:

.. code-block:: sh

    (warsztaty) ~/carrots$ python manage.py help

Dostaniesz listę wszystkich komend oraz opcji obsługiwanych przez ``manage.py``.

Aby uzyskać pomoc na temat pojedynczej komendy, uruchom ``manage.py help komenda`` np:

.. code-block:: sh

    (warsztaty) ~/carrots$ python manage.py help syncdb

Interfejs administracyjny
-------------------------

W tym momencie możemy uruchomić naszą aplikację.
Uruchom serwer wpisując :django:django-admin:`python manage.py runserver <django:runserver>`:

.. code-block:: sh

   (warsztaty) ~/carrots$ python manage.py runserver

::

   Validating models...

   0 errors found
   April 19, 2013 - 20:14:37
   Django version 1.6.2, using settings 'carrots.settings'
   Development server is running at http://127.0.0.1:8000/
   Quit the server with CTRL-BREAK.

Nasza strona będzie dostępna pod adresem http://127.0.0.1:8000/ , lub
http://localhost:8000/.

Panel administracyjny jest dostępny pod ścieżką ``admin/``, dlatego wchodzimy na
adres http://localhost:8000/admin/.


Tworzymy nową aplikację do ankiet
---------------------------------

Na razie stworzyliśmy projekt ``carrots``. Projekty w Django składają się z
aplikacji, dostarczających określone funkcje.

My chcemy umieścić na naszej stronie ankiety, dlatego dodamy aplikację ``polls``.

Z linii poleceń wpisz :django:django-admin:`python manage.py startapp polls <django:startapp>`:

.. code-block:: sh

   (warsztaty) ~/carrots$ python manage.py startapp polls
   (warsztaty) ~/carrots$ tree .

::

   .
   ├── carrots
   │   ├── __init__.py
   │   ├── settings.py
   │   ├── urls.py
   │   ├── wsgi.py
   ├── carrots.db
   ├── manage.py
   └── polls
       ├── __init__.py
       ├── admin.py
       ├── models.py
       ├── tests.py
       └── views.py

   2 directories, 14 files

Po stworzeniu aplikacji trzeba ją jeszcze aktywować w naszym projekcie.
W pliku ``carrots/settings.py`` musimy dodać aplikację ``polls`` do :django:setting:`INSTALLED_APPS`.
Efekt powinien wyglądać tak::

    INSTALLED_APPS = (
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.messages',
        'django.contrib.staticfiles',
        'polls'
    )

Aplikacje w Django składają się z kilku plików:

* ``admin.py`` - definicje dla panelu administracyjnego,
* ``models.py`` - definicje modeli dla bazy danych,
* ``tests.py`` - testy aplikacji,
* ``views.py`` - widoki aplikacji.

Podsumowanie
============

Instalacja Django:

.. code-block:: sh

   (warsztaty) ~$ pip install django==1.6.2

Tworzenie katalogu projektu:

.. code-block:: sh

   # Linux

   (warsztaty) ~$ django-admin.py startproject carrots


.. code-block:: bat

   :: Windows

   (warsztaty) C:\Users\TeddyBear> python -m django-admin startproject carrots

Ustawienie strefy czasowej oraz języka w pliku ``carrots/settings.py``::

   TIME_ZONE = 'Europe/Warsaw'

   LANGUAGE_CODE = 'pl'

   USE_TZ = False

Utworzenie bazy danych (należy także uruchomić po dodaniu każdego modelu):

.. code-block:: sh

   (warsztaty) ~/carrots$ python manage.py syncdb

Uruchomienie serwera:

.. code-block:: sh

   (warsztaty) ~/carrots$ python manage.py runserver

Utworzenie nowej aplikacji o nazwie ``polls``:

.. code-block:: sh

   (warsztaty) ~/carrots$ python manage.py startapp polls

Pamiętaj, aby po utworzeniu aplikacji dopisać ją do :django:setting:`INSTALLED_APPS`.