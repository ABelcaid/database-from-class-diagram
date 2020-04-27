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
insert into Entreprise_X
values (2,"CSecurity","otman safsafi","casablanca");

/*==============================================================*/
/* Inset data in agence Table                                           */
/*==============================================================*/
insert into agence
values (1,1,"Itech agence 1","agadir",'2020-04-26');
insert into agence
values (2,1,"Itech agence 2","fes",'2017-02-16');
insert into agence
values (3,1,"Itech agence 3","safi",'2018-04-17');


/*==============================================================*/
/* Inset data in personnel Table                                           */
/*==============================================================*/
insert into personnel
values (1,2,"Ali talal",24,"Responsable SI",8900.5,'2020-01-26');
insert into personnel
values (2,2,"abdelali hossini",44,"Responsable financier",9900.5,'2010-01-26');
insert into personnel
values (3,2,"omar charkaoui",34,"Responsable achat",8900.5,'2015-02-24');



/*==============================================================*/
/* Update in Entreprise_X Table                                           */
/*==============================================================*/
update Entreprise_X
set DG = 'rachid azrou'
where id = 2;

/*==============================================================*/
/* Delate in Entreprise_X Table                                           */
/*==============================================================*/
delete from Entreprise_X where id = 2;

-- show table
 select * from Entreprise_X;






/*==============================================================*/
/* Update in agence Table                                           */
/*==============================================================*/
update agence
set localisation = 'casablanca'
where id = 3;

/*==============================================================*/
/* Delate in agence Table                                           */
/*==============================================================*/
delete from agence where id = 3;

-- show table
 select * from agence;








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

---------------------------------------------------------------------

CREATE USER 'belcaid3'@'localhost' IDENTIFIED BY 'belcaid123';

 grant ALL PRIVILEGES on gestion_personnel.* to 'belcaid3'@'localhost';



---------------------- connect to MySQL from win PowerShell --------------------------------------

-- cd "C:\Program Files\MySQL\MySQL Server 8.0\bin" 

.\mysql.exe -u belcaid3 -p     

 -- get the user
select user();