--kreiranje baze
create database Martina;
use Martina;
--kreiranje tablice
create table Uèenik
(IDŠifraUèenik int not null identity (1,1),
Ime nvarchar(30) not null,
Prezime nvarchar (30) not null,
Mjesto nvarchar (30) not null,
constraint Uèenik_PK primary key (IDŠifraUèenik));
--dodavanje ogranièenja
alter table Uèenik add constraint
Uèenik_CHK check(IDŠifraUèenik between 1 and 1000);

select * from Uèenik;

create table Aktvivnost
(IDŠifraAktivnosti smallint not null identity (1,1),
Naziv nvarchar(30),
constraint Aktvinost_PK primary key (IDŠifraAktivnosti));

create table Evidencija
(IDŠifraEvidencija int not null identity (1,1),
IDŠifraUèenika int not null,
IDŠifraAktivnost smallint not null,
constraint Evidencija_PK primary key (IDŠifraEvidencija));

--strani kljuè
-- upozorenje ne mogu staviti strani kljuè
alter table Evidencija
add constraint FK_Evidencija_Aktivnost
foreign key (IDŠifraAktivnosti)
references Aktivnost(IDŠifraAktivnosti);





alter table Uèenik add MjestoRoðenja datetime2;
alter table Uèenik drop constraint Uèenik_CHK;

alter table Aktvivnost add Trajanje smallint;
alter table Aktvivnost add constraint Aktvivnost_CHK check(Trajanje between 2 and 10);
alter table Aktvivnost add Uvjet smallint;
alter table Aktvivnost add constraint Uvjet_CHK check (Uvjet >10);
alter table Uèenik alter column Prezime nvarchar(50);
alter table Uèenik drop column Mjesto;

--popunjavnje tablica
--brianje tablice
drop table Evidencija;

create table Evidencija(
IDŠifraEvidencija int not null identity(1,1), 
ŠifraAktivnostiID smallint not null,
ŠifraUèenikaID int not null,
constraint Evidencija_PK primary key(IDŠifraEvidencija));

--foreign key ne mogu ga kreirati!!!!!
alter table Evidencija
constraint FK_Evidencija_Aktvivnost foreign key (ŠifraAktivnostiID)
references Aktvivnost(IDŠifraAktivnosti),
constraint FK_Evidencija_Uèenik foreign key (ŠifraUèenikID)
references Uèenik(IDŠifraUèenik);

--popunjavanje tablice
select * from Uèenik;
alter table Uèenik drop column MjestoRoðenja;
alter table Uèenik add DatumRoðenja datetime2;
insert into Uèenik
values('Anita', 'Miliæeviæ','2004-05-01'),
('Sara','Tamak', '2005-01-12'),
('Marko', 'Gordiæ', '2006-08-07'),
('Iva', 'Matan', '2005-09-03'),
('Martina', 'Antunoviæ', '2006-07-28'),
('Ivo', 'Lizak', '2004-12-16');

select  * from Aktvivnost;
alter table Aktvivnost add Oznaka nvarchar(3);
insert into Aktvivnost (Oznaka, Naziv)
values ('A01', 'Osnove rada'),
('A02', 'Microsoft Word'),
('T01', 'Uvod u SQL'),
('R01', 'Upotreba IT-a'),
('R02', 'Poslovna informatika'),
('R03', 'Grafika');
select * from Evidencija;
insert into Evidencija
values(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

--izmjena podataka 
update Uèenik set Ime='Josip' where IDŠifraUèenik =3; 
select * from Aktvivnost;
update Aktvivnost set naziv='Uredsko poslovanje' where Oznaka='R02';
update Aktvivnost set Trajanje=6 where Oznaka='A01';
update Aktvivnost set Uvjet=20 where Oznaka='T01';
delete from Aktvivnost where Oznaka='A02';

select * from uèenik;
select * from Uèenik DatumRoðenja like '2004%';
delete from Uèenik where DatumRoðenja like'2004%';

