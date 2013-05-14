==========
Instalacja
==========

Na potrzeby naszych warsztatów będzie nam potrzebny interpreter języka
Python w wersji 3.2 lub 3.3. Poniżej znajdują się wskazówki jak
sprawdzić czy już go nie mamy, ewentualnie zainstalować wraz z
przydatnymi narzędziami.

Windows
=======

Wersje dla Windows można pobrać bezpośrednio ze strony `python.org`_.
Po ściągnięciu pliku ``*.exe`` uruchom go i postępuj zgonie z instrukcjami.
Ważne jest aby zapamiętać ścieżkę, którą wybraliśmy jako katalog instalaji,
bo będzie nam ona potrzebna przy :ref:`instalacji narzędzi <narzędzia>`.


Linux (Ubuntu, Fedora, etc.) lub Mac
====================================

Aby sprawdzić czy i jaką wersję mamy wpisz w linii poleceń:

.. code-block:: sh

    $ python --version
    Python 3.3.1


Jeśli nie ma dostępnej komendy python, lub wypisuję ona nieodpowiednią wersję.

Ubuntu
------

W linii poleceń wpisz::

    sudo apt-get install python3

Fedora
------

W linii poleceń wpisz::

    sudo yum install python3

OS X
----

Ściągnij i zainstaluj paczkę dla twojej wersji systemu ze strony `python.org`_.


Inne
----

Użyj systemu paczek odpowiedniego dla twojej dystrybucji. Jeśli takiego nie ma
lub nie możesz znaleźć Python'a, to możesz go zainstalować używając źródeł
za strony `python.org`_. Wymagany będzie kompilator i biblioteka readline.

Po cichu zakładamy, że użytkownicy mniej popularnych (nie znaczy gorszych)
dystrybucji na pewno sobie poradzą z tym zadaniem :).



.. _narzędzia:

Narzędzia
=========

Linia poleceń Windows
---------------------

Większość pracy będziemy wykonywać z linii poleceń. Aby uruchomić linię
poleceń Windows kliknij ``Start`` a następnie ``Uruchom...``. W otwartym oknie
wpisz ``cmd`` i kliknij ``OK``. Pojawi się nowe okno z białym tekstem na
czarnym tle:

.. code-block:: bat

    Microsoft Windows [Wersja 6.1.7601]
    Copyright (c) 2009 Microsoft Corporation. Wszelkie prawa zastrzeżone.

    C:\Users\Imie>

Tekst może trochę się różnić w zależności od używanej warsji Windowsa.

``C:\Users\Imie>`` to tak zwany ``prompt``. Informuje nas o katalogu, w którym
aktualnie się znajdujemy oraz czeka na podanie polecenia. W dalszej części
warsztatów ``C:\Users\Imie>`` będziemy czasem skracać do  ``~$``, niezależnie
od używanego systemu (Windows, Linux, MacOS).

Z linii poleceń można poruszać się po zawartości dysku (podobnie jak po
wejściu w ``Mój komputer``). Służą do tego polecenia:

``dir``
    Wyświetla zawartość aktualnego katalogu. Przykładowo, jeżeli ``prompt``
    pokazuje katalog ``C:\Users\Imie``, to polecenie ``dir`` wyświetli zawartość
    naszego katalogu domowego.

``cd katalog``
    Zmiana aktualnego katalogu. Przykładowo będąc w katalogu ``C:\Users\Imie``,
    wykonanie ``cd Documents`` spowoduje wejście do katalogu z naszymi
    dokumentatmi. Możesz teraz sprawdzić co spowoduje wykonanie polecenia ``dir``
    i widzisz coś znajomego.

    Polecenie ``cd..`` spowoduje przejście do wyższego katalogu.

``mkdir katalog``
    Utworzenie nowego katalogu


Środowisko wirtualne
--------------------

Gdy już mamy działającego Python'a, zainstalujemy jeszcze jeden program, który
uprości instalację innych Python'owych programów i usprawni nam pracę.

Pobierz skrypt `virtualenv.py`_ do swojego katalogu domowego i otwórz konsolę.

.. code-block:: bat

    :: Windows
    C:\Users\lrekucki> C:\Python33\python virtualenv.py warsztaty --system-site-packages --distribute

.. code-block:: sh

    # Linux i Mac
    ~$ python3.3 virtualenv.py warsztaty --system-site-packages --distribute --python=python3


W twoim katalogu domowym powstanie katalog ``warsztaty`` zawierający tzw.
wirtualne środowisko. Na razie istotne jest dla nas tylko to, że po jego aktywacji:

.. code-block:: bat

    :: Windows
    C:\Users\lrekucki> warsztaty\Scripts\activate

.. code-block:: sh

    # Linux i Mac
    ~$ source warsztaty/bin/activate

Komenda python będzie uruchamiała dobrą wersję Python'a, więc nie będziemy
musieli ani dopisywać pełnej ścieżki na początku, ani wersji na końcu.

Uruchom w terminalu

.. code-block:: bat

    :: Windows
    (warsztaty) C:\Users\lrekucki>where python
    C:\Users\lrekucki\warsztaty\Scripts\python.exe
    ...

    (warsztaty) C:\Users\lrekucki>python --version
    3.3.1

.. code-block:: sh

    # Linux i Mac
    (warsztaty) ~$ which python
    /home/lrekucki/warsztaty/bin/python.exe
    ...

    (warsztaty) ~$ python --version
    3.3.1


.. _python.org: http://python.org/download/releases/3.3.1/
.. _virtualenv.py: https://raw.github.com/pypa/virtualenv/c881ae56d34a578b3f61326ed7745ef2e6d269d0/virtualenv.py


IPython
-------

Zainstaluj ``IPython``

.. code-block:: sh

    (warsztaty) ~$ pip install ipython
