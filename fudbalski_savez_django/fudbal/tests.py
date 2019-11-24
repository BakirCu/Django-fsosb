import unittest
from .liga_rezultati import Liga
from .mysql_queris import Utakmica

# svaka test klasa se zove TestNESTO (TestLiga npr)


class TestStringMethods(unittest.TestCase):

    # svaki test se zove test_nest (test_imefunkcijekojutestiras)
    def test_upper(self):
        # pozivas funkciju assertEqual, i das joj rezultat svoje funkcije
        # i ocekivani rezultat
        self.assertEqual('foo'.upper(), 'FOO')

# na kraju, pokrenes python manage.py test


class ProvajderPodatakaTest:
    def dohvati_utakmice_sezone(self, sezona):
        utakmice = [
            Utakmica([3, 1, 0, 2]),
            Utakmica([2, 2, 0, 1]),
            Utakmica([5, 4, 3, 2])
        ]

        return utakmice

    def dohvati_ime_tima(self, id):
        return str(id)


class TestLiga(unittest.TestCase):
    def test_tabela(self):
        liga = Liga(ProvajderPodatakaTest())
        tabela = liga.tabela(None)

        tabela = sorted(tabela, key=lambda x: x.ime)

        self.assertEqual(tabela[0].bodovi, 4)
        self.assertEqual(tabela[1].bodovi, 1)
        self.assertEqual(tabela[2].bodovi, 0)
        self.assertEqual(tabela[3].bodovi, 3)
