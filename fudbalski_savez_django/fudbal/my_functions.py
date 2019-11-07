from .models import Utakmica
from django.db.models import Q


def dohvati_kola(poslednja_sezona, tip_sezone):
    kola_poslednje_sezone = Utakmica.objects.filter(Q(sezona__sezona=poslednja_sezona) & Q(
        sezona__tip_id__tip=tip_sezone)).values('kolo').distinct().order_by('-kolo')
    kola = []
    for kolo in kola_poslednje_sezone:
        broj_kola = kolo.get('kolo')
        utakmice_izabranog_kola = Utakmica.objects.all().filter(
            kolo=int(broj_kola), sezona__sezona=poslednja_sezona, sezona__tip_id__tip=tip_sezone).order_by('-datum_zakazano')
        kola.append(utakmice_izabranog_kola)
    return kola
