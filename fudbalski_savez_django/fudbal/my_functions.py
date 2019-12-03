from .models import Utakmica, TimSezona
from django.db.models import Q


def dohvati_kola(poslednja_sezona, tip_sezone):
    kola_poslednje_sezone = Utakmica.objects.filter(Q(sezona__sezona=poslednja_sezona)
                                                    & Q(sezona__tip_id__tip=tip_sezone)
                                                    ).values('kolo').distinct().order_by('-kolo')
    aktivini_timovi = TimSezona.objects.values('tim_id__ime').filter(aktivan=1,
                                                                     sezona_id__sezona=poslednja_sezona,
                                                                     sezona__tip_id__tip=tip_sezone)
    kola = []
    for kolo in kola_poslednje_sezone:
        aktivini_timovi_list = aktive_tims(aktivini_timovi)
        broj_kola = kolo.get('kolo')
        utakmice_izabranog_kola = Utakmica.objects.all().filter(kolo=int(broj_kola),
                                                                sezona__sezona=poslednja_sezona,
                                                                sezona__tip_id__tip=tip_sezone).order_by(
                                                                    '-datum_zakazano')
        for utakmica in utakmice_izabranog_kola:

            if utakmica.domacin.ime in aktivini_timovi_list:
                aktivini_timovi_list.remove(utakmica.domacin.ime)
            if utakmica.gost.ime in aktivini_timovi_list:
                aktivini_timovi_list.remove(utakmica.gost.ime)

        kola.append(UtakmiceKola(utakmice_izabranog_kola,
                                 aktivini_timovi_list))
    return kola


def aktive_tims(timovi):
    rezultat = []
    for tim in timovi:
        ime_tima = tim.get('tim_id__ime')
        rezultat.append(ime_tima)
    return rezultat


class UtakmiceKola:
    def __init__(self, utakmice, slobodni_timovi):
        self.utakmice = utakmice
        self.slobodni_timovi = slobodni_timovi
