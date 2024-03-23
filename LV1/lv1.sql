CREATE TABLE RacunaloNovkovic(
inv_broj SMALLINT PRIMARY KEY,
tip VARCHAR(20),
ram SMALLINT,
hdd SMALLINT,
monitor DECIMAL(4,2),
mis VARCHAR(20),
tipkovnica VARCHAR(20),
mreza CHAR(2) DEFAULT 'DA',
modem CHAR(2) DEFAULT 'DA',
grafika VARCHAR(20),
);

CREATE TABLE smartphoneNovkovic (
inv_broj SMALLINT PRIMARY KEY,
naziv_proiz VARCHAR(40),
naziv_model VARCHAR(40),
memorija_kolicina SMALLINT,
brzina_procesora DECIMAL(3,2),
velicina_ekrana SMALLINT,
naziv_OS VARCHAR(20),
datum_nadogradnje DATETIME,
ime_korisnika VARCHAR(20),
prezime_korisnika VARCHAR(20),
);


CREATE TABLE auto_Radionica_Novkovic (
ser_broj SMALLINT PRIMARY KEY,
naziv_marke VARCHAR(20) NOT NULL,
naziv_modela VARCHAR(20) NOT NULL,
kolicina SMALLINT NOT NULL,
cijena SMALLINT NOT NULL,
boja VARCHAR(20),
godiste DATETIME NOT NULL,
lokacija VARCHAR(20),
CONSTRAINT chk_kolicina_Novkovic CHECK(kolicina >= 0),
CONSTRAINT chk_cijena_Novkovic CHECK(CIJENA >= 0)
);

CREATE TABLE djelatnik_Novkovic (
mat_br SMALLINT PRIMARY KEY,
ime VARCHAR(20),
prezime VARCHAR(20)
);

CREATE TABLE projekt_Novkovic (
oznaka VARCHAR(20) PRIMARY KEY,
naziv VARCHAR(20)
);

CREATE TABLE radi_Novkovic (
broj_dana  SMALLINT,
mat_br SMALLINT,
oznaka VARCHAR(20),
CONSTRAINT fr_key_novkovic1 FOREIGN KEY (mat_br) REFERENCES djelatnik_Novkovic(mat_br),
CONSTRAINT fr_key_novkovic3 FOREIGN KEY (oznaka) REFERENCES projekt_Novkovic (oznaka),
CONSTRAINT pr_key_novkovic1 PRIMARY KEY (mat_br, oznaka)
);
