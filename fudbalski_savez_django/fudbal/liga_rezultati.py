from .mysql_queris import Query
from .models import Tim


class Liga():

    def __init__(self, ime_tima, odigrane_utakmice, pobeda, nereseno, porazi, dati_golovi, primljeni_golovi, gol_razlika, bodovi):
        self.ime_tima = ime_tima
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
        rezultati_tima = []
        ime_tima = Tim.objects.get(id=tim_id).ime
        if ime_tima not in tabela_timova:
            if domacin_gol and gost_gol:
                odigrane_utakmice = 1
                if domacin_gol > gost_gol:
                    pobede = 1
                    nereseno = 0
                    porazi = 0
                elif domacin_gol == gost_gol:
                    pobede = 0
                    nereseno = 1
                    porazi = 0
                else:
                    pobede = 0
                    nereseno = 0
                    porazi = 1
                dati_golovi = domacin_gol
                primljeni_golovi = gost_gol
            else:
                return [0, 0, 0, 0, 0, 0, 0, 0], ime_tima
        else:
            if domacin_gol and gost_gol:
                odigrane_utakmice = tabela_timova[ime_tima][0] + 1
                if domacin_gol > gost_gol:
                    pobede = tabela_timova[ime_tima][1] + 1
                    nereseno = tabela_timova[ime_tima][2]
                    porazi = tabela_timova[ime_tima][3]
                elif domacin_gol == gost_gol:
                    pobede = tabela_timova[ime_tima][1]
                    nereseno = tabela_timova[ime_tima][2] + 1
                    porazi = tabela_timova[ime_tima][3]
                else:
                    pobede = tabela_timova[ime_tima][1]
                    nereseno = tabela_timova[ime_tima][2]
                    porazi = tabela_timova[ime_tima][3] + 1
                dati_golovi = tabela_timova[ime_tima][4] + domacin_gol
                primljeni_golovi = tabela_timova[ime_tima][5] + gost_gol
            else:
                return None, None
        gol_razlika = dati_golovi - primljeni_golovi
        bodovi = pobede * 3 + nereseno
        rezultati_tima.append(odigrane_utakmice)
        rezultati_tima.append(pobede)
        rezultati_tima.append(nereseno)
        rezultati_tima.append(porazi)
        rezultati_tima.append(dati_golovi)
        rezultati_tima.append(primljeni_golovi)
        rezultati_tima.append(gol_razlika)
        rezultati_tima.append(bodovi)
        return rezultati_tima, ime_tima

    @staticmethod
    def tabela_timova(sezona_obj):
        rezultati = []
        tabela_timova = {}
        utakmice_sezone = Query.aktivni_timovi_sezone(sezona_obj)
        for utakmica in utakmice_sezone:
            domacin_gol = utakmica[2]
            gost_gol = utakmica[3]
            domacin_id = utakmica[7]
            gost_id = utakmica[10]
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
        for tim, rezultat in tabela_timova.items():
            rezultati.append(Liga(tim, rezultat[0], rezultat[1], rezultat[2], rezultat[3],
                                  rezultat[4], rezultat[5], rezultat[6], rezultat[7]))
        return rezultati
