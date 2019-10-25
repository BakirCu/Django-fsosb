from django.db import models


class Vesti(models.Model):
    naslov = models.CharField(max_length=100)
    sadrzaj = models.TextField()
    vreme_posta = models.DateTimeField(auto_now_add=True)
    slika = models.ImageField(default='default.jpg', upload_to='vesti_img')

    def __str__(self):
        return f"{self.naslov}"

    class Meta:
        verbose_name_plural = 'Vesti'
        ordering = ['-vreme_posta']


class Galerija(models.Model):
    naslov = models.CharField(max_length=100)
    vreme_posta = models.DateTimeField(auto_now_add=True)
    slika = models.ImageField(default='default.jpg', upload_to='galerija_img')

    def __str__(self):
        return f"{self.naslov}"

    class Meta:
        verbose_name_plural = 'Galerija'
        ordering = ['-vreme_posta']
