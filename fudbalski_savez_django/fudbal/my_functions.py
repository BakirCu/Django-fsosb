from .liga_rezultati import Utakmica


def create_list_of_dicts(last_season_int, objects_list):
    kola_list = []
    for kolo in objects_list:
        utakmice_kola_dict = {}
        broj_kola_str = kolo.get('kolo')
        utakmice_izabranog_kola = Utakmica.objects.all().filter(
            kolo=int(broj_kola_str), sezona=last_season_int)
        utakmice_kola_dict[broj_kola_str] = utakmice_izabranog_kola
        kola_list.append(utakmice_kola_dict)
    return kola_list
