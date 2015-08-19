import os
import sys

#----------------------------------------------------------
# :: General setup & db
#----------------------------------------------------------

DEBUG = False
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    ('G McClure', 'gmcclure@gmail.com'),
)

MANAGERS = ADMINS

TIME_ZONE = 'America/Los_Angeles'
LANGUAGE_CODE = 'en-US'

SITE_ID = 1

USE_I18N = False
USE_L10N = False

# Make this unique, and don't share it with anybody.
SECRET_KEY = ''

DATABASES = {
    'default': {
        # 'ENGINE'   : 'django.db.backends.mysql',
        'ENGINE'   : 'django.db.backends.postgresql_psycopg2',
        'NAME'     : 'specialagent',
        'USER'     : 'specialagentman',
        'PASSWORD' : 'wyMY2E1Bu',
        'HOST'     : 'localhost',
        'PORT'     : '',
    }
}

#----------------------------------------------------------
# :: Pythonpath, paths, & dirs
#----------------------------------------------------------

PROJECT_ROOT = os.path.dirname(__file__)
VENDOR_ROOT  = ''.join([PROJECT_ROOT, '/vendor'])
APPS_ROOT    = ''.join([PROJECT_ROOT, '/apps'])
LIB_ROOT     = ''.join([PROJECT_ROOT, '/lib'])

# Pythonpath
if '/vendor' not in ' '.join(sys.path):
    sys.path.append(VENDOR_ROOT)
if '/apps' not in ' '.join(sys.path):
    sys.path.append(APPS_ROOT)
if '/lib' not in ' '.join(sys.path):
    sys.path.append(LIB_ROOT)

MEDIA_ROOT = os.path.abspath(os.path.join(PROJECT_ROOT, '_'))
MEDIA_URL  = '/_/'

STATIC_ROOT = ''
STATIC_URL = '/static/'

ADMIN_MEDIA_PREFIX = '/static/admin/'

# Additional locations of static files
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
)

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
#    'django.contrib.staticfiles.finders.DefaultStorageFinder',
)

#----------------------------------------------------------
# :: Loaders, middleware, & apps
#----------------------------------------------------------

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
#     'django.template.loaders.eggs.Loader',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    # 'privatebeta.middleware.PrivateBetaMiddleware',
)

ROOT_URLCONF = 'specialagent.urls'

TEMPLATE_DIRS = (
    os.path.abspath(os.path.join(PROJECT_ROOT, 'templates')),
)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.admin',
    'django_extensions',
    'paypal.standard.ipn',
    'social_auth',
    'south',
    'easy_thumbnails',
    'hq',
    'precis',
    'subscriptions',
    # 'privatebeta',
)

#----------------------------------------------------------
# :: Logging
#----------------------------------------------------------

# A sample logging configuration. The only tangible logging
# performed by this configuration is to send an email to
# the site admins on every HTTP 500 error.
# See http://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}

#----------------------------------------------------------
# :: Backends & app configs
#----------------------------------------------------------

# Module: social-auth config
AUTHENTICATION_BACKENDS = (
    'social_auth.backends.facebook.FacebookBackend',
    'social_auth.backends.google.GoogleOAuthBackend',
    'social_auth.backends.google.GoogleOAuth2Backend',
    'social_auth.backends.google.GoogleBackend',
    'social_auth.backends.contrib.linkedin.LinkedinBackend',
    'social_auth.backends.twitter.TwitterBackend',
    'social_auth.backends.yahoo.YahooBackend',
    'social_auth.backends.OpenIDBackend',
    'lib.backends.auth.Email',
    'django.contrib.auth.backends.ModelBackend',
)

TWITTER_CONSUMER_KEY              = ''
TWITTER_CONSUMER_SECRET           = ''
FACEBOOK_APP_ID                   = ''
FACEBOOK_API_SECRET               = ''
LINKEDIN_CONSUMER_KEY             = ''
LINKEDIN_CONSUMER_SECRET          = ''
GOOGLE_CONSUMER_KEY               = ''
GOOGLE_CONSUMER_SECRET            = ''

LOGIN_URL                         = '/login/'
LOGIN_REDIRECT_URL                = '/'
LOGIN_ERROR                       = '/login/'

SOCIAL_AUTH_ERROR_KEY             = 'social_errors'
SOCIAL_AUTH_COMPLETE_URL_NAME     = 'socialauth_complete'
SOCIAL_AUTH_ASSOCIATE_URL_NAME    = 'associate_complete'
SOCIAL_AUTH_DEFAULT_USERNAME      = 'new_agent'

SOCIAL_AUTH_EXPIRATION            = 'expires'

AUTH_PROFILE_MODULE               = 'precis.UserProfile'

# AWS config
AWS_ACCESS_KEY_ID                 = ''
AWS_SECRET_ACCESS_KEY             = ''
AWS_STORAGE_BUCKET_NAME           = 'specialagent'

# Easy-thumbnails config
THUMBNAIL_DEBUG = False

# Privatebeta exception allowing for Ajax email submission
PRIVATEBETA_ALWAYS_ALLOW_VIEWS = ['privatebeta.views.store_email']

try:
    from local_settings import *
except ImportError:
    pass
