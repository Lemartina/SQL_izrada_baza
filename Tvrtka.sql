create database Tvrtka
use Tvrtka

create table zaposlenik(
idzap int not null primary key,
ime nvarchar (50) not null,
prezime nvarchar(50) not null,
placaid int not null,
radnomjestoid int not null)


alter table zaposlenik add constraint  fk_zaposlenik_placa foreign key
(placaid) references placa(idplaca)

create table placa(
idplaca int not null primary key,
iznos decimal(18,2))

create table radnomjesto(
idradnomjesto int not null primary key,
naziv nvarchar(100))

alter table zaposlenik add constraint fk_zaposlenik_radnomjesto foreign key(radnomjestoid)
references radnomjesto(idradnomjesto)

select * from zaposlenik


select * from radnomjesto

insert into radnomjesto(idradnomjesto, naziv)
values
(1,'prodavaè'),
(2,'programer'),
(3,'konultant'),
(4,'direktor');

select * from placa


insert into placa (idplaca, iznos)
values
(1, 5000),
(2, 4500),
(3, 3000),
(4, 1500),
(5, 7000),
(6, 9000);

select * from zaposlenik


insert into zaposlenik (idzap, ime, prezime, placaid, radnomjestoid)
values
(1,'Marko','Markoviæ',1,4),
(2,'Ivan','Manji',2,4),
(3,'Ana','Janji',3,3),
(4,'Ivna','Horvat',4,2),
(5,'Marina','Markoviæ',5,1),
(6,'Josipa','Jankoviæ',6,4),
(7,'Ivanka','Smiæ',6,2),
(8,'Jadranka','Sniniæ',5,3),
(9,'Iva','Joviæ',4,1),
(10,'Marko','Diliæ',3,2);

select * from placa
select * from radnomjesto



--popis zaposlenih s iznosom plaæe i nazivom radnog mjesta

select
a.ime, a.prezime, b.iznos as iznosplace,c.naziv
from
zaposlenik a
inner join placa b
on a.placaid=b.idplaca
inner join radnomjesto c
on a.radnomjestoid=c.idradnomjesto
where c.naziv ='direktor'
and b.iznos<9000


-- zbroj svih plaæa
select 
sum(iznos) as ukunpnoplace
from placa


-- zbroj svih plaæa
select 
sum(iznos) as ukunpnoplace
from placa

-- prosjek svih plaæa
select 
avg(iznos) as prosjekplace
from placa

select 
count(*) 
from placa

select 
*
from placa

select * from radnomjesto
select * from zaposlenik
where radnomjestoid ='4'


update zaposlenik
set radnomjestoid='2'
where idzap in (1,2)



SELECT * FROM zapslenik
GROUP BY posao

select
a.ime, 
a.prezime, 
c.naziv, 
b.iznos
from
zaposlenik a
inner join placa b
on a.placaid=b.idplaca
inner join radnomjesto c
on a.radnomjestoid=c.idradnomjesto
where c.naziv='programer'

select * from zaposlenik
select * from radnomjesto

--============================================================
--AGREATNE FUNKACIJE
--=============================================================

-- Prosjek plaæe po radnom mjestu
SELECT b.naziv,
COUNT(a.ime) AS 'Broj zaposlenih',
avg(c.iznos) as 'Prosjek plaæe po radnom mjestu'
FROM zaposlenik a, radnomjesto b, placa c
WHERE a.radnomjestoid = b.idradnomjesto
and a.placaid=c.idplaca
GROUP BY b.naziv
order by 'Prosjek plaæe po radnom mjestu'


-- godišnji iznos plaæe
SELECT 
min(b.naziv) as 'Naziv radnog mjesta',
c.iznos AS 'Mjesecni iznos',
c.iznos * 12 as 'Godisnji iznos'
FROM zaposlenik a, radnomjesto b, placa c
WHERE a.radnomjestoid = b.idradnomjesto
and a.placaid=c.idplaca
GROUP BY c.iznos, c.iznos * 12

-- godišnji iznos plaæe veæi od 60000 eura
SELECT 
min(b.naziv) as 'Naziv radnog mjesta',
c.iznos AS 'Mjesecni iznos',
c.iznos * 12 as 'Godisnji iznos'
FROM zaposlenik a, radnomjesto b, placa c
WHERE a.radnomjestoid = b.idradnomjesto
and a.placaid=c.idplaca
GROUP BY c.iznos, c.iznos * 12
having c.iznos*12>60000


