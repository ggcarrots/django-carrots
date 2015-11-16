Dictionaries
========

Introduction
------------

It is time for you to get to know useful data structure - dictionary. Dictionaries are used to store data as a key and value (just like in encyclopedia - you have entry and a description attached to it). Imagine you want to store information about library users. For every reader you have: name, surname, birthdate, birthplace, id number.
In python such a structure would look like this:

.. code-block:: python

  reader = {
    'name': 'Kasia',
    'surname': 'Kowalska',
    'date_of_birth': '19-01-1985',
    'place_of_birth': 'Wrocław',
    'readers_nr': 'ASDF1234',
  }

In this example ``name`` is a key (dictionary entry), witch assigned value ``Kasia`` (entry description).
Try to create your own user entry.

Nowoczesna Biblioteka Raczyńskich in Poznan wants to send its users birthday wishes. For the library worker to know when you were born it only takes to check:

  >>> print reader['date_of_birth']
  '19-01-1985'

The clerk recalled: to send you birthday wishes he needs your address aswell. You can add them to your reader's data in such manner:

.. code-block:: python

  reader['address'] = 'ul. Marszałkowska 1, 01-234 Warszawa'
  
You can easily change the value in dictionary, if you make any mistake- it only takes to rewrite existing value:

.. code-block:: python

  reader['place_of_birth'] = 'Łódź'

To print to screen whole dictionary, we can use loop :keyword:`for`:

.. code-block:: python

  for key in reader:
    print key, reader[key]

Using 'for' loop on dictionary allows to iterate though every single key. ``reader[key]`` gives access to the value under given key.
Beware, the order of records is random, dictionaries do not have assigned order. If you want to use ordered structures use lists.

Task 1
------
  
Description: Library system contains author data assigned to every book. Library clerk checks book author while putting books on shelf in alphabetic order.
Try to write down pairs: book --> author for every record in dictionary, used to store library information.

EXAMPLE (one line output):

.. code-block:: python

  'Introduction to Algorithms' --> 'Thomas H. Cormen'

.. code-block:: python

  title_to_author = {
    'Structure and Interpretation of Computer Programs' : 'Harold Abelson',
    'Introduction to Algorithms' : 'Thomas H. Cormen',
    'The C Programming Language' : 'Brian W. Kernighan',
    'The Pragmatic Programmer: From Journeyman to Master' : 'Andrew Hunt',
    'Art of Computer Programming' : 'Donald Ervin Knuth',
    'Design Patterns: Elements of Reusable Object-Oriented Software' : 'Erich Gamma',
    'Artificial Intelligence: A Modern Approach' : 'Stuart Russell',
    'Introduction to the Theory of Computation' : 'Michael Sipser',
    'Code Complete' : 'Steve McConnell',
    'The Mythical Man-Month: Essays on Software Engineering' : 'Frederick P. Brooks Jr.'}


Task 2
------

