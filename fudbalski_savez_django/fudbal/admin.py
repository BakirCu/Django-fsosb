from django.contrib import admin
from .models import TimoviSokobanja, Sudija, Utakmica, Delegat, Tim, TimSezona, Kazne, Sezona, Odbor, ClanOdbora, Obavestenja
from django.contrib.auth.models import User, Group

admin.site.register([Odbor, ClanOdbora, TimoviSokobanja, Sudija, Utakmica,
                     Delegat, Tim, TimSezona, Kazne, Sezona, Obavestenja])
admin.site.unregister(User)
admin.site.unregister(Group)
