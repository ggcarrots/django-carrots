Objets et classes
=================

Dans les faits, ce chapitre pourrait faire l'objet d'un atelier d'un
week-end à lui tout seul.  Nous allons simplement nous concentrer sur
les fonctionnalités les plus simples dont vous aurez besoin pour
pouvoir travailler avec Django.

Toute valeur est un objet
-------------------------

Toutes les choses que nous avons appelées valeur jusqu'à présent peut-etre
appelé "un objet" dans l'univers de Python. On dit communément que
"tout est objet".

Par exemple les entiers, pour lesquels la fonction :func:`help` nous
retournait des dizaines de lignes d'information à propos de
:func:`int`sont aussi des objets.

.. Par exemple une variable name = "toto" est un objet de type string

Tout objet a une classe
-----------------------

Une classe est le type d'un objet (un type d'objet?). Par analogie, on peut dire que
c'est le moule qui permet de créer l'objet.

On peut tout simplement utiliser la fonction :func:`type`: pour
connaitre le type d'un objet :

    >>> type(2)
    <class 'int'>
    >>> type(2.0)
    <class 'float'>
    >>> type("spam eggs")
    <class 'str'>
    >>> x = 1, 2
    >>> type(x)
    <class 'tuple'>
    >>> type([])
    <class 'list'>

Nous avons déjà parlé des classes que vous pouvez voir ici : ``int``,
``float``, ``str``, ``tuple``.

Quand nous utilisons des nombres dans notre programme, nous attendons qu'ils se comportent comme des nombres, et nous savons intuitivement ce qu'est un nombre.

Par contre, Python doit savoir exactement ce que ça veut dire d'etre un nombre.

Par exemple qu'est-ce qu'il se passe lorsqu'on additionne deux nombres
? Ou qu'on les divisent ? La classe ``int`` définit tous cela et bien
plus.

En utilisant la fonction :func:`help` , vérifiez ce que nous donne la classe ``str``. Voici quelques fonctionnalités intéressantes :

    >>> help(str.lower)
    Help on method_descriptor:
    <BLANKLINE>
    lower(...)
        S.lower() -> str
    <BLANKLINE>
        Return a copy of the string S converted to lowercase.
    <BLANKLINE>
    >>> help(str.upper)
    Help on method_descriptor:
    <BLANKLINE>
    upper(...)
        S.upper() -> str
    <BLANKLINE>
        Return a copy of S converted to uppercase.
    <BLANKLINE>
    >>> help(str.ljust)
    Help on method_descriptor:
    <BLANKLINE>
    ljust(...)
        S.ljust(width[, fillchar]) -> str
    <BLANKLINE>
        Return S left-justified in a Unicode string of length width. Padding is
        done using the specified fill character (default is a space).
    <BLANKLINE>
    >>> help(str.center)
    Help on method_descriptor:
    <BLANKLINE>
    center(...)
        S.center(width[, fillchar]) -> str
    <BLANKLINE>
        Return S centered in a string of length width. Padding is
        done using the specified fill character (default is a space)
    <BLANKLINE>

Toutes ces opérations sont applicable à n'importe quelle chaîne de caractères. Pour y accéder, on ajoute un point suivi de l'appel de la fonction à appliquer :

    >>> x = "Ala"
    >>> x.upper()
    'ALA'
    >>> x.lower()
    'ala'
    >>> x.center(9)
    '   Ala   '

Une fonction appliquée à un objet est appelée une méthode de l'objet.

Encore une dernière chose importante, pour créer un nouvel objet, on appelle la classe de l'objet (dans le jargon technique on dit qu'on instancie un objet). 
L'objet ainsi créé est appelé une instance de la classe :

    >>> int()
    0
    >>> str()
    ''
    >>> list()
    []
    >>> tuple()
    ()

Une instance est donc une nouvelle valeur du type décrit par la classe.

Pour résumer, nous avons vu les classes :func:`int`, :func:`str`, :func:`tuple` et
:func:`list`. Nous avons vu que pour connaitre la classe décrivant une valeur (un objet), nous pouvions regarder son type avec la fonction :func:`type`. Pour créer une instance de la classe (un nouvel objet), on appèle la classe de la même manière que nous appelons une fonction, en ajoutant des parenthèses ``()``. Par exemple : ``int()``.


Définir une classe
------------------

Les classes telles que ``int`` ou ``str`` font partie du langage Python est sont déjà définies, mais nous pouvons créer nos propres classes pour définir leur comportement. Cela s'appelle définir une classe.

Il est aussi facile de définir une classe que de définir une fonction. En fait un classe n'est rien de plus qu'un ensemble de fonctions. Prenons par exemple une classe ``Dog`` :

