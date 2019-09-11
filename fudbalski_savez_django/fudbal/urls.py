from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="pocetna_strana"),
]
