--kreiranje baze
create database Martina;
use Martina;
--kreiranje tablice
create table U�enik
(ID�ifraU�enik int not null identity (1,1),
Ime nvarchar(30) not null,
Prezime nvarchar (30) not null,
Mjesto nvarchar (30) not null,
constraint U�enik_PK primary key (ID�ifraU�enik));
--dodavanje ograni�enja
alter table U�enik add constraint
U�enik_CHK check(ID�ifraU�enik between 1 and 1000);

select * from U�enik;

create table Aktvivnost
(ID�ifraAktivnosti smallint not null identity (1,1),
Naziv nvarchar(30),
constraint Aktvinost_PK primary key (ID�ifraAktivnosti));

create table Evidencija
(ID�ifraEvidencija int not null identity (1,1),
ID�ifraU�enika int not null,
ID�ifraAktivnost smallint not null,
constraint Evidencija_PK primary key (ID�ifraEvidencija));

--strani klju�
-- upozorenje ne mogu staviti strani klju�
alter table Evidencija
add constraint FK_Evidencija_Aktivnost
foreign key (ID�ifraAktivnosti)
references Aktivnost(ID�ifraAktivnosti);





alter table U�enik add MjestoRo�enja datetime2;
alter table U�enik drop constraint U�enik_CHK;

alter table Aktvivnost add Trajanje smallint;
alter table Aktvivnost add constraint Aktvivnost_CHK check(Trajanje between 2 and 10);
alter table Aktvivnost add Uvjet smallint;
alter table Aktvivnost add constraint Uvjet_CHK check (Uvjet >10);
alter table U�enik alter column Prezime nvarchar(50);
alter table U�enik drop column Mjesto;

--popunjavnje tablica
--brianje tablice
drop table Evidencija;

create table Evidencija(
ID�ifraEvidencija int not null identity(1,1), 
�ifraAktivnostiID smallint not null,
�ifraU�enikaID int not null,
constraint Evidencija_PK primary key(ID�ifraEvidencija));

--foreign key ne mogu ga kreirati!!!!!
alter table Evidencija
constraint FK_Evidencija_Aktvivnost foreign key (�ifraAktivnostiID)
references Aktvivnost(ID�ifraAktivnosti),
constraint FK_Evidencija_U�enik foreign key (�ifraU�enikID)
references U�enik(ID�ifraU�enik);

--popunjavanje tablice
select * from U�enik;
alter table U�enik drop column MjestoRo�enja;
alter table U�enik add DatumRo�enja datetime2;
insert into U�enik
values('Anita', 'Mili�evi�','2004-05-01'),
('Sara','Tamak', '2005-01-12'),
('Marko', 'Gordi�', '2006-08-07'),
('Iva', 'Matan', '2005-09-03'),
('Martina', 'Antunovi�', '2006-07-28'),
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
update U�enik set Ime='Josip' where ID�ifraU�enik =3; 
select * from Aktvivnost;
update Aktvivnost set naziv='Uredsko poslovanje' where Oznaka='R02';
update Aktvivnost set Trajanje=6 where Oznaka='A01';
update Aktvivnost set Uvjet=20 where Oznaka='T01';
delete from Aktvivnost where Oznaka='A02';

select * from u�enik;
select * from U�enik DatumRo�enja like '2004%';
delete from U�enik where DatumRo�enja like'2004%';

