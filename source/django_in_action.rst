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
* bazy danych - w niej przechowywane będą dane takie jak pytania ankiety i odpowiedzi.

Zaczniemy od stworzenia serwera aplikacji.

Instalacja
==========

Zainstaluj Django, uruchamiając w konsoli:

.. code-block:: sh

   ~$ pip install django==1.5.5

Odpowiednia paczka zostanie pobrana z `PyPI <http://pypi.python.org>`_ - repozytorium pakietów Pythona,
gdzie można znaleźć wiele użytecznych bibliotek.


Poczatek projektu
=================

Django dostarcza skrypt administracyjny "django-admin.py". Pozwala on stworzyć szkielet naszej strony.

Aby stworzyć nowy projekt ze stroną, uruchamiamy:

.. code-block:: sh

   # Linux

   ~$ django-admin.py startproject carrots
   ~$ tree carrots
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

   (warsztaty) C:\Users\TeddyBear> python -m django-admin startproject carrots
   (warsztaty) C:\Users\TeddyBear> tree /f carrots
   Folder PATH listing
   Volume serial number is 00FA-07FF
   C:\USERS\TEDDYBEAR\DOCUMENTS\CARROTS
   │   manage.py
   │
   └───carrots
           settings.py
           urls.py
           wsgi.py
           __init__.py


Struktura projektu
==================

Nowo utworzony projekt zawiera katalog "carrots" i kilka podstawowych plików.

W pliku ``carrots/settings.py`` znajdują się ustawienia strony, takie jak język, baza danych, zainstalowane aplikacje.
Plik ten możemy edytować sami. Na początku wewnątrz znajdziemy domyślne ustawienia i komentarze wyjaśniające.

Plik ``manage.py`` pozwala administrować stroną, czyli utworzyć lub wyczyścić bazę danych, uruchomić prosty serwer
aplikacji itp. Później zobaczymy, jak go używać.

Plik ``carrots/urls.py`` zawiera informacje o ścieżkach (urlach) na stronie.

Pozostałe pliki są mniej ciekawe, przeważnie w ogóle się do nich nie zagląda, ani się ich nie zmienia.
Dociekliwych odsyłam do Google.

Ustawienia aplikacji
====================

W pliku ``carrots/settings.py`` znajdź:

.. code-block:: py

   DATABASES = {
     'default': {
       'ENGINE': 'django.db.backends.', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
       'NAME': '',                      # Or path to database file if using sqlite3.
       'USER': '',                      # Not used with sqlite3.
       'PASSWORD': '',                  # Not used with sqlite3.
       'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
       'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
     }
   }

Jest to definicja bazy danych, której będziemy używać. Jak widzimy, jest to zwykły słownik, zawierający klucz
``default``. ``Django`` zawsze szuka definicji bazy właśnie pod tym kluczem, a jeżeli jej nie znajdzie, to
zgłosi błąd.

Sama definicja bazy ``default`` składa się z kilku informacji: silnika, jakiego używamy, nazwy bazy, użytkownika,
hasła oraz adresu do połączenia z bazą. My będziemy używać bazy ``Sqlite``, gdyż jest to najprostsze rozwiązanie.
Informacje takie jak użytkownik, hasło czy adres będą w tym wypadku niepotrzebne.

Zamień ``'django.db.backends.'`` na ``'django.db.backends.sqlite3'`` oraz dodaj ``'NAME'`` ``'carrots.db'``.
Plik ``carrots.db`` będzie zawierał bazę danych.

Ostatecznie nasza definicja bazy może wyglądać w ten sposób::

   DATABASES = {
     'default': {
       'ENGINE': 'django.db.backends.sqlite3',
       'NAME': 'sqlite.db',
     }
   }



Ustaw strefę czasową na Warszawę i domyślny język na polski
::

   # Local time zone for this installation. Choices can be found here:
   # http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
   # although not all choices may be available on all operating systems.
   # In a Windows environment this must be set to your system time zone.
   TIME_ZONE = 'Europe/Warsaw'

   # Language code for this installation. All choices can be found here:
   # http://www.i18nguy.com/unicode/language-identifiers.html
   LANGUAGE_CODE = 'pl'


Dla uproszczenia wyłączymy też zaawansowaną obsługę stref czasowych w bazie
danych - nie bedzie ona potrzebna w naszym projekcie::

   # If you set this to False, Django will not use timezone-aware datetimes.
   USE_TZ = False


Odkomentuj też dwie wskazane linie w ``INSTALLED_APPS``.

::

   INSTALLED_APPS = (
       'django.contrib.auth',
       'django.contrib.contenttypes',
       'django.contrib.sessions',
       'django.contrib.sites',
       'django.contrib.messages',
       'django.contrib.staticfiles',
       # Uncomment the next line to enable the admin:
       'django.contrib.admin',
       # Uncomment the next line to enable admin documentation:
       'django.contrib.admindocs',
   )

