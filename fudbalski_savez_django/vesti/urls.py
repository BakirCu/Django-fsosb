from django.urls import path
from .views import VestiListView, VestDetailView, GalleryTemplateView


urlpatterns = [
    path('vesti/', VestiListView.as_view(), name='vesti'),
    path('vest/<int:pk>/', VestDetailView.as_view(), name="vest"),
    path('gallery/', GalleryTemplateView.as_view(), name="gallery"),
]
