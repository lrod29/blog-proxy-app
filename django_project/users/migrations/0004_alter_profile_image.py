# Generated by Django 4.1.7 on 2023-04-01 04:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0003_alter_profile_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='image',
            field=models.ImageField(default='profile_pics/foto.jpeg', upload_to='profile_pics'),
        ),
    ]