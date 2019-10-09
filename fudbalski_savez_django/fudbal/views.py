from django.shortcuts import render
from .liga_rezultati import Liga, Sezona, Utakmica
from .my_functions import create_list_of_dicts


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
    kola_list = create_list_of_dicts(poslednja_sezona_int, sva_kola_sezone)
    trenutna_sezona = '{}/{}'.format(poslednja_sezona_int,
                                     poslednja_sezona_int + 1)
    return render(request, 'fudbal/liga_rezultati.html', {'kola': kola_list,
                                                          'sezona': trenutna_sezona, })


def liga_tabela(request):
    broj_sezone = Sezona.poslednja_sezona()
    tabela_utakmica = Liga.tabela_timova(broj_sezone)
    return render(request, 'fudbal/liga_tabela.html', {'timovi': tabela_utakmica, })


def kup_rezultati(request):
    return render(request, 'fudbal/kup_rezultati.html')


def kup_tabela(request):
    return render(request, 'fudbal/kup_tabela.html')


def deligiranje_sudija(request):
    if request.GET:
        broj_kola_str = request.GET.get('dropdown')
        kola = Utakmica.objects.all().filter(kolo=int(broj_kola_str))
    else:
        kola = Utakmica.objects.all().filter(kolo=2)
        broj_kola_str = '2'

    return render(request, 'fudbal/deligiranje_sudija.html', {'kola': kola,
                                                              'broj_kola': broj_kola_str})


def lista_sudija(request):
    return render(request, 'fudbal/lista_sudija.html')


def vesti(request):
    return render(request, 'fudbal/vesti.html')


def gallery(request):
    return render(request, 'fudbal/gallery.html')
