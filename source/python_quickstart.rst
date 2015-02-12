======================
Introduction à Python
======================

Commençons par lancer l'interpréteur Python que nous avons installé lors du chapitre précédant:


.. code-block:: sh

    (workshops) ~$ python
    Python 3.4.0 (...)
    Type "copyright", "credits" or "license" for more information.

    >>>


Avant d'entrer ``python``, nous entrions nos commandes sur la ligne de commande
du système d'exploitation.

L'invite de ligne de commande (aussi appelée "prompt") était ``~$``. Une fois
la commande ``python`` entrée, l'invite de commande a changée et est désormais
``>>>``. Cela signifie qu'à partir de maintenant, nous devons uniquement utiliser
des commandes venant du langage Python.

Les commandes telles que ``cd`` ou ``mkdir`` ne fonctionneront pas. Il est
temps d'apprendre un nouveau langage !

Nous ne taperons pas les signes ``>>>`` (de la même manière que pour ``~$``),
l'interpréteur python le fera pour nous.

Commençons par additionner deux nombres: 

    >>> 2 + 2
    4

Python est une super calculatrice:

    >>> 6 * 7
    42
    >>> 1252 - 38 * 6
    1024
    >>> (3 - 5) * 7
    -14
    >>> 21 / 7
    3.0
    >>> 3**2
    9
    >>> 5 / 2
    2.5

Faites bien attention lorsque vous entrez des nombres à virgules, utilisez des
points comme séparateurs, et non pas des virgules. Les virgules nous seront
utiles plus tard, pour définir des :ref:`tuple <bmi-tuples>`, mais nous
y reviendrons.


Le temps des présentations
==========================

Chaînes de caractères (Strings)
-------------------------------

Les nombres ne sont pas suffisants pour communiquer de manière efficace, nous
avons donc besoin d'utiliser des chaînes de caractères (aussi appelées
``strings``).

Voici quelques exemples: 

    >>> "Bonjour tout le monde"
    'Bonjour tout le monde'
    >>> 'Foo Bar'
    'Foo Bar'
    >>> "Rock 'n' Roll"
    "Rock 'n' Roll"
    >>> 'Mon nom est "Pierre"'
    'Mon nom est "Pierre"'

Vous pouvez également ajouter (on dit également concaténer) deux chaînes l'une
à l'autre:

    >>> 'Mon nom est ' + '"Pierre"'
    'Mon nom est "Pierre"'

Ou elles peuvent être aussi multipliés par des nombres:

    >>> 'oui ' * 3
    'oui oui oui'

