--kreiranje baze
create database radiona;

--upotreba baze
use radiona;
--kriranje tablice uèenik
create table Uèenik
(IDŠifra_uèenika int identity(1,1) not null,
Ime nvarchar(30) not null,
Prezime nvarchar(30)not null,
Mjesto nvarchar(30),
constraint Uèenik_PK primary key (IDŠifra_uèenika));

--stavljanje ogranièenja
alter table Ueènik
add constraint Ueènik_CHK check(IDŠifra_uèenika between 1 and 1000);

--kreiranje tablice aktivnost
create table Aktivnost
(IDŠifra_aktivnosti nvarchar(5) not null,
Naziv nvarchar(30) not null,
constraint Aktivnost_PK primary key (IDŠifra_aktivnosti));

--kreiranje tablice evidencija
create table Evidencija(
IDŠifra_evidencija int not null identity(1,1), 
Šifra_aktivnostiID nvarchar(5) not null,
Šifra_uèenikaID int not null,
constraint Evidencija_PK primary key(IDŠifra_evidencija));

select * from Aktivnost;
select * from Evidencija;

--dodavanje stupca u tablicu
alter table Uèenik add Datum_roðenja date;
--uklanjanje ogranièenja
alter table Ueènik drop constraint Ueènik_CHK;

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
alter table uèenik drop column mjesto;
insert into Uèenik
values(1, 'Anita', 'Miliæeviæ','2004-05-01'),
(2, 'Sara','Tamak', '2005-01-12'),
(3, 'Marko', 'Gordiæ', '2006-08-07'),
(4, 'Iva', 'Matan', '2005-09-03'),
(5, 'Martina', 'Antunoviæ', '2006-07-28'),
(6, 'Ivo', 'Lizak', '2004-12-16');
 select*from Uèenik;
 select *from Evidencija;
 select * from Aktivnost;

 alter table Evidencija add constraint FK_Evidencija_Ueènik foreign key (Šifra_uèenikaID)
 references Ueènik(IDŠifra_uèenika);

 alter table Evidencija add constraint FK_Evidencija_Aktivnost foreign key (Šifra_aktivnostiID)
 references Ueènik(IDŠifra_aktivnosti);
 

 drop table Ueènik;