``INSTALLED_APPS`` zawiera informację o zainstalowanych aplikacjach. Projekty ``Django``
składają się z wielu aplikacji, w tym wypadku są to na przykład aplikacje: ``auth`` do
uwierzytelniania użytkowników, ``sessions`` do zarządzania sesją użytkownika itd.

Jak widać, ``INSTALLED_APPS`` jest po prostu krotką zawierającą napisy. Odkomentowanie
dwóch ostatnich napisów włączy aplikację do administracji. Później będziemy jej używać.

Baza danych
===========

Teraz użyjemy opisanego wcześniej pliku ``manage.py`` do stworzenia
bazy danych. Służy do tego opcja ``syncdb``:

.. code-block:: sh

   ~$ cd carrots
   ~$ python manage.py syncdb

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
    Username (leave blank to use 'fasola'): fasola
    Email address: admin@example.com
    Password:
    Password (again):
    Superuser created successfully.
    Installing custom SQL ...
    Installing indexes ...
    Installed 0 object(s) from 0 fixture(s)

Jeśli wszystko poszło, dobrze Django poprosi Cię o podanie danych konta administratora.
Nazwę użytkownika możesz zostawić taką, jaka jest proponowana, adres email może być dowolny.
Z podanymi danymi (tzn. Username i Password) będziemy mogli później zalogować się do
panelu administracyjnego. W powyższym przykładzie użytkownikiem będzie ``fasola``.

Jeżeli chcesz dowiedzieć się więcej na temat ``manage.py``, uruchom:

.. code-block:: sh

    ~$ python manage.py help

Dostaniesz listę wszystkich komend oraz opcji obsługiwanych przez ``manage.py``.

Aby uzyskać pomoc na temat pojedynczej komendy, uruchom ``manage.py help komenda`` np:

.. code-block:: sh

    ~$ python manage.py help syncdb

Interfejs administracyjny
=========================

Napisaliśmy wcześniej, że włączyliśmy aplikację do administracji. To jeszcze
nie znaczy, że aplikacja jest dostępna pod jakimś adresem.

Teraz w pliku ``carrots/urls.py`` odkomentuj wszystkie linie poniżej ``Uncomment`` (poprzez usuniecie ``#`` z początku
linii). Plik wynikowy powinien wyglądać tak:

.. code-block:: py

   from django.conf.urls import patterns, include, url

   # Uncomment the next two lines to enable the admin:
   from django.contrib import admin
   admin.autodiscover()

   urlpatterns = patterns('',
       # Examples:
       # url(r'^$', 'carrots.views.home', name='home'),
       # url(r'^carrots/', include('carrots.foo.urls')),

       # Uncomment the next line to enable the admin:
       url(r'^admin/', include(admin.site.urls)),
   )

W ten sposób administracja będzie dostępna pod urlem ``admin/``.



Następnie uruchom serwer:

.. code-block:: sh

   ~$ python manage.py runserver
   Validating models...

   0 errors found
   April 19, 2013 - 20:14:37
   Django version 1.5.1, using settings 'carrots.settings'
   Development server is running at http://127.0.0.1:8000/
   Quit the server with CTRL-BREAK.

Nasza strona będzie dostępna pod adresem http://127.0.0.1:8000/ , lub
http://localhost:8000/.

Jak wspomnieliśmy administracja powinna być dostępna pod urlem ``admin/``, dlatego wchodzimy na
adres http://localhost:8000/admin/.


Tworzymy nową aplikację do ankiet.
==================================

Na razie stworzyliśmy projekt ``carrots``. Projekty w Django dzielą się na aplikacje dostarczające określone funkcje.

My chcemy umieścić na naszej stronie ankiety, dlatego dodamy aplikację ``polls``.

Z linii poleceń wpisz:

::

   ~$ python manage.py startapp polls
   ~$ tree .
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
       ├── models.py
       ├── tests.py
       └── views.py

   2 directories, 14 files

Po stworzeniu aplikacji trzeba ją jeszcze aktywować w naszym projekcie.
W pliku ``carrots/settings.py`` musimy dodać aplikację ``polls`` do ``INSTALLED_APPS``.
Efekt powinien wyglądać tak::

    INSTALLED_APPS = (
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.sites',
        'django.contrib.messages',
        'django.contrib.staticfiles',
        # Uncomment the next line to enable the admin:
        'django.contrib.admin',
        # Uncomment the next line to enable admin documentation:
        'django.contrib.admindocs',

        'polls',
    )

Aplikacje w ``Django`` składają się z kilku plików:
* ``models.py`` - definicje modeli dla bazy danych,
* ``tests.py`` - testy aplikacji,
* ``views.py`` - widoki aplikacji.

Modele
======

Następnym krokiem będzie zdefiniowanie modeli naszej aplikacji.
Model opisuje, co i w jaki sposób może być przechowywane w bazie danych.

