# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding field 'Page.slug'
        db.add_column('precis_page', 'slug', self.gf('django.db.models.fields.SlugField')(default='', max_length=100, db_index=True), keep_default=False)


    def backwards(self, orm):
        
        # Deleting field 'Page.slug'
        db.delete_column('precis_page', 'slug')


    models = {
        'auth.group': {
            'Meta': {'object_name': 'Group'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        'auth.permission': {
            'Meta': {'ordering': "('content_type__app_label', 'content_type__model', 'codename')", 'unique_together': "(('content_type', 'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Group']", 'symmetrical': 'False', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'precis.page': {
            'Meta': {'object_name': 'Page'},
            'bg_color': ('django.db.models.fields.CharField', [], {'default': "'#fff'", 'max_length': '7'}),
            'bg_disabled': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'bg_image': ('django.db.models.fields.files.ImageField', [], {'max_length': '200', 'blank': 'True'}),
            'headline_color': ('django.db.models.fields.CharField', [], {'default': "'#000'", 'max_length': '7'}),
            'headline_fontclass': ('django.db.models.fields.CharField', [], {'default': "'typeface-default'", 'max_length': '200'}),
            'headline_left': ('django.db.models.fields.CharField', [], {'default': '18', 'max_length': '40'}),
            'headline_pixel_size': ('django.db.models.fields.CharField', [], {'default': "'28'", 'max_length': '3'}),
            'headline_text': ('django.db.models.fields.CharField', [], {'default': "'This is your headline.'", 'max_length': '100'}),
            'headline_top': ('django.db.models.fields.CharField', [], {'default': '45', 'max_length': '40'}),
            'linkbox_enabled': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'linkbox_left': ('django.db.models.fields.CharField', [], {'default': '18', 'max_length': '400'}),
            'linkbox_top': ('django.db.models.fields.CharField', [], {'default': '30', 'max_length': '40'}),
            'profile': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['precis.UserProfile']", 'unique': 'True', 'primary_key': 'True'}),
            'slug': ('django.db.models.fields.SlugField', [], {'default': "''", 'max_length': '100', 'db_index': 'True'}),
            'status_color': ('django.db.models.fields.CharField', [], {'default': "'#000'", 'max_length': '7'}),
            'status_fontclass': ('django.db.models.fields.CharField', [], {'default': "'typeface-default'", 'max_length': '200'}),
            'status_left': ('django.db.models.fields.CharField', [], {'default': '18', 'max_length': '40'}),
            'status_pixel_size': ('django.db.models.fields.CharField', [], {'default': "'22'", 'max_length': '3'}),
            'status_text': ('django.db.models.fields.CharField', [], {'default': "'This is your status.'", 'max_length': '100'}),
            'status_top': ('django.db.models.fields.CharField', [], {'default': '90', 'max_length': '40'}),
            'story_color': ('django.db.models.fields.CharField', [], {'default': "'#000'", 'max_length': '7'}),
            'story_fontclass': ('django.db.models.fields.CharField', [], {'default': "'typeface-default'", 'max_length': '200'}),
            'story_left': ('django.db.models.fields.CharField', [], {'default': '18', 'max_length': '40'}),
            'story_pixel_size': ('django.db.models.fields.CharField', [], {'default': "'18'", 'max_length': '3'}),
            'story_text': ('django.db.models.fields.TextField', [], {'default': "'This is your story.'"}),
            'story_top': ('django.db.models.fields.CharField', [], {'default': '5', 'max_length': '40'})
        },
        'precis.userprofile': {
            'Meta': {'object_name': 'UserProfile'},
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_subscriber': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'user': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['auth.User']", 'unique': 'True'})
        }
    }

    complete_apps = ['precis']
