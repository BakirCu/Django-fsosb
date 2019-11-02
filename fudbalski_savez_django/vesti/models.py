from django.db import models
from django.utils import timezone
from .video_id import embed_video
from PIL import Image
from io import BytesIO
from django.core.files.uploadedfile import InMemoryUploadedFile
import sys


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

        # resajzovanje slike
        height_def = 1920
        width_def = 1080
        output = BytesIO()
        img_temp = Image.open(self.slika)
        if img_temp.height > height_def or img_temp.width > height_def:
            skale_factor_1 = img_temp.height / height_def
            skale_factor_2 = img_temp.width / width_def
            if skale_factor_1 > skale_factor_2:
                new_height = img_temp.height / skale_factor_1
                new_width = img_temp.width / skale_factor_1
            else:
                new_height = img_temp.height / skale_factor_2
                new_width = img_temp.width / skale_factor_2
            img_temp_rez = img_temp.resize((int(new_width), int(new_height)))
            img_temp_rez.save(output, format="JPEG", quality=85)
            output.seek(0)
            self.slika = InMemoryUploadedFile(output, 'ImageField', "%s.jpg" % self.slika.name.split(
                '.')[0], 'image/jpeg', sys.getsizeof(output), None)
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
