from django.db import connection


class Query:

    @staticmethod
    def odigrane_utakmice(ime_tima, izbaceni_timovi):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT count(*)  FROM fudbal_sb.fudbal_utakmica
            INNER JOIN fudbal_sb.fudbal_tim
            ON  fudbal_utakmica.domacin_id = fudbal_tim.id OR fudbal_utakmica.gost_id = fudbal_tim.id
            WHERE fudbal_tim.ime = %s and fudbal_utakmica.domacin_id NOT IN %s and  fudbal_utakmica.gost_id NOT IN %s ''', [ime_tima, izbaceni_timovi, izbaceni_timovi])
            broj_odigrane_utacmice = cursor.fetchone()
        return broj_odigrane_utacmice[0]

    @staticmethod
    def pobede(ime_time):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT COUNT(*) FROM fudbal_sb.fudbal_utakmica
                            INNER JOIN fudbal_sb.fudbal_tim
                            ON fudbal_utakmica.domacin_id = fudbal_tim.id OR fudbal_utakmica.gost_id = fudbal_tim.id
                            WHERE fudbal_tim.ime = %s
                             AND ((fudbal_utakmica.domacin_id=fudbal_tim.id AND fudbal_utakmica.domacin_gol > fudbal_utakmica.gost_gol)
                              OR
                            (fudbal_utakmica.gost_id=fudbal_tim.id AND fudbal_utakmica.gost_gol > fudbal_utakmica.domacin_gol));''', [ime_time])

            broj_pobeda = cursor.fetchone()
        return broj_pobeda[0]

    @staticmethod
    def porazi(ime_time):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT COUNT(*) FROM fudbal_sb.fudbal_utakmica
                            INNER JOIN fudbal_sb.fudbal_tim
                            ON fudbal_utakmica.domacin_id = fudbal_tim.id OR fudbal_utakmica.gost_id = fudbal_tim.id
                            WHERE fudbal_tim.ime = %s
                             AND ((fudbal_utakmica.domacin_id=fudbal_tim.id AND fudbal_utakmica.domacin_gol < fudbal_utakmica.gost_gol)
                              OR
                            (fudbal_utakmica.gost_id=fudbal_tim.id AND fudbal_utakmica.gost_gol < fudbal_utakmica.domacin_gol));''', [ime_time])
            broj_porazi = cursor.fetchone()
        return broj_porazi[0]

    @staticmethod
    def nereseno(ime_time):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT COUNT(*) FROM fudbal_sb.fudbal_utakmica
                            INNER JOIN fudbal_sb.fudbal_tim
                            ON fudbal_utakmica.domacin_id = fudbal_tim.id OR fudbal_utakmica.gost_id = fudbal_tim.id
                            WHERE fudbal_tim.ime = %s
                             AND ((fudbal_utakmica.domacin_id=fudbal_tim.id AND fudbal_utakmica.domacin_gol = fudbal_utakmica.gost_gol)
                              OR
                            (fudbal_utakmica.gost_id=fudbal_tim.id AND fudbal_utakmica.gost_gol = fudbal_utakmica.domacin_gol));''', [ime_time])
            broj_porazi = cursor.fetchone()
        return broj_porazi[0]

    @staticmethod
    def dati_golovi(ime_tima):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT SUM(golovi) FROM
                            (SELECT SUM(fudbal_utakmica.domacin_gol) AS golovi FROM fudbal_sb.fudbal_utakmica
                            INNER JOIN fudbal_tim
                            ON fudbal_utakmica.domacin_id=fudbal_tim.id
                            WHERE fudbal_tim.ime= %s UNION ALL
                            SELECT SUM(fudbal_utakmica.gost_gol ) FROM fudbal_sb.fudbal_utakmica
                            INNER JOIN fudbal_tim
                            ON fudbal_utakmica.gost_id=fudbal_tim.id
                             WHERE fudbal_tim.ime = %s) AS bodovi''', [ime_tima, ime_tima])
            broj_bodova = cursor.fetchone()
            if not broj_bodova[0]:
                return 0
        return int(broj_bodova[0])

    @staticmethod
    def primljeni_golovi(ime_tima):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT SUM(golovi) FROM
                            (SELECT SUM(fudbal_utakmica.gost_gol) AS golovi FROM fudbal_sb.fudbal_utakmica
                            INNER JOIN fudbal_sb.fudbal_tim
                            ON fudbal_utakmica.domacin_id=fudbal_tim.id
                            WHERE fudbal_tim.ime= %s UNION ALL
                            SELECT SUM(fudbal_utakmica.domacin_gol ) FROM fudbal_sb.fudbal_utakmica
                            INNER JOIN fudbal_sb.fudbal_tim
                            ON fudbal_utakmica.gost_id=fudbal_tim.id
                             WHERE fudbal_tim.ime = %s) AS bodovi''', [ime_tima, ime_tima])

            broj_bodova = cursor.fetchone()
            if not broj_bodova[0]:
                return 0
        return int(broj_bodova[0])

    @staticmethod
    def imena_timova(poslednja_sezona_id):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT  ime FROM fudbal_sb.fudbal_timsezona as ts
                            INNER JOIN fudbal_sb.fudbal_tim as t
                            INNER JOIN fudbal_sb.fudbal_sezona as s
                            ON ts.tim_id = t.id AND ts.sezona_id = s.id
                            WHERE ts.aktivan = 1 AND ts.sezona_id = %s''', [poslednja_sezona_id])
            imena_timova = cursor.fetchall()
        return imena_timova
