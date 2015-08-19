from django import forms
from django.contrib.auth.models import User


class UserSignupForm(forms.ModelForm):
    email = forms.EmailField(label="Email")
    email2 = forms.EmailField(label="Email Confirmation")
    password = forms.CharField(label="Password", widget=forms.PasswordInput)
    password2 = forms.CharField(label="Password Confirmation", widget=forms.PasswordInput, help_text="Verify password entered above.")

    class Meta:
        model = User
        fields = ('email', 'password',)

    def clean_email(self):
        email = self.cleaned_data['email']
        users_found = User.objects.filter(email__iexact=email)
        if len(users_found) > 0:
            raise forms.ValidationError("A user with that email address already exists.")
        return email

    def clean_email2(self):
        email = self.cleaned_data.get('email', '')
        email2 = self.cleaned_data['email2']
        if email != email2:
            raise forms.ValidationError("The two emails don't match!")
        return email2

    def clean_password2(self):
        password = self.cleaned_data.get('password', '')
        password2 = self.cleaned_data['password2']
        if password != password2:
            raise forms.ValidationError("The two passwords didn't match!")
        return password2

    def save(self, commit=True):
        user = super(UserSignupForm, self).save(commit=False)
        user.set_password(self.cleaned_data['password'])
        user.username = self.cleaned_data['email']
        user.is_active = True
        if commit:
            user.save()
        return user
