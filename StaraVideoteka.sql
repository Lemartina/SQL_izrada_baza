create database StaraVideoteka;

use StaraVideoteka;

create table Klijent
(IDKlijent int not null identity(1,1),
ImeKlijenta nvarchar(30) not null,
PrezimeKlijenta nvarchar(30) not null,
DatumRo�enja date,
Adresa nvarchar (30) not null,
BrojTelefona varchar(15)
constraint Klijent_PK primary key(IDKlijent));

alter table Klijent 
add BrojTelefona tinyint;

select * from Klijent;

alter table Klijent
add constraint Klijent_PK primary key (IDKlijent);

create table �anr
(ID�anr int not null identity(1,1),
Naziv�anra nvarchar(50) not null);
alter table �anr add constraint �anr_PK primary key(ID�anr);

create table Redatelj
(IDRedatelj int not null identity(1,1),
ImeREdatelja nvarchar(30) not null,
PrezimeRedatelja nvarchar(30) not null);
Alter table Redatelj add constraint Redatelj_PK primary key(IDRedatelj); 

select * from Redatelj;

create table Film
(IDFilm int not null identity (1,1),
NazivFilma nvarchar(50) not null,
�ifraFilma varchar(10) not null,
�anrID int not null,
RedateljiID int not null,
constraint Film_PK primary key (IDFilm));

drop table Film;
alter table Posudba drop constraint FK_Posudba_Film;

create table Posudba
(IDPosudba int not null identity(1,1),
KlijentID int not null,
FilmID int not null,
DatumPosudbe datetime2 not null,
DatumVra�anja datetime2
constraint Posudba_PK primary key (IDPosudba));

alter table Posudba
add constraint FK_Posudba_Klijent foreign key(KlijentID)
references Klijent(IDKlijent);

alter table Posudba
add constraint FK_Posudba_Film foreign key(FilmID)
references Film(IDFilm);

alter table Film
add constraint FK_Film_�anr foreign key(�anrID)
references �anr(ID�anr);

alter table Film
add constraint FK_Film_Redatelj foreign key(RedateljiID)
references Redatelj(IDRedatelj);

insert into �anr
values('Animirani'),('Dokumntarni'),
('Drama'),
('Akcija'),
('Triler'),
('Avantura'),
('Romanti�ni'),
('Povjesni'),
('Ratni'),
('Obiteljski'),
('Vestern'),
('Kriminalisti�ki'),
('Fantazija'),
('SF'),
('Komedija');

select * from �anr;

insert into Redatelj
values ('Roland', 'Emmerich'),
('Alex', 'Garland'),
('Anastasiya', 'Palchikova'),
('Todd', 'Philips'),
('Andrew', 'Stanton'),
('Chris', 'Columbs');

select * from Redatelj;

insert into Klijent values
('Ana', 'Peri�','2000-01-12','Bjelovarska 1, Zagreb','01/123-456'),
('Marko', 'Ani�','2001-02-27','Daruvarska 3, Zagreb','01/123-564'),
('Ivan', 'Hovrat','1999-03-07', 'Koprivni�ka 10a, Vrbovec', '01/123-956'),
('Bruno', 'Tani�', '1992-03-05', 'N. Tavlei�a 45, Zagreb','01/123-856'),
('Helena', 'Turni�', '1990-05-13','Supetrova 1a, Zagreb','01/123-756'),
('Ana', 'Ivani�','2007-10-20', 'Slavonska 2, Zagreb', '01/123-656'),
('Ivan', 'Petak', '2009-12-03', 'Vukovarska 8, Samobor', '01/123-556');

select * from Klijent;

insert into Film values
('Dan nezavisnosti: Nova prijetnja', 'SF100A', 14, 1),
('Harry Potter i kamen mudraca', 'AV100A', 6, 6),
('Harry Potter i odaja tajni', 'AV200B', 6, 6),
('EX machina', 'SF200A', 14, 2),
('Mamurluk', 'Kom100A', 15, 4),
('Ma�a', 'KRI100A', 12, 3),
('Wall-E', 'ANIM100A', 1, 5);
select * from Film;

--datum, broj tlefona, �ifra filma
ALTER TABLE Klijent
ALTER COLUMN DatuRo�enja date;

alter table Klijent 
alter column Brojtelefona varchar(15);

alter table Film
alter column �ifraFilma varchar(10);

select * from Klijent;
insert into Klijent(DatuRo�enja, BrojTelefona) values
('2000-01-12', '01/123-456'),
('2001-02-27', '01/123-564'),
('1999-03-07', '01/123-956'),
('1992-03-05', '01/123-856'),
('1990-05-13', '01/123-756'),
('2007-10-20', '01/123-656'),
('2009-12-03', '01/123-556');

