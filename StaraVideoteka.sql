create database StaraVideoteka;

use StaraVideoteka;

create table Klijent
(IDKlijent int not null identity(1,1),
ImeKlijenta nvarchar(30) not null,
PrezimeKlijenta nvarchar(30) not null,
DatumRoðenja date,
Adresa nvarchar (30) not null,
BrojTelefona varchar(15)
constraint Klijent_PK primary key(IDKlijent));

alter table Klijent 
add BrojTelefona tinyint;

select * from Klijent;

alter table Klijent
add constraint Klijent_PK primary key (IDKlijent);

create table Žanr
(IDŽanr int not null identity(1,1),
NazivŽanra nvarchar(50) not null);
alter table Žanr add constraint Žanr_PK primary key(IDŽanr);

create table Redatelj
(IDRedatelj int not null identity(1,1),
ImeREdatelja nvarchar(30) not null,
PrezimeRedatelja nvarchar(30) not null);
Alter table Redatelj add constraint Redatelj_PK primary key(IDRedatelj); 

select * from Redatelj;

create table Film
(IDFilm int not null identity (1,1),
NazivFilma nvarchar(50) not null,
ŠifraFilma varchar(10) not null,
ŽanrID int not null,
RedateljiID int not null,
constraint Film_PK primary key (IDFilm));

drop table Film;
alter table Posudba drop constraint FK_Posudba_Film;

create table Posudba
(IDPosudba int not null identity(1,1),
KlijentID int not null,
FilmID int not null,
DatumPosudbe datetime2 not null,
DatumVraæanja datetime2
constraint Posudba_PK primary key (IDPosudba));

alter table Posudba
add constraint FK_Posudba_Klijent foreign key(KlijentID)
references Klijent(IDKlijent);

alter table Posudba
add constraint FK_Posudba_Film foreign key(FilmID)
references Film(IDFilm);

alter table Film
add constraint FK_Film_Žanr foreign key(ŽanrID)
references Žanr(IDŽanr);

alter table Film
add constraint FK_Film_Redatelj foreign key(RedateljiID)
references Redatelj(IDRedatelj);

insert into Žanr
values('Animirani'),('Dokumntarni'),
('Drama'),
('Akcija'),
('Triler'),
('Avantura'),
('Romantièni'),
('Povjesni'),
('Ratni'),
('Obiteljski'),
('Vestern'),
('Kriminalistièki'),
('Fantazija'),
('SF'),
('Komedija');

select * from Žanr;

insert into Redatelj
values ('Roland', 'Emmerich'),
('Alex', 'Garland'),
('Anastasiya', 'Palchikova'),
('Todd', 'Philips'),
('Andrew', 'Stanton'),
('Chris', 'Columbs');

select * from Redatelj;

insert into Klijent values
('Ana', 'Periæ','2000-01-12','Bjelovarska 1, Zagreb','01/123-456'),
('Marko', 'Aniæ','2001-02-27','Daruvarska 3, Zagreb','01/123-564'),
('Ivan', 'Hovrat','1999-03-07', 'Koprivnièka 10a, Vrbovec', '01/123-956'),
('Bruno', 'Taniæ', '1992-03-05', 'N. Tavleièa 45, Zagreb','01/123-856'),
('Helena', 'Turniæ', '1990-05-13','Supetrova 1a, Zagreb','01/123-756'),
('Ana', 'Ivaniæ','2007-10-20', 'Slavonska 2, Zagreb', '01/123-656'),
('Ivan', 'Petak', '2009-12-03', 'Vukovarska 8, Samobor', '01/123-556');

select * from Klijent;

insert into Film values
('Dan nezavisnosti: Nova prijetnja', 'SF100A', 14, 1),
('Harry Potter i kamen mudraca', 'AV100A', 6, 6),
('Harry Potter i odaja tajni', 'AV200B', 6, 6),
('EX machina', 'SF200A', 14, 2),
('Mamurluk', 'Kom100A', 15, 4),
('Maša', 'KRI100A', 12, 3),
('Wall-E', 'ANIM100A', 1, 5);
select * from Film;

--datum, broj tlefona, šifra filma
ALTER TABLE Klijent
ALTER COLUMN DatuRoðenja date;

alter table Klijent 
alter column Brojtelefona varchar(15);

alter table Film
alter column ŠifraFilma varchar(10);

select * from Klijent;
insert into Klijent(DatuRoðenja, BrojTelefona) values
('2000-01-12', '01/123-456'),
('2001-02-27', '01/123-564'),
('1999-03-07', '01/123-956'),
('1992-03-05', '01/123-856'),
('1990-05-13', '01/123-756'),
('2007-10-20', '01/123-656'),
('2009-12-03', '01/123-556');

