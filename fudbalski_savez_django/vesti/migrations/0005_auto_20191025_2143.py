# Generated by Django 2.2.6 on 2019-10-25 19:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vesti', '0004_vesti_video'),
    ]

    operations = [
        migrations.AlterField(
            model_name='vesti',
            name='video',
            field=models.FileField(null=True, upload_to='vesti_video'),
        ),
    ]