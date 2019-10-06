from django.contrib import admin
from .models import Tim, Sudija, Utakmica, Delegat
from django.contrib.auth.models import User, Group

admin.site.register([Tim, Sudija, Utakmica, Delegat])
admin.site.unregister(User)
admin.site.unregister(Group)
