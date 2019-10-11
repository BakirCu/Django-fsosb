from django.db import connection


class Query:

    @staticmethod
    def odigrane_utakmice(ime_tima):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT count(*)  FROM fudbal_sb.fudbal_utakmica
                            INNER JOIN fudbal_tim
                            ON fudbal_utakmica.domacin_id = fudbal_tim.id OR fudbal_utakmica.gost_id = fudbal_tim.id
                            WHERE fudbal_tim.ime= %s; ''', [ime_tima])
            broj_odigrane_utacmice = cursor.fetchone()
        return broj_odigrane_utacmice[0]

    @staticmethod
    def pobede(ime_time):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT COUNT(*) FROM fudbal_utakmica
                            INNER JOIN fudbal_tim
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
            cursor.execute('''SELECT COUNT(*) FROM fudbal_utakmica
                            INNER JOIN fudbal_tim
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
            cursor.execute('''SELECT COUNT(*) FROM fudbal_utakmica
                            INNER JOIN fudbal_tim
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
                            INNER JOIN fudbal_tim
                            ON fudbal_utakmica.domacin_id=fudbal_tim.id
                            WHERE fudbal_tim.ime= %s UNION ALL
                            SELECT SUM(fudbal_utakmica.domacin_gol ) FROM fudbal_sb.fudbal_utakmica
                            INNER JOIN fudbal_tim
                            ON fudbal_utakmica.gost_id=fudbal_tim.id
                             WHERE fudbal_tim.ime = %s) AS bodovi''', [ime_tima, ime_tima])

            broj_bodova = cursor.fetchone()
            if not broj_bodova[0]:
                return 0
        return int(broj_bodova[0])

    @staticmethod
    def imena_timova(poslednja_sezona):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT r.ime, SUM(r.bodovi) as broj_bodova
                            FROM
                            (SELECT t.ime,
                            CASE
                            WHEN u.domacin_gol > u.gost_gol  THEN 3
                                WHEN u.domacin_gol = u.gost_gol  THEN 1
                                ELSE 0
                                END AS bodovi
                            FROM fudbal_utakmica AS u
                            INNER JOIN fudbal_tim AS t
                            ON u.domacin_id = t.id
                            WHERE u.sezona = %s

                            UNION ALL
                            SELECT t.ime,
                            CASE
                            WHEN u.gost_gol > u.domacin_gol THEN 3
                                WHEN u.gost_gol = u.domacin_gol  THEN 1
                                ELSE 0
                                END AS bodovi
                            FROM fudbal_utakmica AS u
                            INNER JOIN fudbal_tim AS t
                            ON u.gost_id = t.id
                             WHERE u.sezona = %s) AS r
                            GROUP BY r.ime
                            ORDER BY SUM(r.bodovi) DESC''', [poslednja_sezona, poslednja_sezona])
            imena_timova = cursor.fetchall()
        return imena_timova
