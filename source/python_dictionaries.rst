
Słowniki
========

Wprowadzenie
------------

Czas żebyś poznał/a przydatną struktrurę danych - słownik. Słowniki służą do przechowywania danych w formie klucz wartość (tak jak w encyklopedii mamy hasło, a z nim powiązany opis).
Wyobraź sobie, że chcemy przechowywać informacje o czytelnikach w bibliotece. Dla każdego czytelnika mamy następujące dane: imię, nazwisko, data urodzenia, miejsce urodzenia, numer karty czytelnika.
Tak to wygląda w języku Python z zastosowaniem słowników:

.. code-block:: python

  reader = {
    'name': 'Kasia',
    'surname': 'Kowalska',
    'date_of_birth': '19-01-1985',
    'place_of_birth': 'Wrocław',
    'readers_nr': 'ASDF1234',
  }

W tym przykładzie ``name`` to klucz (hasło w słowniku), któremu odpowiada wartość ``Kasia`` (opis hasła).
Spróbuj teraz stworzyć swój własny rekord czytelnika.

Nowoczesna Biblioteka Raczyńskich w Poznaniu chce wysyłać swoim czytelnikom życzenia urodzinowe. Żeby pan bibliotekarz wiedział kiedy się urodziłaś/eś wystarczy, że sprawdzi:

  >>> print reader['date_of_birth']
  '19-01-1985'
  
Pan bibliotekarz przypomniał sobie: żeby wysłać Tobie życzenia urodzinowe potrzebuje Twojego adresu. Możesz go dodać do swoich danych czytelnika w następujący sposób:

.. code-block:: python

  reader['address'] = 'ul. Marszałkowska 1, 01-234 Warszawa'
  
Możesz też łatwo zmienić wartość w słowniku, jeśli wcześniej popełniłeś/łaś błąd- wystarczy nadpisać istniejącą wartość:

.. code-block:: python

  reader['place_of_birth'] = 'Łódź'
  
Żeby wypisać cały słownik na ekran, możemy użyć pętli :keyword:`for`:

.. code-block:: python

  for key in reader:
    print key, reader[key]

Użycie pętli for ze słownikiem pozwala przeiterować się po kolejnych kluczach słownika. ``reader[key]`` daje skolei dosUwaga, kolejność w jakiej
będziemy otrzymywać klucze jest losowa, słowniki nie pamiętają kolejności. Jeżeli chcemy zapamiętać kolejność musimy
użyć przykładowo list.

Zadanie 1
---------
  
Opis: System biblioteczny zawiera dane o autorze dla każdej ksiąki. Pan bibliotrekarz układając książki na regale sprawdza autora, żeby książki były ułożone alfabetycznie.
Spróbuj wypisać pary: książka --> autor dla każdej pozycji w słowniku, który opisuje księgozbiór biblioteki.

PRZYKŁAD (jedna linijka oczekiwanego wyjścia):

.. code-block:: python

  'Introduction to Algorithms' --> 'Thomas H. Cormen'

.. code-block:: python

  title_to_author = {'Structure and Interpretation of Computer Programs' : 'Harold Abelson',
                   'Introduction to Algorithms' : 'Thomas H. Cormen',
                   'The C Programming Language' : 'Brian W. Kernighan',
                   'The Pragmatic Programmer: From Journeyman to Master' : 'Andrew Hunt',
                   'Art of Computer Programming' : 'Donald Ervin Knuth',
                   'Design Patterns: Elements of Reusable Object-Oriented Software' : 'Erich Gamma',
                   'Artificial Intelligence: A Modern Approach' : 'Stuart Russell',
                   'Introduction to the Theory of Computation' : 'Michael Sipser',
                   'Code Complete' : 'Steve McConnell',
                   'The Mythical Man-Month: Essays on Software Engineering' : 'Frederick P. Brooks Jr.'}


Zadanie 2
---------

