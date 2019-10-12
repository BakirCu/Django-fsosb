from django.shortcuts import render
from .liga_rezultati import Liga, Sezona, Utakmica
from .my_functions import dohvati_kola


def home(request):
    return render(request, 'fudbal/home.html')


def savez(request):
    return render(request, 'fudbal/o_savezu.html')


def rukovodstvo(request):
    return render(request, 'fudbal/rukovodstvo.html')


def propisi(request):
    return render(request, 'fudbal/propisi.html')


def liga_rezultati(request):
    poslednja_sezona = Sezona.poslednja_sezona()
    kola_poslednje_sezone = Utakmica.objects.filter(
        sezona=poslednja_sezona).values('kolo').distinct().order_by('-kolo')
    utakmice_po_kolima = dohvati_kola(poslednja_sezona, kola_poslednje_sezone)
    trenutna_sezona = '{}/{}'.format(poslednja_sezona,
                                     poslednja_sezona + 1)
    return render(request, 'fudbal/liga_rezultati.html', {'utakmice_po_kolima': utakmice_po_kolima,
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
    poslednja_sezona = Sezona.poslednja_sezona()
    kola_poslednje_sezone = Utakmica.objects.filter(
        sezona=poslednja_sezona).values('kolo').distinct().order_by('-kolo')
    kola = []
    for kolo in kola_poslednje_sezone:
        kola.append(kolo.get('kolo'))
    if request.GET:
        izabrano_kolo = request.GET.get('dropdown')
    else:
        izabrano_kolo = kola[0]
    utakmice = Utakmica.objects.all().filter(
        kolo=int(izabrano_kolo), sezona=poslednja_sezona)
    return render(request, 'fudbal/deligiranje_sudija.html', {'utakmice': utakmice,
                                                              'broj_kola': izabrano_kolo,
                                                              'kola': kola})


def lista_sudija(request):
    return render(request, 'fudbal/lista_sudija.html')


def vesti(request):
    return render(request, 'fudbal/vesti.html')


def gallery(request):
    return render(request, 'fudbal/gallery.html')
