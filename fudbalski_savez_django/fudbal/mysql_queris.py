from django.db import connection


class Query:

    def bodovi(ime_tima):
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

            broj_bodova = cursor.fetchone()[0]

        return broj_bodova
