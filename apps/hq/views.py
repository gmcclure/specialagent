from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import render
from hq.forms import UserSignupForm
from precis.forms import UpdateSlugForm
from precis.models import Page


def index(request):
    if request.user.is_authenticated():
        return HttpResponseRedirect('/id/{}'.format(request.user.id))
    else:
        return HttpResponseRedirect('/home/')

    return render(request, 'hq/frontpage.html')


def logout_session(request):
    logout(request)
    return HttpResponseRedirect('/')


def signup(request):
    if request.method == 'POST':
        form = UserSignupForm(request.POST)
        if form.is_valid():
            form.save()
            auth_user = authenticate(email=str(form.cleaned_data['email']), password=str(form.cleaned_data['password']))
            if auth_user is not None:
                login(request, auth_user)
                return HttpResponseRedirect('/id/' + str(int(request.user.id)))
            else:
                messages.error(request, 'You couldn\'t be logged in. Send a message to <a href="mailto:support@specialagent.me">support@specialagent.me</a> in order to receive assistance.')
                return render(request, 'hq/signup.html', { 'form': form })
    else:
        form = UserSignupForm()

    return render(request, 'hq/signup.html', { 'form': form })


@login_required
def home(request):
    page = Page.objects.get(pk=request.user.get_profile().id)
    if request.method == 'POST':
        slug_form = UpdateSlugForm(request.POST, instance=Page.objects.get(pk=request.user.get_profile().id))
        if slug_form.is_valid():
            slug_form.save()
            return HttpResponseRedirect('/hq/')
    else:
        slug_form = UpdateSlugForm()

    return render(request, 'hq/home.html', { 'page': page, 'slug_form': slug_form })