Możesz pomóc bibliotekarzowi sprawdzić, na którą półkę powinien odłożyć daną książkę. W tym momencie biblioteka przechowuje 
dane o książkach w dwóch słownikach: ``title_to_author`` i ``title_to_shelf_number``. Musimy je połączyć.
W wyniku połączenia powstanie nowy słownik, który dla danego tytułu książki ma zawierać informacje o numerze półki oraz autorze.
Te informacje mają być przechowywane w krotkach o postaci (numer półki, imię i nazwisko autora)

Połącz dwa słowniki ``title_to_author`` i ``title_to_shelf_number`` w jeden, przechowywany w zmiennej
``title_to_book_record``:

* Kluczem w słowniku ``title_to_author`` jest "tytuł książki", a wartością "imię głównego authora"
* Kluczem w słowniku ``title_to_shelf_number`` jest "tytuł książki", a wartością "numer półki"
* Kluczem w wynikowym słowniku ``title_to_book_record`` powinien być "tytuł książki", a wartością 2 elementowa krotka
  ("imię głównego autora", "numer półki")

PRZYKŁAD:

Dla klucza ``The C Programming Language`` słownik ``title_to_book_record`` powinien zwrócić krotkę:
``('Brian W. Kernighan', 23)``. Czyli, w interpreterze Pythona:

  >>> title_to_book_record['The C Programming Language']
  ('Brian W. Kernighan', 23)
  
.. code-block:: python

  title_to_author = {'Structure and Interpretation of Computer Programs' : 'Harold Abelson',
                   'Introduction to Algorithms' : 'Thomas H. Cormen',
                   'The C Programming Language' : 'Brian W. Kernighan',
                   'The Pragmatic Programmer: From Journeyman to Master' : 'Andrew Hunt',
                   'Art of Computer Programming' : 'Donald Ervin Knuth',
                   'Design Patterns: Elements of Reusable Object-Oriented Software' : 'Erich Gamma',
                   'Artificial Intelligence: A Modern Approach' : 'Stuart Russell',
                   'Introduction to the Theory of Computation' : 'Michael Sipser',
                   'Code Complete' : 'Steve McConnell',
                   'The Mythical Man-Month: Essays on Software Engineering' : 'Frederick P. Brooks Jr.'}
                   
.. code-block:: python

  title_to_shelf_number = {'Structure and Interpretation of Computer Programs' : 1,
                         'Introduction to Algorithms' : 34,
                         'The C Programming Language' : 23,
                         'The Pragmatic Programmer: From Journeyman to Master' : 12,
                         'Art of Computer Programming' : 4,
                         'Design Patterns: Elements of Reusable Object-Oriented Software' : 586,
                         'Artificial Intelligence: A Modern Approach' : 32,
                         'Introduction to the Theory of Computation' : 98,
                         'Code Complete' : 77,
                         'The Mythical Man-Month: Essays on Software Engineering' : 3}
                         

Zadanie 3
---------

Gdybyś szukał konkretnego wydania ksiażki po ISBN to możesz skorzystać z poniższego słownika.

Wypisz zawartość słownika w formacie::

    'TITLE' by 'AUTOR' is on shelf 'NUMBER_OF_SHELF' (ISBN: 'NUMBER_OF_ISBN')

Kluczem w słownik ``books`` jest numer "ISBN" , a wartością 3 ELEMENTOWA KROTKA ("tytuł książki", "imię głównego autora", "numer półki")

PRZYKŁAD (jedna linijka oczekiwanego wyjścia)::

    Introduction to Algorithms by Thomas H. Cormen is on shelf 34 (ISBN: 0262032937)

