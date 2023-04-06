create database StaraVideoteka default charset utf8 ;

use StaraVideoteka;

create table Klijent
(IDKlijent int not null identity(1,1),
ImeKlijenta nvarchar(30) not null,
PrezimeKlijenta nvarchar(30) not null,
DatumRodenja date,
Adresa nvarchar (30) not null,
BrojTelefona varchar(15)
constraint Klijent_PK primary key(IDKlijent));

alter table Klijent 
add BrojTelefona tinyint;

select * from Klijent;

alter table Klijent
add constraint Klijent_PK primary key (IDKlijent);

create table zanr
(IDzanr int not null identity(1,1),
NazivZanra nvarchar(50) not null);
alter table Zanr add constraint Zanr_PK primary key(IDzanr);

create table Redatelj
(IDRedatelj int not null identity(1,1),
ImeREdatelja nvarchar(30) not null,
PrezimeRedatelja nvarchar(30) not null);
Alter table Redatelj add constraint Redatelj_PK primary key(IDRedatelj); 

select * from Redatelj;

create table Film
(IDFilm int not null identity (1,1),
NazivFilma nvarchar(50) not null,
SifraFilma varchar(10) not null,
ZanrID int not null,
RedateljiID int not null,
constraint Film_PK primary key (IDFilm));

drop table Film;
alter table Posudba drop constraint FK_Posudba_Film;

create table Posudba
(IDPosudba int not null identity(1,1),
KlijentID int not null,
FilmID int not null,
DatumPosudbe datetime2 not null,
DatumVracanja datetime2
constraint Posudba_PK primary key (IDPosudba));

alter table Posudba
add constraint FK_Posudba_Klijent foreign key(KlijentID)
references Klijent(IDKlijent);

alter table Posudba
add constraint FK_Posudba_Film foreign key(FilmID)
references Film(IDFilm);

alter table Film
add constraint FK_Film_zanr foreign key(zanrID)
references Zanr(IDzanr);

alter table Film
add constraint FK_Film_Redatelj foreign key(RedateljiID)
references Redatelj(IDRedatelj);

insert into Zanr
values('Animirani'),('Dokumntarni'),
('Drama'),
('Akcija'),
('Triler'),
('Avantura'),
('Romantični'),
('Povjesni'),
('Ratni'),
('Obiteljski'),
('Vestern'),
('Kriminalistički'),
('Fantazija'),
('SF'),
('Komedija');

select * from Zanr;

insert into Redatelj
values ('Roland', 'Emmerich'),
('Alex', 'Garland'),
('Anastasiya', 'Palchikova'),
('Todd', 'Philips'),
('Andrew', 'Stanton'),
('Chris', 'Columbs');

select * from Redatelj;

insert into Klijent values
('Ana', 'Perić','2000-01-12','Bjelovarska 1, Zagreb','01/123-456'),
('Marko', 'Anić','2001-02-27','Daruvarska 3, Zagreb','01/123-564'),
('Ivan', 'Hovrat','1999-03-07', 'Koprivnička 10a, Vrbovec', '01/123-956'),
('Bruno', 'Tanić', '1992-03-05', 'N. Tavleiča 45, Zagreb','01/123-856'),
('Helena', 'Turnić', '1990-05-13','Supetrova 1a, Zagreb','01/123-756'),
('Ana', 'Ivanić','2007-10-20', 'Slavonska 2, Zagreb', '01/123-656'),
('Ivan', 'Petak', '2009-12-03', 'Vukovarska 8, Samobor', '01/123-556');

select * from Klijent;

insert into Film values
('Dan nezavisnosti: Nova prijetnja', 'SF100A', 14, 1),
('Harry Potter i kamen mudraca', 'AV100A', 6, 6),
('Harry Potter i odaja tajni', 'AV200B', 6, 6),
('EX machina', 'SF200A', 14, 2),
('Mamurluk', 'Kom100A', 15, 4),
('Mača', 'KRI100A', 12, 3),
('Wall-E', 'ANIM100A', 1, 5);
select * from Film;

--datum, broj tlefona, šifra filma
ALTER TABLE Klijent
ALTER COLUMN DatuRodenja date;

alter table Klijent 
alter column Brojtelefona varchar(15);

alter table Film
alter column SifraFilma varchar(10);

select * from Klijent;
insert into Klijent(DatuRodenja, BrojTelefona) values
('2000-01-12', '01/123-456'),
('2001-02-27', '01/123-564'),
('1999-03-07', '01/123-956'),
('1992-03-05', '01/123-856'),
('1990-05-13', '01/123-756'),
('2007-10-20', '01/123-656'),
('2009-12-03', '01/123-556');

