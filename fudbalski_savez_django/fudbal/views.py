from django.shortcuts import render


def home(request):
    return render(request, 'fudbal/home.html')


def gallery(request):
    return render(request, 'fudbal/gallery.html')


def savez(request):
    return render(request, 'fudbal/o_savezu.html')
