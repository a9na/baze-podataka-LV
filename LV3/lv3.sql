CREATE TABLE novkovic_3_osobe_2(
ime VARCHAR(20),
prezime VARCHAR(20),
jmbg VARCHAR(15) PRIMARY KEY,
datum_rod SMALLDATETIME,
spol VARCHAR(1),
visina SMALLINT,
broj_cipela SMALLINT,
);
 
INSERT INTO novkovic_3_osobe2 (ime, prezime, jmbg, datum_rod, spol, visina, broj_cipela) VALUES 
('Ivica', 'Ivic', 123, '10.10.2001', 'M', 180, 40),
('Ana', 'Anic', 234, '11.11.2002', 'Z', 165, 38),
('Mia', 'Mijic', 345, '12.01.2003', 'Z', 170, 39),
('Marko', 'Markic', 456, '02.15.2003', 'M', 180, 42),
('Petra', 'Petric', 567, '04.13.2002', 'Z', 160, 37);
 
UPDATE novkovic_3_osobe2 SET ime = 'Lana', prezime = 'Lanic' WHERE jmbg = 234;
UPDATE novkovic_3_osobe2 SET broj_cipela = broj_cipela + 1;
DELETE FROM novkovic_3_osobe2 WHERE jmbg = 345;
 
SELECT * FROM novkovic_3_osobe2;
 
SELECT * FROM student ORDER BY DatUpis ASC;
SELECT ime AS Ime, prezime AS Prezime FROM student WHERE DatRod < '1994-01-01';
 
SELECT ime, prezime, naziv FROM ispit, student, predmet WHERE sifPredmeta=sifra AND ocjena>=4 AND mbr=mbrStud;
 
SELECT * FROM mjesto ORDER BY Pbr ASC;
