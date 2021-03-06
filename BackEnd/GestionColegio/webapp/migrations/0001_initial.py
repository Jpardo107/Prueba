# Generated by Django 4.0.3 on 2022-03-15 13:19

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Alumno',
            fields=[
                ('rut_al', models.IntegerField(db_column='RUT_AL', primary_key=True, serialize=False)),
                ('nom_al', models.CharField(db_column='NOM_AL', max_length=30)),
                ('ap_al', models.CharField(db_column='AP_AL', max_length=30)),
            ],
            options={
                'db_table': 'alumno',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Cursos',
            fields=[
                ('id_curso', models.IntegerField(db_column='ID_CURSO', primary_key=True, serialize=False)),
                ('nom_curso', models.CharField(db_column='NOM_CURSO', max_length=30)),
            ],
            options={
                'db_table': 'cursos',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Profesor',
            fields=[
                ('rut_pro', models.CharField(db_column='RUT_PRO', max_length=9, primary_key=True, serialize=False)),
                ('nom_pro', models.TextField(db_column='NOM_PRO')),
                ('ap_pro', models.CharField(db_column='AP_PRO', max_length=30)),
            ],
            options={
                'db_table': 'profesor',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Pruebas',
            fields=[
                ('id_pr', models.IntegerField(db_column='ID_PR', primary_key=True, serialize=False)),
                ('nom_pr', models.CharField(db_column='NOM_PR', max_length=50)),
            ],
            options={
                'db_table': 'pruebas',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Esta',
            fields=[
                ('id_curso', models.OneToOneField(db_column='ID_CURSO', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='webapp.cursos')),
            ],
            options={
                'db_table': 'esta',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Rinde',
            fields=[
                ('id_pr', models.OneToOneField(db_column='ID_PR', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='webapp.pruebas')),
                ('nota_pr', models.FloatField()),
            ],
            options={
                'db_table': 'rinde',
                'managed': False,
            },
        ),
    ]
