/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     13-03-2022 11:34:13                          */
/*==============================================================*/


drop table if exists ALUMNO;

drop table if exists CURSOS;

drop table if exists ESTA;

drop table if exists PROFESOR;

drop table if exists PRUEBAS;

drop table if exists RINDE;

/*==============================================================*/
/* Table: ALUMNO                                                */
/*==============================================================*/
create table ALUMNO
(
   RUT_AL               int not null,
   NOM_AL               varchar(30) not null,
   AP_AL                varchar(30) not null,
   primary key (RUT_AL)
);

/*==============================================================*/
/* Table: CURSOS                                                */
/*==============================================================*/
create table CURSOS
(
   ID_CURSO             int not null,
   RUT_PRO              varchar(9) not null,
   NOM_CURSO            varchar(30) not null,
   primary key (ID_CURSO)
);

/*==============================================================*/
/* Table: ESTA                                                  */
/*==============================================================*/
create table ESTA
(
   ID_CURSO             int not null,
   RUT_AL               int not null,
   primary key (ID_CURSO, RUT_AL)
);

/*==============================================================*/
/* Table: PROFESOR                                              */
/*==============================================================*/
create table PROFESOR
(
   RUT_PRO              varchar(9) not null,
   NOM_PRO              longtext not null,
   AP_PRO               varchar(30) not null,
   primary key (RUT_PRO)
);

/*==============================================================*/
/* Table: PRUEBAS                                               */
/*==============================================================*/
create table PRUEBAS
(
   ID_PR                int not null,
   ID_CURSO             int not null,
   NOM_PR               varchar(50) not null,
   NOTA_PR              float(2) not null,
   primary key (ID_PR)
);

/*==============================================================*/
/* Table: RINDE                                                 */
/*==============================================================*/
create table RINDE
(
   ID_PR                int not null,
   RUT_AL               int not null,
   primary key (ID_PR, RUT_AL)
);

alter table CURSOS add constraint FK_ADMINISTRA foreign key (RUT_PRO)
      references PROFESOR (RUT_PRO) on delete restrict on update restrict;

alter table ESTA add constraint FK_ESTA foreign key (ID_CURSO)
      references CURSOS (ID_CURSO) on delete restrict on update restrict;

alter table ESTA add constraint FK_ESTA2 foreign key (RUT_AL)
      references ALUMNO (RUT_AL) on delete restrict on update restrict;

alter table PRUEBAS add constraint FK_TIENE foreign key (ID_CURSO)
      references CURSOS (ID_CURSO) on delete restrict on update restrict;

alter table RINDE add constraint FK_RINDE foreign key (ID_PR)
      references PRUEBAS (ID_PR) on delete restrict on update restrict;

alter table RINDE add constraint FK_RINDE2 foreign key (RUT_AL)
      references ALUMNO (RUT_AL) on delete restrict on update restrict;


insert into alumno values 
('175119426', 'Jaime', 'Pardo'),
('135880604', 'Doris', 'Uribe'),
('233424226', 'Sebastian', 'Pardo'),
('195556479', 'Daniela', 'Uribe');

insert into esta values
(4,'195556479'),
(1,'175119426'),
(2,'175119426'),
(3,'135880604'),
(4,'175119426'),
(4,'135880604'),
(4,'233424226'),
(1,'135880604'),
(2,'233424226'),
(3,'233424226');

insert into cursos values 
(4,'184552146','Fisica nuclear'),
(1,'184552146','Programacion'),
(2,'184552146','Matematicas'),
(3,'111166749','Humanidades');

insert into profesor values
('184552146', 'Juan', 'Perez'),
('111166749', 'Maritza', 'Maldonado');

insert into pruebas values
(9,4,'Fusion de particulas'),
(10,4,'Fision de particulas'),
(1,1,'Python'),
(2,1,'CSS'),
(3,2,'Algebra'),
(4,2,'Calculo'),
(5,3,'Literatura'),
(6,3,'Filosofia'),
(7,1,'Javascript'),
(8,1,'TypeScript');

