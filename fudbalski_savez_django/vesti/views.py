from django.views.generic import ListView, DetailView
from .models import Vesti, Slika


class VestiListView(ListView):
    model = Vesti
    context_object_name = "vesti"
    paginate_by = 3


class VestDetailView(DetailView):
    model = Vesti


class GalleryListView(ListView):
    model = Slika
    context_object_name = "slike"
    paginate_by = 12
