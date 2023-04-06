--kreiranje baze
create database Martina default charset utf8;
use Martina;
--kreiranje tablice
create table Ucenik
(IDsifraUcenik int not null identity (1,1),
Ime nvarchar(30) not null,
Prezime nvarchar (30) not null,
Mjesto nvarchar (30) not null,
constraint Ucenik_PK primary key (IDsifraUcenik));
--dodavanje ograničenja
alter table Ucenik add constraint
Ucenik_CHK check(IDsifraUcenik between 1 and 1000);

select * from Ucenik;

create table Aktvivnost
(IDsifraAktivnosti smallint not null identity (1,1),
Naziv nvarchar(30),
constraint Aktvinost_PK primary key (IDsifraAktivnosti));

create table Evidencija
(IDsifraEvidencija int not null identity (1,1),
IDsifraUcenika int not null,
IDsifraAktivnost smallint not null,
constraint Evidencija_PK primary key (IDsifraEvidencija));

--strani ključ
-- upozorenje ne mogu staviti strani ključ
alter table Evidencija
add constraint FK_Evidencija_Aktivnost
foreign key (IDsifraAktivnosti)
references Aktivnost(IDsifraAktivnosti);





alter table Ucenik add MjestoRodenja datetime2;
alter table Ucenik drop constraint Ucenik_CHK;

alter table Aktvivnost add Trajanje smallint;
alter table Aktvivnost add constraint Aktvivnost_CHK check(Trajanje between 2 and 10);
alter table Aktvivnost add Uvjet smallint;
alter table Aktvivnost add constraint Uvjet_CHK check (Uvjet >10);
alter table Ucenik alter column Prezime nvarchar(50);
alter table Ucenik drop column Mjesto;

--popunjavnje tablica
--brianje tablice
drop table Evidencija;

create table Evidencija(
IDsifraEvidencija int not null identity(1,1), 
SifraAktivnostiID smallint not null,
SifraUcenikaID int not null,
constraint Evidencija_PK primary key(IDsifraEvidencija));

--foreign key ne mogu ga kreirati!!!!!
alter table Evidencija
constraint FK_Evidencija_Aktvivnost foreign key (SifraAktivnostiID)
references Aktvivnost(IDsifraAktivnosti),
constraint FK_Evidencija_Ucenik foreign key (SifraUcenikID)
references Ucenik(IDdifraUcenik);

--popunjavanje tablice
select * from Ucenik;
alter table Ucenik drop column MjestoRodenja;
alter table Ucenik add DatumRocenja datetime2;
insert into Ucenik
values('Anita', 'Mili�evi�','2004-05-01'),
('Sara','Tamak', '2005-01-12'),
('Marko', 'Gordić', '2006-08-07'),
('Iva', 'Matan', '2005-09-03'),
('Martina', 'Antunović', '2006-07-28'),
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
update Ucenik set Ime='Josip' where IDcifraUcenik =3; 
select * from Aktvivnost;
update Aktvivnost set naziv='Uredsko poslovanje' where Oznaka='R02';
update Aktvivnost set Trajanje=6 where Oznaka='A01';
update Aktvivnost set Uvjet=20 where Oznaka='T01';
delete from Aktvivnost where Oznaka='A02';

select * from ucenik;
select * from Ucenik DatumRodenja like '2004%';
delete from Ucenik where DatumRodenja like'2004%';

