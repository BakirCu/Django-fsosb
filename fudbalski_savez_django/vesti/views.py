from django.shortcuts import render
from .models import Vesti


def vesti(request):
    vesti = Vesti.objects.all()
    return render(request, "vesti/vesti.html",  {'vesti': vesti})


def gallery(request):

    return render(request, "vesti/gallery.html")
