from .models import Utakmica, TimSezona
from django.db.models import Q


class Provajder():

    def kola_sezone(self, poslednja_sezona, tip_sezone):
        return Utakmica.objects.filter(Q(sezona__sezona=poslednja_sezona)
                                       & Q(sezona__tip_id__tip=tip_sezone)
                                       ).values('kolo').distinct().order_by('-kolo')

    def aktivini_timovi(self, poslednja_sezona, tip_sezone):
        return TimSezona.objects.values('tim_id__ime').filter(aktivan=1,
                                                              sezona_id__sezona=poslednja_sezona,
                                                              sezona__tip_id__tip=tip_sezone)

    def utakmice_kola(self, kolo, poslednja_sezona, tip_sezone):
        return Utakmica.objects.all().filter(kolo=int(kolo),
                                             sezona__sezona=poslednja_sezona,
                                             sezona__tip_id__tip=tip_sezone).order_by(
                                                 '-datum_zakazano')


class UtakmiceKola():
    def __init__(self, provajder):
        self.provajder = provajder

    def dohvati_kola(self, poslednja_sezona, tip_sezone):
        kola_poslednje_sezone = self.provajder.kola_sezone(poslednja_sezona,
                                                           tip_sezone)
        aktivini_timovi = self.provajder.aktivini_timovi(poslednja_sezona,
                                                         tip_sezone)
        utakmice_kola = []
        for kolo in kola_poslednje_sezone:
            aktivini_timovi_set = UtakmiceKola.aktive_tims(aktivini_timovi)
            broj_kola = kolo.get('kolo')
            utakmice = self.provajder.utakmice_kola(broj_kola,
                                                    poslednja_sezona,
                                                    tip_sezone)

            slobodni_timovi = UtakmiceKola.remove_from_set(utakmice,
                                                           aktivini_timovi_set)
            utakmice_kola.append(UtakmiceSlobodniTimovi(utakmice,
                                                        slobodni_timovi))
        return utakmice_kola

    @staticmethod
    def remove_from_set(utakmice, aktivini_timovi):
        for utakmica in utakmice:
            aktivini_timovi.discard(utakmica.domacin.ime)
            aktivini_timovi.discard(utakmica.gost.ime)
        return list(aktivini_timovi)

    @staticmethod
    def aktive_tims(timovi):
        rezultat = set()
        for tim in timovi:
            ime_tima = tim.get('tim_id__ime')
            rezultat.add(ime_tima)
        return rezultat


class UtakmiceSlobodniTimovi():
    def __init__(self, utakmice, slobodni_timovi):
        self.utakmice = utakmice
        self.slobodni_timovi = slobodni_timovi
