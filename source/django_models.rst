
Models
======

The next step is to define the model of our application. The model describes what and how can be 
stored in the database. From Python point of view that is a basic class, which inherits from ``models.Model``. 

Our application will include questions and answers to them, so we'll create two models: ``Poll`` and ``Choice``. The model ``Poll`` contains the contents of questions and the date of publication. The model 
``Choice`` contains a reference to the relevant questions, the content of responses and the number of 
votes.

In the file ``polls/models.py`` we type::

    from django.db import models

    class Poll(models.Model):
        question = models.CharField(max_length=200)
        pub_date = models.DateTimeField('date published')

    class Choice(models.Model):
        poll = models.ForeignKey(Poll)
        choice_text = models.CharField(max_length=200)
        votes = models.IntegerField(default=0)

By adding new models we have changed the database schema. We need to make the ``syncdb`` again so that 
new models could appear in the database.

.. warning::
    After executing the ``syncdb``, you can not add new fields to the model. You can only add new models. There are ways to avoid it, but … it is a totally different story

.. code-block:: sh

   (workshops) ~/carrots$ python manage.py syncdb
   Creating tables ...
   Creating table polls_poll
   Creating table polls_choice
   Installing custom SQL ...
   Installing indexes ...
   Installed 0 object(s) from 0 fixture(s)

That’s it! However, probably we would like to be able to edit objects. The easiest way is to do it in 
the administrative interface.

We create a file ``polls/admin.py`` and the file includes::

    from django.contrib import admin
    from polls.models import Poll, Choice

    admin.site.register(Poll)
    admin.site.register(Choice)

By that ``Poll`` and ``Choice`` model will be available in administration panel.  

.. note::

    Some changes require a server restart. In the console with the server activated push the buttons ``Ctrl+C`` and then ``pythonmanage.py runserver`` again.

When we go back to http://localhost:8000/admin/ we will see that a new bookmark ``Polls`` appeared.


Playing in the console
----------------------

Django provides its own console. It is a simple Python console (where we can do exactly the same thing 
as when you activate the command ``python``), but we can also use the tools and models of Django.

.. code-block:: sh

   (workshops) ~/carrots$ python manage.py shell

When you are in the shell already::

    >>> from polls.models import Poll, Choice

All the surveys in the database; and now there's nothing here, so we get an empty list::

    >>> Poll.objects.all()
    []

We create the first survey::

    >>> import datetime
    >>> p = Poll(question="What's new?", pub_date=datetime.datetime.now())

Save the poll in the database. For this purpose, you always need to call ``save()``::

    >>> p.save()

Each object in the database is assigned to a unique ID::

    >>> p.id
    1

``p`` is a simple object. We can read its attributes::

    >>> p.question
    "What's new?"
    >>> p.pub_date
    datetime.datetime(2014, 10, 18, 13, 0, 0, 775217)

After changing of attributes we again call ``save()`` to save changes::

    >>> p.question = "What's up?"
    >>> p.save()

``objects.all()`` returns a list of all the objects in the database::

    >>> Poll.objects.all()
    [<Poll: Poll object>]

Django models are classes and classes can define methods. A method is a function that gets an extra 
parameter ``self``, which is the current object (e.g, the current questionnaire). Methods in classes (
models) allow you to add additional behaviors or change the existing ones.

One of the methods is the ``__str__()``, which allows you to change the display of the model (a 
questionnaire or a question). ``<Poll: Poll object>`` doesn’t tell us much. Let's fix that by adding the 
method ``__str__`` to ``Poll`` and ``Choice``::

    class Poll(models.Model):
        # ...
        def __str__(self):
            return self.question

    class Choice(models.Model):
        # ...
        def __str__(self):
            return self.choice_text

Django will use these methods for displaying objects, not just in the console, but also in the 
aforementioned administration interface.

We can also add other methods.  In the ``carrots/polls/models.py`` append (comments ``#…`` in here 
mean the code located in the file)::

    import datetime
    from django.utils import timezone
    # ...
    class Poll(models.Model):
        # ...
        def was_published_recently(self):
            return self.pub_date >= datetime.datetime.now() - datetime.timedelta(days=1)

Note that we had to add an ``import datetime`` to use objects representing the time in Python.

Let’s save the changes and run intepreter with the command ``python manage.py`` shell once again::

    >>> from polls.models import Poll, Choice

    # Let’s find out if our method __str__() works
    >>> Poll.objects.all()
    [<Poll: What's up?>]

Up to the moment we have used the method ``all`` which allows you to get a list of all objects of a 
defined type (e.g. all questions). There are other methods that allow to find objects that meet 
certain conditions:

.. code-block:: python

    # Django provides a very easy search of the objects in the database. Let's look at
    some examples.
    >>> Poll.objects.filter(id=1)
    [<Poll: What's up?>]
    >>> Poll.objects.filter(question__startswith='What')
    [<Poll: What's up?>]
    >>> Poll.objects.get(pub_date__year=2014)
    <Poll: What's up?>

    # The attempt to retrieve a nonexistent object will make Python to protest strongly.
    # But we have already got used to this.
    >>> Poll.objects.get(id=2)
    Traceback (most recent call last):
        ...
    DoesNotExist: Poll matching query does not exist. Lookup parameters were {'id': 2}

    # Let’s try our own method.
    >>> p = Poll.objects.get(pk=1)
    >>> p.was_published_recently()
    True

We can also have access to the answers (``Choice``) questions:

.. code-block:: python

    # For now our questionnaire does not include any questions. Let's add some!
    >>> p.choice_set.all()
    []

    # .. for example three. We will use the method "create". As a result, we get anobject "Choice".
    >>> p.choice_set.create(choice_text='Not much', votes=0)
    <Choice: Not much>
    >>> p.choice_set.create(choice_text='The sky', votes=0)
    <Choice: The sky>
    >>> c = p.choice_set.create(choice_text='Just hacking again', votes=0)

    # With the object "Choice" we can find the questionnaire  to which it belongs.
    >>> c.poll
    <Poll: What's up?>

    # ...Vice versa, all of the answers to the questionnaire
    >>> p.choice_set.all()
    [<Choice: Not much>, <Choice: The sky>, <Choice: Just hacking again>]
    >>> p.choice_set.count()
    3

    # And now something more difficult. What does this question do?
    >>> Choice.objects.filter(poll__pub_date__year=2014)
    [<Choice: Not much>, <Choice: The sky>, <Choice: Just hacking again>]

    # Finally, let's remove one of the questions. Use method ``delete``.
    >>> c = p.choice_set.filter(choice_text__startswith='Just hacking')
    >>> c.delete()

Summary
-------

* We are creating models by defining classes inheriting from ``models.Model`` in ``polls/models.py file``.
* After new model creation we have to remember to run python ``manage.py syncdb``.
* To download every object in the model::

    Poll.objects.all()

* To download the object which satisfies the condition::

    Poll.objects.filter(question__startswith='What')

* To download single object::

    Poll.objects.get(id=2)

