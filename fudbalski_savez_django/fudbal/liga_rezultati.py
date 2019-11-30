from .mysql_queris import Query
from .models import Tim
from enum import Enum


class Rezultat_poredjenja(Enum):
    # rezultat poredjenja u rezultati_susreta moze da vrati 3 vrednosti, pa ne mozemo da koristimo True i False
    # koristimo enum
    IZGUBIO = 0
    POBEDIO = 1
    NERESENO = 2


class Susreti():
    # ovo je mala pomocna klasa u kojoj drzimo sumu svih potrebnih informacija o medjusobnom susretu 2 tima
    def __init__(self):
        self.dato_u_gostima = 0
        self.primljeno_u_gostima = 0
        self.dato_kod_kuce = 0
        self.primljeno_kod_kuce = 0
        self.bodovi = 0  # ovo su bodovi u zajednickim susretima
        self.bodovi_protivnik = 0  # bodovi protivnika u zajednickim susretima

    # funkcija koja pomaze pri debagovanju testova
    def __str__(self):
        return "Dato u gostima " + str(self.dato_u_gostima) + \
            " Primljeno u gostima " + str(self.primljeno_u_gostima) + \
            " Dato kod kuce " + str(self.dato_kod_kuce) + \
            " Primljeno kod kuce " + str(self.primljeno_kod_kuce) + \
            " Bodovi " + str(self.bodovi) + \
            " Bodovi protivnika " + str(self.bodovi_protivnik)

    def rezultati_susreta(self):
        # drugi uslov poredjenja, ko ima veci broj bodova u zajednickim susretima
        if self.bodovi > self.bodovi_protivnik:
            return Rezultat_poredjenja.POBEDIO
        if self.bodovi < self.bodovi_protivnik:
            return Rezultat_poredjenja.IZGUBIO

        dati_golovi = self.dato_kod_kuce + self.dato_u_gostima
        primljeni_golovi = self.primljeno_kod_kuce + self.primljeno_u_gostima

        # treci uslov poredjenja, ko ima vecu gol razliku u zajednickim susretima
        if primljeni_golovi > dati_golovi:
            return Rezultat_poredjenja.IZGUBIO
        if primljeni_golovi < dati_golovi:
            return Rezultat_poredjenja.POBEDIO

        # cetvrti uslov poredjenja, ko je vise golova dao u gostima u medjusobnim susretima
        if self.primljeno_kod_kuce > self.dato_u_gostima:
            return Rezultat_poredjenja.IZGUBIO
        if self.primljeno_kod_kuce < self.dato_u_gostima:
            return Rezultat_poredjenja.POBEDIO

        return Rezultat_poredjenja.NERESENO


class Rezultat():
    # Rezutat je prosiren id-jem i dict-om koji sadrzi instancu Susreti
    # za svaki tim sa kojim je igrao tim ciji je ovaj Rezultat
    def __init__(self, ime, id):
        self.ime = ime
        self.id = id
        self.odigrane_utakmice = 0
        self.pobeda = 0
        self.nereseno = 0
        self.porazi = 0
        self.dati_golovi = 0
        self.primljeni_golovi = 0
        self.gol_razlika = 0
        self.bodovi = 0
        self.susreti = {}

    # pomocna funkcija za debagovanje, nije potrebna
    def __str__(self):
        return "Tim: " + self.ime + " Bodovi: " + str(self.bodovi)

    def __eq__(self, other):
        if self.id == other.id and self.ime == other.ime \
                and self.odigrane_utakmice == other.odigrane_utakmice \
                and self.pobeda == other.pobeda and self.nereseno == other.nereseno \
                and self.porazi == other.porazi and self.dati_golovi == other.dati_golovi \
                and self.primljeni_golovi == other.primljeni_golovi \
                and self.gol_razlika == other.gol_razlika and self.bodovi == other.bodovi:
            return True
        else:
            return False

    def __lt__(self, other):
        # prvi uslov poredjenja, poredjenje po ukupnom broju bodova
        if self.bodovi < other.bodovi:
            return True
        if self.bodovi > other.bodovi:
            return False

        # drugi, treci  i cetrvti uslovi poredjenja su u rezultatima susreta
        if other.id in self.susreti:
            rezultati_susreta = self.susreti[other.id].rezultati_susreta()

            if rezultati_susreta == Rezultat_poredjenja.IZGUBIO:
                return True
            if rezultati_susreta == Rezultat_poredjenja.POBEDIO:
                return False

        # peti uslov poredjenja je u ukupnoj gol razlici
        if self.gol_razlika < other.gol_razlika:
            return True
        if self.gol_razlika > other.gol_razlika:
            return False

        # ako su jednaki po svim uslovima, biramo da je bolji onaj koji je prvi po abecedom redu
        # u stvarnosti zrebom se odlucuje pobednik, ali do ovoga nece doci
        return self.ime < other.ime


