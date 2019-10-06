from django.db import models
from django.utils import timezone


class Delegat(models.Model):
    ime_delegata = models.CharField(max_length=20)
    prezime_delegata = models.CharField(max_length=20)

    def __str__(self):
        return '{} {}'.format(self.ime_delegata, self.prezime_delegata)

    class Meta:
        verbose_name_plural = "Delegati"


class Sudija(models.Model):
    ime_sudije = models.CharField(max_length=20)
    prezime_sudije = models.CharField(max_length=20)

    def __str__(self):
        return '{} {}'.format(self.ime_sudije, self.prezime_sudije)

    class Meta:
        verbose_name_plural = "Sudije"


class Tim(models.Model):
    ime_tima = models.CharField(max_length=30)

    def __str__(self):
        return self.ime_tima

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
        Sudija, on_delete=models.CASCADE, related_name='glavni_sudija')

    prvi_pomocnik = models.ForeignKey(
        Sudija, on_delete=models.CASCADE, related_name='prvi_pomocnik')

    drugi_pomocnik = models.ForeignKey(
        Sudija, on_delete=models.CASCADE, related_name='drug_pomocnik')

    delegat = models.ForeignKey(
        Delegat, on_delete=models.CASCADE, related_name='delegat')

    def __str__(self):
        return '{}.kolo {} :{}--{}: {} "sezona {}"'.format(self.kolo, self.domacin, self.domacin_gol, self.gost_gol, self.gost, self.sezona)

    class Meta:
        verbose_name_plural = "Utakmice"