Nasza aplikacja będzie zawierać pytania oraz odpowiedzi do nich, dlatego utworzymy dwa modele: ``Poll`` oraz ``Choice``.
Model ``Poll`` zawiera treść pytania i datę publikacji. Model ``Choice`` zawiera odwołanie do odpowiedniego pytania,
treść odpowiedzi oraz liczbę głosów.

W pliku ``polls/models.py`` wpisujemy::

    from django.db import models

    class Poll(models.Model):
        question = models.CharField(max_length=200)
        pub_date = models.DateTimeField('date published')

    class Choice(models.Model):
        poll = models.ForeignKey(Poll)
        choice_text = models.CharField(max_length=200)
        votes = models.IntegerField(default=0)

Dodając nowe modele, zmieniliśmy schemat bazy danych.
Musimy ponownie wykonać ``syncdb``, aby nowe modele pojawiły się w bazie danych.

.. warning::
    Po wykonaniu ``syncdb`` nie można już dodać nowych pól do modelu. Można dodawać tylko nowe modele.
    Są sposoby, żeby to obejść, ale o tym w innej bajce.

.. code-block:: sh

   ~$ python manage.py syncdb
   Creating tables ...
   Creating table polls_poll
   Creating table polls_choice
   Installing custom SQL ...
   Installing indexes ...
   Installed 0 object(s) from 0 fixture(s)

I tyle! Pewnie chcielibysmy jednak mieć też możliwość edytowania obiektów. Najłatwiej to zrobić w interfejsie 
administracyjnym.

Tworzymy plik ``polls/admin.py``, a w nim::

    from django.contrib import admin
    from polls.models import Poll, Choice

    admin.site.register(Poll)
    admin.site.register(Choice)

.. note::

    Niektóre zmiany wymagają ponownego uruchomienia serwera.  W konsoli, gdzie jest uruchomiony
    serwer, wciskamy ``Ctrl+C`` i wykonujemy ``python manage.py runserver`` raz jeszcze.

Gdy ponownie wejdziemy na http://localhost:8000/admin/, zobaczymy, że pojawiła się tam nowa zakładka `Polls`.


Zabawa w konsoli
================

Django udostępnia swoją konsolę. Jest to zwykła konsola Pythona (tzn. możemy robić dokładnie te same rzeczy,co po
uruchomieniu polecenia ``python``), ale dodatkowo możemy korzystać z narzędzi i modeli Django.

.. code-block:: sh

   ~$ python manage.py shell

Gdy już jesteś w shellu::

    >>> from polls.models import Poll, Choice

    # Wszystkie ankiety w bazie; teraz nie ma tam nic, dlatego dostajemy pustą listę
    >>> Poll.objects.all()
    []

    # Tworzymy pierwszą ankietę.
    >>> import datetime
    >>> p = Poll(question="What's new?", pub_date=datetime.datetime.now())

    # Zapisujemy ankietę w bazie danych. W tym celu zawsze trzeba wywołać metodę save().
    >>> p.save()

    # Każdy obiekt w bazie danych ma przypisane unikalne dla siebie ID.
    >>> p.id
    1

    # p jest zwykłym obiektem. Możemy czytać jego atrybuty.
    >>> p.question
    "What's new?"
    >>> p.pub_date
    datetime.datetime(2012, 2, 26, 13, 0, 0, 775217)

    # Po zmianie atrybutów ponownie wywołujemy save(), aby zapisać zmiany do bazy.
    >>> p.question = "What's up?"
    >>> p.save()

    # objects.all() zwraca listę wszystkich obiektów w bazie danych
    >>> Poll.objects.all()
    [<Poll: Poll object>]

Modele w Django są klasami, a w klasach możemy definiować metody. Metoda to taka funkcja, która dodatkowo dostaje
parametr ``self``, będący aktualnym obiektem (np. aktualną ankietą). Metody w klasach (modelach) pozwalają dodawać
dodatkowe zachowania lub zmieniać istniejące.

Jedną z takich metod jest ``__str__``, która pozwala zmienić sposób wyświetlania modelu (ankiety lub pytania).
``<Poll: Poll object>`` niewiele nam mówi. Naprawmy to, dodając metodę ``__str__`` do ``Poll`` i ``Choice``::

    class Poll(models.Model):
        # ...
        def __str__(self):
            return self.question

    class Choice(models.Model):
        # ...
        def __str__(self):
            return self.choice_text

Django będzie używało tych metod przy wyświetlaniu obiektów, nie tylko w konsoli, ale również we wspomnianym wcześniej
interfejsie administracyjnym.

Możemy też dodawać inne metody::

    import datetime
    from django.utils import timezone
    # ...
    class Poll(models.Model):
        # ...
        def was_published_recently(self):
            return self.pub_date >= datetime.datetime.now() - datetime.timedelta(days=1)

Zauważcie, że musieliśmy dodać ``import datetime``, aby móc korzystać z obiektów reprezentujących czas w Pythonie.

