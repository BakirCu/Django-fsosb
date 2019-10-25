from django.db import models
from django.utils import timezone
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _
from .my_validators import check_first_upper


class Delegat(models.Model):
    ime = models.CharField(max_length=20)
    prezime = models.CharField(max_length=20)

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

    def __str__(self):
        return '{} {}'.format(self.ime, self.prezime)

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

            if self.domacin_id and self.gost_id and self.domacin_id and self.gost_id:
                raise ValidationError(
                    _('Domacin i Gost moraju biti razliciti'))

    class Meta:
        verbose_name_plural = "Utakmice"
