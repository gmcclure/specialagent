from django.conf import settings
from django.core.urlresolvers import reverse
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils.http import urlquote
from paypal.standard.forms import PayPalPaymentsForm

def signup(request):
    """
    Displays PayPal subscription signup form and provides enough context for
    the template to display the unsubscribe button if the user is already a
    subscriber.
    """
    paypal_setup = {
        'cmd'           : '_xclick-subscriptions',
        'business'      : settings.PAYPAL_RECEIVER_EMAIL,
        'a3'            : '8.00', # monthly price
        'p3'            : 1,      # duration of each unit
        't3'            : 'M',    # duration unit ('M' for month)
        'src'           : '1',    # make payments recur
        'sra'           : '1',    # reattempt payment on payment error
        'no_note'       : '1',    # remove extra notes (optional)
        'item_name'     : 'SpecialAgent.me Monthly Subscription',
        'notify_url'    : settings.SITE_DOMAIN + reverse('paypal-ipn'),
        'return_url'    : settings.SITE_DOMAIN + reverse('paypal-return'),
        'cancel_return' : settings.SITE_DOMAIN + reverse('paypal-cancel'),
        'custom'        : request.user.username,
    }

    form = PayPalPaymentsForm(initial=paypal_setup, button_type='subscribe')

    return render_to_response('subscriptions/signup.html', 
            { 'dev': settings.DEBUG, 'encoded_email': urlquote(settings.PAYPAL_RECEIVER_EMAIL), 'form': form },
            context_instance=RequestContext(request))
