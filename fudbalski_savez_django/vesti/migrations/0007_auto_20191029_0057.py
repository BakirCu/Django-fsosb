# Generated by Django 2.2.6 on 2019-10-28 23:57

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('vesti', '0006_auto_20191028_1515'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='slika',
            options={'verbose_name_plural': 'Slika'},
        ),
        migrations.AlterModelOptions(
            name='vesti',
            options={'verbose_name_plural': 'Vesti'},
        ),
    ]
