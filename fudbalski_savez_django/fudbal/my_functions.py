from .liga_rezultati import Utakmica


def dohvati_kola(poslednja_sezona):
    kola_poslednje_sezone = Utakmica.objects.filter(
        sezona=poslednja_sezona).values('kolo').distinct().order_by('-kolo')
    kola = []
    for kolo in kola_poslednje_sezone:
        broj_kola = kolo.get('kolo')
        utakmice_izabranog_kola = Utakmica.objects.all().filter(
            kolo=int(broj_kola), sezona=poslednja_sezona).order_by('-vreme_odigravanja')
        kola.append(utakmice_izabranog_kola)
    return kola
