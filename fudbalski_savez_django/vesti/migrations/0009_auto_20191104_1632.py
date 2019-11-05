# Generated by Django 2.2.6 on 2019-11-04 15:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('vesti', '0008_auto_20191104_0211'),
    ]

    operations = [
        migrations.AlterField(
            model_name='slika',
            name='vest',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='vesti.Vest'),
        ),
        migrations.AlterField(
            model_name='video',
            name='vest',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='vesti.Vest'),
        ),
    ]