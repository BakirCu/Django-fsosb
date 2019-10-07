from django.shortcuts import render
from .liga_rezultati import Liga, Sezona, Utakmica


def home(request):
    return render(request, 'fudbal/home.html')


def savez(request):
    return render(request, 'fudbal/o_savezu.html')


def rukovodstvo(request):
    return render(request, 'fudbal/rukovodstvo.html')


def propisi(request):
    return render(request, 'fudbal/propisi.html')


def liga_rezultati(request):
    poslednja_sezona_int = Sezona.poslednja_sezona()
    sva_kola_sezone = Utakmica.objects.filter(
        sezona=poslednja_sezona_int).values('kolo').distinct().order_by('-kolo')
    kola_list = []
    for kolo in sva_kola_sezone:
        utacmice_kola_dct = {}
        broj_kola_str = kolo.get('kolo')
        utakmice_izabranog_kola = Utakmica.objects.all().filter(
            kolo=int(broj_kola_str), sezona=poslednja_sezona_int)
        utacmice_kola_dct[broj_kola_str] = utakmice_izabranog_kola
        kola_list.append(utacmice_kola_dct)
    return render(request, 'fudbal/liga_rezultati.html', {'kola': kola_list, })


def liga_tabela(request):
    broj_sezone = Sezona.poslednja_sezona()
    tabela_utakmica = Liga.tabela_timova(broj_sezone)
    return render(request, 'fudbal/liga_tabela.html', {'timovi': tabela_utakmica, })


def kup(request):
    return render(request, 'fudbal/kup.html')


def deligiranje_sudija(request):
    if request.GET:
        broj_kola_str = request.GET.get('dropdown')
        utakmice_izabranog_kola = Utakmica.objects.all().filter(kolo=int(broj_kola_str))
    else:
        utakmice_izabranog_kola = Utakmica.objects.all().filter(kolo=2)
        broj_kola_str = '2'

    return render(request, 'fudbal/deligiranje_sudija.html', {'kola': utakmice_izabranog_kola,
                                                              'broj_kola': broj_kola_str})


def lista_sudija(request):

    return render(request, 'fudbal/lista_sudija.html')


def vesti(request):

    return render(request, 'fudbal/vesti.html')


def gallery(request):
    return render(request, 'fudbal/gallery.html')
