# Generated by Django 4.1.7 on 2023-04-01 04:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0006_alter_profile_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='image',
            field=models.ImageField(default='default/foto.jpeg', upload_to='profile_pics/'),
        ),
    ]