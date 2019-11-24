from .mysql_queris import Query
from .models import Tim


class Rezultat():
    def __init__(self, ime):
        self.ime = ime
        self.odigrane_utakmice = 0
        self.pobeda = 0
        self.nereseno = 0
        self.porazi = 0
        self.dati_golovi = 0
        self.primljeni_golovi = 0
        self.gol_razlika = 0
        self.bodovi = 0


class ProvajderPodataka:
    def dohvati_utakmice_sezone(self, sezona):
        return Query.utakmice_aktivnih_timova(sezona)

    def dohvati_ime_tima(self, id):
        return Tim.objects.get(id=id).ime


class Liga():
    def __init__(self, provajder):
        self.provajder = provajder

    def tabela(self, sezona):
        tabela_timova = {}
        utakmice_sezone = self.provajder.dohvati_utakmice_sezone(sezona)

        for utakmica in utakmice_sezone:
            if utakmica.golovi_domacin is None or utakmica.golovi_gost is None:
                continue

            if utakmica.id_domacin not in tabela_timova:
                tabela_timova[utakmica.id_domacin] = Rezultat(
                    self.provajder.dohvati_ime_tima(utakmica.id_domacin))

            tabela_timova[utakmica.id_domacin] = Liga.osvezi_rezultate(
                tabela_timova[utakmica.id_domacin], utakmica.golovi_domacin, utakmica.golovi_gost)

            if utakmica.id_gost not in tabela_timova:
                tabela_timova[utakmica.id_gost] = Rezultat(
                    self.provajder.dohvati_ime_tima(utakmica.id_gost))

            tabela_timova[utakmica.id_gost] = Liga.osvezi_rezultate(
                tabela_timova[utakmica.id_gost], utakmica.golovi_gost, utakmica.golovi_domacin)

        # ovde ce se dohvatiti lista kaznenih poena

        tabela_timova_imena = []

        for tim in tabela_timova:
            tabela_timova_imena.append(tabela_timova[tim])

        # ovde moze da se pozove sortiranje liste tabela_timova_imena

        return tabela_timova_imena

    @staticmethod
    def osvezi_rezultate(tim, golovi, golovi_protivnika):
        tim.odigrane_utakmice = tim.odigrane_utakmice + 1
        tim.dati_golovi = tim.dati_golovi + golovi
        tim.primljeni_golovi = tim.primljeni_golovi + golovi_protivnika
        tim.gol_razlika = tim.dati_golovi - tim.primljeni_golovi

        gol_razlika_utakmice = golovi - golovi_protivnika

        if gol_razlika_utakmice > 0:
            tim.pobeda = tim.pobeda + 1
        elif gol_razlika_utakmice == 0:
            tim.nereseno = tim.nereseno + 1
        else:
            tim.porazi = tim.porazi + 1

        tim.bodovi = tim.pobeda * 3 + tim.nereseno

        return tim

    @staticmethod
    def kazneni_bodovi(sezona_obj, tabela_timova):
        kaznjeni_timovi = Query.kaznjeni_timovi(sezona_obj)
        for tim_bod in kaznjeni_timovi:
            kaznjeni_tim = tim_bod[0]
            kazneni_bodovi = int(tim_bod[1])
            if kaznjeni_tim in tabela_timova:
                tim = tabela_timova[kaznjeni_tim]
                tim.bodovi -= kazneni_bodovi
        return tabela_timova

    @staticmethod
    def sort_table(tabela_timova):
        return {k: v for k, v in sorted(tabela_timova.items(), key=lambda x: (x[1].bodovi, x[1].gol_razlika), reverse=True)}
