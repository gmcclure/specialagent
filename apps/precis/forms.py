from django import forms
from precis.models import Page


class BackgroundUploadForm(forms.ModelForm):
    bg_image = forms.ImageField(label='Background Image', max_length=200)

    class Meta:
        model = Page
        fields = ( 'bg_image', )


class ContactAgentForm(forms.Form):
    sender  = forms.EmailField()
    subject = forms.CharField(max_length=150)
    message = forms.CharField(widget=forms.Textarea)


class UpdateSlugForm(forms.ModelForm):
    slug = forms.SlugField(label='Personal URL Keyword', max_length=100, min_length=3,
            error_messages={'invalid': 'Please use letters, numbers, underscores or hyphens ONLY.'})

    class Meta:
        model = Page
        fields = ( 'slug', )
