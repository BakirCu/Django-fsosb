from django.shortcuts import render
from .models import Utakmica
from .tabela_lige import Liga


def home(request):
    return render(request, 'fudbal/home.html')


def savez(request):
    return render(request, 'fudbal/o_savezu.html')


def rukovodstvo(request):
    return render(request, 'fudbal/rukovodstvo.html')


def propisi(request):
    return render(request, 'fudbal/propisi.html')


def liga_rezultati(request):
    poslednje_kolo = Utakmica.objects.values(
        'sezona').distinct().order_by('-sezona')[0]
    broj_sezone = poslednje_kolo.get('sezona')
    sva_kola_sezone = Utakmica.objects.filter(
        sezona=broj_sezone).values('kolo').distinct().order_by('-kolo')
    broj_utacmice_kola = []
    for kolo in sva_kola_sezone:
        utacmice_kola = {}
        broj_key = kolo.get('kolo')
        utakmice_izabranog_kola_value = Utakmica.objects.all().filter(
            kolo=int(broj_key), sezona=broj_sezone)
        utacmice_kola[broj_key] = utakmice_izabranog_kola_value
        broj_utacmice_kola.append(utacmice_kola)

    return render(request, 'fudbal/liga_rezultati.html', {'broj_utacmice_kola': broj_utacmice_kola, })


def liga_tabela(request):
    tabela_utakmica = Liga.tabela_timova()
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
