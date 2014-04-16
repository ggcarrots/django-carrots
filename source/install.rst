==========
Instalacja
==========

Na potrzeby warsztatów będzie nam potrzebny interpreter języka
Python w wersji 3.4. Poniżej znajdują się wskazówki, jak
sprawdzić, czy już go mamy, ewentualnie zainstalować wraz z
przydatnymi narzędziami.

Windows
=======

Wersje dla Windows można pobrać bezpośrednio ze strony `python.org`_.
Po ściągnięciu pliku ``*.msi`` uruchom go i postępuj zgonie z instrukcjami.
Ważne jest, aby zapamiętać ścieżkę, którą wybraliśmy jako katalog instalacji,
bo będzie nam ona potrzebna przy :ref:`instalacji narzędzi <narzędzia>`.


Linux (Ubuntu, Fedora, etc.) lub Mac
====================================

Aby sprawdzić czy i jaką wersję mamy, wpisz w linii poleceń:

.. code-block:: sh

    $ python --version
    Python 3.4.0

Jeśli nie ma dostępnej komendy python lub wyświetla ona nieodpowiednią wersję:

Ubuntu
------

W linii poleceń wpisz::

    sudo apt-get install python3.4

Fedora
------

W linii poleceń wpisz::

    sudo yum install python3.4

OS X
----

Ze strony `python.org`_ ściągnij i zainstaluj paczkę dla Twojej wersji systemu.


Inne
----

Użyj systemu paczek odpowiedniego dla Twojej dystrybucji. Jeśli takiego nie ma
lub nie możesz znaleźć Pythona, to możesz go zainstalować, używając źródeł
za strony `python.org`_. Wymagany będzie kompilator i biblioteka readline.

Po cichu zakładamy, że użytkownicy mniej popularnych (nie znaczy, że gorszych)
dystrybucji Linuksa na pewno sobie poradzą z tym zadaniem :).



.. _narzędzia:

Narzędzia
=========

Linia poleceń Windows
---------------------

Większość pracy będziemy wykonywać z linii poleceń. Aby uruchomić linię
poleceń Windows, kliknij ``Start``, a następnie ``Uruchom...``. W otwartym oknie
wpisz ``cmd`` i kliknij ``OK``. Pojawi się nowe okno z białym tekstem na
czarnym tle:

.. code-block:: bat

    Microsoft Windows [Wersja 6.1.7601]
    Copyright (c) 2009 Microsoft Corporation. Wszelkie prawa zastrzeżone.

    C:\Users\Imie>

Tekst może trochę się różnić w zależności od używanej wersji Windowsa.

``C:\Users\Imie>`` to tak zwany ``prompt``. Informuje nas o katalogu, w którym
aktualnie się znajdujemy oraz czeka na podanie polecenia. W dalszej części
warsztatów ``C:\Users\Imie>`` będziemy skracać do  ``~$``, niezależnie
od używanego systemu (Windows, Linux, MacOS).

Z pomocą linii poleceń można poruszać się po zawartości dysku (podobnie jak po
wejściu w ``Mój komputer``). Służą do tego polecenia:

``dir``
    Wyświetla zawartość aktualnego katalogu. Przykładowo, jeżeli ``prompt``
    pokazuje katalog ``C:\Users\Imie``, to polecenie ``dir`` wyświetli zawartość
    naszego katalogu domowego.

``cd katalog``
    Służy do zmiany aktualnego katalogu. Przykładowo, jeśli jesteśmy w katalogu ``C:\Users\Imie``,
    wykonanie ``cd Documents`` przeniesie nas do katalogu z naszymi
    dokumentami. Jeśli teraz wykonasz polecenie ``dir``, zobaczysz coś znajomego.

    Polecenie ``cd..`` powoduje przejście do katalogu poziom wyżej.

``mkdir katalog``
    Tworzy nowy katalog.


Środowisko wirtualne
--------------------

Musimy wybrać teraz katalog dla naszego środowiska wirtualnego. Środowisko wirtualne pozwala
odizolować naszą pracę od innych części systemu. Może być to przykładowo katalog domowy użytkownika.

W przypadku Windowsa 7 ścieżka do katalogu domowego dla użytkownika ``Ala`` będzie wyglądała tak: ``C:\Users\Ala\`` .
Możesz wybrać też inny katalog, ale ważne jest, żeby zapamiętać, gdzie znajduje się nasze środowisko.

Na przykład, jeżeli naszym katalogiem domowym jest ``C:\Users\lrekucki``, linia poleceń będzie wyglądała tak:

.. code-block:: bat

    :: Windows
    C:\Users\lrekucki> C:\Python34\python -m venv warsztaty

.. code-block:: sh

    # Linux i Mac
    ~$ python3.4 -m venv warsztaty


W Twoim katalogu domowym powstanie katalog ``warsztaty`` zawierający tzw.
wirtualne środowisko. Na razie istotne jest dla nas tylko to, że po jego aktywacji:

.. code-block:: bat

    :: Windows
    C:\Users\lrekucki> warsztaty\Scripts\activate

.. code-block:: sh

    # Linux i Mac
    ~$ source warsztaty/bin/activate

komenda ``python`` będzie uruchamiała dobrą wersję Pythona, więc nie będziemy
musieli ani dopisywać pełnej ścieżki na początku, ani wersji na końcu.

Uruchom w terminalu:

.. code-block:: bat

    :: Windows
    (warsztaty) C:\Users\lrekucki>where python
    C:\Users\lrekucki\warsztaty\Scripts\python.exe

    (warsztaty) C:\Users\lrekucki>where pip
    C:\Users\lrekucki\warsztaty\Scripts\pip.exe
    ...

    (warsztaty) C:\Users\lrekucki>python --version
    3.4.0

.. code-block:: sh

    # Linux i Mac
    (warsztaty) ~$ which python
    /home/lrekucki/warsztaty/bin/python
    (warsztaty) ~$ which pip
    /home/lrekucki/warsztaty/bin/pip
    ...

    (warsztaty) ~$ python --version
    3.4.0


.. _python.org: http://python.org/download/releases/3.4.0/

W razie problemów po wpisaniu ``which pip`` może być potrzeba przeinstalowania pip:

.. code-block:: sh

    python -m pip uninstall pip
    python -m ensurepip

Podsumowanie
------------

Instalacja nowego środowiska wirtualnego:

.. code-block:: bat

    :: Windows
    C:\Users\lrekucki> C:\Python34\python -m venv warsztaty

.. code-block:: sh

    # Linux i Mac
    ~$ python3.4 -m venv warsztaty

Aktywacja środowiska wirtualnego:

.. code-block:: bat

    :: Windows
    C:\Users\lrekucki> warsztaty\Scripts\activate

.. code-block:: sh

    # Linux i Mac
    ~$ source warsztaty/bin/activate

Upewnij się, że używasz właściwej wersji pythona:

.. code-block:: sh

    (warsztaty) ~$ python --version
    3.4.0


IPython
-------

Ewentualnie możemy zainstalować ``IPython``, który poprawi wygląd i wygodę korzystania
z konsoli Pythona.

Zainstaluj ``IPython``:

.. code-block:: sh

    (warsztaty) ~$ pip install ipython

.. note::

    Jeżeli polecenie ``pip`` nie działa, spróbuj ``pip3``.