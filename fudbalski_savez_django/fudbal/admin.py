from django.contrib import admin
from .models import TimoviSokobanja, Sudija, Utakmica, Delegat, Tim, TimSezona, Kazne, Sezona
from django.contrib.auth.models import User, Group

admin.site.register([TimoviSokobanja, Sudija, Utakmica,
                     Delegat, Tim, TimSezona, Kazne, Sezona])
admin.site.unregister(User)
admin.site.unregister(Group)
