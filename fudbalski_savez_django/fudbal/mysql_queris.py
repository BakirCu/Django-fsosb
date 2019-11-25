from django.db import connection


class Utakmica:
    def __init__(self, utakmica_podaci):
        self.golovi_domacin = utakmica_podaci[0]
        self.golovi_gost = utakmica_podaci[1]
        self.id_domacin = utakmica_podaci[2]
        self.id_gost = utakmica_podaci[3]


class Kazna:
    def __init__(self, kazna_podaci):
        self.id_tim = kazna_podaci[0]
        self.kazneni_bodovi = kazna_podaci[1]


class Query:

    @staticmethod
    def utakmice_aktivnih_timova(sezona_obj):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT domacin_gol, gost_gol, domacin_id, gost_id FROM fudbal_sb.fudbal_utakmica AS u
                           INNER JOIN fudbal_sb.fudbal_sezona AS s
                           INNER JOIN fudbal_sb.fudbal_tipsezone AS t
                           ON u.sezona_id=s.id AND s.tip_id=t.id
                           WHERE s.sezona=%(sezona)s AND t.tip=%(tip)s
                           AND u.domacin_id IN
                           (SELECT tim_id FROM fudbal_sb.fudbal_timsezona AS tim
                            INNER JOIN fudbal_sb.fudbal_sezona AS s
                            INNER JOIN fudbal_sb.fudbal_tipsezone AS tip
                            ON tim.sezona_id=s.id AND tip.id=s.tip_id
                            WHERE s.sezona=%(sezona)s AND tim.aktivan=1 AND tip.tip=%(tip)s)
                           and u.gost_id in
                           (SELECT tim_id FROM fudbal_sb.fudbal_timsezona AS tim
                            INNER JOIN fudbal_sb.fudbal_sezona AS s
                            INNER JOIN fudbal_sb.fudbal_tipsezone AS tip
                            ON tim.sezona_id=s.id AND tip.id=s.tip_id
                            WHERE s.sezona=%(sezona)s AND tim.aktivan=1 AND tip.tip=%(tip)s);''', {'sezona': sezona_obj.sezona, 'tip': sezona_obj.tip})
            utakmice_podaci = cursor.fetchall()

            utakmice = []
            for utakmica_podaci in utakmice_podaci:
                utakmice.append(Utakmica(utakmica_podaci))

        return utakmice

    @staticmethod
    def kaznjeni_timovi(sezona_obj):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT tim_id, sum(kazneni_bodovi)FROM fudbal_sb.fudbal_kazne AS k
                            INNER JOIN fudbal_sb.fudbal_timsezona AS ts
                            INNER JOIN fudbal_sb.fudbal_sezona AS s
                            INNER JOIN fudbal_sb.fudbal_tipsezone AS tip
                            ON k.tim_u_sezoni_id=ts.id AND ts.sezona_id=s.id AND s.tip_id=tip.id
                            WHERE sezona=%(sezona)s AND tip=%(tip)s
                            GROUP BY tim_id''', {'sezona': sezona_obj.sezona, 'tip': sezona_obj.tip})
            kazne_podaci = cursor.fetchall()

            kazne = []
            for kazna_podaci in kazne_podaci:
                kazne.append(Kazna(kazna_podaci))

        return kazne
