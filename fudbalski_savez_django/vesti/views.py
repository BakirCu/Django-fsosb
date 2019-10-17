from django.shortcuts import render


def vesti(request):
    return render(request, "vesti/vesti.html")


def gallery(request):
    return render(request, "vesti/gallery.html")
