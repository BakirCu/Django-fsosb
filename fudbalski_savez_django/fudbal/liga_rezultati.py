from .mysql_queris import Query
from .models import Tim


def tabela_timova(sezona_obj):
    tabela_timova = {}
    utakmice_sezone = Query.aktivni_timovi_sezone(sezona_obj)
    for utakmica in utakmice_sezone:
        domacin_gol = utakmica[2]
        gost_gol = utakmica[3]
        domacin_id = utakmica[7]
        gost_id = utakmica[10]
        rezultati_tima, ime_tima = rezultat_tima(
            domacin_id, domacin_gol, gost_gol, tabela_timova)
        if not rezultati_tima:
            continue
        tabela_timova[ime_tima] = rezultati_tima
        rezultati_tima, ime_tima = rezultat_tima(
            gost_id, domacin_gol, gost_gol, tabela_timova)
        if not rezultati_tima:
            continue
        tabela_timova[ime_tima] = rezultati_tima
    return tabela_timova


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
