from .mysql_queris import Query


class Liga():

    def __init__(self, ime_tima, odigrane_utakmice, broj_pobeda, broj_neresenih, broj_poraza, dati_golovi, primljni_golovi, gol_razliak, bodovi):
        self.ime_tima = ime_tima
        self.odigrane_utakmice = odigrane_utakmice
        self.broj_pobeda = broj_pobeda
        self.broj_neresenih = broj_neresenih
        self.broj_poraza = broj_poraza
        self.dati_golovi = dati_golovi
        self.primljni_golovi = primljni_golovi
        self.gol_razliak = gol_razliak
        self.bodovi = bodovi

    @staticmethod
    def tabela_timova():
        tabela_timova_list = []
        imena_timova = Query.imena_timova()

        for tim in imena_timova:
            ime_tima = tim[0]
            dati_golovi = Query.dati_golovi(ime_tima)
            primljeni_golovi = Query.primljeni_golovi(ime_tima)
            utakmica = Query.odigrane_utakmice(ime_tima)
            pobeda = Query.pobede(ime_tima)
            poraz = Query.porazi(ime_tima)
            nereseno = Query.nereseno(ime_tima)
            gol_razlika = dati_golovi - primljeni_golovi
            broj_bodova = pobeda*3 + nereseno
            tabela_timova_list.append(Liga(ime_tima, utakmica, pobeda, nereseno, poraz,
                                           dati_golovi, primljeni_golovi, gol_razlika, broj_bodova))
        return tabela_timova_list
