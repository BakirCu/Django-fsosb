from django.db import models
from django.utils import timezone
from PIL import Image
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _


class Vesti(models.Model):
    naslov = models.CharField(max_length=100)
    sadrzaj = models.TextField()
    vreme_posta = models.DateTimeField(default=timezone.now)
    slika = models.ImageField(default='default.jpg', upload_to='vesti_img')
    video = models.CharField(max_length=300, blank=True, null=True)

    def __str__(self):
        return f"{self.naslov}"

    def clean(self):
        if self.slika.size > 2e+7:
            raise ValidationError(
                _('Slika  ne moze biti veca od 20 MB'))

    def save(self):
        super().save()
        img = Image.open(self.slika.path)
        if img.height > 533 or img.width > 800:
            img.thumbnail((533, 800))
            img.save(self.slika.path)

    class Meta:
        verbose_name_plural = 'Vesti'
        ordering = ['-vreme_posta']


class Slika(models.Model):
    naslov = models.CharField(max_length=100)
    vreme_posta = models.DateTimeField(default=timezone.now)
    slika = models.ImageField(default='default.jpg', upload_to='galerija_img')

    def __str__(self):
        return f"{self.naslov}"

    class Meta:
        verbose_name_plural = 'Slika'
        ordering = ['-vreme_posta']
