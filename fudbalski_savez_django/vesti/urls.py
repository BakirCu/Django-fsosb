from django.urls import path
from .views import VestiListView, VestDetailView, GalleryListView


urlpatterns = [
    path('vesti/', VestiListView.as_view(), name='vesti'),
    path('vest/<int:pk>/', VestDetailView.as_view(), name="vest"),
    path('gallery/', GalleryListView.as_view(), name="slike"),
]
