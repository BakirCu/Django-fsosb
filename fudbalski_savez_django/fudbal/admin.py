from django.contrib import admin
from .models import TimoviSokobanja, Sudija, Utakmica, Delegat
from django.contrib.auth.models import User, Group

admin.site.register([TimoviSokobanja, Sudija, Utakmica, Delegat])
admin.site.unregister(User)
admin.site.unregister(Group)