update Klijent set DatuRoðenja='2009-12-03', BrojTelefona='01/123-556'where IDKlijent=10;
update Klijent set DatuRoðenja='2007-12-20', BrojTelefona='01/123-656' where IDKlijent=9;
update Klijent set DatuRoðenja='1990-05-13', BrojTelefona='01/123-756' where IDKlijent=8;
update Klijent set DatuRoðenja='1992-03-05', BrojTelefona='01/123-956' where IDKlijent=7;
update Klijent set DatuRoðenja='1999-03-07', BrojTelefona='01/123-656' where IDKlijent=6;
update Klijent set DatuRoðenja='2001-02-27', BrojTelefona='01/123-546' where IDKlijent=5;
update Klijent set DatuRoðenja='2000-01-12', BrojTelefona='01/123-456' where IDKlijent=4;
 select * from Posudba;
 update Film set ŠifraFilma='AV100A' where NazivFilma='Harry Potter i kamen mudraca';
 update Film set ŠifraFilma='SF100A' where NazivFilma='Dan nezavisnosti: Nova prijetnja';
 update Film set ŠifraFilma='AV200B' where NazivFilma='Harry Potter i odaja tajni';
 update Film set ŠifraFilma='SF200A' where IDFilm=5;
 update Film set ŠifraFilma='Kom100A' where IDFilm=6;
  update Film set ŠifraFilma='KRI100A' where IDFilm=7;
   update Film set ŠifraFilma='ANM100A' where IDFilm=8;

update Klijent set IDKlijent= 1 where PrezimeKlijenta= 'Periæ';

 select * from klijent;

drop table Klijent;
alter table Posudba drop constraint FK_Posudba_Klijent;
select * from Klijent;
select * from Posudba;
select * from Film;
insert into Posudba values
(1, 6, '2021-01-20', '2021-01-23'),
(1, 6, '2021-01-20', '2021-01-23'),
(4, 5, '2021-01-20', '2021-01-22'),
(1, 1, '2021-01-23', '2021-01-26'),
(2, 4, '2021-09-10', '2021-09-13'),
(6, 7, '2021-10-09', '2021-10-10');

select * from Posudba;

update Posudba set FilmID=2, DatumPosudbe='2021-10-13'where IDPosudba=7;
update Posudba set DatumVraæanja= null where IDPosudba = 7;
select * from Film;
select * from Klijent;
select * from Posudba;
select * from Redatelj;
select * from Žanr;

select * from Klijent where Adresa like '%Zagreb';

select * from Klijent where DatumRoðenja < '2000-01-12';
select * from film;

select * from žanr;
select * from film where ŽanrID= '14';

select * from Posudba;
select * from posudba where DatumVraæanja is null;
select * from film;
select * from žanr;


select ImeKlijenta, PrezimeKlijenta, DatumPosudbe, DatumVraæanja from Klijent
inner join Posudba
on Klijent.IDKlijent=Posudba.KlijentID;


--prikaži popis filmova s žanrom i redateljima

select*from Film;
select * from Žanr;
select * from Redatelj;

select NazivFilma, NazivŽanra, ImeREdatelja, PrezimeRedatelja from Film
inner join Žanr on Film.ŽanrID=Žanr.IDŽanr
inner join Redatelj on Film.RedateljiID=Redatelj.IDRedatelj;

select NazivFilma, NazivŽanra, ImeREdatelja, PrezimeRedatelja from Film
left join Žanr on Film.ŽanrID=Žanr.IDŽanr
left join Redatelj on Film.RedateljiID=Redatelj.IDRedatelj;

select NazivFilma, NazivŽanra, ImeREdatelja, PrezimeRedatelja from Film
right join Žanr on Film.ŽanrID=Žanr.IDŽanr
right join Redatelj on Film.RedateljiID=Redatelj.IDRedatelj;

select ImeKlijenta, PrezimeKlijenta, DatumVraæanja, NazivFilma from Klijent
inner join Posudba
on Klijent.IDKlijent=Posudba.KlijentID
inner join Film
on Posudba.FilmID=FIlm.IDFilm;

select ImeKlijenta, PrezimeKlijenta, DatumVraæanja, NazivFilma from Klijent
inner join Posudba
on Klijent.IDKlijent=Posudba.KlijentID
inner join Film
on Posudba.FilmID=FIlm.IDFilm
where DatumVraæanja is null;

select * from film;
select * from žanr;


select ImeRedatelja, PrezimeRedatelja, NazivFilma from Redatelj
inner join Film
on Redatelj.IDRedatelj=Film.RedateljiID
where ImeRedatelja='Chris' and PrezimeRedatelja='Columbs';

select NazivŽanra from Žanr
full join Film
on Žanr.IDŽanr=Film.ŽanrID
where ŽanrID is null;

select * from klijent;

update Klijent set PrezimeKlijenta='Topiæ' where DatumRoðenja='2000-01-12';

delete From klijent where IDKlijent=7;

select  * from posudba;

update Posudba set DatumVraæanja='2021-10-20' where DatumVraæanja is null;

select * from film;
select * from Žanr;

create view vwAvantura AS 
select NazivFilma, NazivŽanra
from Film
inner join Žanr
on Film.ŽanrID=Žanr.IDŽanr
where NazivŽanra='Avantura';

select * from vwAvantura;
