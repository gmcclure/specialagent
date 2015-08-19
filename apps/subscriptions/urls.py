from django.conf.urls.defaults import *
from django.views.generic import TemplateView

urlpatterns = patterns('',
    (r'^signup/$', 'subscriptions.views.signup'),
    url(r'^payment_return/', TemplateView.as_view(template_name='subscriptions/payment_return.html'), name='paypal-return'),
    url(r'^payment_canceled/', TemplateView.as_view(template_name='subscriptions/payment_canceled.html'), name='paypal-cancel'),
    url(r'^specialagent_payment_notify_x0BQI0Ze/', include('paypal.standard.ipn.urls'), name='paypal-ipn'),
)
