from django.db import models
from django.utils import timezone
from PIL import Image


class Vesti(models.Model):
    naslov = models.CharField(max_length=100)
    sadrzaj = models.TextField()
    vreme_posta = models.DateTimeField(default=timezone.now)
    slika = models.ImageField(default='default.jpg', upload_to='vesti_img')

    def __str__(self):

        return f"{self.naslov}"

    def save(self):
        super().save()
        img = Image.open(self.slika.path)
        if img.height > 400 or img.width > 300:
            output_size = (400, 300)
            img.thumbnail(output_size)
            img.save(self.slika.path)
