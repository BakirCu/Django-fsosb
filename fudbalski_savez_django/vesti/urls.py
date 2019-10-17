from django.urls import path
from . import views

urlpatterns = [
    path('vesti/', views.vesti, name='vesti'),
    path('gallery/', views.gallery, name="gallery"),

]
