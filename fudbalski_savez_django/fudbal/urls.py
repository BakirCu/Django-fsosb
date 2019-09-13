from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="pocetna_strana"),
    path('gallery/', views.gallery, name="gallery"),
    path('savez/', views.savez, name="o_savezu"),

]
