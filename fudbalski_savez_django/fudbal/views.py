from django.shortcuts import render
from .liga_rezultati import Liga
from .my_functions import dohvati_kola
from vesti.models import Vest, Slika
from .models import Sudija, Delegat, Sezona, TimSezona, TimoviSokobanja, ClanOdbora, Odbor
from django.db.models import Q


def home(request):
    vesti = Vest.objects.all()[:3]
    slika = Slika.objects.first()
    return render(request, "fudbal/home.html", {"vesti": vesti,
                                                "slika": slika})


def savez(request):
    return render(request, "fudbal/o_savezu.html")


def rukovodstvo(request):
    clanovi_rukovodstava = ClanOdbora.objects.filter(
        odbor_id__naziv_odbora='Rukovodstvo')

    return render(request, "fudbal/rukovodstvo.html", {'clanovi': clanovi_rukovodstava})


def odbori(request):
    odbori = Odbor.objects.filter(~Q(naziv_odbora='Rukovodstvo'))
    clanovi_po_odborima = []
    for odbor in odbori:
        clanovi_odbora = ClanOdbora.objects.filter(
            odbor_id__naziv_odbora=odbor.naziv_odbora)
        clanovi_po_odborima.append(clanovi_odbora)
    return render(request, "fudbal/odbori.html", {'odbori': clanovi_po_odborima})


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
    izbaceni_timovi = TimSezona.objects.filter(
        sezona=poslednja_sezona_obj.id, aktivan=0).values('tim_id')
    if izbaceni_timovi:
        izbaceni_timovi_id = []
        for tim_id in izbaceni_timovi:
            izbaceni_timovi_id.append(tim_id.get('tim_id'))
        izbaceni_timovi = tuple(izbaceni_timovi_id)
        print(izbaceni_timovi)
    else:
        izbaceni_timovi = tuple([0])
    tabela_utakmica = Liga.tabela_timova(
        poslednja_sezona_obj.id, izbaceni_timovi)
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
    return render(request, "fudbal/lista_sudija_delegata.html", {"sudije": sudije})


def lista_delagata(request):
    delegati = Delegat.objects.all()
    return render(request, "fudbal/lista_sudija_delegata.html", {"sudije": delegati})


def obavestenja(request):
    return render(request, "fudbal/obavestenja.html")


def timovi_sokobanje(request):
    ucesca = TimoviSokobanja.objects.values('ucesce').distinct()
    timovi_sokobanje = []
    for ucesce in ucesca:
        liga = ucesce['ucesce']
        timovi_u_ligi = TimoviSokobanja.objects.filter(ucesce=liga)
        timovi_po_ligama = {liga: timovi_u_ligi}
        timovi_sokobanje.append(timovi_po_ligama)
    return render(request, "fudbal/timovi_sokobanje.html", {"timovi_sokobanje": timovi_sokobanje})
