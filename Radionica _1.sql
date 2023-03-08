--constraint Uèenik_CHK CHECK(IDŠifra between 1 and 1000);

select * from Uèenik;

create table Uèenik
(IDŠifra int not null identity (1,1),
Ime nvarchar(30) not null,
Prezime nvarchar (30) not null,
Mjesto_roðenja nvarchar (30) not null,
constraint Uèenik_Pk primary key (IDŠifra),
constraint Uèenik_CHK check(IDŠifra between 1 and 1000));

CREATE TABLE Aktivnost
(IDŠifra_aktivnosti int not null identity (1,1),
Naziv nvarchar(30) not null,
constraint Aktivnost_PK primary key (IDŠifra_aktivnosti));

create table Evidencija
(IDŠifEV int not null identity(1,1),
ŠifraID int not null,
Šifra_aktivnostiID int not null,
constraint Evidencija_PK primary key (IDŠifEv),
constraint Evidencija_FK foreign key(ŠifraID) references Uèenik(IDŠifra));

/*msg 2714, Level 16, State 5, Line 25
There is already an object named 'Evidencija_FK' in the database.
Msg 1750, Level 16, State 1, Line 25
Could not create constraint or index. See previous errors.*/
alter table Evidencija 
add constraint Evidencija_FK foreign key(Šifra_aktivnostiID) references Aktivnost(IDŠifra_aktivnosti);

select * from Evidencija;

alter table Uèenik 
add Datum_roðenja nvarchar (50);

alter table Aktivnost 
add Trajanje time;


alter table Aktivnost 
add Uvjet char(20),
constraint Aktivnost_CHK check (Uvjet>10);

alter table Uèenik alter column Prezime nvarchar(50);
alter table Uèenik drop column Mjesto_roðenja;


-- bez id-a se unose podaci
insert into Uèenik
values ('Anita','Milièeviæ', ' Osijek', '2004-05-01'),('Sara', 'Tamak', 'Zagreb','2005-01-12'),
('Marko', 'Gordiæ', 'Split', '2006-08-07'),
('Iva', 'Matan', 'Slatina','2005-09-03'),
('Martina', 'Antunoviæ', 'Sisak','2000-07-28'),
('Ivo', 'Lizak','Dubrovnik','2004-12-16');

alter table Evidencija alter
column Šifra_aktivnostiID varchar(3);

alter table Aktivnost alter column IDŠifra_aktivnosti varchar(3) not null;

insert into Evidencija (ŠifraID,Šifra_aktivnostiID)
values (1, 'A01'),
(2, 'A02'),
(3, 'T01'),
(4, 'R01'),
(5, 'R02'),
(6, 'R03');

drop table uèenik;

alter table Uèenik 
add Datum_roðenja date;

select * from Uèenik;

--uklanjanje ogranièenja
alter table Uèenik drop constraint Uèenik_CHK;

alter table Aktivnost drop column ID_šifra;
ALTER TABLE Aktivnost alter column Šifra char(3);




select * from Aktivnost;



insert into Aktivnost (Naziv)
values ('Osnove rada'),
('Microsoft word'),
('Uvod u SQL'),
('Upotrba IT-a'),
('Poslovna informatika'),
('Grafika');

drop table Aktivnost;


select * from Evidencija;





);


