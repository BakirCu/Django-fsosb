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
    # ovde uzimam sva kola i izdvajam broj kola i cuvam ih u listi 'brojevi_kola'
    sva_kola = Utakmica.objects.filter(
        sezona='2019/2020').values('kolo').distinct().order_by('-kolo')
    print(sva_kola)
    brojevi_kola = []
    for kolo in sva_kola:
        utacmice_kola = {}
        broj_key = kolo.get('kolo')
        utakmice_izabranog_kola_value = Utakmica.objects.all().filter(kolo=int(broj_key))
        utacmice_kola[broj_key] = utakmice_izabranog_kola_value
        brojevi_kola.append(utacmice_kola)

    print(brojevi_kola)
    tabela_utakmica = Liga.tabela_timova()

    return render(request, 'fudbal/liga.html', {'timovi': tabela_utakmica,
                                                'broj_kola': brojevi_kola,
                                                })


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