Une chaine de caractères doit toujours se commencer et se terminer par le même
caractère. Il peut s'agir d'un guillemet simple (``'``), ou d'un guillemet
double (``"``). Cela n'a aucun effet sur la valeur de la chaine de caractères.
Par exemple, si nous entrons ``"Batman"``, nous créons une chaine de caractères
``Batman``, les guillemets ne font pas partie de la chaine de caractères, ils
sont là uniquement pour indiquer qu'il s'agit d'une chaîne de caractères
(string) (malheureusement, Python n'est pas suffisamment brillant pour se
rendre compte de ça lui même).


Afficher les chaînes de caractères
----------------------------------

Mais, comment afficher ces chaînes de caractères d'une manière lisible? Il est
possible de le faire en utilisant la fonction :func:`print`.


    >>> print("Bonjour tout le monde !")
    Bonjour tout le monde !

Il est aussi possible d'afficher différentes chaînes de caractères sur une même
ligne, sans avoir à les ajouter l'une à l'autre. Elles seront séparées par des
espaces:

    >>> print("Bonjour, mon nom est", "Pierre")
    Bonjour, mon nom est Pierre

La fonction :func:`print` peut être utilisée de différentes manières,
puisqu'elle peut écrire à peu près n'importe quoi.  Pour l'instant, le seul
type de valeurs que nous connaissons sont les nombres:

    >>> print(1)
    1
    >>> print(1, 2, 3)
    1 2 3
    >>> print("2 + 2 =", 2 + 2)
    2 + 2 = 4

Et voilà, nous avons terminé d'utiliser la console interactive de Python pour
l'instant. Pour sortir, entrez `quit()`::

    >>> quit()

Ou tapez ``Ctrl+D`` pour Linux ou ``Ctrl+Z`` pour Windows.


Fichiers de code source Python
==============================

Jusqu'à présent nous avons exécuté du code dans l'invite de commande
interractive dans laquelle nous récupèrons une réponse immédiate à nos
commandes. C'est un bon moyen d'apprendre et d'expérimenter les
éléments du langage. C'est pourquoi on y retourne.

Notre premier programme pourrait ressembler à ça::

    print("Hi, my name is Lucas")


Enregistrez ce programme dans un fichier appelé ``visitingcard.py``,
et lancé le depuis l'invite de commande ``python visitingcard.py``:

.. code-block:: sh

    (workshops) ~$ python visitingcard.py
    Hi, my name is Lucas
    (workshops) ~$

Un même programme peut contenir plusieurs commandes. Chacune devant être sur une ligne séparée, par exemple::

    print("Hi,")
    print()

    print("my name is Lucas")

    print()
    print("Bye.")

Nous pouvons ajouter des lignes vides où nous le souhaitons dans le
fichier ``visitingcard.py`` pour améliorer la lisibilité. Ici, nous
avons séparé l'entête du message d'avec son contenu et d'avec sa fin.


IMC calculator
==============

Essayons de créer un programme simple permettant de calculer son `IMC`
(`Indice de Masse Corporelle`_).

La formule de ce calcul est la suivante::

    IMC = (masse (kg)) / (taille (m)) au carré

Nous savons déjà faire une division, une puissance et afficher des
nombres. Il ne nous reste plus qu`à créer un fichier ``imc.py`` et à
essayer d'écrire le programme qui calcule l'IMC:


.. testcode::

    print("Votre IMC est :", 65.5 / (1.75 ** 2))

Lancer votre programme comme ceci::

    $ python imc.py

Vous obtenez::

.. testoutput::

    Votre IMC est : 21.387755102040817

Comme vous le voyez notre programme à besoin de quelques améliorations::

1. Si quelqu'un d'autre souhaite utiliser le programme nous devons
   modifier le fichier ``imc.py``.

2. Pour une personne qui ne connait pas les tables d'IMC par cœur,
   21.387755102 ne veut pas dire grand chose.

3. Afficher autant de décimales n'est pas nécessaire. Les nombres en
   entrée n'ayant que 3 chiffres significatifs.

Programmer c'est l'art de résoudre les problèmes, alors mettons nous au travail !
Cela va nous donner l'opportunité d'apprendre de nouvelles fonctionnalitées de Python.

.. _`Indice de Masse Corporelle`: http://fr.wikipedia.org/wiki/Indice_de_masse_corporelle


Alias
=====

Commençons par résoudre notre premier problème. Pour commencer nous
aimerions bien rendre notre programme plus lisible, pour permettre au
lecteur de savoir immédiatement quelle valeur correspond à la taille et quelle
valeur correspond au poids.

C'est pourquoi nous donnons des noms à ces valeurs:

.. testcode::

    weight = 65.5
    height = 1.75

    bmi = weight / height ** 2
    print("Votre IMC est :", bmi)

Le résultat n'a pas changé:

.. testoutput::

    Votre IMC est : 21.387755102040817


Pour mieux comprendre le fonctionnement des alias, revenons à l'invite
de commande Python et essayons d'en créer quelques-un

    >>> x = 42
    >>> PI = 3.1415
    >>> name = "Amelia"
    >>> print("Things:", x, PI, name)
    Things: 42 3.1415 Amelia

Une valeur peut être liée à plusieurs alias, elle peut donc avoir
plusieurs noms:

    >>> y = x
    >>> print(x, y)
    42 42

On peut également modifier la valeur d'un alias. La nouvelle valeur
n'a pas besoin d'être du même type que la précédente:

    >>> x = 13
    >>> print(x)
    13
    >>> x = "Scarab"
    >>> print(x)
    Scarab

Les alias sont indépendants les uns des autres. Si on modifie la
valeur de X, la valeur de y reste la même:

    >>> print(y)
    42

.. note:: Pour ceux qui connaissent d'autres langages de programmation

    Vous vous demandez surement pourquoi nous n'utilisons pas ici le
    terme "variable". C'est simplement car en Python, les alias ne
    fonctionnent pas de la même manière que les variables.
	Dans la plupart des langages, l'opération ``y = x`` crée une copie de
    ``x`` et la stocke dans la variable ``y``

	En Python, rien n'est copié silencieusement. ``y`` devient
	seulement un autre moyen de nommer la même valeur. Si on modifie
	cette valeur, ``x`` et ``y`` seront tous les deux modifiés et
	afficheront la même chose.

	Dans notre exemple, nous n'avons pas modifier la valeur du nombre
	``42``, mais nous avons modifié la valeur associée à ``x`` (en
	particulier, les valeurs des nombres ne sont jamais modifié, bien
	qu'en 1897, la Chambre basse de l'état d'Indiana ait accepté de
	modifier la valeur de π à ``3``, décision rejetée par le Sénat).
	C'est pourquoi, afficher la valeur de ``y`` avec ``print(y)``,
	nous donne ``42``.

Comme nous l'avons vu dans notre programme, nous pouvons également
donner des noms aux résultats des calculs et utiliser ensuite ces noms
comme alias de la valeur dans d'autres calculs.

    >>> w = 65.5
    >>> h = 175.0 / 100.0
    >>> bmi = w / h ** 2
    >>> print(w, h, bmi)
    65.5 1.75 21.387755102040817

À noter qu'une fois que la valeur est calculée, elle n'est pas modifiée:

    >>> w = 64
    >>> print(w, h, bmi)
    64 1.75 21.387755102040817

Sauf si on demande à Python de la recalculée à nouveau:

    >>> bmi = w / h**2
    >>> print(w, h, bmi)
    64 1.75 20.897959183673468

Il est grand temps d'ajouter quelques commentaires à notre programme
afin que les lecteurs (dont nous faisons partie) se souviennent que le
poids et en kg et la taille en m.

Les commentaires nous permette de rajouter du texte dans notre code
python.  Les commentaires seront simplement ignoré par l'interpreteur
python lors de l'exécution du code.

En Python, un commentaire est tous ce qui se trouve après un caractère
``#`` et la fin de la ligne::

    # Weight in kilograms
    weight = 65.5

    # Height in meters
    height = 1.75

    bmi = weight / height ** 2  # Calcule l'IMC en kg/m2
    print("Votre IMC est :", bmi)


Les fonctions
=============

Notre programme est pas trop mal, mais si l'utilisateur souhaite
calculer son IMC, il aura besoin de modifier le code source du
programme. Ce serait bien plus simple de lui permettre de saisir ces
valeurs directement dans la console après le lancement du programme et
de lui retourner ensuite son IMC.

Pour ce faire, nous devons apprendre à utiliser les fonctions. La
première fonction que nous allons apprendre à utiliser est la fonction
:func:`help`: ::

    >>> help
    Type help() for interactive help, or help(object) for help about object.

La fonction :func:`help` est très sympa car elle nous expliquer
comment nous devons l'utiliser. Elle peut aussi nous dire comment
utiliser d'autres fonctions::

    >>> help(input)
    Help on function input in module builtins:
    <BLANKLINE>
    input(...)
        input([prompt]) -> string
    <BLANKLINE>
        Read a string from standard input.  The trailing newline is stripped.
        If the user hits EOF (Unix: Ctl-D, Windows: Ctl-Z+Return), raise EOFError.
        On Unix, GNU readline is used if enabled.  The prompt string, if given,
        is printed without a trailing newline before reading.
    <BLANKLINE>

Nous utiliserons :func:`input` pour lire les données de
l'utilisateur. Comme nous pouvons le voir dans la documentation, la
fonction nous retourne une chaîne de caractères (string).

.. code::

    >>> input()
    Julie a un chat
    'Julie a un chat'

Apprenons maintenant ce qu'"appeler une fonction" veut dire.

Pour appeler une fonction, il faut utiliser ``()``, ce qui donne
l'information à l'interpreteur Python qu'il doit appeler une fonction.

Appeler une fonction c'est lancer le code de cette fonction. Si vous
oubliez d'utiliser ``()`` après le nom de la fonction, la fonction ne
sera pas appellée.

Dans cette situation, il n'y aura pas d'erreur car il est tout a fait
possible de manipuler une fonction sans l'appeler.

La plupart du temps une fonction **return** un résultat.

Dans le cas de la :func:`input`, ce résultat est une chaîne de
caractères, c'est pourquoi nous pouvons la manipuler de la même
manière que nous avons manipuler les chaînes de caractères auparavent.

Par exemple nous pouvons donner un alias au résultat de la fonction
``input()`` pour pouvoir réutiliser cette valeur par la suite:

.. testsetup::

    input.queue.append("Joanna")

.. doctest::

    >>> name = input()
    Joanna
    >>> name
    'Joanna'
    >>> print("Votre nom est :", name)
    Votre nom est : Joanna

Est-ce que ça suffit pour améliorer notre programme ?

.. testsetup::

    input.queue.append("60.5")

.. doctest::

    >>> w = input()
    60.5
    >>> w
    '60.5'
    >>> print(w + 3)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: Can't convert 'int' object to str implicitly

Comme vous pouvez le voir, Python ne sait pas qu'elle résultat nous
souhaitons.  Il est n'est pas possible d'additionner des chaînes de
type (``str``) et des entiers de type (``int``). Python ne sait pas si
nous parlons du nombre ``63.5`` ou de la chaîne de caractères
``"60.5"``. Nous sommes les seuls à le savoir et nous devons donc
ajouter ces informations à notre programme.


Voici deux nouvelles fonctions :

    >>> help(int)  # doctest: +NORMALIZE_WHITESPACE
    Help on class int in module builtins:
    <BLANKLINE>
    class int(object)
     |  int(x=0) -> integer
     |  int(x, base=10) -> integer
     |
     |  Convert a number or string to an integer, or return 0 if no arguments
     |  are given.  If x is a number, return x.__int__().  For floating point
     |  numbers, this truncates towards zero.
     |
     |  ...

et

    >>> help(float)  # doctest: +NORMALIZE_WHITESPACE
    Help on class float in module builtins:
    <BLANKLINE>
    class float(object)
     |  float(x) -> floating point number
     |
     |  Convert a string or number to a floating point number, if possible.
     |
     |  ...

La fonction :func:`help` n'hésite pas à nous annoncer qu'en fait,
:func:`int` and :func:`float` ne sont pas des fonctions, mais des
classes (mais nous reviendrons là dessus dans la suite du tutoriel)
ainsi que toutes les informations sur les nombreuses choses pour
lesquelles nous pouvons les utiliser. Actuellement ce qui nous
intéresse est simplement la fonctionnalité de base permettant de
convertir une chaîne de caractères contenant un nombre sous la forme
d'un nombre d'un type donné.

Essayons :func:`int` et :func:`float`:

    >>> int("0")
    0
    >>> int(" 63 ")
    63
    >>> int("60.5")
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    ValueError: invalid literal for int() with base 10: '60.5'
    >>> float("0")
    0.0
    >>> float(" 63 ")
    63.0
    >>> float("60.5")
    60.5


Avant d'utiliser ces nouvelles fonctions dans notre programme, prenons
le temps de décrire comme il devrait fonctionner:

1. Demander à l'utilisateur d'entrer sa taille.
2. Lire la valeur de l'utilisateur et la stocker dans l'alias ``height``.
3. Convertir la valeur sous forme de chaîne de caractères en valeur décimale.
4. Demander à l'utilisateur d'entrer son poids.
5. Lire la valeur de l'utilisateur et la stocker dans l'alias ``weight``.
6. Convertir la valeur sous forme de chaîne de caractères en valeur décimale.
7. En utilisant ces valeurs calculer l'IMC et stocker sa valeur dans l'alias ``imc``.
8. Afficher la valeur de l'IMC.

Sans surprise, ces 8 points peuvent être transcrit en 8 lignes de code
(lignes vides exclues):

.. testsetup::

    input.queue.append("1.75")
    input.queue.append("65.5")

.. testcode::

    print("Entrez votre taille en mètres :")
    height = input()
    height = float(height)

    print("Entrez votre poids en kilogrammes :")
    weight = input()
    weight = float(weight)

    imc = weight / height ** 2  # calculate IMC
    print("Votre IMC est :", imc)

Vous pouvez sauvegarder votre programme dans le fichier ``imc.py`` et lancer ``python imc.py``.
Le résultat devrait ressembler à:

.. testoutput::

    Entrez votre taille en mètres :
    1.75
    Entrez votre poids en kilogrammes :
    65.5
    Votre IMC est : 21.387755102040817

En conclusion, pour appeler une fonction, nous avons besoin de
connaître son nom (nous en connaissons maintenant quelques-unes :
:func:`print`, :func:`help`, :func:`input`, :func:`int`, :func:`float`
and :func:`quit`) et ce qu'elles attendent de nous (ce qui s'appelle
la liste des arguments de la fonction).

Entrer uniquement le nom de la fonction ne l'appelle pas. Mais ça va
nous retourner qu'il s'agit bien d'une fonction.

    >>> input  # doctest: +SKIP
    <built-in function input>

.. We skip the test above because we can't mock input.__repr__ :(

Afin d'appeler une fonction, nous devons ajouter des parenthèses après son nom:

    >>> input()  # doctest: +SKIP

Ainsi la fonction sera exécutée par Python.

Les arguments de la fonction sont donnés entre les parenthèses et s'il
y en a plus d'un on les sépare par virgules:

    >>> int("FF", 16)
    255


Checking conditions
====================

Let’s go to our next problem. We want our program to print the appropriate
classification for the calculated BMI by using the table below:


=====================   ==================
   BMI                    Classification
=====================   ==================
 < 18,5                    underweight
 18,5 – 24,99            normal weight
 ≥ 25,0                     overweight
=====================   ==================

We need to use the “conditional statement” :keyword:`if`. It will execute the rest of the program
based on a given condition:


.. testsetup::

    input.queue.append("1.75")
    input.queue.append("65.5")

.. testcode::

    print("Enter your height in meters:")
    height = input()
    height = float(height)

    print("Enter your weight in kilograms:")
    weight = input()
    weight = float(weight)

    bmi = weight / height**2  # Calculate BMI

    if bmi < 18.5:
        print("underweight")
    elif bmi < 25.0:
        print("normal weight")
    else:
        print("overweight")

.. testoutput::

    Enter your height in meters:
    1.75
    Enter your weight in kilograms:
    65.5
    normal weight

Comparisons:  true or false?
----------------------------

The first element which we have not mentioned yet, are comparisons. For numbers they act exactly like
during the math lessons:

    >>> 2 > 1
    True
    >>> 1 == 2
    False
    >>> 1 == 1.0
    True
    >>> 10 >= 10
    True
    >>> 13 <= 1 + 3
    False
    >>> -1 != 0
    True

The result of comparison is always ``True`` or ``False``.
They can be combined into more complex conditions by using words :keyword:`and` and
:keyword:`or`:

    >>> x = 5
    >>> x < 10
    True
    >>> 2*x > x
    True
    >>> (x < 10) and (2*x > x)
    True
    >>> (x != 5) and (x != 4)
    False
    >>> (x != 5) and (x != 4) or (x == 5)
    True


Indentations
------------

Another thing you should pay attention to is the indentation in the code. Open the interactive mode
and enter a simple condition, such as::

    >>> if 2 > 1:
    ...

So far nothing has happened, as evidenced by dots ``...`` instead of incentives ``>>>``, which we
saw so far. Python expects us to give further instructions which are supposed to be executed if the
condition ``2 > 1``  turns to be true. Let’s try to make Python print "OK"::

    >>> if 2 > 1:
    ... print("OK")
      File "<stdin>", line 2
        print("OK")
            ^
    IndentationError: expected an indented block

Unfortunately, we haven’t succeeded. Python needs to know whether the instruction we have written is a
continuation of  :keyword:`if` or it is the next instruction not covered by the condition. To this
purpose we need to indent our code:

    >>> if 2 > 1:
    ...  print("OK")
    ...
    OK

All you need is one space or ``TAB``. However, all the lines that are supposed to be executed one
after another, should be indented the same way::

    >>> if -1 < 0:
    ...  print("A")
    ...   print("B")
      File "<stdin>", line 3
        print("B")
        ^
    IndentationError: unexpected indent

    >>> if -1 < 0:
    ...     print("A")
    ...   print("B")
      File "<stdin>", line 3
        print("B")
                ^
    IndentationError: unindent does not match any outer indentation level

    >>> if -1 < 0:
    ...   print("A")
    ...   print("B")
    ...
    A
    B


To avoid chaos, most of the Python’ programmers use four spaces for each level of indentation. We will
do the same:

    >>> if 2 > 1:
    ...     if 3 > 2:
    ...         print("OK")
    ...     else:
    ...         print("FAIL")
    ...     print("DONE")
    OK
    DONE


What if not?
------------

Actually, we could write our program just by using :keyword:`if` ::

    if bmi < 18.5:
        print("underweight")
    if bmi >= 18.5:
        if bmi < 25.0:
            print("normal weight")
    if bmi >= 25.0:
        print("overweight")

However, we have used also :keyword:`else` and :keyword:`elif`, so that we would not have to repeat
similar conditions nor to increase readability. In more complex programs it may not be obvious from
the beginning that the following condition is the opposite of the previous one.


Using :keyword:`else` , we have the guarantee that the given instructions will be executed only if the instructions printed under :keyword:`if` haven’t been executed::

    if bmi < 18.5:
        print("underweight")
    else:
        # If your program executes this instruction,
        # for sure bmi >= 18.5 !
        if bmi < 25.0:
            print("normal weight")
        else:
            # now for sure bmi >= 25.0, we don’t have to
            # check it
            print("overweight")

Pay particular attention to the indentations. Every use of  :keyword:`else`,
will cause an increased indentation of our code. It is very annoying when you have to check a few or a
dozen or so conditions which exclude one another . Therefore the authors of Python added a little
'improvement' in the form of :keyword:`elif`, instruction, which allows you to check another condition
immediately::


    if n < 1:
        print("one")
    elif n < 2:
        # if it wasn’t n < 1, and now it is n < 2
        print("two")
    elif n < 3:
        # ,if none of the previous condition was true.
        # n >= 1 i n>= 2, ale n < 3
        print("three")
    else:
        # trolls can count only to three
        print("more")


Strings formatting
==================

The last issue which we have mentioned above was the problem with too many digits in a printed BMI.
Out of the three problems we had, this one is the easiest to solve.

That’s why we left it for the end of our "adventure" with the BMI calculator. We already know
that we can add strings to each other and multiply them by integers. You will see that we can also
format them. But first we will need one more type of data (except the strings and the numbers we
already know).


.. _bmi-tuples:

Tuples
------

At the beginning we mentioned that we can not use commas in numbers, because we will need them later
while using tuples. And here they are:

    >>> 1, 2, 3
    (1, 2, 3)
    >>> ("Ala", 15)
    ('Ala', 15)
    >>> x = 1,5
    >>> print(x)
    (1, 5)

A tuple is nothing more than a few values grouped into one. The values we want to group should be
separated by commas. The whole thing can be enclosed in parentheses to make it more clear, but it is
not required. Except when we want to group none of the elements (however strange it may sound):

    >>> ()
    ()

Tuples can be combined:

    >>> names = ("Paulina", "Kowalska")
    >>> details = (27, 1.70)
    >>> names + details
    ('Paulina', 'Kowalska', 27, 1.7)

They may also contain other tuples e.g. information on a point on the map can be
grouped as follows:

    >>> point = ("Name of point", (x, y))

where ``x`` and ``y`` are numbers.

We can refer to the grouped values by using their positions in the tuple (counting form zero) e.g.:

    >>> p = (10, 15)
    >>> p[0]  #  first value
    10
    >>> p[1]  # second value
    15


Formatting
----------

Going back to our program: currently the result is reduced to a single line. Now we want to write the
BMI as a number and the interval in which it is located, that is to say::

    Your BMI is equal: 21.39 (normal weight)

Modify the current program so that the calculated BMI would be available under the name of ``bmi``,and
the name of the interval under the name of ``category``. Then we can use :func:`print` and obtain the
required result:

.. testsetup::

    bmi = 21.387755102040817
    category = "normal weight"

.. testcode::

    print("Your BMI is equal:", bmi, "(" + category + ")")

.. testoutput::
    :hide:

    Your BMI is equal: 21.387755102040817 (normal weight)

Well, almost….We still have too many digits. We would also have a problem if we wanted to generate
such a string and save with a name, because we use :func:`print` to separate the elements.
Fortunately, there is a better way:

    >>> bmi = 21.387755102040817
    >>> category = "normal weight"
    >>> result = "Your BMI: %f (%s)" % (bmi, category)
    >>> result
    'Your BMI: 21.387755 (normal weight)'
    >>> print(result)
    Your BMI: 21.387755 (normal weight)

We have here a string and a tuple joined by ``%``. The string is a template which will be completed
with values from the tuple. The spaces to be filled are also labeled with the percentage (``%``). .
The letter that follows defines the type of a value we want to insert. The integers are represented
by  ``i`` as **integer** (we can also use ``d`` as **decimal**),  strings are represented by ``s`` as
**string**, and floating-point numbers are represented by ``f`` for **float**:

    >>> "String: %s, Numbers: %d %f" % ("Ala", 10, 3.1415)
    'String: Ala, Numbers: 10 3.141500'

Now instead of nine decimal places we always get six, but the formatting has the advantage that it
allows us to have more control by putting between ``%`` and ``f`` additional information, e.g. if you
want to display only two places after the decimal point:


    >>> "%.2f" % 3.1415
    '3.14'
    >>> "%.2f" % 21.387755102040817
    '21.39'

There are plenty options of formatting, so we will not show them all here. One of the most useful is
the option of aligning to a specific number of characters:

.. testcode::

    WIDTH = 28

    print("-" * WIDTH)
    print("| Name and last name |  Weight  |")
    print("-" * WIDTH)
    print("| %15s | %6.2f |" % ("Łukasz", 67.5))
    print("| %15s | %6.2f |" % ("Pudzian", 123))
    print("-" * WIDTH)

.. testoutput::

    --------------------------------
    | Name and last name  |  Weight|
    --------------------------------
    |              Łukasz |  67.50 |
    |             Pudzian | 123.00 |
    --------------------------------

We can also align the string ``-``  to the left by putting before the number of characters:

.. testcode::

    WIDTH = 28

    print("-" * WIDTH)
    print("| Name and last name |  Weight |")
    print("-" * WIDTH)
    print("| %-15s | %6.2f |" % ("Łukasz", 67.5))
    print("| %-15s | %6.2f |" % ("Pudzian", 123))
    print("-" * WIDTH)

.. testoutput::

    -------------------------------
    | Name and last name|  Weight |
    -------------------------------
    | Łukasz            |  67.50  |
    | Pudzian           | 123.00  |
    -------------------------------

Aligning towards the centre is an additional excercise for you :).


Summary
=======

In this chapter we learned basics of Python syntax. We discovered how to print integers,
floating-point numbers, strings and tuples.

We learnt the function :func:`print`, that prints information for the user and the function 
:func:`input`, which reads it.

We also know now that indentations can be important, especially when we want to use
the instruction :keyword:`if` (also in connection with :keyword:`else` and :keyword:`elif`).

We successfully created a program stored in a file and ran it. Our program asks the user to answer
a few simple questions, performs calculations and presents results in the form which is useful for the
user.

This is quite a lot like for a first program. We still have a lot of work, anyhow you can be proud of
what we have done so far!

