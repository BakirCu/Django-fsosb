from .mysql_queris import Query
from .models import Tim


class Liga():

    def __init__(self, odigrane_utakmice, pobeda, nereseno, porazi, dati_golovi, primljeni_golovi, gol_razlika, bodovi):
        self.odigrane_utakmice = odigrane_utakmice
        self.pobeda = pobeda
        self.nereseno = nereseno
        self.porazi = porazi
        self.dati_golovi = dati_golovi
        self.primljeni_golovi = primljeni_golovi
        self.gol_razlika = gol_razlika
        self.bodovi = bodovi

    @staticmethod
    def rezultat_tima(tim_id, domacin_gol, gost_gol, tabela_timova):

        ime_tima = Tim.objects.get(id=tim_id).ime
        if ime_tima not in tabela_timova:
            rezultati = Liga(0, 0, 0, 0, 0, 0, 0, 0)
            if domacin_gol and gost_gol:
                rezultati.odigrane_utakmice = 1
                if domacin_gol > gost_gol:
                    rezultati.pobeda = 1
                elif domacin_gol == gost_gol:
                    rezultati.nereseno = 1
                else:
                    rezultati.porazi = 1
                rezultati.dati_golovi = domacin_gol
                rezultati.primljeni_golovi = gost_gol
            else:
                return rezultati, ime_tima
        else:
            if domacin_gol and gost_gol:
                rezultati = tabela_timova[ime_tima]
                rezultati.odigrane_utakmice += 1
                if domacin_gol > gost_gol:
                    rezultati.pobeda += 1
                elif domacin_gol == gost_gol:
                    rezultati.nereseno += 1
                else:
                    rezultati.porazi += 1
                rezultati.dati_golovi += domacin_gol
                rezultati.primljeni_golovi += gost_gol
            else:
                return None, None
        rezultati.gol_razlika = rezultati.dati_golovi - rezultati.primljeni_golovi
        rezultati.bodovi = rezultati.pobeda * 3 + rezultati.nereseno
        return rezultati, ime_tima

    @staticmethod
    def tabela_timova(sezona_obj):
        tabela_timova = {}
        utakmice_sezone = Query.aktivni_timovi_sezone(sezona_obj)
        for utakmica in utakmice_sezone:
            domacin_gol = utakmica[0]
            gost_gol = utakmica[1]
            domacin_id = utakmica[2]
            gost_id = utakmica[3]
            rezultati_tima, ime_tima = Liga.rezultat_tima(
                domacin_id, domacin_gol, gost_gol, tabela_timova)
            if not rezultati_tima:
                continue
            tabela_timova[ime_tima] = rezultati_tima
            rezultati_tima, ime_tima = Liga.rezultat_tima(
                gost_id, domacin_gol, gost_gol, tabela_timova)
            if not rezultati_tima:
                continue
            tabela_timova[ime_tima] = rezultati_tima
        return tabela_timova
