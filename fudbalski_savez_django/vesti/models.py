from django.db import models
from django.utils import timezone


class Vesti(models.Model):
    naslov = models.CharField(max_length=100)
    sadrzaj = models.TextField()
    vreme_posta = models.DateTimeField(default=timezone.now)
    slika = models.ImageField(default='default.jpg', upload_to='vesti_img')
    video = models.CharField(max_length=100, blank=True, null=True)

    def __str__(self):
        return f"{self.naslov}"

    def save(self, *args, **kwargs):
        self.video = 'https://www.youtube.com/embed/' + str(self.video[-11:])
        return super(Vesti, self).save(*args, **kwargs)

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