.. code-block:: python

  books = {'0262510871' : ('Structure and Interpretation of Computer Programs', 'Harold Abelson', 1),
         '0262032937' : ('Introduction to Algorithms', 'Thomas H. Cormen', 34),
         '0131103628' : ('The C Programming Language', 'Brian W. Kernighan', 23),
         '020161622X' : ('The Pragmatic Programmer: From Journeyman to Master', 'Andrew Hunt', 12),
         '0201485419' : ('Art of Computer Programming', 'Donald Ervin Knuth', 4),
         '0201633612' : ('Design Patterns: Elements of Reusable Object-Oriented Software', 'Erich Gamma', 586),
         '0130803022' : ('Artificial Intelligence: A Modern Approach', 'Stuart Russell', 32),
         '0534950973' : ('Introduction to the Theory of Computation', 'Michael Sipser', 98),
         '0735619670' : ('Code Complete', 'Steve McConnell', 77),
         '0201835959' : ('The Mythical Man-Month: Essays on Software Engineering', 'Frederick P. Brooks Jr.', 3)}
         
         
Zadanie dodatkowe
-----------------

Uzupełnij ciało funkcji ``find_by_isbn_part`` tak, aby zwracała tytuły książek zawierające podany fragment numeru ISBN.
Kluczem w słowniku ``books`` jest numer ``ISBN``, a wartością 3 ELEMENTOWA KROTKA::

    ("tytuł książki", "imię głównego autora", "numer półki")

Uruchomienie tego skryptu spowoduje wywołanie funkcji testującej, która sprawdzi czy funkcja dobrze działa i wypisze raport na konsolę.

.. code-block:: python

  books = {'0262510871' : ('Structure and Interpretation of Computer Programs', 'Harold Abelson', 1),
         '0262032937' : ('Introduction to Algorithms', 'Thomas H. Cormen', 34),
         '0131103628' : ('The C Programming Language', 'Brian W. Kernighan', 23),
         '020161622X' : ('The Pragmatic Programmer: From Journeyman to Master', 'Andrew Hunt', 12),
         '0201485419' : ('Art of Computer Programming', 'Donald Ervin Knuth', 4),
         '0201633612' : ('Design Patterns: Elements of Reusable Object-Oriented Software', 'Erich Gamma', 586),
         '0130803022' : ('Artificial Intelligence: A Modern Approach', 'Stuart Russell', 32),
         '0534950973' : ('Introduction to the Theory of Computation', 'Michael Sipser', 98),
         '0735619670' : ('Code Complete', 'Steve McConnell', 77),
         '0201835959' : ('The Mythical Man-Month: Essays on Software Engineering', 'Frederick P. Brooks Jr.', 3)}

POPRAW FUNKCJĘ ``find_by_isbn_part``:

.. code-block:: python

    def find_by_isbn_part(books, isbn_part):
        result = []

        # PODPOWIEDZI:
        #  - użyj pętli for
        #  - isbn_part in isbn to warunek, który sprawdza czy ciąg znaków isbn_part zawiera się w isbn
        #  - dodawanie elementów do listy, gdzie x to lista, a e to element, który chcesz dodać: x.append(e)
        return result

    # TEGO PONIŻEJ NIE ZMIENIAJ
    def test(books):
        single_test(books, '020', ['The Pragmatic Programmer: From Journeyman to Master',
                                 'Art of Computer Programming',
                                 'Design Patterns: Elements of Reusable Object-Oriented Software',
                                 'The Mythical Man-Month: Essays on Software Engineering'])
        single_test(books, '18', ['The Mythical Man-Month: Essays on Software Engineering'])
        single_test(books, '22', ['The Pragmatic Programmer: From Journeyman to Master',
                                'Artificial Intelligence: A Modern Approach'])
        single_test(books, '0735619670', ['Code Complete'])

    def single_test(books, input, expected_output):
        output = find_by_isbn_part(books, input)
        if set(output) != set(expected_output) or len(output) != len(expected_output):
            print("ŹLE! DLA '"+input+"' WYNIK TO: '"+str(output)+"', OCZEKIWANO: '"+str(expected_output)+"'")
        else:
            print("OK! DLA '"+input+"'")

    test(books)