You can help the clerk to find out on which shelf given book should be putted. In this very moment the library store data about its books in two dictionaries:: ``title_to_author`` and ``title_to_shelf_number``. We need to join them. 
After join there will be one dictionary, containing information about shelf and author of a book.
These information will be stored in tuplets of such elements (shelf number, author's full name)

Merge two dictionaries ``title_to_author`` and ``title_to_shelf_number`` in one, stored in variable ``title_to_book_record``:

* The key in dictionary ``title_to_author`` is "book's title", and value is "main author's name"
* The key in dictionary ``title_to_shelf_number`` is "book's title", and value is "shelf number"
* The key in output dictionary ``title_to_book_record`` should be "book's title", and value should contain 2 elements tuple
  ("main author's name", "shelf number")

EXAMPLE:

For key ``The C Programming Language`` dictionary ``title_to_book_record`` should return a tuplet:
``('Brian W. Kernighan', 23)``. In Python interpreter:

  >>> title_to_book_record['The C Programming Language']
  ('Brian W. Kernighan', 23)
  
.. code-block:: python

  title_to_author = {
    'Structure and Interpretation of Computer Programs' : 'Harold Abelson',
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

  title_to_shelf_number = {
    'Structure and Interpretation of Computer Programs' : 1,
    'Introduction to Algorithms' : 34,
    'The C Programming Language' : 23,
    'The Pragmatic Programmer: From Journeyman to Master' : 12,
    'Art of Computer Programming' : 4,
    'Design Patterns: Elements of Reusable Object-Oriented Software' : 586,
    'Artificial Intelligence: A Modern Approach' : 32,
    'Introduction to the Theory of Computation' : 98,
    'Code Complete' : 77,
    'The Mythical Man-Month: Essays on Software Engineering' : 3}


Task 3
------

If you would like to find books particular edition by ISBN, you can use dictionary as below.

Print out dictionary's content in such manner::

    'TITLE' by 'AUTOR' is on shelf 'NUMBER_OF_SHELF' (ISBN: 'NUMBER_OF_ISBN')

The key in dictionary ``books`` is integer "ISBN" , and value is THREE ELEMENTS TUPLE ("book's title", "main author's name", "shelf number")

EXAMPLE (one line output)::

    Introduction to Algorithms by Thomas H. Cormen is on shelf 34 (ISBN: 0262032937)

.. code-block:: python

  books = {
    '0262510871' : ('Structure and Interpretation of Computer Programs', 'Harold Abelson', 1),
    '0262032937' : ('Introduction to Algorithms', 'Thomas H. Cormen', 34),
    '0131103628' : ('The C Programming Language', 'Brian W. Kernighan', 23),
    '020161622X' : ('The Pragmatic Programmer: From Journeyman to Master', 'Andrew Hunt', 12),
    '0201485419' : ('Art of Computer Programming', 'Donald Ervin Knuth', 4),
    '0201633612' : (
      'Design Patterns: Elements of Reusable Object-Oriented Software', 'Erich Gamma', 586),
    '0130803022' : ('Artificial Intelligence: A Modern Approach', 'Stuart Russell', 32),
    '0534950973' : ('Introduction to the Theory of Computation', 'Michael Sipser', 98),
    '0735619670' : ('Code Complete', 'Steve McConnell', 77),
    '0201835959' : (
      'The Mythical Man-Month: Essays on Software Engineering', 'Frederick P. Brooks Jr.', 3
    )
  }

         
Additional task
---------------

Fill the body of method ``find_by_isbn_part``, so it would return all books' titles matching part of given ISBN.
The key in dictionary ``books`` is ``ISBN``, and value is THREE ELEMENTS TUPLE::

    ("book's title", "main author's name", "shelf number")

Running this script will execute test function, that will verify if the method works properly and output the result to the terminal.

.. code-block:: python

  books = {
    '0262510871' : ('Structure and Interpretation of Computer Programs', 'Harold Abelson', 1),
    '0262032937' : ('Introduction to Algorithms', 'Thomas H. Cormen', 34),
    '0131103628' : ('The C Programming Language', 'Brian W. Kernighan', 23),
    '020161622X' : ('The Pragmatic Programmer: From Journeyman to Master', 'Andrew Hunt', 12),
    '0201485419' : ('Art of Computer Programming', 'Donald Ervin Knuth', 4),
    '0201633612' : (
      'Design Patterns: Elements of Reusable Object-Oriented Software', 'Erich Gamma', 586),
    '0130803022' : ('Artificial Intelligence: A Modern Approach', 'Stuart Russell', 32),
    '0534950973' : ('Introduction to the Theory of Computation', 'Michael Sipser', 98),
    '0735619670' : ('Code Complete', 'Steve McConnell', 77),
    '0201835959' : (
      'The Mythical Man-Month: Essays on Software Engineering', 'Frederick P. Brooks Jr.', 3
    )
  }

CORRECT THE FUNCTION ``find_by_isbn_part``:

.. code-block:: python

    def find_by_isbn_part(books, isbn_part):
        result = []

        # HINTS:
        #  - user for loop
        #  - isbn_part in isbn is a condition that verifies if isbn contains isbn_part
        #  - adding elements to list, where x is a list and e is an element to add: x.append(e)
        return result

    # DO NOT ALTER
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
            print(
              "WRONG! FOR '" + input +
              "' RESULT IS: '" + str(output) +
              "', EXPECTED: '" + str(expected_output) + "'")
        else:
            print("OK! FOR '" + input + "'")

    test(books)
