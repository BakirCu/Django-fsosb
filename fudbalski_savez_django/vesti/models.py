from django.db import models
from django.utils import timezone
from .video_id import embed_video, resize_image


class Vesti(models.Model):
    naslov = models.CharField(max_length=100)
    sadrzaj = models.TextField()
    vreme_posta = models.DateTimeField(default=timezone.now)
    slika = models.ImageField(default='default.jpg', upload_to='vesti_img')
    video = models.CharField(max_length=100, blank=True, null=True)

    def __str__(self):
        return f"{self.naslov}"

    def save(self, *args, **kwargs):
        if self.video:
            self.video = embed_video(str(self.video))
        self.slika = resize_image(self.slika, 1080, 1920)
        return super(Vesti, self).save(*args, **kwargs)

    def clean(self):
        if self.video:
            embed_video(str(self.video))

    class Meta:
        verbose_name_plural = 'Vesti'
        ordering = ['-vreme_posta']


class Slika(models.Model):
    naslov = models.CharField(max_length=100)
    vreme_posta = models.DateTimeField(default=timezone.now)
    slika = models.ImageField(default='default.jpg', upload_to='galerija_img')

    class Meta:
        verbose_name_plural = 'Slika'
        ordering = ['-vreme_posta']
