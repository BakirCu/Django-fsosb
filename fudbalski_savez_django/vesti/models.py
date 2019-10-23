from django.db import models
from django.utils import timezone


class Vesti(models.Model):
    naslov = models.CharField(max_length=100)
    sadrzaj = models.TextField()
    vreme_posta = models.DateTimeField(default=timezone.now)
    slika = models.ImageField(default='default.jpg', upload_to='vesti_img')

    def __str__(self):
        return f"{self.naslov}"

    class Meta:
        verbose_name_plural = 'Vesti'
        ordering = ['-vreme_posta']
