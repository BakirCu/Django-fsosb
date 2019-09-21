from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="pocetna_strana"),
    path('savez/', views.savez, name="o_savezu"),
    path('rukovodstvo/', views.rukovodstvo, name="rukovodstvo"),
    path('propisi/', views.propisi, name='propisi'),
    path('liga/', views.liga, name="liga"),
    path('kup/', views.kup, name='kup'),
    path('deligiranje/', views.deligiranje_sudija, name='deligiranje_sudija'),
    path('lista/', views.lista_sudija, name='lista_sudija'),
    path('vesti/', views.vesti, name='vesti'),
    path('gallery/', views.gallery, name="gallery"),

]
