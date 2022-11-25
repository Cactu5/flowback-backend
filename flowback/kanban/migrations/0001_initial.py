# Generated by Django 4.0.8 on 2022-11-22 15:41

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('group', '0006_alter_grouppermissions_allow_vote'),
    ]

    operations = [
        migrations.CreateModel(
            name='KanbanEntry',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(db_index=True, default=django.utils.timezone.now)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('title', models.CharField(max_length=255)),
                ('description', models.TextField()),
                ('tag', models.IntegerField(choices=[(1, 'backlog'), (2, 'chosen_for_execution'), (3, 'in_progress'), (4, 'evaluation'), (5, 'finished')])),
                ('assignee', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='kanban_entry_assignee', to='group.groupuser')),
                ('created_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='group.groupuser')),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
