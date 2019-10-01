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
    sva_kola = Utakmica.objects.values('kolo').distinct()
    brojevi_kola = []
    for kolo in sva_kola:
        broj = kolo.get('kolo')
        brojevi_kola.append(broj)
    # u zavisnosti od broja koji dobijem kada neko klikne na dugme, uzmem sve utakmice iz tog kola i prikazem ih
    if request.GET:
        broj_kola_str = request.GET.get('broj')
        utakmice_izabranog_kola = Utakmica.objects.all().filter(kolo=int(broj_kola_str))
    else:
        utakmice_izabranog_kola = Utakmica.objects.all().filter(kolo=int(1))

    tabela_utakmica = Liga.tabela_timova()
    tabela_utakmica.sort(key=lambda x: x.bodovi, reverse=True)
    return render(request, 'fudbal/liga.html', {'timovi': tabela_utakmica,
                                                'broj_kola': brojevi_kola,
                                                'kola': utakmice_izabranog_kola, })


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