update Klijent set DatuRo�enja='2009-12-03', BrojTelefona='01/123-556'where IDKlijent=10;
update Klijent set DatuRo�enja='2007-12-20', BrojTelefona='01/123-656' where IDKlijent=9;
update Klijent set DatuRo�enja='1990-05-13', BrojTelefona='01/123-756' where IDKlijent=8;
update Klijent set DatuRo�enja='1992-03-05', BrojTelefona='01/123-956' where IDKlijent=7;
update Klijent set DatuRo�enja='1999-03-07', BrojTelefona='01/123-656' where IDKlijent=6;
update Klijent set DatuRo�enja='2001-02-27', BrojTelefona='01/123-546' where IDKlijent=5;
update Klijent set DatuRo�enja='2000-01-12', BrojTelefona='01/123-456' where IDKlijent=4;
 select * from Posudba;
 update Film set �ifraFilma='AV100A' where NazivFilma='Harry Potter i kamen mudraca';
 update Film set �ifraFilma='SF100A' where NazivFilma='Dan nezavisnosti: Nova prijetnja';
 update Film set �ifraFilma='AV200B' where NazivFilma='Harry Potter i odaja tajni';
 update Film set �ifraFilma='SF200A' where IDFilm=5;
 update Film set �ifraFilma='Kom100A' where IDFilm=6;
  update Film set �ifraFilma='KRI100A' where IDFilm=7;
   update Film set �ifraFilma='ANM100A' where IDFilm=8;

update Klijent set IDKlijent= 1 where PrezimeKlijenta= 'Peri�';

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
update Posudba set DatumVra�anja= null where IDPosudba = 7;
select * from Film;
select * from Klijent;
select * from Posudba;
select * from Redatelj;
select * from �anr;

select * from Klijent where Adresa like '%Zagreb';

select * from Klijent where DatumRo�enja < '2000-01-12';
select * from film;

select * from �anr;
select * from film where �anrID= '14';

select * from Posudba;
select * from posudba where DatumVra�anja is null;
select * from film;
select * from �anr;


select ImeKlijenta, PrezimeKlijenta, DatumPosudbe, DatumVra�anja from Klijent
inner join Posudba
on Klijent.IDKlijent=Posudba.KlijentID;


--prika�i popis filmova s �anrom i redateljima

select*from Film;
select * from �anr;
select * from Redatelj;

select NazivFilma, Naziv�anra, ImeREdatelja, PrezimeRedatelja from Film
inner join �anr on Film.�anrID=�anr.ID�anr
inner join Redatelj on Film.RedateljiID=Redatelj.IDRedatelj;

select NazivFilma, Naziv�anra, ImeREdatelja, PrezimeRedatelja from Film
left join �anr on Film.�anrID=�anr.ID�anr
left join Redatelj on Film.RedateljiID=Redatelj.IDRedatelj;

select NazivFilma, Naziv�anra, ImeREdatelja, PrezimeRedatelja from Film
right join �anr on Film.�anrID=�anr.ID�anr
right join Redatelj on Film.RedateljiID=Redatelj.IDRedatelj;

select ImeKlijenta, PrezimeKlijenta, DatumVra�anja, NazivFilma from Klijent
inner join Posudba
on Klijent.IDKlijent=Posudba.KlijentID
inner join Film
on Posudba.FilmID=FIlm.IDFilm;

select ImeKlijenta, PrezimeKlijenta, DatumVra�anja, NazivFilma from Klijent
inner join Posudba
on Klijent.IDKlijent=Posudba.KlijentID
inner join Film
on Posudba.FilmID=FIlm.IDFilm
where DatumVra�anja is null;

select * from film;
select * from �anr;


select ImeRedatelja, PrezimeRedatelja, NazivFilma from Redatelj
inner join Film
on Redatelj.IDRedatelj=Film.RedateljiID
where ImeRedatelja='Chris' and PrezimeRedatelja='Columbs';

select Naziv�anra from �anr
full join Film
on �anr.ID�anr=Film.�anrID
where �anrID is null;

select * from klijent;

update Klijent set PrezimeKlijenta='Topi�' where DatumRo�enja='2000-01-12';

delete From klijent where IDKlijent=7;

select  * from posudba;

update Posudba set DatumVra�anja='2021-10-20' where DatumVra�anja is null;

select * from film;
select * from �anr;

create view vwAvantura AS 
select NazivFilma, Naziv�anra
from Film
inner join �anr
on Film.�anrID=�anr.ID�anr
where Naziv�anra='Avantura';

select * from vwAvantura;
