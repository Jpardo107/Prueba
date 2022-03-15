# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Alumno(models.Model):
    rut_al = models.IntegerField(db_column='RUT_AL', primary_key=True)  # Field name made lowercase.
    nom_al = models.CharField(db_column='NOM_AL', max_length=30)  # Field name made lowercase.
    ap_al = models.CharField(db_column='AP_AL', max_length=30)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'alumno'


class Cursos(models.Model):
    id_curso = models.IntegerField(db_column='ID_CURSO', primary_key=True)  # Field name made lowercase.
    rut_pro = models.ForeignKey('Profesor', models.DO_NOTHING, db_column='RUT_PRO' , null=True, blank=True)  # Field name made lowercase.
    nom_curso = models.CharField(db_column='NOM_CURSO', max_length=30)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cursos'


class Esta(models.Model):
    id_curso = models.OneToOneField(Cursos, models.DO_NOTHING, db_column='ID_CURSO', primary_key=True)  # Field name made lowercase.
    rut_al = models.ForeignKey(Alumno, models.DO_NOTHING, db_column='RUT_AL', null=True, blank=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'esta'
        unique_together = (('id_curso', 'rut_al'),)


class Profesor(models.Model):
    rut_pro = models.CharField(db_column='RUT_PRO', primary_key=True, max_length=9)  # Field name made lowercase.
    nom_pro = models.TextField(db_column='NOM_PRO')  # Field name made lowercase.
    ap_pro = models.CharField(db_column='AP_PRO', max_length=30)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'profesor'


class Pruebas(models.Model):
    id_pr = models.IntegerField(db_column='ID_PR', primary_key=True)  # Field name made lowercase.
    id_curso = models.ForeignKey(Cursos, models.DO_NOTHING, db_column='ID_CURSO', null=True, blank=True)  # Field name made lowercase.
    nom_pr = models.CharField(db_column='NOM_PR', max_length=50)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pruebas'


class Rinde(models.Model):
    id_pr = models.OneToOneField(Pruebas, models.DO_NOTHING, db_column='ID_PR', primary_key=True)  # Field name made lowercase.
    rut_al = models.ForeignKey(Alumno, models.DO_NOTHING, db_column='RUT_AL', null=True, blank=True)  # Field name made lowercase.
    nota_pr = models.FloatField()

    class Meta:
        managed = False
        db_table = 'rinde'
        unique_together = (('id_pr', 'rut_al'),)