import os

from django.conf import settings
from django.conf.urls.defaults import patterns, include, url
from django.views.generic import TemplateView

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'', include('social_auth.urls')),
    # (r'^invite/', include('privatebeta.urls')),
    (r'^logout/', 'hq.views.logout_session'),
    (r'^$', 'hq.views.index'),
    (r'^home/$', TemplateView.as_view(template_name='hq/index.html')),
    (r'^features/$', TemplateView.as_view(template_name='hq/features.html')),
    (r'^pricing/$', TemplateView.as_view(template_name='hq/pricing.html')),
    (r'^contact/$', TemplateView.as_view(template_name='hq/contact.html')),
    (r'^login/$', 'django.contrib.auth.views.login', {'template_name': 'hq/login.html'}),
    (r'^signup/$', 'hq.views.signup'),
    (r'^hq/$', 'hq.views.home'),
    (r'^id/(?P<user_id>.*)$', 'precis.views.id'),
    (r'^page/(?P<profile_id>.*)$', 'precis.views.page'),
    (r'^api/keycheck/(?P<keyword>.*)$', 'precis.views.keycheck'),
    (r'^upload/$', 'precis.views.upload_background'),
    (r'^contact_agent/$', 'precis.views.contact_agent'),
    url(r'^subscriptions/', include('subscriptions.urls')),
    (r'^_/(?P<path>.*)$', 'django.views.static.serve', { 'document_root': os.path.abspath(os.path.join(settings.PROJECT_ROOT, '_')) }),
    url(r'^admin/', include(admin.site.urls)),
    (r'^(?P<agent_url>.*)$', 'precis.views.front'),
)
