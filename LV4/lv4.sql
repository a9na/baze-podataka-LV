--1. Zadatak
--inicijali i god. rod.
SELECT SUBSTRING (ime,1,1) + SUBSTRING (prezime,1,1) AS inicjal, year(datRod) AS god
FROM student;

--od najstarijeg do najmladeg
SELECT * FROM student
ORDER BY datRod;

-- najstarija zenska studentica
SELECT TOP 1 ime, prezime FROM student
WHERE spol='F'
ORDER BY datRod;

--2.zadatak
SELECT COUNT(*) AS
ukupan_broj_studenata
FROM student;

SELECT COUNT(DISTINCT pbrPreb) AS
broj_razlicitih_mjesta
FROM student;

--3. Zadatak
SELECT AVG(ocjena) AS
prosjecna_ocjena
FROM ispit
WHERE ocjena >=2;

--4. Zadatak
SELECT s.ime, s.prezime, CAST(AVG(i.ocjena) AS DECIMAL(10,2)) AS prosjecnaOcjena
FROM student s
JOIN ispit i ON s.mbr = i.mbrStud
WHERE i.ocjena>1
GROUP BY s.ime, s.prezime
ORDER BY prosjecnaOcjena DESC;

SELECT s.mbr
FROM student s
JOIN ispit i ON s.mbr = i.mbrStud
WHERE i.ocjena >1
GROUP BY s.mbr
HAVING AVG(i.ocjena)>2.5;

--5. Zadatak
CREATE VIEW pogledIspitNovkovic AS
SELECT s.ime AS imeStudenta, s.prezime AS prezimeStudenta, p.naziv, i.ocjena, i.datIspita
FROM ispit i
JOIN student s ON i.mbrStud = s.mbr
JOIN predmet p ON i.sifPredmeta = p.sifra;
