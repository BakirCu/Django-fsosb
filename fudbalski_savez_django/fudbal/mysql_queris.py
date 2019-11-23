from django.db import connection


class Query:

    def utakmice_aktivnih_timova(sezona_obj):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT domacin_gol, gost_gol, domacin_id, gost_id FROM fudbal_sb.fudbal_utakmica as u
                           inner join fudbal_sb.fudbal_sezona as s
                           inner join fudbal_sb.fudbal_tipsezone as t
                           on u.sezona_id=s.id and s.tip_id=t.id
                           where s.sezona=%(sezona)s and t.tip=%(tip)s
                           and u.domacin_id in
                           (SELECT tim_id FROM fudbal_sb.fudbal_timsezona as tim
                            inner join fudbal_sb.fudbal_sezona as s
                            inner join fudbal_sb.fudbal_tipsezone as tip
                            on tim.sezona_id=s.id and tip.id=s.tip_id
                            where s.sezona=%(sezona)s and tim.aktivan=1 and tip.tip=%(tip)s)
                           and u.gost_id in
                           (SELECT tim_id FROM fudbal_sb.fudbal_timsezona as tim
                            inner join fudbal_sb.fudbal_sezona as s
                            inner join fudbal_sb.fudbal_tipsezone as tip
                            on tim.sezona_id=s.id and tip.id=s.tip_id
                            where s.sezona=%(sezona)s and tim.aktivan=1 and tip.tip=%(tip)s);''', {'sezona': sezona_obj.sezona, 'tip': sezona_obj.tip})
            utakmice = cursor.fetchall()
        return utakmice

    @staticmethod
    def kaznjeni_timovi(sezona_obj):
        with connection.cursor() as cursor:
            cursor.execute('''SELECT ime, sum(kazneni_bodovi)FROM fudbal_sb.fudbal_kazne as k
                            inner join fudbal_sb.fudbal_timsezona as ts
                            inner join fudbal_sb.fudbal_tim as tim
                            inner join fudbal_sb.fudbal_sezona as s
                            inner join fudbal_sb.fudbal_tipsezone as tip
                            on k.tim_u_sezoni_id=ts.id and ts.tim_id=tim.id and ts.sezona_id=s.id and s.tip_id=tip.id
                            where sezona=%(sezona)s and tip=%(tip)s
                            group by ime''', {'sezona': sezona_obj.sezona, 'tip': sezona_obj.tip})
            timovi = cursor.fetchall()
        return timovi