.. testsetup:: simple-class

    class Dog(object):

        def bark(self):
            print("Woof! Woof!")

::

    class Dog(object):

        def bark(self):
            print("Woof! Woof!")

Les classes commencent par le mot clé :keyword:`class`, suivi du nom de la classe.
L'``(object)`` indique que nouveau type ``Dog`` est un nouveau type de l'ensemble des classes de type ``object``.
Ainsi, les instances de notre classe, c'est à dire les objets créés, seront de type ``Dog`` mais également du type plus général des ``objects``.

En fait c'est exactement pour cela qu'on dit que "tout est objet en Python". Car chaque classe est une spécialisation de la classe ``object`` de Python. C'est pourquoi quasiment chaque valeur est de type général ``object``.

Il est important de noter que chaque fonction d'une classe doit prendre pour premier argument la valeur de l'objet duquel elle a été appelée. Nous l'appelons systématiquement ``self`` par convention. Dans notre exemple, nous avons une fonction appelée ``bark`` (qui comme vous le voyez n'a qu'un seul argument), regardons comment elle fonctionne :

.. testcode:: simple-class

    my_new_pet = Dog()
    my_new_pet.bark()

.. testoutput:: simple-class

    Woof! Woof!

Vous pouvez appeler ce premier argument comme vous le souhaitez mais `la convention la plus répandue <https://www.python.org/dev/peps/pep-0008/#function-and-method-arguments>`_ est de l'appeler ``self``.


Attributs des objets
--------------------

Outre les méthodes (les fonctions définies dans une classe), les objets
peuvent également avoir des attributs.

.. testcode:: simple-class

    my_new_pet = Dog()
    my_new_pet.name = "Snoopy"

    print(my_new_pet.name)

.. testoutput:: simple-class

    Snoopy

Parfois nous souhaitons que tous les objets d'une classe aient un attribut, par exemple tous les chiens doivent avoir un nom. Nous pouvons ajouter le spécifier en crééant une fonction, au nom spécial, appelée ``__init__`` :

::

    class Dog(object):

        def __init__(self, name):
            self.name = name

        def bark(self):
            print("Woof! Woof!")


Dans la fonction ``__init__``, nous avons assigné une valeur à un nouvel attribut ``name`` de l'objet ``self``. Comme expliqué précédement, ``self`` est l'objet courant de la classe ``Dog`` que nous sommes en train de manipuler. Nous pouvons maintenant utiliser cet attribut dans les autres méthodes :

.. testcode:: init-class

    class Dog(object):

        def __init__(self, name):
            self.name = name

        def bark(self):
            return "Woof! %s! Woof!" % (self.name,)

    snoopy = Dog("Snoopy")
    pluto = Dog("Pluto")
    print(snoopy.bark())
    print(pluto.bark())

.. testoutput:: init-class

    Woof! Snoopy! Woof!
    Woof! Pluto! Woof!

La fonction :func:`__init__` est appelée durant la création de l'objet.
On l'appelle contructeur; car elle aide à la création de l'objet.


Dans cet exemple, la fonction ``__init__`` accepte deux arguments:
``self`` et ``name``, mais quand on créé une instance de la classe
``Dog``, nous ne spécifions que l'argument ```name``, ``self``
est automatiquement spécifié par Python.
Désormais, lorsque que nous instancions un nouvel objet Dog, celui-ci a un attribut: son nom

Héritage
========

Dans le chapitre précédent, nous avons créé une classe ``Dog`` comme sous ensemble du type ``objects``, mais ce n'est pas la seule possibilité. Nous pouvons également dire que ``Dog`` est aussi un ``Animal`` :

::

    class Animal(object):
        pass

    class Dog(Animal):

        def __init__(self, name):
            self.name = name

        def bark(self):
            return "Woof! %s! Woof!" % (self.name,)

Nous avons donc une nouvelle classe ``Animal``, qui hérite du type ``object``. ``Dog`` hérite du type ``Animal``. En d'autres termes :

* Tout ``Animal`` est un ``object``
* Tout ``Dog`` est un ``Animal``, tout ``Dog`` est un ``object``

Ainsi nous pouvons décrire des comportements communs à tous les
Animaux dans notre classe ``Animal``, par exemple le fait de courir,
et laisser dans la classe ``Dog`` des comportements plus spécifiques,
comme aboyer:

::

    class Animal(object):

        def run(self, distance):
            return "Run %s meters." % (distance,)

La méthode ``run`` sera disponible pour tous les sous-types de ``Animal`` (comme les objets de type ``Dog`` par exemple) :

::

    >>> scooby = Dog("Scooby")
    >>> print(scooby.run(10))
    Run 10 meters.
