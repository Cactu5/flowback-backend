# Generated by Django 4.2.7 on 2023-12-25 15:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('poll', '0022_pollvotingtypecardinal_score'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pollvotingtypecardinal',
            name='score',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=11, null=True),
        ),
    ]