update Klijent set DatuRodenja='2009-12-03', BrojTelefona='01/123-556'where IDKlijent=10;
update Klijent set DatuRodenja='2007-12-20', BrojTelefona='01/123-656' where IDKlijent=9;
update Klijent set DatuRodenja='1990-05-13', BrojTelefona='01/123-756' where IDKlijent=8;
update Klijent set DatuRodenja='1992-03-05', BrojTelefona='01/123-956' where IDKlijent=7;
update Klijent set DatuRodenja='1999-03-07', BrojTelefona='01/123-656' where IDKlijent=6;
update Klijent set DatuRodenja='2001-02-27', BrojTelefona='01/123-546' where IDKlijent=5;
update Klijent set DatuRodenja='2000-01-12', BrojTelefona='01/123-456' where IDKlijent=4;
 select * from Posudba;
 update Film set SifraFilma='AV100A' where NazivFilma='Harry Potter i kamen mudraca';
 update Film set SifraFilma='SF100A' where NazivFilma='Dan nezavisnosti: Nova prijetnja';
 update Film set SifraFilma='AV200B' where NazivFilma='Harry Potter i odaja tajni';
 update Film set SifraFilma='SF200A' where IDFilm=5;
 update Film set SifraFilma='Kom100A' where IDFilm=6;
  update Film set SifraFilma='KRI100A' where IDFilm=7;
   update Film set SifraFilma='ANM100A' where IDFilm=8;

update Klijent set IDKlijent= 1 where PrezimeKlijenta= 'Perić';

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
update Posudba set DatumVracanja= null where IDPosudba = 7;
select * from Film;
select * from Klijent;
select * from Posudba;
select * from Redatelj;
select * from Zanr;

select * from Klijent where Adresa like '%Zagreb';

select * from Klijent where DatumRodenja < '2000-01-12';
select * from film;

select * from Zanr;
select * from film where ZanrID= '14';

select * from Posudba;
select * from posudba where DatumVracanja is null;
select * from film;
select * from Zanr;


select ImeKlijenta, PrezimeKlijenta, DatumPosudbe, DatumVracanja from Klijent
inner join Posudba
on Klijent.IDKlijent=Posudba.KlijentID;


--prikaži popis filmova s žanrom i redateljima

select*from Film;
select * from Zanr;
select * from Redatelj;

select NazivFilma, NazivZanra, ImeREdatelja, PrezimeRedatelja from Film
inner join Zanr on Film.ZanrID=Zanr.IDZanr
inner join Redatelj on Film.RedateljiID=Redatelj.IDRedatelj;

select NazivFilma, NazivZanra, ImeREdatelja, PrezimeRedatelja from Film
left join Zanr on Film.ZanrID=Zanr.IDzanr
left join Redatelj on Film.RedateljiID=Redatelj.IDRedatelj;

select NazivFilma, NazivZanra, ImeREdatelja, PrezimeRedatelja from Film
right join Zanr on Film.ZanrID=Zanr.IDZanr
right join Redatelj on Film.RedateljiID=Redatelj.IDRedatelj;

select ImeKlijenta, PrezimeKlijenta, DatumVracanja, NazivFilma from Klijent
inner join Posudba
on Klijent.IDKlijent=Posudba.KlijentID
inner join Film
on Posudba.FilmID=FIlm.IDFilm;

select ImeKlijenta, PrezimeKlijenta, DatumVracanja, NazivFilma from Klijent
inner join Posudba
on Klijent.IDKlijent=Posudba.KlijentID
inner join Film
on Posudba.FilmID=FIlm.IDFilm
where DatumVracanja is null;

select * from film;
select * from Zanr;


select ImeRedatelja, PrezimeRedatelja, NazivFilma from Redatelj
inner join Film
on Redatelj.IDRedatelj=Film.RedateljiID
where ImeRedatelja='Chris' and PrezimeRedatelja='Columbs';

select NazivZanra from Zanr
full join Film
on Zanr.IDzanr=Film.ZanrID
where ZanrID is null;

select * from klijent;

update Klijent set PrezimeKlijenta='Topić' where DatumRodenja='2000-01-12';

delete From klijent where IDKlijent=7;

select  * from posudba;

update Posudba set DatumVracanja='2021-10-20' where DatumVracanja is null;

select * from film;
select * from Zanr;

create view vwAvantura AS 
select NazivFilma, NazivZanra
from Film
inner join Zanr
on Film.ZanrID=Zanr.IDzanr
where NazivZanra='Avantura';

select * from vwAvantura;
