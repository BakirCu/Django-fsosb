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


def liga(request):
    tabela_utakmica = Liga.tabela_timova()
    tabela_utakmica.sort(key=lambda x: x.bodovi, reverse=True)
    return render(request, 'fudbal/liga.html', {'timovi': tabela_utakmica})


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
