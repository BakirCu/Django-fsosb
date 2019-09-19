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

    id_domacin = models.ForeignKey(
        Tim, on_delete=models.DO_NOTHING, related_name='domacin')

    golovi_domacin = models.PositiveSmallIntegerField(default=0)

    id_gost = models.ForeignKey(
        Tim, on_delete=models.DO_NOTHING, related_name='gost')

    golovi_gost = models.PositiveSmallIntegerField(default=0)

    sezona = models.CharField(max_length=10, default='2019/2020')

    prvi_sudija = models.ForeignKey(
        Sudija, on_delete=models.DO_NOTHING, related_name='prvi_sudija')

    drugi_sudija = models.ForeignKey(
        Sudija, on_delete=models.DO_NOTHING, related_name='drug_sudija')

    def __str__(self):
        return '{}.kolo {}-{}'.format(self.kolo, self.id_domacin, self.id_gost)

    class Meta:
        verbose_name_plural = "Utakmice"
