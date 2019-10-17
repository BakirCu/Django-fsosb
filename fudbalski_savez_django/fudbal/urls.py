from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="pocetna_strana"),
    path('savez/', views.savez, name="o_savezu"),
    path('rukovodstvo/', views.rukovodstvo, name="rukovodstvo"),
    path('propisi/', views.propisi, name='propisi'),
    path('liga-rezultati/', views.liga_rezultati, name="liga_rezultati"),
    path('liga-tabela/', views.liga_tabela, name="liga_tabela"),
    path('kup-rezultati/', views.kup_rezultati, name='kup_rezultati'),
    path('kup-tabela/', views.kup_tabela, name='kup_tabela'),
    path('delegiranje/', views.delegiranje_sudija, name='delegiranje_sudija'),
    path('lista/', views.lista_sudija, name='lista_sudija'),

]
