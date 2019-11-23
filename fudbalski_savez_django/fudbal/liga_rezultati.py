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
    '''1.Promenio sam nazive i jer kada u metodi tabela pozovemo rezultat_tima,
     bitno nam je da razlikujemo kada smo poslali id_domacina,
     a kada id_gosta, i morao sam da stavim ovo 'is None', jer onako
     bi ulazilo u ovo prvo if ako su golovi domacina ili gosta == 0
     2. Promenio sam raspored if i else jer moram nekako da ispisem sve nule za planirane utakmice
     na pocetku sezone, ali mi se sada javlja drugi problem, ovako kako sam napisao, ako admin unese prvi put ime tima
     i stavi mu neki rezultat, taj rezultat ce ovako kako sam napisao sve vrednosti da postavi na 0'''
    @staticmethod
    def rezultat_tima(tim_id, dati_golovi, primljeni_golovi, tabela_timova):
        ime_tima = Tim.objects.get(id=tim_id).ime
        if ime_tima not in tabela_timova and dati_golovi is None or primljeni_golovi is None:
            rezultati = Liga(0, 0, 0, 0, 0, 0, 0, 0)
            return rezultati, ime_tima
        elif ime_tima not in tabela_timova:
            rezultati = Liga(0, 0, 0, 0, 0, 0, 0, 0)
        else:
            rezultati = tabela_timova[ime_tima]

        if dati_golovi is None or primljeni_golovi is None:
            return None, None

        rezultati.odigrane_utakmice += 1
        if dati_golovi > primljeni_golovi:
            rezultati.pobeda += 1
        elif dati_golovi == primljeni_golovi:
            rezultati.nereseno += 1
        else:
            rezultati.porazi += 1
        rezultati.dati_golovi += dati_golovi
        rezultati.primljeni_golovi += primljeni_golovi
        rezultati.gol_razlika = rezultati.dati_golovi - rezultati.primljeni_golovi
        rezultati.bodovi = rezultati.pobeda * 3 + rezultati.nereseno
        return rezultati, ime_tima

    @staticmethod
    def tabela(sezona_obj):
        utakmice_sezone = Query.utakmice_aktivnih_timova(sezona_obj)
        tabela_timova = {}
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
                gost_id, gost_gol, domacin_gol, tabela_timova)
            if not rezultati_tima:
                continue
            tabela_timova[ime_tima] = rezultati_tima
        tabela_timova = Liga.kazneni_bodovi(sezona_obj, tabela_timova)
        tabela_timova = Liga.sort_table(tabela_timova)
        return tabela_timova

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
