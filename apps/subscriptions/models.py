from django.contrib.auth.models import User
from paypal.standard.ipn.signals import subscription_signup, subscription_cancel

def activate_subscription(sender, **kwargs):
    ipn_obj = sender
    user_profile = User.objects.get(username=ipn_obj.custom).get_profile()
    user_profile.is_subscriber = True
    user_profile.save()
subscription_signup.connect(activate_subscription, dispatch_uid='subscription.models.activate_subscription')

def cancel_subscription(sender, **kwargs):
    ipn_obj = sender
    user_profile = User.objects.get(username=ipn_obj.custom).get_profile()
    user_profile.is_subscriber = False
    user_profile.save()
subscription_cancel.connect(cancel_subscription, dispatch_uid='subscription.models.cancel_subscription')
