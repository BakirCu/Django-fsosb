from django.db import models


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
    kolo = models.PositiveSmallIntegerField()

    domacin = models.ForeignKey(
        Tim, on_delete=models.CASCADE, related_name='domacin')

    domacin_gol = models.PositiveSmallIntegerField(default=0)

    gost = models.ForeignKey(
        Tim, on_delete=models.CASCADE, related_name='gost')

    gost_gol = models.PositiveSmallIntegerField(default=0)

    sezona = models.CharField(max_length=10)

    prvi_sudija = models.ForeignKey(
        Sudija, on_delete=models.CASCADE, related_name='prvi_sudija')

    drugi_sudija = models.ForeignKey(
        Sudija, on_delete=models.CASCADE, related_name='drug_sudija')

    def __str__(self):
        return '{}.kolo {} :{}--{}: {} "sezona {}"'.format(self.kolo, self.domacin, self.domacin_gol, self.gost_gol, self.gost, self.sezona)

    class Meta:
        verbose_name_plural = "Utakmice"
