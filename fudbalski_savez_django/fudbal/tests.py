import unittest


# svaka test klasa se zove TestNESTO (TestLiga npr)
class TestStringMethods(unittest.TestCase):

    # svaki test se zove test_nest (test_imefunkcijekojutestiras)
    def test_upper(self):
        # pozivas funkciju assertEqual, i das joj rezultat svoje funkcije
        # i ocekivani rezultat
        self.assertEqual('foo'.upper(), 'FOO')

# na kraju, pokrenes python manage.py test
