from django.shortcuts import render
from .liga_rezultati import Liga
from .my_functions import dohvati_kola
from vesti.models import Vest, Slika
from .models import Sudija, Sezona
from django.db.models import Q


def home(request):
    vesti = Vest.objects.all()[:3]
    slika = Slika.objects.first()
    return render(request, "fudbal/home.html", {"vesti": vesti,
                                                "slika": slika})


def savez(request):
    return render(request, "fudbal/o_savezu.html")


def rukovodstvo(request):
    return render(request, "fudbal/rukovodstvo.html")


def propisi(request):
    return render(request, "fudbal/propisi.html")


def liga_rezultati(request):
    poslednja_sezona_obj = Sezona.objects.all().order_by('-sezona').first()
    poslednja_sezona = poslednja_sezona_obj.sezona
    utakmice_po_kolima = dohvati_kola(poslednja_sezona, 'LIGA')
    trenutna_sezona = "{}/{}".format(poslednja_sezona_obj.sezona,
                                     poslednja_sezona_obj.sezona + 1)
    return render(
        request,
        "fudbal/liga_rezultati.html",
        {"utakmice_po_kolima": utakmice_po_kolima, "sezona": trenutna_sezona},
    )


def liga_tabela(request):
    poslednja_sezona = Sezona.objects.all().order_by('-sezona').first().sezona
    poslednja_sezona_obj = Sezona.objects.get(
        Q(sezona=poslednja_sezona) & Q(tip_id__tip="LIGA"))

    tabela_utakmica = Liga.tabela_timova(poslednja_sezona_obj.id)
    return render(request, "fudbal/liga_tabela.html", {"timovi": tabela_utakmica})


def kup_rezultati(request):
    return render(request, "fudbal/kup_rezultati.html")


def kup_tabela(request):
    return render(request, "fudbal/kup_tabela.html")


def delegiranje_sudija(request):
    poslednja_sezona = Sezona.poslednja_sezona()
    utakmice_po_kolima = dohvati_kola(poslednja_sezona)
    trenutna_sezona = "{}/{}".format(poslednja_sezona, poslednja_sezona + 1)
    return render(
        request,
        "fudbal/delegiranje_sudija.html",
        {"utakmice_po_kolima": utakmice_po_kolima, "sezona": trenutna_sezona},
    )


def lista_sudija(request):
    sudije = Sudija.objects.all()
    return render(request, "fudbal/lista_sudija.html", {"sudije": sudije})


def vesti(request):
    return render(request, "fudbal/vesti.html")


def gallery(request):
    return render(request, "fudbal/gallery.html")
