/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     26/04/2020 13:37:56                          */
/*==============================================================*/


drop table if exists Agence;

drop table if exists Entreprise_X;

drop table if exists Personnel;

/*==============================================================*/
/* Table: Agence                                                */
/*==============================================================*/
create table Agence
(
   id                   int not null,
   Ent_id               int,
   nom                  varchar(254),
   localisation         varchar(254),
   date_creation        date,
   primary key (id)
);

/*==============================================================*/
/* Table: Entreprise_X                                          */
/*==============================================================*/
create table Entreprise_X
(
   id                   int not null,
   nom                  varchar(254),
   DG                   varchar(254),
   siege_social         varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table: Personnel                                             */
/*==============================================================*/
create table Personnel
(
   id                   int not null,
   Age_id               int,
   nom                  varchar(254),
   age                  int,
   mission              varchar(254),
   salaire              float,
   date_embauche        date,
   primary key (id)
);

alter table Agence add constraint FK_Association_1 foreign key (Ent_id)
      references Entreprise_X (id) on delete restrict on update restrict;

alter table Personnel add constraint FK_Association_2 foreign key (Age_id)
      references Agence (id) on delete restrict on update restrict;


/*==============================================================*/
/* Inset data in Entreprise_X Table                                           */
/*==============================================================*/
insert into Entreprise_X
values (1,"Itech","omar halli","rabat");

/*==============================================================*/
/* Inset data in agence Table                                           */
/*==============================================================*/
insert into agence
values (1,1,"Itech agence","agadir",'2020-04-26');

/*==============================================================*/
/* Inset data in personnel Table                                           */
/*==============================================================*/
insert into personnel
values (1,2,"Ali talal",24,"Responsable SI",8900.5,'2020-01-26');


/*==============================================================*/
/* Update in personnel Table                                           */
/*==============================================================*/
update personnel
set age = 22
where id = 3;

/*==============================================================*/
/* Delate in personnel Table                                           */
/*==============================================================*/
delete from personnel where id = 3;

-- show table
 select * from personnel;

/*==============================================================*/
/* Create user +  permission                                  */
/*==============================================================*/
CREATE USER 'belcaid2'@'localhost' IDENTIFIED BY 'belcaid';

 grant insert on gestion_personnel.* to 'belcaid2'@'localhost';