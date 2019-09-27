from django.shortcuts import render
from .models import Utakmica
from .mysql_queris import Query
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
    tabela_utakmica = []
    imena_timova = Query.imena_timova()

    for tim in imena_timova:
        ime_tima = tim[0]
        dati_golovi = Query.dati_golovi(ime_tima)
        primljeni_golovi = Query.primljeni_golovi(ime_tima)
        utakmica = Query.odigrane_utakmice(ime_tima)
        pobeda = Query.pobede(ime_tima)
        poraz = Query.porazi(ime_tima)
        nereseno = Query.nereseno(ime_tima)
        gol_razlika = dati_golovi - primljeni_golovi
        broj_bodova = pobeda*3 + nereseno
        tabela_utakmica.append(Liga(ime_tima, utakmica, pobeda, nereseno, poraz,
                                    dati_golovi, primljeni_golovi, gol_razlika, broj_bodova))
        print('''{}: broj datih golova: {},
            broj primljenih golova: {}
            broj odigranih utacmica: {},
            broj pobeda: {}, broj poraza: {},broj neresenih {},
            gol razlika {}, broj bodova {}'''.format(ime_tima,
                                                     dati_golovi,
                                                     primljeni_golovi,
                                                     utakmica,
                                                     pobeda,
                                                     poraz,
                                                     nereseno,
                                                     gol_razlika,
                                                     broj_bodova))
    print(tabela_utakmica)

    return render(request, 'fudbal/liga.html')


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