class ProvajderPodataka:
    def dohvati_utakmice_sezone(self, sezona):
        return Query.utakmice_aktivnih_timova(sezona)

    def dohvati_ime_tima(self, id):
        return Tim.objects.get(id=id).ime

    def dohvati_kazne_timova(self, sezona):
        return Query.kaznjeni_timovi(sezona)


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
                    self.provajder.dohvati_ime_tima(utakmica.id_domacin), utakmica.id_domacin)

            tabela_timova[utakmica.id_domacin] = Liga.osvezi_rezultate(
                tabela_timova[utakmica.id_domacin], utakmica.id_gost, utakmica.golovi_domacin, utakmica.golovi_gost, True)

            if utakmica.id_gost not in tabela_timova:
                tabela_timova[utakmica.id_gost] = Rezultat(
                    self.provajder.dohvati_ime_tima(utakmica.id_gost), utakmica.id_gost)

            tabela_timova[utakmica.id_gost] = Liga.osvezi_rezultate(
                tabela_timova[utakmica.id_gost], utakmica.id_domacin, utakmica.golovi_gost, utakmica.golovi_domacin, False)

        kazneni_poeni = self.provajder.dohvati_kazne_timova(sezona)
        for kazna in kazneni_poeni:
            if kazna.id_tim in tabela_timova:
                tabela_timova[kazna.id_tim].bodovi -= kazna.kazneni_bodovi

        tabela_timova_imena = []

        for tim in tabela_timova:
            tabela_timova_imena.append(tabela_timova[tim])

        tabela_timova_imena.sort(reverse=True)

        return tabela_timova_imena

    @staticmethod
    def osvezi_rezultate(tim, protivnik, golovi, golovi_protivnika, is_domacin):
        # sada nam je za rezultat potreban i id protivnika kao i informacija na cijem terenu je igrana utakmica
        # informacije o tome na cijem terenu je igrana utakmica su nam potrebne za medjusobne susrete i poredjenje
        # timova u medjusobnim susretima
        tim.odigrane_utakmice = tim.odigrane_utakmice + 1
        tim.dati_golovi = tim.dati_golovi + golovi
        tim.primljeni_golovi = tim.primljeni_golovi + golovi_protivnika
        tim.gol_razlika = tim.dati_golovi - tim.primljeni_golovi

        gol_razlika_utakmice = golovi - golovi_protivnika

        if protivnik not in tim.susreti:
            tim.susreti[protivnik] = Susreti()

        if gol_razlika_utakmice > 0:
            tim.pobeda = tim.pobeda + 1
            tim.susreti[protivnik].bodovi += 3
        elif gol_razlika_utakmice == 0:
            tim.nereseno = tim.nereseno + 1
            tim.susreti[protivnik].bodovi += 1
            tim.susreti[protivnik].bodovi_protivnik += 1
        else:
            tim.porazi = tim.porazi + 1
            tim.susreti[protivnik].bodovi_protivnik += 3

        tim.bodovi = tim.pobeda * 3 + tim.nereseno

        if is_domacin:
            tim.susreti[protivnik].dato_kod_kuce += golovi
            tim.susreti[protivnik].primljeno_kod_kuce += golovi_protivnika
        else:
            tim.susreti[protivnik].dato_u_gostima += golovi
            tim.susreti[protivnik].primljeno_u_gostima += golovi_protivnika

        return tim
