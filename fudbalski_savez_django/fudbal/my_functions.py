from .liga_rezultati import Utakmica


def dohvati_kola(last_season, objects):
    kola_list = []
    for kolo in objects:
        broj_kola = kolo.get('kolo')
        utakmice_izabranog_kola = Utakmica.objects.all().filter(
            kolo=int(broj_kola), sezona=last_season).order_by('-vreme_odigravanja')
        kola_list.append(utakmice_izabranog_kola)
    return kola_list
