# Generated by Django 2.1.7 on 2019-09-25 15:26

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Sudija',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ime_sudije', models.CharField(max_length=20)),
                ('prezime_sudije', models.CharField(max_length=20)),
            ],
            options={
                'verbose_name_plural': 'Sudije',
            },
        ),
        migrations.CreateModel(
            name='Tim',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ime_tima', models.CharField(max_length=30)),
            ],
            options={
                'verbose_name_plural': 'Timovi',
            },
        ),
        migrations.CreateModel(
            name='Utakmica',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('kolo', models.PositiveSmallIntegerField()),
                ('domacin_gol', models.PositiveSmallIntegerField(default=0)),
                ('gost_gol', models.PositiveSmallIntegerField(default=0)),
                ('sezona', models.CharField(default='2019/2020', max_length=10)),
                ('domacin', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='domacin', to='fudbal.Tim')),
                ('drugi_sudija', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='drug_sudija', to='fudbal.Sudija')),
                ('gost', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='gost', to='fudbal.Tim')),
                ('prvi_sudija', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='prvi_sudija', to='fudbal.Sudija')),
            ],
            options={
                'verbose_name_plural': 'Utakmice',
            },
        ),
    ]