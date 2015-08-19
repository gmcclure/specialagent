from django.conf.urls.defaults import *

urlpatterns = patterns('',
    url(r'^$', 'privatebeta.views.invite', name='privatebeta_invite'),
    url(r'^store_email/$', 'privatebeta.views.store_email', name='privatebeta_store_email'),
    url(r'^sent/$', 'privatebeta.views.sent', name='privatebeta_sent'),
)
