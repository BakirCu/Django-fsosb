from django.db import models
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _
from .my_validators import check_first_upper
from vesti.video_id import resize_image


class Delegat(models.Model):
    ime = models.CharField(max_length=20)
    prezime = models.CharField(max_length=20)
    datum_rodjenja = models.DateField(auto_now=False, null=True, blank=True)
    zvanje = models.CharField(max_length=200, null=True)
    slika = models.ImageField(default='sudija.jpg', upload_to='delegat_img')

    def __str__(self):
        return '{} {}'.format(self.ime, self.prezime)

    def save(self, *args, **kwargs):
        self.slika = resize_image(self.slika, 300, 300)
        return super(Delegat, self).save(*args, **kwargs)

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
        self.slika = resize_image(self.slika, 300, 300)
        return super(Sudija, self).save(*args, **kwargs)

    def clean(self):
        check_first_upper(self.ime)
        check_first_upper(self.prezime)

    class Meta:
        verbose_name_plural = "Sudije"


class TipSezone(models.Model):
    tip = models.CharField(max_length=5)

    def __str__(self):
        return f"{self.tip}"


class Sezona(models.Model):
    sezona = models.PositiveSmallIntegerField(blank=False)
    tip = models.ForeignKey(TipSezone, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.sezona}:{self.tip}"

    class Meta:
        unique_together = ['sezona', 'tip']
        verbose_name_plural = "Sezone"


class Tim(models.Model):
    ime = models.CharField(max_length=30)

    def __str__(self):
        return self.ime

    def clean(self):
        check_first_upper(self.ime)

    class Meta:
        verbose_name_plural = "Timovi"


class TimSezona(models.Model):
    tim = models.ForeignKey(Tim, on_delete=models.CASCADE)
    sezona = models.ForeignKey(Sezona, on_delete=models.CASCADE)
    aktivan = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.sezona}:{self.tim}:{self.aktivan}"

    class Meta:
        unique_together = ['sezona', 'tim']
        verbose_name_plural = "Timovi u sezoni"


class Kazne(models.Model):
    tim_u_sezoni = models.ForeignKey(TimSezona, on_delete=models.CASCADE)
    kazneni_bodovi = models.PositiveSmallIntegerField()
    razlog = models.TextField()
    datum = models.DateField()

    class Meta:
        verbose_name_plural = "Kazneni bodovi"


class Utakmica(models.Model):
    sezona = models.ForeignKey(Sezona, on_delete=models.CASCADE)
    kolo = models.PositiveSmallIntegerField()
    domacin = models.ForeignKey(
        Tim, on_delete=models.CASCADE, related_name='domacin')
    domacin_gol = models.PositiveSmallIntegerField(null=True, blank=True)
    gost = models.ForeignKey(
        Tim, on_delete=models.CASCADE, related_name='gost')
    gost_gol = models.PositiveSmallIntegerField(null=True, blank=True)
    mesto_odigravanja = models.CharField(max_length=100)
    glavni_sudija = models.ForeignKey(
        Sudija, on_delete=models.DO_NOTHING, related_name='glavni_sudija')
    prvi_pomocnik = models.ForeignKey(
        Sudija, on_delete=models.DO_NOTHING, related_name='prvi_pomocnik')
    drugi_pomocnik = models.ForeignKey(
        Sudija, on_delete=models.DO_NOTHING, related_name='drug_pomocnik')
    delegat = models.ForeignKey(
        Delegat, on_delete=models.DO_NOTHING, related_name='delegat')
    datum_zakazano = models.DateTimeField(
        auto_now=False, null=True, blank=True)
    datum_odigrano = models.DateTimeField(
        auto_now=False, null=True, blank=True)

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


class TimoviSokobanja(models.Model):
    ime = models.CharField(max_length=30)
    ucesce = models.CharField(max_length=100)
    logo = models.ImageField(upload_to='logo_img')

    def __str__(self):
        return self.ime

    def save(self, *args, **kwargs):
        self.logo = resize_image(self.logo, 300, 300)
        return super(TimoviSokobanja, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = "TimoviSokobanje"