insert into rinde values
(9, '175119426', 7.0),
(9, '135880604', 5.0),
(9, '233424226', 3.0),
(9, '195556479', 1.5),
(10, '175119426', 5.0),
(10, '135880604', 6.5),
(10, '233424226', 7.0),
(10, '195556479', 3.3),
(1, '175119426', 1.5),
(2, '135880604', 6.5),
(3, '233424226', 4.3),
(4, '175119426', 4.0),
(5, '233424226', 6.4),
(6, '135880604', 5.5),
(7, '175119426', 3.2),
(8, '135880604', 7.0),
(1, '135880604', 6.9),
(2, '175119426', 6.3),
(3, '175119426', 2.6),
(4, '233424226', 5.9),
(5, '135880604', 6.6),
(6, '233424226', 4.5),
(7, '135880604', 6.0),
(8, '175119426', 7.0);

# UPDATE DE NOTAS PARA LA CONSULTA N° 4
UPDATE rinde
SET nota_pr=2.0 WHERE rut_al='175119426';
UPDATE rinde
SET nota_pr=2.5 WHERE rut_al='135880604';
#################################################################
#1.- Escriba una Query que entregue la lista de alumnos para el curso "programación"
create view curso as
select concat_ws(' ', a.NOM_AL, a.AP_AL) as Nombre, c.NOM_CURSO as Curso 
from alumno a, esta b, cursos c 
where a.RUT_AL = b.RUT_AL and b.ID_CURSO = c.ID_CURSO and c.ID_CURSO;

select * from curso where Curso = 'Programacion';


#2.- Escriba una Query que calcule el promedio de notas de un alumno en un curso.
create view PromNotasCursoAl as 
select concat_ws(' ', a.NOM_AL, a.AP_AL) as Nombre, c.NOM_CURSO as Curso, truncate(avg(d.nota_pr), 1) as Promedio
from alumno a, esta b, cursos c, rinde d, pruebas e
where a.RUT_AL = b.RUT_AL and b.ID_CURSO = c.ID_CURSO and c.ID_CURSO and a.RUT_AL = d.RUT_AL and d.ID_PR = e.ID_PR
and a.RUT_AL = '175119426' and c.NOM_CURSO = 'Programacion';

select * from PromNotasCursoAl;

#3.- Escriba una Query que entregue a los alumnos y el promedio que tiene en cada curso.
create view AlumnosPromedios as 
select concat_ws(' ', a.NOM_AL, a.AP_AL) as Nombre, c.NOM_CURSO as Curso, truncate(avg(e.nota_pr), 1) as Promedio
from alumno a, esta b, cursos c, pruebas d, rinde e
where a.RUT_AL = b.RUT_AL and b.ID_CURSO = c.ID_CURSO and c.ID_CURSO 
and c.ID_CURSO = d.ID_CURSO and d.ID_PR = e.ID_PR and a.RUT_AL = e.RUT_AL 
group by c.NOM_CURSO, a.RUT_AL;

select * from AlumnosPromedios;

#4.- Escriba una Query que lista a todos los alumnos con más de un curso con promedio rojo.
create view promRojo as
select concat_ws(' ', a.NOM_AL, a.AP_AL) as Nombre
from alumno a, esta b, cursos c, pruebas d, rinde e
where a.RUT_AL = b.RUT_AL and b.ID_CURSO = c.ID_CURSO and c.ID_CURSO 
and c.ID_CURSO = d.ID_CURSO and d.ID_PR = e.ID_PR and a.RUT_AL = e.RUT_AL
group by c.NOM_CURSO, a.RUT_AL
having truncate(avg(e.nota_pr), 1) < 4.0;

select *, count(Nombre) as NumPromRojo from PromRojo
group by Nombre
having count(Nombre) >1





 




























