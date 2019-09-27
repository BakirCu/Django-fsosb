from django.db import connection


class Query:

    def odigrane_utakmice(ime_tima):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT count(*)  FROM fudbal_sb.fudbal_utakmica
                            INNER JOIN fudbal_tim
                            ON fudbal_utakmica.domacin_id = fudbal_tim.id OR fudbal_utakmica.gost_id = fudbal_tim.id
                            WHERE fudbal_tim.ime_tima= %s; ''', [ime_tima])

            broj_odigrane_utacmice = cursor.fetchone()
        return broj_odigrane_utacmice[0]

    def pobede(ime_time):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT COUNT(*) FROM fudbal_utakmica
                            INNER JOIN fudbal_tim
                            ON fudbal_utakmica.domacin_id = fudbal_tim.id OR fudbal_utakmica.gost_id = fudbal_tim.id
                            WHERE fudbal_tim.ime_tima = %s
                             AND ((fudbal_utakmica.domacin_id=fudbal_tim.id AND fudbal_utakmica.domacin_gol > fudbal_utakmica.gost_gol)
                              OR
                            (fudbal_utakmica.gost_id=fudbal_tim.id AND fudbal_utakmica.gost_gol > fudbal_utakmica.domacin_gol));''', [ime_time])

            broj_pobeda = cursor.fetchone()
        return broj_pobeda[0]

    def porazi(ime_time):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT COUNT(*) FROM fudbal_utakmica
                            INNER JOIN fudbal_tim
                            ON fudbal_utakmica.domacin_id = fudbal_tim.id OR fudbal_utakmica.gost_id = fudbal_tim.id
                            WHERE fudbal_tim.ime_tima = %s
                             AND ((fudbal_utakmica.domacin_id=fudbal_tim.id AND fudbal_utakmica.domacin_gol < fudbal_utakmica.gost_gol)
                              OR
                            (fudbal_utakmica.gost_id=fudbal_tim.id AND fudbal_utakmica.gost_gol < fudbal_utakmica.domacin_gol));''', [ime_time])

            broj_porazi = cursor.fetchone()
        return broj_porazi[0]

    def nereseno(ime_time):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT COUNT(*) FROM fudbal_utakmica
                            INNER JOIN fudbal_tim
                            ON fudbal_utakmica.domacin_id = fudbal_tim.id OR fudbal_utakmica.gost_id = fudbal_tim.id
                            WHERE fudbal_tim.ime_tima = %s
                             AND ((fudbal_utakmica.domacin_id=fudbal_tim.id AND fudbal_utakmica.domacin_gol = fudbal_utakmica.gost_gol)
                              OR
                            (fudbal_utakmica.gost_id=fudbal_tim.id AND fudbal_utakmica.gost_gol = fudbal_utakmica.domacin_gol));''', [ime_time])

            broj_porazi = cursor.fetchone()
        return broj_porazi[0]

    def dati_golovi(ime_tima):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT SUM(golovi) FROM
                            (SELECT SUM(fudbal_utakmica.domacin_gol) AS golovi FROM fudbal_sb.fudbal_utakmica
                            INNER JOIN fudbal_tim
                            ON fudbal_utakmica.domacin_id=fudbal_tim.id
                            WHERE fudbal_tim.ime_tima= %s UNION ALL
                            SELECT SUM(fudbal_utakmica.gost_gol ) FROM fudbal_sb.fudbal_utakmica
                            INNER JOIN fudbal_tim
                            ON fudbal_utakmica.gost_id=fudbal_tim.id
                             WHERE fudbal_tim.ime_tima = %s) AS bodovi''', [ime_tima, ime_tima])

            broj_bodova = cursor.fetchone()
            if not broj_bodova[0]:
                return 0
        return broj_bodova[0]

    def primljeni_golovi(ime_tima):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT SUM(golovi) FROM
                            (SELECT SUM(fudbal_utakmica.gost_gol) AS golovi FROM fudbal_sb.fudbal_utakmica
                            INNER JOIN fudbal_tim
                            ON fudbal_utakmica.domacin_id=fudbal_tim.id
                            WHERE fudbal_tim.ime_tima= %s UNION ALL
                            SELECT SUM(fudbal_utakmica.domacin_gol ) FROM fudbal_sb.fudbal_utakmica
                            INNER JOIN fudbal_tim
                            ON fudbal_utakmica.gost_id=fudbal_tim.id
                             WHERE fudbal_tim.ime_tima = %s) AS bodovi''', [ime_tima, ime_tima])

            broj_bodova = cursor.fetchone()
            if not broj_bodova[0]:
                return 0
        return broj_bodova[0]

    def imena_timova():
        with connection.cursor() as cursor:
            cursor.execute('''SELECT fudbal_tim.ime_tima FROM fudbal_tim''')
            imena_timova = cursor.fetchall()
        return imena_timova
