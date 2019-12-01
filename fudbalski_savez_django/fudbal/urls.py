from django.urls import path
from . import views
from .views import VestiListView, VestDetailView, GalleryListView
urlpatterns = [
    path('', views.home, name="pocetna_strana"),
    path('savez/', views.savez, name="o_savezu"),
    path('rukovodstvo/', views.rukovodstvo, name="rukovodstvo"),
    path('odbori/', views.odbori, name="odbori"),
    path('propisi/', views.propisi, name='propisi'),
    path('liga-rezultati/', views.liga_rezultati, name="liga_rezultati"),
    path('liga-tabela/', views.liga_tabela, name="liga_tabela"),
    path('kup-rezultati/', views.kup_rezultati, name='kup_rezultati'),
    path('kup-tabela/', views.kup_tabela, name='kup_tabela'),
    path('delegiranje/', views.delegiranje_sudija, name='delegiranje_sudija'),
    path('sudije/', views.lista_sudija, name='lista_sudija'),
    path('delegati/', views.lista_delagata, name='lista_delegata'),
    path('timovi/', views.timovi_sokobanje, name='timovi_sokobanje'),
    path('obavestenja/', views.obavestenja, name='obavestenja'),
    path('vesti/', VestiListView.as_view(), name='vesti'),
    path('vest/<int:pk>/', VestDetailView.as_view(), name="vest"),
    path('gallery/', GalleryListView.as_view(), name="slike"),
]