Zapiszmy te zmiany i uruchommy intepreter za pomocą polecenia ``python manage.py shell`` raz jeszcze::

    >>> from polls.models import Poll, Choice

    # Sprawdzmy czy dziala nasza nowa metoda __str__()
    >>> Poll.objects.all()
    [<Poll: What's up?>]

Do tej pory używaliśmy metody ``all``, która pozwala wyciągnąć listę wszystkich obiektów danego typu (np. wszystkich
pytań). Istnieją też inne metody pozwalające wyciągnąć obiekty spełniające określone warunki:

.. code-block:: python

    # Django pozwala na bardzo łatwe wyszukiwanie obiektow w bazie danych. Spójrzmy na kilka przykładów.
    >>> Poll.objects.filter(id=1)
    [<Poll: What's up?>]
    >>> Poll.objects.filter(question__startswith='What')
    [<Poll: What's up?>]
    >>> Poll.objects.get(pub_date__year=2012)
    <Poll: What's up?>

    # Próba pobrania nieistniejącego obiektu spowoduje silne protesty Pythona.
    # Ale do tego jesteśmy już przyzwyczajeni.
    >>> Poll.objects.get(id=2)
    Traceback (most recent call last):
        ...
    DoesNotExist: Poll matching query does not exist. Lookup parameters were {'id': 2}

    # Wypróbujmy teraz naszą własną metodę.
    >>> p = Poll.objects.get(id=1)
    >>> p.was_published_recently()
    True

Możemy też uzyskać dostęp do odpowiedzi (``Choice``) na pytania:

.. code-block:: python

    # Na razie nasza ankieta nie zawiera żadnych odpowiedzi. Dodajmy jakieś!
    >>> p.choice_set.all()
    []

    # ... na przykład trzy. Użyjemy do tego metody "create". W wyniku dostaniemy obiekt "Choice".
    >>> p.choice_set.create(choice_text='Not much', votes=0)
    <Choice: Not much>
    >>> p.choice_set.create(choice_text='The sky', votes=0)
    <Choice: The sky>
    >>> c = p.choice_set.create(choice_text='Just hacking again', votes=0)

    # Mając obiekt "Choice", możemy też znaleźć ankietę, do której on należy.
    >>> c.poll
    <Poll: What's up?>

    # ...I na odwrót, wszystkie odpowiedzi dla danej ankiety.
    >>> p.choice_set.all()
    [<Choice: Not much>, <Choice: The sky>, <Choice: Just hacking again>]
    >>> p.choice_set.count()
    3

    # A teraz coś trudniejszego. Co robi to zapytanie?
    >>> Choice.objects.filter(poll__pub_date__year=2012)
    [<Choice: Not much>, <Choice: The sky>, <Choice: Just hacking again>]

    # Na koniec usuńmy jedno z pytań. Służy do tego metoda "delete".
    >>> c = p.choice_set.filter(choice_text__startswith='Just hacking')
    >>> c.delete()



Wyświetlanie stron internetowych
================================

Wejście pod główny adres http://localhost:8000/ nadal powoduje wyświetlenie brzydkiej strony błędu. Nie może tak dalej
być!

Dobrze jest zacząć pracę nad nowym serwisem internetowym od przemyślenia struktury URLi (adresów). Wiemy, że będziemy
chcieli wyświetlić listę wszystkich ankiet na stronie, pozwolić użytkownikom zagłosować oraz wyświetlić zbiorcze wyniki
ankiety.

Jeszcze raz otwórzmy plik ``urls.py`` i dodajmy cztery nowe wpisy. Ostatecznie plik powinien wyglądać następująco::

  from django.conf.urls import patterns, include, url

  from django.contrib import admin
  admin.autodiscover()

  urlpatterns = patterns('',
      url(r'^polls/$', 'polls.views.index'),
      url(r'^polls/(?P<poll_id>\d+)/$', 'polls.views.detail'),
      url(r'^polls/(?P<poll_id>\d+)/results/$', 'polls.views.results'),
      url(r'^polls/(?P<poll_id>\d+)/vote/$', 'polls.views.vote'),
      url(r'^admin/', include(admin.site.urls)),
  )

Przyjrzyjmy się temu przykładowi raz jeszcze. Każdy argument przekazany do funkcji ``patterns`` (poza pierwszym, ale
o tym potem) określa nam wzorzec URL (adresu). Wzorzec ten zapisany jest za pomocą
`wyrażenia regularnego <http://pl.wikipedia.org/wiki/Wyra%C5%BCenie_regularne#Wyra.C5.BCenia_regularne_w_praktyce>`_.
Jest to trudne techniczne określenie malutkiego języka, służącego do zwięzłej reprezentacji wzorców tekstu.

Kiedy użytkownik próbuje wejść na określony adres na naszej stronie, taki jak http://localhost:8000/polls/1/,
Django wybiera część URL po trzecim ukośniku (w tym przypadku ``polls/1/``)  i próbuje ją kolejno dopasować do wyrażeń
regularnych z ``urlpatterns``. Przyjrzyjmy się przykładowi takiego wyrażenia::

  r'^polls/(?P<poll_id>\d+)/vote/$'

Tak naprawdę jest to normalny ciąg znaków (może poza poczatkowym ``r``, które jest tu używane tylko dla wygody).
Kiedy próbujemy do niego dopasować tekst (nadal myślimy o ``polls/1/``), musimy pamietać o następujacych zasadach:

.. admonition:: Wyrażenia regularne
   :class: alert alert-info

   * Każda litera i cyfra wyrażenia regularnego pasuje tylko do takiej samej litery/cyfry ciągu dopasowywanego. Tak samo
     ukośnik (``/``), spacja (`` ``), podkreślenie (``_``) i myślnik (``-``).
   * ``^`` pasuje tylko do początku ciągu znaków (nie do znaku, "początek" należy tutaj traktować jak abstrakcyjny twór
     przed pierwszym znakiem).
   * ``$`` pasuje tylko do końca ciągu znaków (na podobnej zasadzie co "początek").
   * Kropka (``.``) pasuje do dowolnego znaku.
   * Jeżeli kilka znaków obejmiemy nawiasami kwadratowymi, np. tak ``[aBde]``, taka grupa liczy się jako jedna całość i
     dopasuje się do dowolnego jednego znaku z wewnątrz grupy.
   * Istnieje skrótowa notacja dla takich grup. Zamiast wypisywać wszystkie małe litery alfabetu, możemy napisac ``[a-z]``,
     aby dopasować dowolną jedną małą literę. Tak samo dla dużych liter ``[A-Z]`` lub cyfr ``[0-9]``.
   * Dopasować jedną cyfrę można jeszcze krócej, używając znaczka ``\d``.
   * Jeżeli po dowolnym z powyższych wyrażeń postawimy znak ``?``, zostanie ono potraktowane jako *opcjonalne*. Oznacza
     to, że jeżeli w ciągu dopasowywanym nie będzie takiego wyrażenia, nadal będzie możliwe jego dopasowanie. Jeżeli
     będzie, zostanie dopasowane.
   * Jeżeli po wyrażeniu postawimy znak ``*``, dopasuje się ono z dowolną ilością powtorzeń wyrażenia (wliczając w to zero
     powtórzeń, czyli tak jakby było *opcjonalne*).
   * Jeżeli po wyrażeniu postawimy znak ``+``, dopasuje się ono z dowolną ilością powtórzeń wyrażenia, z wyjątkiem zera
     powtórzeń (tzn. wyrażenie musi wystąpić co najmniej raz).
   * Jeżeli kilka znaków obejmiemy nawiasami zwykłymi, np. tak ``(\d\d)``, zostaną one potraktowane jako grupa i wszystkie
     powyższe modyfikatory będą na nie działały w całości. Jeżeli dodatkowo napiszemy to z ``(?P<NAZWA>napis)``, grupa
     zostanie nazwana i będzie się do niej można potem odwołać pod nazwą ``NAZWA``. Jest to bardzo popularne przy pracy w
     Django.

Uff... Jest jeszcze wiele reguł, ale tak naprawdę nikt ich wszystkich nie pamięta. Te powyższe wystarczają w większości
przypadków.

Czy widzisz już, że przykładowe wyrażenie dopasuje się do ``polls/1/``? Dlaczego?

Kiedy już Django znajdzie dopasowanie, popatrzy na drugą część linii. Określa ona widok, który ma być wywołany w celu
utworzenia strony dla użytkownika. Dla ``polls/1/`` będzie to ``polls.views.detail``. Wszystkie nazwane grupy zostaną
przekazane widokowi jako argumenty o tej samej nazwie, tak jakby wywołać z konsoli:

.. code-block:: python

  detail(request=<HttpRequest object>, poll_id='1')


Pierwszy widok
==============

Dobra, zobaczmy, jak to działa w praktyce. Niestety, wejście pod adres http://localhost:8000/polls/1/ nie kończy się
dobrze::

  ViewDoesNotExist at /polls/1/

  Could not import polls.views.detail. View does not exist in module polls.views.

Ach, to dlatego, że nie zdefiniowaliśmy jeszcze widoku (Django podpowiada nam, że szukało ``polls.views.detail``,
niestety bez powodzenia)! Otwórzmy w tym celu plik `polls/views.py` i dodajmy kilka nowych funkcji::

  from django.http import HttpResponse

  def index(request):
      return HttpResponse("Hello, world. You're at the poll index.")

  def detail(request, poll_id):
      return HttpResponse("You're looking at poll %s." % poll_id)

  def results(request, poll_id):
      return HttpResponse("You're looking at the results of poll %s." % poll_id)

  def vote(request, poll_id):
      return HttpResponse("You're voting on poll %s." % poll_id)

Tak wyglądają najprostsze możliwe widoki. Nie zwracają one zwykłych ciągów znaków, tak jak funkcja budująca choinkę w
Pythonie, bo muszą mówić protokołem HTTP, który jest nieco bardziej skomplikowany (tutaj dobrze byłoby zobaczyć w
przeglądarce, co się tak naprawdę dzieje, gdy wchodzimy pod adres http://localhost:8000/polls/1/).


Widok, który naprawdę coś robi
==============================

Nasze widoki na razie nie robią zbyt wiele. Dajmy im trochę popracować!

Wszystko, czego Django potrzebuje od widoku, to obiekt
`HttpResponse <https://docs.djangoproject.com/en/1.4/ref/request-response/#django.http.HttpResponse>`_
lub wyrzucenie wyjątku. Cała reszta jest pod naszą kontrolą. Możemy na przykład użyć funkcji, które poznaliśmy w trybie
interaktywnym, aby wyświetlić wszystkie ankiety użytkownikowi::

  from polls.models import Poll
  from django.http import HttpResponse

  def index(request):
      latest_poll_list = Poll.objects.all().order_by('-pub_date')[:5]
      output = ', '.join([p.question for p in latest_poll_list])
      return HttpResponse(output)

.. note::

    Teraz nie podajemy już całej treści pliku, bo byłaby ona za długa. Podawane są tylko najważniejsze zmiany. W tym
    wypadku zmieniła się funkcja ``index`` oraz sam początek pliku (dodana linijka
    ``from django.http import HttpResponse``).

Działa! Jest tylko jeden problem z tym przykładem: określamy w widoku nie tylko to, co ma być zwrócone, ale też w jakim
formacie ma zostać zwrócone użytkownikowi serwisu. Jedną z najważniejszych umiejętności programisty jest umiejętność
odróżniania i rozdzielania dwóch niezależnych rzeczy. Programisci Django o tym pomyśleli i stworzyli system szablonow::

  from django.template import Context, loader
  from polls.models import Poll
  from django.http import HttpResponse

  def index(request):
      latest_poll_list = Poll.objects.all().order_by('-pub_date')[:5]
      t = loader.get_template('polls/index.html')
      c = Context({
          'latest_poll_list': latest_poll_list,
      })
      return HttpResponse(t.render(c))

Za obsługę szablonu w tym wypadku są odpowiedzialne funkcje ``get_template`` (Znajduje szablon) oraz ``render`` (zmienia
szablon na test, który dostanie ostatecznie użytkownik).

Kod jest trochę dłuższy, ale zaraz zobaczymy, o ile bardziej wszystko będzie czytelne. Najpierw załadujmy jednak stronę
http://localhost:8000/polls/, aby zobaczyć wynik naszej pracy::

  TemplateDoesNotExist at /polls/
  polls/index.html

Ups! No tak, nie dodaliśmy jeszcze szablonu. Aby to zrobić, stwórzmy plik ``polls/templates/polls/index.html`` i dodajmy
do niego:

.. note::
    Szablony aplikacji znajdują się w katalogu ``templates`` aplikacji, a funkcja ``get_template`` sama szuka szablonów
    w tych katalogach, dlatego nie musieliśmy podawać całej ścieżki ``polls/templates/polls/index.html``, wystarczyło
    ``polls/index.html``.

.. code-block:: django

  {% if latest_poll_list %}
  <ul>
      {% for poll in latest_poll_list %}
          <li><a href="/polls/{{ poll.id }}/">{{ poll.question }}</a></li>
      {% endfor %}
  </ul>
  {% else %}
      <p>No polls are available.</p>
  {% endif %}

Po przeładowaniu strony w przeglądarce powinniśmy zobaczyć listę zawierającą wszystkie utworzone wcześniej ankiety.

.. note::

    Jeżeli po odświeżeniu strony nadal widać błąd, należy ponownie uruchomić serwer. W konsoli, w której już jest 
    uruchomiony serwer, wciskamy ``Ctrl+C`` i wykonujemy ``python manage.py runserver`` ponownie.
    Teraz powinno już działać.

.. note::

   HTML i CSS sa formatami służącymi do określania wyglądu stron internetowych. Szablonów Django będziemy używać po to,
   aby generować kod HTML. Dobry opis HTML znajduje się w książce
   `Interactive Data Visualization for the Web <http://ofps.oreilly.com/titles/9781449339739/k_00000003.html>`_.
   Zachwycającą własnością sieci WWW jest to, że kody HTML i CSS każdej strony są zupełnie jawne. Polecam obejrzenie kodu
   ulubionych stron.

Prawie w każdym widoku będziemy chcieli ostatecznie użyć szablonu. Dlatego w Django jest funkcja ``render_to_response``,
która pozwala zrobić to w krótszy sposób::

  from django.shortcuts import render_to_response
  from polls.models import Poll

  def index(request):
      latest_poll_list = Poll.objects.all().order_by('-pub_date')[:5]
      return render_to_response('polls/index.html', {'latest_poll_list': latest_poll_list},
                            context_instance=RequestContext(request))


Zwracanie 404
=============

Zajmijmy się teraz widokiem szczegółow ankiety -- strony, która wyświetla pytania z konkretnej ankiety. Tak wygląda kod
widoku::

    from django.http import Http404
    # ...
    def detail(request, poll_id):
        try:
            p = Poll.objects.get(id=poll_id)
        except Poll.DoesNotExist:
            raise Http404
        return render_to_response('polls/detail.html', {'poll': p})

Tak wygląda kod szablonu ``polls/templates/polls/detail.html``:

.. code-block:: django

    <h1>{{ poll.question }}</h1>
    <ul>
    {% for choice in poll.choice_set.all %}
        <li>{{ choice.choice_text }}</li>
    {% endfor %}
    </ul>

Nowością jest tutaj wyrzucanie wyjątku ``Http404``, gdy sprawdzimy, że ankieta o konkretnym ID nie istnieje. Django
obsłuży taki wyjątek, wyświetlając domyślną stronę 404.

.. note::

   Można zmienić stronę wyswietlaną przez Django w wypadku błędu 404 (brak strony) i 500 (nieoczekiwany błąd serwera).
   W tym celu trzeba stworzyć szablony ``404.html`` i ``500.html``. Przed sprawdzeniem, czy to zadziałało, należy zmienić
   ``DEBUG`` w pliku ``settings.py`` na ``False``, inaczej Django nadal będzie wyświetlać swoje pomocnicze
   *żółte* strony.


Obsługa formularzy
==================

Zmieńmy szablon ``polls/templates/polls/details.html``, dodając tam prosty formularz HTML.

.. code-block:: django

  <h1>{{ poll.question }}</h1>

  {% if error_message %}<p><strong>{{ error_message }}</strong></p>{% endif %}

  <form action="/polls/{{ poll.id }}/vote/" method="post">
  {% csrf_token %}
  {% for choice in poll.choice_set.all %}
      <input type="radio" name="choice" id="choice{{ forloop.counter }}" value="{{ choice.id }}" />
      <label for="choice{{ forloop.counter }}">{{ choice.choice_text }}</label><br />
  {% endfor %}
  <input type="submit" value="Vote" />
  </form>

.. note::

   ``{% csrf_token %}`` to bardzo magiczny sposób zabezpieczenia przed stosunkowo nowym sposobem ataku na użytkowników
   stron internetowych. Wiecej opisane jest w
   `dokumentacji Cross Site Request Forgery <https://docs.djangoproject.com/en/1.4/ref/contrib/csrf/>`_.

Aby działały niektóre tagi szablonu (w szczególnosci ``{% csrf_token %}``), musimy przekazać do `render_to_response`
obiekt `RequestContext <https://docs.djangoproject.com/en/1.4/ref/templates/api/#subclassing-context-requestcontext>`_.
Robimy to w następujacy sposób::

  from django.template import RequestContext
  from django.shortcuts import get_object_or_404
  # ...
  def detail(request, poll_id):
      p = get_object_or_404(Poll, id=poll_id)
      return render_to_response('polls/detail.html', {'poll': p},
                                 context_instance=RequestContext(request))

Uważny czytelnik zauważy, że formularz wysyłany jest na adres ``/polls/{{ poll.id }}/vote/``, który nie obsługuje
jeszcze danych formularza. Poprawmy to teraz::

    from django.http import HttpResponseRedirect
    from django.core.urlresolvers import reverse

    from polls.models import Choice
    # ...
    def vote(request, poll_id):
        p = get_object_or_404(Poll, id=poll_id)
        try:
            selected_choice = p.choice_set.get(id=request.POST['choice'])
        except (KeyError, Choice.DoesNotExist):
            # Wyświetl błąd użytkownikowi, gdy wybrał złą opcję
            return render_to_response('polls/detail.html', {
                'poll': p,
                'error_message': "Musisz wybrać poprawną opcję.",
            }, context_instance=RequestContext(request))

        # Zapisz nową liczbę głósów
        selected_choice.votes += 1
        selected_choice.save()
        # Przekieruj użytkownika do widoku detali ankiety na, którą właśnie zagłosował
        return HttpResponseRedirect(reverse('polls.views.results', args=(p.id,)))

W tym widoku pojawia się sporo nowych koncepcji, o których nie mówiliśmy.

Obiekt ``request`` zawiera dane wysłane przez użytkownika, a ``request.POST`` zawiera dane z formularza
wysłanego przez użytkownika. W ten sposób wiemy, która opcja została wybrana.

Tutaj pojawia się ważna kwestia. Może okazać się, że widok dostał nieistniejącą odpowiedź.
Zawsze musimy sprawdzać dane otrzymane od użytkownika i reagować, jeśli te dane są bezsensowne.
To właśnie dzieje się w po :keyword:`except`. Odsyłamy wtedy użytkownika do ankiety i wyświetlamy błąd.

Jeżeli użytkownik wybrał poprawną opcję, możemy zwiększyć liczbę głosów i zapisać zmiany.
Następnie wykonujemy przekierowanie za pomocą ``HttpResponseRedirect`` do wcześniej napisanego
widoku detali ankiety.

Kolejna istotna sprawa: po zagłosowaniu mogliśmy po prostu wyświetlić jakąś stronę, podobnie jak na końcu widoku detali
(za pomocą ``render_to_response``). To, niestety, mogłoby prowadzić do ponownego wysyłania ankiety, jeżeli użytkownik
zacznie bawić się przyciskami ``wstecz`` i ``dalej`` w przeglądarce, albo po prostu odświeży stronę (klawiszem ``f5``)
W skrócie, zawsze po poprawnym wysłaniu formularza (w tym wypadku, zagłosowaniu na ankietę) powinniśmy wykonać
przekierowanie za pomocą ``HttpResponseRedirect``.

Na koniec pozostał nam do opracowania widok wyników ankiety, wyświetlany po zagłosowaniu::

  def results(request, poll_id):
      p = get_object_or_404(Poll, id=poll_id)
      return render_to_response('polls/results.html', {'poll': p},
                             context_instance=RequestContext(request))

Szablon ``polls/templates/polls/results.html``:

.. code-block:: django

  <h1>{{ poll.question }}</h1>

  <ul>
  {% for choice in poll.choice_set.all %}
      <li>{{ choice.choice_text }} -- {{ choice.votes }} vote{{ choice.votes|pluralize }}</li>
  {% endfor %}
  </ul>

  <a href="/polls/{{ poll.id }}/">Vote again?</a>

To wszystko! Wejdź pod adres http://localhost:8000/admin/ i stwórz kilka nowych ankiet i pytań, a potem pobaw się,
głosując na nie i namawiając inne osoby, aby zrobiły to samo.


.. admonition:: ``polls/views.py``
   :class: alert alert-hidden

   .. code-block:: python

        from django.http import Http404
        from django.http import HttpResponse
        from django.http import HttpResponseRedirect
        from django.template import Context, loader
        from django.template import RequestContext
        from django.shortcuts import render_to_response
        from django.shortcuts import get_object_or_404
        from django.core.urlresolvers import reverse

        from polls.models import Choice
        from polls.models import Poll

        def index(request):
            latest_poll_list = Poll.objects.all().order_by('-pub_date')[:5]
            return render_to_response('polls/index.html',
                                    {'latest_poll_list': latest_poll_list},
                                    context_instance=RequestContext(request))

        def detail(request, poll_id):
            p = get_object_or_404(Poll, id=poll_id)
            return render_to_response('polls/detail.html', {'poll': p},
                                     context_instance=RequestContext(request))

        def results(request, poll_id):
            p = get_object_or_404(Poll, id=poll_id)
            return render_to_response('polls/results.html', {'poll': p},
                             context_instance=RequestContext(request))

        def vote(request, poll_id):
            p = get_object_or_404(Poll, id=poll_id)
            try:
                selected_choice = p.choice_set.get(id=request.POST['choice'])
            except (KeyError, Choice.DoesNotExist):
                # Wyświetl błąd użytkownikowi, gdy wybrał złą opcję
                return render_to_response('polls/detail.html', {
                    'poll': p,
                    'error_message': "Musisz wybrać poprawną opcję.",
                }, context_instance=RequestContext(request))

            selected_choice.votes += 1
            selected_choice.save()
            # Przekieruj użytkownika do widoku detali ankiety, na którą właśnie zagłosował
            return HttpResponseRedirect(reverse('polls.views.results', args=(p.id,)))

.. admonition:: ``urls.py``
   :class: alert alert-hidden

   .. code-block:: python

        from django.conf.urls import patterns, include, url

        from django.contrib import admin
        admin.autodiscover()

        urlpatterns = patterns('',
          url(r'^polls/$', 'polls.views.index'),
          url(r'^polls/(?P<poll_id>\d+)/$', 'polls.views.detail'),
          url(r'^polls/(?P<poll_id>\d+)/results/$', 'polls.views.results'),
          url(r'^polls/(?P<poll_id>\d+)/vote/$', 'polls.views.vote'),
          url(r'^admin/', include(admin.site.urls)),
        )

.. admonition:: ``polls/models.py``
   :class: alert alert-hidden

   .. code-block:: python

        from django.db import models

        class Poll(models.Model):
            question = models.CharField(max_length=200)
            pub_date = models.DateTimeField('date published')

            def __str__(self):
                return self.question


        class Choice(models.Model):
            poll = models.ForeignKey(Poll)
            choice_text = models.CharField(max_length=200)
            votes = models.IntegerField(default=0)

            def __str__(self):
                return self.choice_text
