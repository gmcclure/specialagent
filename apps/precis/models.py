import os

from django.contrib.auth.models import User
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from precis.storage import OverwriteStorage


class UserProfile(models.Model):
    """Assigned to AUTH_PROFILE_MODULE in settings.py."""
    user = models.OneToOneField(User)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    is_subscriber = models.BooleanField(default=False)


def background_image_path(instance, filename):
    """Returns user profile-specific path in MEDIA_ROOT
    for user uploaded background image files.

    All files are named, for now, background.jpg.
    """
    return os.path.join('public', str(instance.profile_id), 'bgs', 'background.jpg')


class Page(models.Model):
    """This model tracks all precis page values.

    This might be temporary. It might be useful to create
    other models in order to represent other page elements
    in the future.
    """
    # Each attribute is tracked with the same name, camel-cased in the Javascript.
    profile = models.OneToOneField(UserProfile, primary_key=True)
    slug = models.SlugField(max_length=100, default='')
    bg_color = models.CharField(max_length=7, default='#fff')
    bg_image = models.ImageField(max_length=200, storage=OverwriteStorage(), upload_to=background_image_path, blank=True)
    bg_disabled = models.BooleanField(default=False)
    headline_text = models.CharField(max_length=100, default='This is your headline.')
    headline_top = models.CharField(max_length=40, default=25)
    headline_left = models.CharField(max_length=40, default=18)
    headline_color = models.CharField(max_length=7, default='#000')
    headline_pixel_size = models.CharField(max_length=3, default='28')
    headline_fontclass = models.CharField(max_length=200, default='typeface-default')
    status_text = models.CharField(max_length=100, default='This is your status.')
    status_top = models.CharField(max_length=40, default=70)
    status_left = models.CharField(max_length=40, default=18)
    status_color = models.CharField(max_length=7, default='#000')
    status_pixel_size = models.CharField(max_length=3, default='22')
    status_fontclass = models.CharField(max_length=200, default='typeface-default')
    story_text = models.TextField(default='This is your story.')
    story_top = models.CharField(max_length=40, default=105)
    story_left = models.CharField(max_length=40, default=18)
    story_color = models.CharField(max_length=7, default='#000')
    story_pixel_size = models.CharField(max_length=3, default='18')
    story_fontclass = models.CharField(max_length=200, default='typeface-default')
    linkbox_top = models.CharField(max_length=40, default=30)
    linkbox_left = models.CharField(max_length=400, default=18)
    linkbox_enabled = models.BooleanField(default=False)

    def __unicode__(self):
        return self.headline_text


@receiver(post_save, sender=User)
def create_profile(sender, **kwargs):
    """Creates a profile as soon as a new user account is saved."""
    return UserProfile.objects.get_or_create(user=kwargs['instance'])


@receiver(post_save, sender=UserProfile)
def create_page(sender, **kwargs):
    """Creates an associated page model as soon as a user profile is saved."""
    return Page.objects.get_or_create(profile=kwargs['instance'])

