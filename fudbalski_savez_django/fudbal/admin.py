from django.contrib import admin
from .models import Tim, Sudija, Utakmica
from django.contrib.auth.models import User, Group

admin.site.register([Tim, Sudija, Utakmica])
admin.site.unregister(User)
admin.site.unregister(Group)
