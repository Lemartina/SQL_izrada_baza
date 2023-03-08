select Ime, Prezime, NazivRazreda from Ucenik inner join RazredniOdjel
on Ucenik.RazredID = RazredniOdjel.IDRazred;
select * from Ucenik;
select * from RazredniOdjel;

select Ime, Prezime,ImeRazrednika, PrezimeRazrednika from Ucenik inner join RazredniOdjel
on Ucenik.RazredID= RazredniOdjel.IDRazred
where (Ime='Marko') and (Prezime='Markiæ');

select Ime,Prezime, NazivRazreda from Ucenik inner join RazredniOdjel
on Ucenik.RazredID = RazredniOdjel.IDRazred
Where (NazivRazreda = '1.c' or NazivRazreda = '2.c') and ime like 'A%';

select * from Ucenik inner join RazredniOdjel
on Ucenik.RazredID = RazredniOdjel.IDRazred
where NazivRazreda= '1.c' and Prosjek>3.5 order by ime desc;

UPDATE Ucenik SET MjestoRodjenja='Zagreb' where oib=34567891011;

Update Ucenik set MjestoRodjenja='Rijeka'
where oib=23456789101;

delete from ucenik where oib=34567891011;

insert into ucenik values ('Marko', 'Markiæ', 34567891011, 'Splitska ulica 1', 3, 3.78, 'mmarkic@gmail.com', 'Zagreb');










