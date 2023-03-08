--kreiranje baze
create database radiona;

--upotreba baze
use radiona;
--kriranje tablice u�enik
create table U�enik
(ID�ifra_u�enika int identity(1,1) not null,
Ime nvarchar(30) not null,
Prezime nvarchar(30)not null,
Mjesto nvarchar(30),
constraint U�enik_PK primary key (ID�ifra_u�enika));

--stavljanje ograni�enja
alter table Ue�nik
add constraint Ue�nik_CHK check(ID�ifra_u�enika between 1 and 1000);

--kreiranje tablice aktivnost
create table Aktivnost
(ID�ifra_aktivnosti nvarchar(5) not null,
Naziv nvarchar(30) not null,
constraint Aktivnost_PK primary key (ID�ifra_aktivnosti));

--kreiranje tablice evidencija
create table Evidencija(
ID�ifra_evidencija int not null identity(1,1), 
�ifra_aktivnostiID nvarchar(5) not null,
�ifra_u�enikaID int not null,
constraint Evidencija_PK primary key(ID�ifra_evidencija));

select * from Aktivnost;
select * from Evidencija;

--dodavanje stupca u tablicu
alter table U�enik add Datum_ro�enja date;
--uklanjanje ograni�enja
alter table Ue�nik drop constraint Ue�nik_CHK;

--punjenje tablice
insert into Aktivnost
values ('A01', 'Osnove rada'),
('A02', 'Microsoft Word'),
('T01', 'Uvod u SQL'),
('R01', 'Upotreba IT-a'),
('R02', 'Poslovna informatika'),
('R03', 'Grafika');


select * from Evidencija;
insert into Evidencija
values('A01', 1),
('A02', 2),
('T01', 3),
('R01', 4),
('R02', 5),
('A01', 6);
select * from Evidencija;
alter table u�enik drop column mjesto;
insert into U�enik
values(1, 'Anita', 'Mili�evi�','2004-05-01'),
(2, 'Sara','Tamak', '2005-01-12'),
(3, 'Marko', 'Gordi�', '2006-08-07'),
(4, 'Iva', 'Matan', '2005-09-03'),
(5, 'Martina', 'Antunovi�', '2006-07-28'),
(6, 'Ivo', 'Lizak', '2004-12-16');
 select*from U�enik;
 select *from Evidencija;
 select * from Aktivnost;

 alter table Evidencija add constraint FK_Evidencija_Ue�nik foreign key (�ifra_u�enikaID)
 references Ue�nik(ID�ifra_u�enika);

 alter table Evidencija add constraint FK_Evidencija_Aktivnost foreign key (�ifra_aktivnostiID)
 references Ue�nik(ID�ifra_aktivnosti);
 

 drop table Ue�nik;



