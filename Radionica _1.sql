--constraint Učenik_CHK CHECK(IDSifra between 1 and 1000);

select * from Ucenik;

create table Ucenik
(IDSifra int not null identity (1,1),
Ime nvarchar(30) not null,
Prezime nvarchar (30) not null,
Mjesto_rodenja nvarchar (30) not null,
constraint Ucenik_Pk primary key (IDSifra),
constraint Ucenik_CHK check(IDSifra between 1 and 1000));

CREATE TABLE Aktivnost
(IDSifra_aktivnosti int not null identity (1,1),
Naziv nvarchar(30) not null,
constraint Aktivnost_PK primary key (IDSifra_aktivnosti));

create table Evidencija
(IDSifEV int not null identity(1,1),
sifraID int not null,
sifra_aktivnostiID int not null,
constraint Evidencija_PK primary key (IDSifEv),
constraint Evidencija_FK foreign key(sifraID) references Ucenik(IDSifra));

/*msg 2714, Level 16, State 5, Line 25
There is already an object named 'Evidencija_FK' in the database.
Msg 1750, Level 16, State 1, Line 25
Could not create constraint or index. See previous errors.*/
alter table Evidencija 
add constraint Evidencija_FK foreign key(sifra_aktivnostiID) references Aktivnost(IDSifra_aktivnosti);

select * from Evidencija;

alter table Ucenik 
add Datum_rodenja nvarchar (50);

alter table Aktivnost 
add Trajanje time;


alter table Aktivnost 
add Uvjet char(20),
constraint Aktivnost_CHK check (Uvjet>10);

alter table Ucenik alter column Prezime nvarchar(50);
alter table Ucenik drop column Mjesto_rodenja;


-- bez id-a se unose podaci
insert into Ucenik
values ('Anita','Miličević', ' Osijek', '2004-05-01'),('Sara', 'Tamak', 'Zagreb','2005-01-12'),
('Marko', 'Gordić', 'Split', '2006-08-07'),
('Iva', 'Matan', 'Slatina','2005-09-03'),
('Martina', 'Antunović', 'Sisak','2000-07-28'),
('Ivo', 'Lizak','Dubrovnik','2004-12-16');

alter table Evidencija alter
column sifra_aktivnostiID varchar(3);

alter table Aktivnost alter column IDSifra_aktivnosti varchar(3) not null;

insert into Evidencija (sifraID,sifra_aktivnostiID)
values (1, 'A01'),
(2, 'A02'),
(3, 'T01'),
(4, 'R01'),
(5, 'R02'),
(6, 'R03');

drop table ucenik;

alter table Ucenik 
add Datum_rodenja date;

select * from Ucenik;

--uklanjanje ograničenja
alter table Ucenik drop constraint Ucenik_CHK;

alter table Aktivnost drop column ID_sifra;
ALTER TABLE Aktivnost alter column sifra char(3);




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


