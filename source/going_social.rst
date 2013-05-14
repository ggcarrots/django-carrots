=================
Uspołeczniamy się
=================

Aby tworzyć aplikacje, które integrują się z Facebookiem musimy mieć konto deweloperskie.
W tym celu musimy wejść na stronę dla programistów (`Facebook developers`_).
Tam klikamy na ``Zarejestruj się teraz``, a następnie ``zweryfikuj swoje konto``.
Na kolejnej stronie zostaniemy poproszeni o podanie swojego numeru telefonu w celu weryfikacji.

Gdy zweryfikujemy swoje konto możemy stworzyć naszą pierwszą aplikację dla Facebooka.
Na stronie dla programistów klikamy zakładkę ``Apps``, a następnie ``Utwórz aplikację``.

Teraz musimy podać nazwę aplikacji (``Nazwa aplikacji``). Pozostałe pola (``App Namespace`` oraz ``Web Hosting``)
pozostawiamy bez zmian. Po potwierdzeniu zostaniemy przeniesiemi na stronę z detalami
naszej aplikacji.

Musimy ustawić jeszcze ``App Domains`` na ``localhost`` oraz ``Site URL`` w ``Strona z logowaniem za pomocą konta na
Facebooku`` na ``http://localhost``. Na stronie konfiguracji jest dużo więcej opcji, ale na razie nie przejmujemy się
nimi.

Zapisujemy zmiany. Dostaniemy powiadomienie:
``Changes saved. Poczekaj several minutes, musimy wysłać dane na wszystkie serwery``.

Konfiguracja
============

Do integracji z Facebookiem użyjemy pakietu django-carrots-account::

    pip install django-carrots

Teraz musimy dodać aplikacje ``social_auth`` oraz ``account`` do listy zainstalowanych aplikacji (w pliku
``settings.py``)::

    INSTALLED_APPS = (
        ...
        'polls',
        'social_auth',
        'account'
    )

Aplikacja ``social_auth`` pozwala na integrację z Facebookiem (i nie tylko), natomiast aplikacja
``account`` daje nam kilka prostych widoków pozwalających się zalogować i wylogować.

Potrzebna będzie też dodatkowa konfiguracja. Do pliku ``settings.py`` dopisujemy::

    AUTHENTICATION_BACKENDS = (
        'django.contrib.auth.backends.ModelBackend',
        'social_auth.backends.facebook.FacebookBackend',
    )

Dzięki tej zmianie, Django będzie potrafiło zalogować użytkownika na podstawie informacji od Facebooka.

Teraz musimy wrócić do strony detali aplikacji Facebook (`developers.facebook.com`_),
gdzie znajdziemy ``App ID`` oraz ``App Secret``.
Kopiujemy te informacje do naszego pliku ``settings.py``::

    FACEBOOK_APP_ID              = 'App ID'
    FACEBOOK_API_SECRET          = 'App Secret'

Następnie musimy dodać kilka opcji, które określą, gdzie użytkownik ma trafić po rejestracji lub
logowaniu (też w pliku ``settings.py``::

    LOGIN_URL          = '/login/'
    LOGIN_REDIRECT_URL = '/polls/'  # tutaj ma trafić użytkownik zaraz po zalogowaniu
    LOGIN_ERROR_URL    = '/login/'

Docelowo chcemy, aby nasza aplikacja potrafiła publikować wyniki ankiet.
W tym celu potrzebne jest dodatkowe uprawnienie. Do pliku ``settings.py`` dopisujemy::

    FACEBOOK_AUTH_EXTRA_ARGUMENTS = {'scope': 'publish_stream'}

Prośba o to uprawnienie (``publish_stream``) jest wysyłana do Facebooka, a użytkownik musi je zaakceptować
zanim użyje naszej aplikacji.

oraz dopisać linijkę do pliku ``urls.py``::

    urlpatterns = patterns('',
        ...
        url(r'^', include('account.urls')),
    )

Tyle jeżeli chodzi o konfigurację, teraz możemy uruchomić syncdb:

.. code-block:: sh

    ~$ python manage.py syncdb
    Creating tables ...
    Creating table social_auth_usersocialauth
    Creating table social_auth_nonce
    Creating table social_auth_association
    Installing custom SQL ...
    Installing indexes ...
    Installed 0 object(s) from 0 fixture(s)

aby django zsynchronizowało bazę danych z właśnie wprowadzonymi zmianami,
i uruchomić server:

.. code-block:: sh

    ~$ python manage.py runserver

Przy odrobinie szczęścia, wchodząc na stronę `http://localhost:8000/` zobaczymy napis
"Login with Facebook", po kliknięciu na który powinniśmy zostać zalogowani za pomocą Facebooka.

Ankiety na Facebook`u
=====================

Aplikacja ``account`` zawiera pomocniczą funkcję ``publish_to_facebook`` pozwalającą publikować na wallu
danego użytkownika. Potrzebne będą nam dwie rzeczy: użytkownik, który wysłał głos oraz tekst, który chcemy opublikować.
Użytkownik jest dostępny poprzez request jako ``request.user``, a tekst pozostawiam kreatywności uczestniczek.
Widok ``vote`` powinien ostatecznie wyglądać tak (linie pogrubione zostały dopisane):

.. code-block:: python
    :emphasize-lines: 1, 16

    from account.facebook import publish_to_facebook

    #...
    def vote(request, poll_id):
        p = get_object_or_404(Poll, pk=poll_id)
        try:
            selected_choice = p.choice_set.get(pk=request.POST['choice'])
        except (KeyError, Choice.DoesNotExist):
            return render_to_response('polls/detail.html', {
                'poll': p,
                'error_message': u"Musisz wybrać poprawną opcję.",
                }, context_instance=RequestContext(request))

        selected_choice.votes += 1
        selected_choice.save()
        publish_to_facebook(request.user, "Tutaj wpisz tekst, który chcesz opublikować")
        return HttpResponseRedirect(reverse('polls.views.results', args=(p.id,)))

.. _`Facebook developers`: https://developers.facebook.com/


Wymaganie logowania
===================

Ostatnia poprawką, którą powinniśmy wprowadzić, to wymuszenie zalogowania się przez użytkownika.
Głosować powinny móc tylko osoby, które się zalogowały, osoby nie zalogowane powinny zostać
przeniesione na stronę logowania.

Można ten efekt uzyskać dodając dekorator `login_required` do widoku `vote`:

.. code-block:: python
    :emphasize-lines: 1, 3

    from django.contrib.auth.decorators import login_required

    @login_required
    def detail(request, poll_id):
        #...

    @login_required
    def vote(request, poll_id):
        #...

Wdrozenie
=========

Dokumentacja zostala wdrozona przez `niezwykly serwer Megiteam <http://www.megiteam.pl/pomoc/djangocarrots/>`_ :-)

.. _developers.facebook.com: https://developers.facebook.com/apps

