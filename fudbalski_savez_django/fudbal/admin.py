from django.contrib import admin
from .models import TimoviSokobanja, Sudija, Utakmica, Delegat, Tim, TimSezona, Kazne, Sezona, Odbor, ClanOdbora, Obavestenja, Propisi, Vest, Slika, Video
from django.contrib.auth.models import User, Group

admin.site.register([Odbor, ClanOdbora, TimoviSokobanja, Sudija, Utakmica,
                     Delegat, Tim, TimSezona, Kazne, Sezona, Obavestenja, Propisi, Vest, Slika, Video])
admin.site.unregister(User)
admin.site.unregister(Group)
