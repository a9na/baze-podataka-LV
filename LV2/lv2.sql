CREATE TABLE grupeNovkovic (
    id_grupe INT PRIMARY KEY,
    oznaka_grupe VARCHAR(50) UNIQUE,
    smjer VARCHAR(50),
    broj_studenata INT
);

CREATE TABLE studentNovkovic (
    br_indeksa INT PRIMARY KEY,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    grupa INT,
    godina_upisa INT,
    godina_studija INT,
    FOREIGN KEY (grupa) REFERENCES grupeNovkovic(id_grupe)
);

ALTER TABLE studentNovkovic
ADD prosjek FLOAT CHECK (prosjek >= 1);

ALTER TABLE studentNovkovic
DROP COLUMN godina_studija;

CREATE TABLE tel_imenikNovkovic (
    broj_telefona VARCHAR(15),
    ime VARCHAR(50),
    prezime VARCHAR(50),
    email_adresa VARCHAR(100),
    datum_unosa DATE,
    PRIMARY KEY (broj_telefona, prezime)
);

CREATE INDEX idx_prosjekNovkovic ON studentNovkovic (prosjek DESC);

CREATE UNIQUE INDEX idx_tel_imenikNovkovic ON tel_imenikNovkovic (broj_telefona, datum_unosa);
