from django.views.generic import ListView, DetailView
from .models import Vest, Slika, Video


class VestiListView(ListView):
    context_object_name = "vesti"
    paginate_by = 3
    queryset = Vest.objects.all()

    def get_context_data(self, **kwargs):
        context = super(VestiListView, self).get_context_data(**kwargs)
        context['slike'] = Slika.objects.all()

        return context


class VestDetailView(DetailView):
    queryset = Vest.objects.all()

    def get_context_data(self, **kwargs):
        context = super(VestDetailView, self).get_context_data(**kwargs)
        context['videi'] = Video.objects.all()
        context['slike'] = Slika.objects.all()

        return context


class GalleryListView(ListView):
    model = Slika
    context_object_name = "slike"
    paginate_by = 12
