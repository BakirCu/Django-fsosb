from django.db import models
from django.utils import timezone
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _
from .my_validators import check_first_upper
from PIL import Image
from io import BytesIO
from django.core.files.uploadedfile import InMemoryUploadedFile
import sys


class Delegat(models.Model):
    ime = models.CharField(max_length=20)
    prezime = models.CharField(max_length=20)
    datum_rodjenja = models.DateField(auto_now=False, null=True, blank=True)
    zvanje = models.CharField(max_length=200, null=True)
    slika = models.ImageField(default='sudija.jpg', upload_to='delegat_img')

    def __str__(self):
        return '{} {}'.format(self.ime, self.prezime)

    def clean(self):
        check_first_upper(self.ime)
        check_first_upper(self.prezime)

    class Meta:
        verbose_name_plural = "Delegati"


class Sudija(models.Model):
    ime = models.CharField(max_length=20)
    prezime = models.CharField(max_length=20)
    zvanje = models.CharField(max_length=200, null=True)
    datum_rodjenja = models.DateField(auto_now=False, null=True, blank=True)
    slika = models.ImageField(default='sudija.jpg', upload_to='delegat_img')

    def __str__(self):
        return '{} {}'.format(self.ime, self.prezime)

    def save(self, *args, **kwargs):

        height_def = 300
        width_def = 300
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
        return super(Sudija, self).save(*args, **kwargs)

    def clean(self):
        check_first_upper(self.ime)
        check_first_upper(self.prezime)

    class Meta:
        verbose_name_plural = "Sudije"


class Tim(models.Model):
    ime = models.CharField(max_length=30)

    def __str__(self):
        return self.ime

    def clean(self):
        check_first_upper(self.ime)

    class Meta:
        verbose_name_plural = "Timovi"


class Utakmica(models.Model):
    sezona = models.PositiveSmallIntegerField(blank=False, default=2019)

    kolo = models.PositiveSmallIntegerField()

    domacin = models.ForeignKey(
        Tim, on_delete=models.CASCADE, related_name='domacin')

    domacin_gol = models.PositiveSmallIntegerField(default=0)

    gost = models.ForeignKey(
        Tim, on_delete=models.CASCADE, related_name='gost')

    gost_gol = models.PositiveSmallIntegerField(default=0)

    mesto_odigravanja = models.CharField(max_length=100)

    vreme_odigravanja = models.DateTimeField(default=timezone.now)

    glavni_sudija = models.ForeignKey(
        Sudija, on_delete=models.DO_NOTHING, related_name='glavni_sudija')

    prvi_pomocnik = models.ForeignKey(
        Sudija, on_delete=models.DO_NOTHING, related_name='prvi_pomocnik')

    drugi_pomocnik = models.ForeignKey(
        Sudija, on_delete=models.DO_NOTHING, related_name='drug_pomocnik')

    delegat = models.ForeignKey(
        Delegat, on_delete=models.DO_NOTHING, related_name='delegat')

    def __str__(self):
        return '{}.kolo {} :{}--{}: {} "sezona {}"'.format(self.kolo, self.domacin, self.domacin_gol, self.gost_gol, self.gost, self.sezona)

    def clean(self):

        if self.prvi_pomocnik_id and self.drugi_pomocnik_id and self.prvi_pomocnik_id == self.drugi_pomocnik_id:
            raise ValidationError(
                _('Prvi i drugi pomocnik moraju biti razliciti'))

        if self.glavni_sudija_id and self.drugi_pomocnik_id and self.glavni_sudija_id == self.drugi_pomocnik_id:
            raise ValidationError(
                _('Glavni sudija i drugi pomocnik moraju biti razliciti'))

        if self.glavni_sudija_id and self.prvi_pomocnik_id and self.glavni_sudija_id == self.prvi_pomocnik_id:
            raise ValidationError(
                _('Glavni sudija i prvi pomocnik moraju biti razliciti'))

        if self.domacin_id and self.gost_id and self.domacin_id == self.gost_id:
            raise ValidationError(
                _('Domacin i Gost moraju biti razliciti'))

    class Meta:
        verbose_name_plural = "Utakmice"
