select * from popis_ucenka;
select * from Ucenik;
select * from RazredniOdjel;
select * from opci_podaci;
select * from M_imena;

create view vwPopisUcenikPoRazredima 
AS 
select ucenik.Ime, ucenik.Prezime,RazredniOdjel.NazivRazreda from Ucenik inner join RazredniOdjel
on Ucenik.RazredID=RazredniOdjel.IDRazred;

select * from vwPopisUcenikPoRazredima;

create view vwPopisUcenik1c
as
select Ucenik.Ime, Ucenik.Prezime, RazredniOdjel.NazivRazreda
from Ucenik inner join RazredniOdjel
on Ucenik.RazredID=RazredniOdjel.IDRazred
where RazredniOdjel.NazivRazreda='1.c';

SELECT * FROM vwPopisUcenik1c;

insert into Ucenik (Ime, Prezime, OIB, Adresa, RazredID, Prosjek, Email, MjestoRodjenja) 
values ('Lana', 'Horvat', '05678901234', 'Zagrebaèka 15', 1, 3.20, 'lana.horvat@skole.hr', 'Split');


select * from Ucenik;
select Ime,Prezime, round(Prosjek,0) as 'Opæi uspjeh' from Ucenik;