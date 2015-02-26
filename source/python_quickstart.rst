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
la commande ``python`` entrée, l'invite de commande a changé et est désormais
``>>>``. Cela signifie qu'à partir de maintenant, nous devons uniquement utiliser
des commandes du langage Python.

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
utiles plus tard, pour définir des :ref:`tuple <imc-tuples>`, mais nous
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
    >>> 'Mon nom est "Camille"'
    'Mon nom est "Camille"'

Vous pouvez également ajouter (on dit également concaténer) deux chaînes l'une
à l'autre:

    >>> 'Mon nom est ' + '"Camille"'
    'Mon nom est "Camille"'

Ou elles peuvent être aussi multipliés par des nombres:

    >>> 'oui ' * 3
    'oui oui oui'

Une chaîne de caractères doit toujours commencer et se terminer par le même
caractère. Il peut s'agir d'un guillemet simple (``'``), ou d'un guillemet
double (``"``). Cela n'a aucun effet sur la valeur de la chaîne de caractères.
Par exemple, si nous entrons ``"Batman"``, nous créons une chaîne de caractères
``Batman``, les guillemets ne font pas partie de la chaîne de caractères, ils
sont là uniquement pour indiquer qu'il s'agit d'une chaîne de caractères
(string) (malheureusement, Python n'est pas suffisamment brillant pour se
rendre compte de ça lui-même).


Afficher les chaînes de caractères
----------------------------------

Mais comment afficher ces chaînes de caractères d'une manière lisible? Il est
possible de le faire en utilisant la fonction :func:`print`.


    >>> print("Bonjour tout le monde !")
    Bonjour tout le monde !

Il est aussi possible d'afficher différentes chaînes de caractères sur une même
ligne, sans avoir à les ajouter l'une à l'autre. Elles seront séparées par des
espaces:

    >>> print("Bonjour, mon nom est", "Camille")
    Bonjour, mon nom est Camille

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
interactive dans laquelle nous récupérons une réponse immédiate à nos
commandes. C'est un bon moyen d'apprendre et d'expérimenter les
éléments du langage. C'est pourquoi on y retourne.

Notre premier programme pourrait ressembler à ça::

    print("Hi, my name is Lucas")


Enregistrez ce programme dans un fichier appelé ``visitingcard.py``,
et lancez-le depuis l'invite de commande ``python visitingcard.py``:

.. code-block:: sh

    (workshops) ~$ python visitingcard.py
    Hi, my name is Lucas
    (workshops) ~$

Un même programme peut contenir plusieurs commandes, chacune devant
être sur une ligne séparée, par exemple::

    print("Hi,")
    print()

    print("my name is Lucas")

    print()
    print("Bye.")

Nous pouvons ajouter des lignes vides où nous le souhaitons dans le
fichier ``visitingcard.py`` pour améliorer la lisibilité. Ici, nous
avons séparé l'entête du message d'avec son contenu et d'avec sa fin.


Calculateur d'IMC
=================

Essayons de créer un programme simple permettant de calculer son `IMC`
(`Indice de Masse Corporelle`_). En anglais on parle de `BMI` (Body
Mass Index).

La formule de ce calcul est la suivante::

    IMC = (masse (kg)) / (taille (m)) au carré

Nous savons déjà faire une division, une puissance et afficher des
nombres. Il ne nous reste plus qu`à créer un fichier ``imc.py`` et à
essayer d'écrire le programme qui calcule l'IMC:


.. testcode::

    print("Votre IMC est :", 65.5 / (1.75 ** 2))

Lancez votre programme comme ceci::

    $ python imc.py

Vous obtenez::

.. testoutput::

    Votre IMC est : 21.387755102040817

Comme vous le voyez notre programme a besoin de quelques améliorations:

1. Si quelqu'un d'autre souhaite utiliser le programme nous devons
   modifier le fichier ``imc.py``.

2. Pour une personne qui ne connait pas les tables d'IMC par cœur,
   21.387755102 ne veut pas dire grand chose.

3. Afficher autant de décimales n'est pas nécessaire. Les nombres en
   entrée n'ayant que 3 chiffres significatifs.

Programmer c'est l'art de résoudre les problèmes, alors mettons nous au travail !
Cela va nous donner l'occasion d'apprendre de nouvelles fonctionnalités de Python.

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
de commande Python et essayons d'en créer quelques-uns :

    >>> x = 42
    >>> PI = 3.1415
    >>> name = "Amelia"
    >>> print("Things:", x, PI, name)
    Things: 42 3.1415 Amelia

Une valeur peut être liée à plusieurs alias, elle peut donc avoir
plusieurs noms :

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
valeur de x, la valeur de y reste la même:

    >>> print(y)
    42

.. note:: Pour ceux qui connaissent d'autres langages de programmation

    Vous vous demandez sûrement pourquoi nous n'utilisons pas ici le
    terme "variable". C'est simplement car en Python, les alias ne
    fonctionnent pas de la même manière que les variables.
    Dans la plupart des langages, l'opération ``y = x`` crée une copie
    de ``x`` et la stocke dans la variable ``y``

	En Python, rien n'est copié silencieusement. ``y`` devient
	seulement un autre moyen de nommer la même valeur. Si on modifie
	cette valeur, ``x`` et ``y`` seront tous les deux modifié et
	afficheront la même chose.

	Dans notre exemple, nous n'avons pas modifié la valeur du nombre
	``42``, mais nous avons modifié la valeur associée à ``x`` (en
	particulier, les valeurs des nombres ne sont jamais modifiées, bien
	qu'en 1897, la Chambre basse de l'état de l'Indiana ait accepté de
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

Sauf si on demande à Python de la recalculer :

    >>> bmi = w / h ** 2
    >>> print(w, h, bmi)
    64 1.75 20.897959183673468

Il est grand temps d'ajouter quelques commentaires à notre programme
afin que les lecteurs-trices (dont nous faisons partie) se souviennent que le
poids est en kg et la taille en m.

Les commentaires nous permettent de rajouter du texte dans notre code
Python.  Les commentaires seront simplement ignorés par l'interpréteur
Python lors de l'exécution du code.

En Python, un commentaire est tout ce qui se trouve entre un caractère
``#`` et la fin de la ligne::

    # Weight in kilograms
    weight = 65.5

    # Height in meters
    height = 1.75

    bmi = weight / height ** 2  # Calculer l'IMC
    print("Votre IMC est :", bmi)


Les fonctions
=============

Notre programme est pas trop mal, mais si l'utilisateur-trice souhaite
calculer son IMC, il ou elle aura besoin de modifier le code source du
programme. Ce serait bien plus simple de lui permettre de saisir ces
valeurs directement dans la console après le lancement du programme et
de lui retourner ensuite son IMC.

Pour ce faire, nous devons apprendre à utiliser les fonctions. La
première fonction que nous allons apprendre à utiliser est la fonction
:func:`help`: ::

    >>> help
    Type help() for interactive help, or help(object) for help about object.

La fonction :func:`help` est très sympa car elle nous explique
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
    Yara a un chat
    'Yara a un chat'

Apprenons maintenant ce qu'"appeler une fonction" veut dire.

Pour appeler une fonction, il faut utiliser ``()``, ce qui donne
l'information à l'interpréteur Python qu'il doit appeler une fonction.

Appeler une fonction c'est lancer le code de cette fonction. Si vous
oubliez d'ajouter ``()`` après le nom de la fonction, la fonction ne
sera pas appelée.

Dans cette situation, il n'y aura pas d'erreur car il est tout-à-fait
possible de manipuler une fonction sans l'appeler.

La plupart du temps une fonction **return** un résultat.

Dans le cas de la :func:`input`, ce résultat est une chaîne de
caractères, c'est pourquoi nous pouvons le manipuler de la même
manière que nous avons manipulé les chaînes de caractères auparavant.

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

Comme vous pouvez le voir, Python ne sait pas quel résultat nous
souhaitons.  Il n'est pas possible d'additionner des chaînes de
type (``str``) et des entiers de type (``int``). Python ne sait pas si
nous parlons du nombre ``60.5`` ou de la chaîne de caractères
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
7. En utilisant ces valeurs calculer l'IMC et stocker sa valeur dans l'alias ``bmi``.
8. Afficher la valeur de l'IMC.

Sans surprise, ces 8 points peuvent être transcrits en 8 lignes de code
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

    bmi = weight / height ** 2  # Calculer IMC
    print("Votre IMC est :", bmi)

Vous pouvez sauvegarder votre programme dans le fichier ``bmi.py`` et lancer ``python bmi.py``.
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
y en a plus d'un on les sépare par une virgule:

    >>> int("FF", 16)
    255


Les conditions
==============

En avant vers notre prochaine problématique. Nous voulons que notre programme affiche les informations relatives à notre IMC une fois ce dernier calculé.

Pour ce faire nous allons utiliser la table de classification ci-dessous:

=====================   ==================
   IMC                    Classification
=====================   ==================
 < 18,5                      Maigreur
 18,5 – 25              Corpulence normale
 ≥ 25,0                      Surpoids
=====================   ==================

Nous allons utiliser le mot clé de condition :keyword:`if`. Il va nous
permettre de choisir les lignes du programme à exécuter en fonction
d'une condition donnée:


.. testsetup::

    input.queue.append("1.75")
    input.queue.append("65.5")

.. testcode::

    print("Entrez votre taille en mètres ::")
    height = input()
    height = float(height)

    print("Entrez votre poids en kilogrammes :")
    weight = input()
    weight = float(weight)

    bmi = weight / height ** 2  # Calculer l'IMC

    if bmi < 18.5:
        print("Maigreur")
    elif bmi < 25.0:
        print("Corpulence normale")
    else:
        print("Surpoids")

.. testoutput::

    Entrez votre taille en mètres ::
    1.75
    Entrez votre poids en kilogrammes :
    65.5
    Corpulence normale

Conditions : vrai ou faux
-------------------------

La première chose dont nous n'avons pas encore parlé sont les conditions.
Pour les nombres, cela fonctionne exactement comme en mathématiques :

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

Le résultat d'une condition est toujours ``True`` ou ``False``.
On peut utiliser les opérateurs :keyword:`and` et :keyword:`or` pour
construire des conditions plus complexes:

    >>> x = 5
    >>> x < 10
    True
    >>> 2 * x > x
    True
    >>> (x < 10) and (2 * x > x)
    True
    >>> (x != 5) and (x != 4)
    False
    >>> (x != 5) and (x != 4) or (x == 5)
    True


Indentation
-----------

Une deuxième chose à laquelle il faut faire attention en Python, c'est
l'indentation du code.

Ouvrez l'interpreteur Python et entrez une combinaison simple, par
exemple:

    >>> if 2 > 1:
    ...

Pour l'instant rien ne se passe, comme le montrent les points ``...`` à
la place des habituels chevrons ``>>>``. Python s'attend à ce que
nous donnions des instructions complémentaires qui devront être
exécutées si la condition ``2 > 1`` s'avère vraie. Essayons d'afficher
"OK"::

    >>> if 2 > 1:
    ... print("OK")
      File "<stdin>", line 2
        print("OK")
            ^
    IndentationError: expected an indented block

Apparemment, ça n'a pas très bien fonctionné. En fait Python doit
savoir si l'instruction que nous avons entrée est une instruction à
exécuter uniquement si la condition est vraie ou si c'est une
instruction à exécuter sans qu'elle ne soit affectée par la condition.

C'est pourquoi nous devons indenter notre code::

    >>> if 2 > 1:
    ...  print("OK")
    ...
    OK

Tout ce que vous devez faire c'est ajouter un espace ou une tabulation
avant votre instruction pour dire qu'elle fait partie des instructions
dépendantes du :keyword:`if`. Attention, toute les lignes a exécuter
dans le if doivent être indentées de la même manière::

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


Pour éviter la confusion, la plupart des développeurs Python se sont
mis d'accord pour toujours utiliser quatre espaces pour chaque niveau
d'identation. Nous allons nous aussi adopter cette convention::

    >>> if 2 > 1:
    ...     if 3 > 2:
    ...         print("OK")
    ...     else:
    ...         print("ECHEC")
    ...     print("FAIT")
    OK
    FAIT


Et si ce n'est pas le cas ?
---------------------------

On pourrait se débrouiller pour écrire un programme en utilisant
uniquement des :keyword:`if` ::

    if bmi < 18.5:
        print("Maigreur")
    if bmi >= 18.5:
        if bmi < 25.0:
            print("Corpulence normale")
    if bmi >= 25.0:
        print("Surpoids")

Mais en fait, on peut aussi utiliser :keyword:`else` et
:keyword:`elif`, afin de ne pas avoir à répéter les conditions
similaires et améliorer la lisibilité du code. Dans des programmes
plus compliqués, il n'est parfois pas évident de reconnaître que la
condition lue est la condition inverse de la précédente.

En utilisant :keyword:`else` , nous avons la garantie que les
instructions données seront exécutées seulement si les instructions
données après le :keyword:`if` n'ont pas été exécutées::

    if bmi < 18.5:
        print("Maigreur")
    else:
        # Si votre programme exécute ces instructions alors vous êtes
        # certains que bmi >= 18.5 !
        if bmi < 25.0:
            print("Corpulence normale")
        else:
            # Ici vous pouvez être certains que bmi >= 25.0
            # nous n'avons donc pas à le vérifier.
            print("Surpoids")

Regardez bien attentivement la manière dont le code est indenté. À
chaque utilisation de :keyword:`else`, un niveau d'indentation a été
ajouté à chaque niveau du code. C'est très ennuyeux d'avoir lire du
code avec de nombreux niveaux d'indentation.

C'est pourquoi les développeurs Python on ajouté un troisième mot clé,
:keyword:`elif`, qui permet de vérifier directement une autre
condition::

    if n < 1:
        print("un")
    elif n < 2:
        # Si ce n'était pas un, alors c'est deux
        print("deux")
    elif n < 3:

        # Si aucune des conditions précédentes n'a été validée alors
        # c'est trois
        # n >= 1 et n>= 2 et n < 3
        print("trois")
    else:
        # Les trolls ne savent compter que jusqu'à trois
        print("more")


Le formatage des chaînes de caractères
======================================

La dernière amélioration, que nous avions mentionnée ci-dessus, était
le trop grand nombre de chiffres après la virgule de notre IMC.

Des trois problèmes que nous avions identifiés, celui-ci est le plus
simple à résoudre.

C'est d'ailleurs pour ça que nous l'avions gardé pour la fin de notre
aventure de calculateur d'IMC.

Nous savons déjà que nous pouvons concaténer des chaînes de
caractères, les multiplier par des nombres, vous allez voir qu'on peut
aussi les formater. Tout d'abord, nous avons besoin de découvrir un nouveau type de données (en plus des ``strings`` et des nombres, ``int`` et ``float``, que nous connaissons déjà).


.. _imc-tuples:

Tuples
------

Rappelez-vous, je vous disais que nous ne pouvions pas utiliser les virgules dans les nombres car nous en aurions besoin par la suite pour définir les tuples. Nous y voici :

    >>> 1, 2, 3
    (1, 2, 3)
    >>> ("Ala", 15)
    ('Ala', 15)
    >>> x = 1,5
    >>> print(x)
    (1, 5)

Un tuple n'est ni plus ni moins qu'une valeur contenant un groupe de
valeurs. Les valeurs que nous souhaitons grouper doivent être séparées
par des virgules. L'ensemble peut-être entouré de parenthèses pour
rendre plus explicite le fait qu'il s'agisse bien d'un groupe, mais ce
n'est pas obligatoire. Sauf pour le cas d'un groupe vide (aussi
bizarre que cela puisse paraître).

    >>> ()
    ()

Il est possible de combiner des tuples:

    >>> names = ("Pauline", "Dupontel")
    >>> details = (27, 1.70)
    >>> names + details
    ('Pauline', 'Dupontel', 27, 1.7)

Un tuple peut aussi contenir un autre tuple, par exemple un point sur
une carte peut-être groupé comme ceci:

    >>> point = ("Pizzeria", (long, lat))

Avec ``long`` et ``lat`` des coordonnées géographiques.

On peut ensuite se référer aux valeurs d'un groupe en utilisant leurs
positions (en commençant à zéro):

    >>> p = (10, 15)
    >>> p[0]  # première valeur
    10
    >>> p[1]  # deuxième valeur
    15


Formater
--------

Pour en revenir à notre programme, actuellement le résultat est affiché sur une seule ligne.

À présent, nous souhaitons afficher notre IMC comme un nombre ainsi
que l'information de la table de classification correspondant à la
tranche en question, comme cela :

::

    Votre IMC est de 21.39 (Corpulence normale)

Modifiez votre programme actuel pour que la valeur de l'IMC soit disponible dans l'alias ``bmi`` et l'information de la table de classification correspondante dans l'alias ``category``. Ensuite utilisez la fonction :func:`print` pour obtenir le résultat souhaité:

.. testsetup::

    bmi = 21.387755102040817
    category = "normal weight"

.. testcode::

    print("Votre IMC est de", bmi, "(" + category + ")")

.. testoutput::
    :hide:

    Votre IMC est de 21.387755102040817 (Corpulence Normale)

Vous y êtes presque…. Nous avons encore un peu trop de chiffres après
la virgule. Nous aurions également un problème si nous souhaitions
stocker la chaîne de caractères contenant le résultat dans un alias et
ce parce que nous utilisons la fonction :func:`print` pour
concaténer les éléments.

Heureusement pour nous, il y a une meilleure solution :

    >>> bmi = 21.387755102040817
    >>> category = "Corpulence normale"
    >>> result = "Votre IMC est de %f (%s)" % (bmi, category)
    >>> result
    'Votre IMC est de 21.387755 (Corpulence normale)'
    >>> print(result)
    Votre IMC est de 21.387755 (Corpulence normale)

Ce que nous voyons, c'est que nous avons une chaîne de caractères liée à un tuple par un ``%``.
Cette chaîne de caractères est un patron qui est complété avec les valeurs contenues dans le tuple.

Les espaces blancs à remplir, sont eux aussi annotés avec un pourcent (``%``).

La lettre qui suit définit le type de la valeur qui doit être
insérée. Les entiers sont représentés par la lettre ``i`` pour
**integer** (il est également possible d'utiliser la lettre ``d``
comme **decimal**), les chaînes de caractères sont représentées par la
lettre ``s`` comme **string** et les valeurs décimales flottantes sont
représentées par la lettre ``f`` comme **float**:

    >>> "String: %s, Numbers: %d %f" % ("Ala", 10, 3.1415)
    'String: Ala, Numbers: 10 3.141500'

Ici au lieu de neuf décimales nous n'en avons plus que six, mais le
formatage a l'avantage de nous permettre d'avoir encore plus de
contrôle en ajoutant des informations complémentaires entre le ``%``
et le ``f`` ; par exemple pour ne faire apparaître que deux chiffres :


    >>> "%.2f" % 3.1415
    '3.14'
    >>> "%.2f" % 21.387755102040817
    '21.39'

Il existe beaucoup d'options de formatage, nous n'allons donc pas toutes
les lister ici. L'une des plus utiles est celle permettant d'aligner
l'affichage sur un nombre de caractères donné :

.. testcode::

    WIDTH = 28

    print("-" * WIDTH)
    print("| Name and last name |  Weight  |")
    print("-" * WIDTH)
    print("| %15s | %6.2f |" % ("Lucas", 67.5))
    print("| %15s | %6.2f |" % ("Camille", 123))
    print("-" * WIDTH)

.. testoutput::

    --------------------------------
    | Name and last name  |  Weight|
    --------------------------------
    |               Lucas |  67.50 |
    |             Camille | 123.00 |
    --------------------------------

Nous pouvons aussi aligner les chaînes de caractères à gauche en
prefixant le nombre de caractères par un ``-`` :

.. testcode::

    WIDTH = 28

    print("-" * WIDTH)
    print("| Name and last name |  Weight |")
    print("-" * WIDTH)
    print("| %-15s | %6.2f |" % ("Lucas", 67.5))
    print("| %-15s | %6.2f |" % ("Camille", 123))
    print("-" * WIDTH)

.. testoutput::

    -------------------------------
    | Name and last name|  Weight |
    -------------------------------
    | Lucas             |  67.50  |
    | Camille           | 123.00  |
    -------------------------------

Je vous laisse chercher comment faire pour aligner au centre :).


En résumé
=========

Dans ce chapitre nous avons appris les bases de la syntaxe
Python. Nous avons découvert comment afficher des nombres entiers et
décimaux, des chaînes de caractères et nous avons découvert les
tuples.

Nous avons appris à utiliser la fonction :func:`print`, qui affiche
des informations à l'utilisateur et la fonction :func:`input`, qui
permet de lire les entrées de ce dernier.

Nous avons vu comment l'identation pouvait être importante, notamment
lors de l'utilisation des instructions :keyword:`if`, :keyword:`else`
et :keyword:`elif`.

Nous avons réalisé notre premier programme dans un fichier que nous pouvons lancer.

Notre programme pose quelques questions à l'utilisateur, calcule des
informations et présente les résultats dans une forme utile à
l'utilisateur.

Ça fait finalement beaucoup de choses pour un premier programme. Nous
avons encore pas mal de travail mais vous pouvez être fier de ce que
vous avez fait jusqu'à présent !
