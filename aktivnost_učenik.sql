--kreiranje baze
create database SlobodneAktivnosti;
use SlobodneAktivnosti;
--kreiranje tablice
create table Aktivnost
(IDAktivnost int not null identity(1,1),
NazivAktivnosti nvarchar(30),
constraint IAktivnost_PK primary key (IDAktivnost)
);
create table Ucenik
(IDUcenik int not null identity(1,1),
Ime nvarchar(30),
Prezime nvarchar(30),
AktivnostID int,
constraint Ucenik_PK primary key (IDUcenik)
);
--unos podataka
insert into Aktivnost
values ('informatika'), ('robotika'), ('novinarstvo'), ('rukomet'), ('nogomet');

insert into Ucenik
values 
('Iva', 'Aniæ', 1),
('Hrvoje', 'Horvat', 2),
('Marko', 'Iviæ', 3),
('Maja', 'Majiæ', 3),
('Maja', 'Horvat', 6);

select * from Aktivnost;
select * from Ucenik;

select * from aktivnost inner join ucenik on Aktivnost.IDAktivnost = Ucenik.AktivnostID;
select * from aktivnost left join ucenik on Aktivnost.IDAktivnost = Ucenik.AktivnostID;
select * from aktivnost right join ucenik on Aktivnost.IDAktivnost = Ucenik.AktivnostID;
select * from aktivnost full join ucenik on Aktivnost.IDAktivnost = Ucenik.AktivnostID;
select * from aktivnost cross join ucenik;