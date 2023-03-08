--constraint U�enik_CHK CHECK(ID�ifra between 1 and 1000);

select * from U�enik;

create table U�enik
(ID�ifra int not null identity (1,1),
Ime nvarchar(30) not null,
Prezime nvarchar (30) not null,
Mjesto_ro�enja nvarchar (30) not null,
constraint U�enik_Pk primary key (ID�ifra),
constraint U�enik_CHK check(ID�ifra between 1 and 1000));

CREATE TABLE Aktivnost
(ID�ifra_aktivnosti int not null identity (1,1),
Naziv nvarchar(30) not null,
constraint Aktivnost_PK primary key (ID�ifra_aktivnosti));

create table Evidencija
(ID�ifEV int not null identity(1,1),
�ifraID int not null,
�ifra_aktivnostiID int not null,
constraint Evidencija_PK primary key (ID�ifEv),
constraint Evidencija_FK foreign key(�ifraID) references U�enik(ID�ifra));

/*msg 2714, Level 16, State 5, Line 25
There is already an object named 'Evidencija_FK' in the database.
Msg 1750, Level 16, State 1, Line 25
Could not create constraint or index. See previous errors.*/
alter table Evidencija 
add constraint Evidencija_FK foreign key(�ifra_aktivnostiID) references Aktivnost(ID�ifra_aktivnosti);

select * from Evidencija;

alter table U�enik 
add Datum_ro�enja nvarchar (50);

alter table Aktivnost 
add Trajanje time;


alter table Aktivnost 
add Uvjet char(20),
constraint Aktivnost_CHK check (Uvjet>10);

alter table U�enik alter column Prezime nvarchar(50);
alter table U�enik drop column Mjesto_ro�enja;


-- bez id-a se unose podaci
insert into U�enik
values ('Anita','Mili�evi�', ' Osijek', '2004-05-01'),('Sara', 'Tamak', 'Zagreb','2005-01-12'),
('Marko', 'Gordi�', 'Split', '2006-08-07'),
('Iva', 'Matan', 'Slatina','2005-09-03'),
('Martina', 'Antunovi�', 'Sisak','2000-07-28'),
('Ivo', 'Lizak','Dubrovnik','2004-12-16');

alter table Evidencija alter
column �ifra_aktivnostiID varchar(3);

alter table Aktivnost alter column ID�ifra_aktivnosti varchar(3) not null;

insert into Evidencija (�ifraID,�ifra_aktivnostiID)
values (1, 'A01'),
(2, 'A02'),
(3, 'T01'),
(4, 'R01'),
(5, 'R02'),
(6, 'R03');

drop table u�enik;

alter table U�enik 
add Datum_ro�enja date;

select * from U�enik;

--uklanjanje ograni�enja
alter table U�enik drop constraint U�enik_CHK;

alter table Aktivnost drop column ID_�ifra;
ALTER TABLE Aktivnost alter column �ifra char(3);




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


