import unittest
from .liga_rezultati import Liga, Rezultat
from .mysql_queris import Utakmica, Kazna

# svaka test klasa se zove TestNESTO (TestLiga npr)


class TestStringMethods(unittest.TestCase):

    # svaki test se zove test_nest (test_imefunkcijekojutestiras)
    def test_upper(self):
        # pozivas funkciju assertEqual, i das joj rezultat svoje funkcije
        # i ocekivani rezultat
        self.assertEqual('foo'.upper(), 'FOO')

# na kraju, pokrenes python manage.py test

# test svakog uslova poredjenja ima drugi skup utakmica


class ProvajderPodatakaTest1:
    def dohvati_utakmice_sezone(self, sezona):
        utakmice = [
            Utakmica([3, 0, 0, 1]),
            Utakmica([0, 5, 1, 0]),
        ]

        return utakmice

    def dohvati_ime_tima(self, id):
        return str(id)

    def dohvati_kazne_timova(self, sezona):
        return []


class ProvajderPodatakaTest2:
    def dohvati_utakmice_sezone(self, sezona):
        utakmice = [
            Utakmica([2, 0, 0, 1]),
            Utakmica([3, 0, 1, 2]),
        ]

        return utakmice

    def dohvati_ime_tima(self, id):
        return str(id)

    def dohvati_kazne_timova(self, sezona):
        return []


class ProvajderPodatakaTest3:
    def dohvati_utakmice_sezone(self, sezona):
        utakmice = [
            Utakmica([3, 0, 0, 1]),
            Utakmica([2, 0, 1, 0]),
        ]

        return utakmice

    def dohvati_ime_tima(self, id):
        return str(id)

    def dohvati_kazne_timova(self, sezona):
        return []


class ProvajderPodatakaTest4:
    def dohvati_utakmice_sezone(self, sezona):
        utakmice = [
            Utakmica([2, 2, 0, 1]),
            Utakmica([3, 3, 1, 0]),
        ]

        return utakmice

    def dohvati_ime_tima(self, id):
        return str(id)

    def dohvati_kazne_timova(self, sezona):
        return []


class ProvajderPodatakaTest5:
    def dohvati_utakmice_sezone(self, sezona):
        utakmice = [
            Utakmica([2, 2, 0, 1]),
            Utakmica([2, 2, 1, 0]),
            Utakmica([1, 0, 0, 2]),
            Utakmica([0, 2, 2, 1])
        ]

        return utakmice

    def dohvati_ime_tima(self, id):
        return str(id)

    def dohvati_kazne_timova(self, sezona):
        return []


class ProvajderPodatakaTestKazne:
    def dohvati_utakmice_sezone(self, sezona):
        utakmice = [
            Utakmica([2, 2, 0, 1]),
            Utakmica([3, 3, 1, 0]),
        ]

        return utakmice

    def dohvati_ime_tima(self, id):
        return str(id)

    def dohvati_kazne_timova(self, sezona):
        kazneni_poeni = [Kazna((0, 1))]
        return kazneni_poeni


class TestLigaPrviUslov(unittest.TestCase):
    def test_tabela(self):
        print("\nTest 1 je u toku")
        liga = Liga(ProvajderPodatakaTest1())
        tabela = liga.tabela(None)
        prvi_tim = Rezultat("0", 0)
        prvi_tim.odigrane_utakmice = 2
        prvi_tim.pobeda = 2
        prvi_tim.nereseno = 0
        prvi_tim.porazi = 0
        prvi_tim.dati_golovi = 8
        prvi_tim.primljeni_golovi = 0
        prvi_tim.gol_razlika = 8
        prvi_tim.bodovi = 6

        self.assertEqual(tabela[0] == prvi_tim, True)


class TestLigaDrugiUslov(unittest.TestCase):
    def test_tabela(self):
        print("\nTest 2 je u toku")
        liga = Liga(ProvajderPodatakaTest2())
        tabela = liga.tabela(None)
        prvi_tim = Rezultat("0", 0)
        prvi_tim.odigrane_utakmice = 1
        prvi_tim.pobeda = 1
        prvi_tim.nereseno = 0
        prvi_tim.porazi = 0
        prvi_tim.dati_golovi = 2
        prvi_tim.primljeni_golovi = 0
        prvi_tim.gol_razlika = 2
        prvi_tim.bodovi = 3

        self.assertEqual(tabela[0] == prvi_tim, True, prvi_tim)


class TestLigaTreciUslov(unittest.TestCase):
    def test_tabela(self):
        print("\nTest 3 je u toku")
        liga = Liga(ProvajderPodatakaTest3())
        tabela = liga.tabela(None)
        prvi_tim = Rezultat("0", 0)
        prvi_tim.odigrane_utakmice = 2
        prvi_tim.pobeda = 1
        prvi_tim.nereseno = 0
        prvi_tim.porazi = 1
        prvi_tim.dati_golovi = 3
        prvi_tim.primljeni_golovi = 2
        prvi_tim.gol_razlika = 1
        prvi_tim.bodovi = 3

        self.assertEqual(tabela[0] == prvi_tim, True, prvi_tim)


class TestLigaCetvrtiUslov(unittest.TestCase):
    def test_tabela(self):
        print("\nTest 4 je u toku")
        liga = Liga(ProvajderPodatakaTest4())
        tabela = liga.tabela(None)
        prvi_tim = Rezultat("0", 0)
        prvi_tim.odigrane_utakmice = 2
        prvi_tim.pobeda = 0
        prvi_tim.nereseno = 2
        prvi_tim.porazi = 0
        prvi_tim.dati_golovi = 5
        prvi_tim.primljeni_golovi = 5
        prvi_tim.gol_razlika = 0
        prvi_tim.bodovi = 2

        self.assertEqual(tabela[0] == prvi_tim, True)


class TestLigaPetiUslov(unittest.TestCase):
    def test_tabela(self):
        print("\nTest 5 je u toku")
        liga = Liga(ProvajderPodatakaTest5())
        tabela = liga.tabela(None)
        prvi_tim = Rezultat("1", 1)
        prvi_tim.odigrane_utakmice = 3
        prvi_tim.pobeda = 1
        prvi_tim.nereseno = 2
        prvi_tim.porazi = 0
        prvi_tim.dati_golovi = 6
        prvi_tim.primljeni_golovi = 4
        prvi_tim.gol_razlika = 2
        prvi_tim.bodovi = 5

        self.assertEqual(tabela[0] == prvi_tim, True)


class TestLigaKazne(unittest.TestCase):
    def test_tabela(self):
        print("\nTest kazni je u toku")
        liga = Liga(ProvajderPodatakaTestKazne())
        tabela = liga.tabela(None)
        prvi_tim = Rezultat("1", 1)
        prvi_tim.odigrane_utakmice = 2
        prvi_tim.pobeda = 0
        prvi_tim.nereseno = 2
        prvi_tim.porazi = 0
        prvi_tim.dati_golovi = 5
        prvi_tim.primljeni_golovi = 5
        prvi_tim.gol_razlika = 0
        prvi_tim.bodovi = 2

        self.assertEqual(tabela[0] == prvi_tim, True)
