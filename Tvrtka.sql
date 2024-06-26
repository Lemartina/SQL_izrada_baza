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
(1,'prodava�'),
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
(1,'Marko','Markovi�',1,4),
(2,'Ivan','Manji',2,4),
(3,'Ana','Janji',3,3),
(4,'Ivna','Horvat',4,2),
(5,'Marina','Markovi�',5,1),
(6,'Josipa','Jankovi�',6,4),
(7,'Ivanka','Smi�',6,2),
(8,'Jadranka','Snini�',5,3),
(9,'Iva','Jovi�',4,1),
(10,'Marko','Dili�',3,2);

select * from placa
select * from radnomjesto



--popis zaposlenih s iznosom pla�e i nazivom radnog mjesta

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


-- zbroj svih pla�a
select 
sum(iznos) as ukunpnoplace
from placa


-- zbroj svih pla�a
select 
sum(iznos) as ukunpnoplace
from placa

-- prosjek svih pla�a
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

-- Prosjek pla�e po radnom mjestu
SELECT b.naziv,
COUNT(a.ime) AS 'Broj zaposlenih',
avg(c.iznos) as 'Prosjek pla�e po radnom mjestu'
FROM zaposlenik a, radnomjesto b, placa c
WHERE a.radnomjestoid = b.idradnomjesto
and a.placaid=c.idplaca
GROUP BY b.naziv
order by 'Prosjek pla�e po radnom mjestu'


-- godi�nji iznos pla�e
SELECT 
min(b.naziv) as 'Naziv radnog mjesta',
c.iznos AS 'Mjesecni iznos',
c.iznos * 12 as 'Godisnji iznos'
FROM zaposlenik a, radnomjesto b, placa c
WHERE a.radnomjestoid = b.idradnomjesto
and a.placaid=c.idplaca
GROUP BY c.iznos, c.iznos * 12

-- godi�nji iznos pla�e ve�i od 60000 eura
SELECT 
min(b.naziv) as 'Naziv radnog mjesta',
c.iznos AS 'Mjesecni iznos',
c.iznos * 12 as 'Godisnji iznos'
FROM zaposlenik a, radnomjesto b, placa c
WHERE a.radnomjestoid = b.idradnomjesto
and a.placaid=c.idplaca
GROUP BY c.iznos, c.iznos * 12
having c.iznos*12>60000

--===========================================
----INSERT � kopiranje tablica
--===========================================

create table kopijapl(
id int not null primary key,
bruto decimal(18,2))

select * from kopijapl
select * from placa


use Tvrtka

INSERT INTO kopijapl(id,bruto)
SELECT idplaca, iznos
FROM placa
WHERE idplaca between 2 and 5

--===========================================
----update � podupiti 
--===========================================
--Promijeniti posao zaposlenika 1654 u tablici zapos2 tako da bude isti
--kao kod zaposlenika br. 1345 iza tablice zapos

select * from zaposlenik
select * from placa

-- pove�anje pla�e

update  placa
set iznos=iznos*2
FROM zaposlenik a, radnomjesto b, placa c
WHERE a.radnomjestoid = b.idradnomjesto
and a.placaid=c.idplaca

select distinct (b.naziv), sum(c.iznos) as [iznos tro�ka]
FROM zaposlenik a, radnomjesto b, placa c
WHERE a.radnomjestoid = b.idradnomjesto
and a.placaid=c.idplaca
group by b.naziv

select a.ime, a.prezime, b.naziv, c.iznos
FROM zaposlenik a
inner join radnomjesto b
on a.radnomjestoid = b.idradnomjesto
inner join placa c
on a.placaid=c.idplaca
where b.naziv= 'programer'



-- pove�ati pla�u 2x za progremere

update placa 
set iznos = iznos *2
FROM placa a
inner join zaposlenik b
on a.idplaca = b.placaid
inner join radnomjesto c
on b.radnomjestoid=c.idradnomjesto
where c.naziv= 'programer'


--pove�ati pla�u svima *2

update placa
set iznos=iznos/2 


--==============================================
--Delete 
--==============================================

select * from zaposlenik
where idzap=10

delete from zaposlenik
where idzap=10

--===================================
--Subsquery
--===================================


--ispisati zaposlenike koji imaju ve�i dohodak od Ane 

select a.ime, a.prezime, b.iznos from
zaposlenik a
inner join 
placa b 
on a.placaid=b.idplaca
where idplaca > (
select placaid from zaposlenik where ime='ana')



--- zaposleni koji imaju pla�u ve�u prosjeka

select a.ime, a.prezime, b.iznos from zaposlenik a
inner join
placa b
on a.placaid=b.idplaca
where b.iznos >(
select avg(iznos) from placa)

--===============================
--indexi
--===============================

CREATE INDEX zap
ON zaposlenik (placaid, radnomjestoid)

--===============================
--transakcije
--===============================

select * from zaposlenik
where ime='ANA'

begin transaction
update zaposlenik
set ime='Ivana'
where ime='Ana'

save tran savepointA
select * from zaposlenik 
where idzap=3

update zaposlenik
set ime='�ana'
where ime='Ivana'

save tran savepointB
select * from zaposlenik 
where idzap=3

rollback tran savepointB

select * from zaposlenik 
where idzap=3

commit tran



create view  pregleddj as
SELECT dbo.zaposlenik.ime, dbo.zaposlenik.prezime, dbo.placa.iznos, dbo.radnomjesto.naziv
FROM     dbo.zaposlenik INNER JOIN
                  dbo.radnomjesto ON dbo.zaposlenik.radnomjestoid = dbo.radnomjesto.idradnomjesto INNER JOIN
                  dbo.placa ON dbo.zaposlenik.placaid = dbo.placa.idplaca

 select * from pregleddj

 --============================================
 --Privremene tablice
 --============================================

 SELECT dbo.radnomjesto.naziv, dbo.placa.iznos
 into #placaProgremera
FROM     dbo.placa INNER JOIN
                  dbo.zaposlenik ON dbo.placa.idplaca = dbo.zaposlenik.placaid INNER JOIN
                  dbo.radnomjesto ON dbo.zaposlenik.radnomjestoid = dbo.radnomjesto.idradnomjesto
				  where dbo.radnomjesto.naziv= 'programer'

SELECT * from #placaProgremera


--Procedura

create or alter procedure 
placa_novo
@noviiznos decimal (18,2)
as
select * from placa
where iznos= @noviiznos

exec placa_novo @noviiznos='5000'


--Triger


create trigger podsjetnik
on zaposlenik
for insert
as 
print 'Dodan je novi zaposlenik'

CREATE TRIGGER NoviTriger
   ON  Placa
   for UPDATE
AS 
print
	'A�urirana je pla�a postoje�eg djelatnika'



select * from zaposlenik
insert into zaposlenik
values (11,'Maja', 'Markovi�',1,2)

select * from placa

update placa
set iznos='5000'
where idplaca='4'