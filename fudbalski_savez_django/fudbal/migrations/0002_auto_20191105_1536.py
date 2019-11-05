# Generated by Django 2.2.6 on 2019-11-05 14:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('fudbal', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='timsezona',
            name='tim',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='fudbal.Tim'),
        ),
        migrations.AlterField(
            model_name='utakmica',
            name='domacin',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='domacin', to='fudbal.Tim'),
        ),
        migrations.AlterField(
            model_name='utakmica',
            name='gost',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='gost', to='fudbal.Tim'),
        ),
    ]