--kreiranje baze
create database radiona default charset utf8;

--upotreba baze
use radiona;
--kriranje tablice u�enik
create table Ucenik
(IDSifra_ucenika int identity(1,1) not null,
Ime nvarchar(30) not null,
Prezime nvarchar(30)not null,
Mjesto nvarchar(30),
constraint Ucenik_PK primary key (IDSifra_ucenika));

--stavljanje ograni�enja
alter table Uecnik
add constraint Uecnik_CHK check(IDSifra_ucenika between 1 and 1000);

--kreiranje tablice aktivnost
create table Aktivnost
(IDSifra_aktivnosti nvarchar(5) not null,
Naziv nvarchar(30) not null,
constraint Aktivnost_PK primary key (IDSifra_aktivnosti));

--kreiranje tablice evidencija
create table Evidencija(
IDSifra_evidencija int not null identity(1,1), 
sifra_aktivnostiID nvarchar(5) not null,
sifra_ucenikaID int not null,
constraint Evidencija_PK primary key(IDSifra_evidencija));

select * from Aktivnost;
select * from Evidencija;

--dodavanje stupca u tablicu
alter table Ucenik add Datum_rodenja date;
--uklanjanje ograničenja
alter table Uecnik drop constraint Uecnik_CHK;

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
alter table ucenik drop column mjesto;
insert into Ucenik
values(1, 'Anita', 'Miličević','2004-05-01'),
(2, 'Sara','Tamak', '2005-01-12'),
(3, 'Marko', 'Gordić', '2006-08-07'),
(4, 'Iva', 'Matan', '2005-09-03'),
(5, 'Martina', 'Antunović', '2006-07-28'),
(6, 'Ivo', 'Lizak', '2004-12-16');
 select*from Ucenik;
 select *from Evidencija;
 select * from Aktivnost;

 alter table Evidencija add constraint FK_Evidencija_Uecnik foreign key (sifra_ucenikaID)
 references Uecnik(IDSifra_ucenika);

 alter table Evidencija add constraint FK_Evidencija_Aktivnost foreign key (sifra_aktivnostiID)
 references Uecnik(IDSifra_aktivnosti);
 

 drop table Uecnik;



