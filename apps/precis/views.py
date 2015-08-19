import simplejson

from django.contrib.auth.decorators import login_required
from django.core.mail import send_mail
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import get_object_or_404, render, render_to_response
from django.template import RequestContext
from django.views.decorators.cache import never_cache
from precis.forms import BackgroundUploadForm, ContactAgentForm
from precis.models import Page


# TODO sanitize data for page updates
# TODO !IMPORTANT ensure that the profile page BELONGS to the logged-in user

@login_required
@never_cache
def id(request, user_id):
    """View for editing the precis page.

    Returns values required for page to make AJAX call in
    order to self-initialize
    """
    page = Page.objects.get(pk=request.user.get_profile().id)
    bg_upload_form = BackgroundUploadForm()
    contact_agent_form = ContactAgentForm()
    return render_to_response('precis/id.html',
            { 'page': page, 'profile_id': request.user.get_profile().id, 'bg_upload_form': bg_upload_form, 'contact_agent_form': contact_agent_form },
            context_instance=RequestContext(request))


def page(request, profile_id):
    """View providing all user-set options for precis page.

    Options are stored in a JSON response, json_rsp, and
    the values are assigned to identically named attributes
    in the Page Backbone.js model. Front-end Page model
    attributes are camel-cased.
    """
    if request.method == 'GET':
        profile_page = Page.objects.get(pk=profile_id)
        json_rsp = {}
        json_rsp['profile_id'] = profile_id
        json_rsp['bg_color'] = profile_page.bg_color
        json_rsp['bg_image'] = profile_page.bg_image.url if profile_page.bg_image else ''
        json_rsp['bg_disabled'] = profile_page.bg_disabled
        json_rsp['headline_text'] = profile_page.headline_text
        json_rsp['headline_top'] = profile_page.headline_top
        json_rsp['headline_left'] = profile_page.headline_left
        json_rsp['headline_color'] = profile_page.headline_color
        json_rsp['headline_pixel_size'] = profile_page.headline_pixel_size
        json_rsp['headline_fontclass'] = profile_page.headline_fontclass
        json_rsp['status_text'] = profile_page.status_text
        json_rsp['status_top'] = profile_page.status_top
        json_rsp['status_left'] = profile_page.status_left
        json_rsp['status_color'] = profile_page.status_color
        json_rsp['status_pixel_size'] = profile_page.status_pixel_size
        json_rsp['status_fontclass'] = profile_page.status_fontclass
        json_rsp['story_text'] = profile_page.story_text
        json_rsp['story_top'] = profile_page.story_top
        json_rsp['story_left'] = profile_page.story_left
        json_rsp['story_color'] = profile_page.story_color
        json_rsp['story_pixel_size'] = profile_page.story_pixel_size
        json_rsp['story_fontclass'] = profile_page.story_fontclass
        json_rsp['linkbox_top'] = profile_page.linkbox_top
        json_rsp['linkbox_left'] = profile_page.linkbox_left
        json_rsp['linkbox_enabled'] = profile_page.linkbox_enabled

        return HttpResponse(simplejson.dumps(json_rsp), content_type='application/json; charset=utf8')

    elif request.method == 'PUT' and request.user.is_authenticated and int(profile_id) == request.user.get_profile().id:
        profile_page = Page.objects.get(pk=profile_id)
        rsp = simplejson.loads(request.read())

        profile_page.bg_color = rsp['bgColor']
        profile_page.bg_disabled = rsp['bgDisabled']
        profile_page.headline_text = rsp['headlineText']
        profile_page.headline_top = rsp['headlineTop']
        profile_page.headline_left = rsp['headlineLeft']
        profile_page.headline_color = rsp['headlineColor']
        profile_page.headline_pixel_size = rsp['headlinePixelSize']
        profile_page.headline_fontclass = rsp['headlineFontclass']
        profile_page.status_text = rsp['statusText']
        profile_page.status_top = rsp['statusTop']
        profile_page.status_left = rsp['statusLeft']
        profile_page.status_color = rsp['statusColor']
        profile_page.status_pixel_size = rsp['statusPixelSize']
        profile_page.status_fontclass = rsp['statusFontclass']
        profile_page.story_text = rsp['storyText']
        profile_page.story_top = rsp['storyTop']
        profile_page.story_left = rsp['storyLeft']
        profile_page.story_color = rsp['storyColor']
        profile_page.story_pixel_size = rsp['storyPixelSize']
        profile_page.story_fontclass = rsp['storyFontclass']
        profile_page.linkbox_top = rsp['linkboxTop']
        profile_page.linkbox_left = rsp['linkboxLeft']
        profile_page.linkbox_enabled = rsp['linkboxEnabled']
        profile_page.save()

        return HttpResponse('Page saved!')

    else:
        return HttpResponse(request.user.get_profile().id)


@login_required
def upload_background(request):
    if request.method == 'POST':
        page = Page.objects.get(pk=request.user.get_profile().id)
        form = BackgroundUploadForm(request.POST, request.FILES, instance=page)

        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/id/' + str(int(request.user.id)))

    else:
        return HttpResponseRedirect('/id/' + str(int(request.user.id)))


def contact_agent(request):
    json_rsp = {}
    json_rsp['success'] = False
    if request.method == 'POST':
        form = ContactAgentForm(request.POST)
        if form.is_valid():
            # send the message
            send_mail(
                form.cleaned_data['subject'],
                form.cleaned_data['message'],
                form.cleaned_data['sender'],
                [request.user.email], fail_silently=True)

            json_rsp['success'] = True
            json_rsp['html'] = '<p>Your message has been sent!</p>'
            return HttpResponse(simplejson.dumps(json_rsp), content_type='application/json; charset=utf8')
    else:
        form = ContactAgentForm()

    json_rsp['html'] = form.as_p()
    return HttpResponse(simplejson.dumps(json_rsp), content_type='application/json; charset=utf8')


@never_cache
def front(request, agent_url):
    """Front-end view to agent's precis page."""
    agent_url = agent_url[:-1] if agent_url[len(agent_url)-1] == '/' else agent_url
    page = get_object_or_404(Page, slug=agent_url)
    contact_agent_form = ContactAgentForm()
    return render(request, 'precis/front.html',
            { 'profile_id': page.profile_id, 'contact_agent_form': contact_agent_form })


def keycheck(request, keyword):
    """Answers GET request by returning True or False availability of user-supplied URL keyword.

    Used for AJAX URL availability check on signup page.
    """
    json_rsp = { 'avail': True }
    if Page.objects.filter(slug=keyword):
        json_rsp['avail'] = False
    return HttpResponse(simplejson.dumps(json_rsp), content_type='application/json; charset=utf8')
