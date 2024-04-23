--1.zad
CREATE TABLE ImenaNovkovicAna (
    ime VARCHAR(100),
    naopako_ime VARCHAR(100)
);


CREATE FUNCTION OkreniNaopakoAna(@ulaz VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @rezultat VARCHAR(100);
    SET @rezultat = REVERSE(@ulaz);
    RETURN @rezultat;
END;


CREATE PROCEDURE OkreniNaopako_ProceduraAna
    @ulaz VARCHAR(100)
AS
BEGIN
    DECLARE @naopako VARCHAR(100);
    SET @naopako = REVERSE(@ulaz);
    PRINT 'Naopako ime: ' + @naopako;
END;


CREATE TRIGGER OkreniNaopako_TriggerAna
ON ImenaNovkovicAna
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @ime VARCHAR(100);
    DECLARE @naopako_ime VARCHAR(100);

    SELECT @ime = ime FROM inserted;
    SET @naopako_ime = dbo.OkreniNaopakoAna(@ime);

    INSERT INTO ImenaNovkovicAna (ime, naopako_ime) VALUES (@ime, @naopako_ime);
END;


SELECT dbo.OkreniNaopakoAna('ivan');


EXEC OkreniNaopako_ProceduraAna 'ivan';


INSERT INTO ImenaNovkovicAna (ime) VALUES ('ivan');
SELECT * FROM ImenaNovkovicAna;


--2.zad

CREATE PROCEDURE IzracunajHoroskopskiZnakNovkovic(@datum DATETIME)
AS
BEGIN
    DECLARE @dan INT; 
	  DECLARE @mjesec INT;
    SET @dan = DAY(@datum);
    SET @mjesec = MONTH(@datum);

    IF (@mjesec = 1 AND @dan >= 20) OR (@mjesec = 2 AND @dan <= 18)
        PRINT 'VODENJAK';
    ELSE IF (@mjesec = 2 AND @dan >= 19) OR (@mjesec = 3 AND @dan <= 20)
        PRINT 'RIBA';
    ELSE IF (@mjesec = 3 AND @dan >= 21) OR (@mjesec = 4 AND @dan <= 19)
        PRINT 'OVAN';
    ELSE IF (@mjesec = 4 AND @dan >= 20) OR (@mjesec = 5 AND @dan <= 20)
        PRINT 'BIK';
    ELSE IF (@mjesec = 5 AND @dan >= 21) OR (@mjesec = 6 AND @dan <= 20)
        PRINT 'BLIZANCI';
    ELSE IF (@mjesec = 6 AND @dan >= 21) OR (@mjesec = 7 AND @dan <= 22)
        PRINT 'RAK';
    ELSE IF (@mjesec = 7 AND @dan >= 23) OR (@mjesec = 8 AND @dan <= 22)
        PRINT 'LAV';
    ELSE IF (@mjesec = 8 AND @dan >= 23) OR (@mjesec = 9 AND @dan <= 22)
    	PRINT 'DJEVICA'
	ELSE IF (@mjesec = 8 AND @dan >= 23) OR (@mjesec = 9 AND @dan <= 22)
    	PRINT 'VAGA'
	ELSE IF (@mjesec = 8 AND @dan >= 23) OR (@mjesec = 9 AND @dan <= 22)
    	PRINT 'ŠKORPION'
	ELSE IF (@mjesec = 8 AND @dan >= 23) OR (@mjesec = 9 AND @dan <= 22)
    	PRINT 'STRIJELAC'
	ELSE IF (@mjesec = 8 AND @dan >= 23) OR (@mjesec = 9 AND @dan <= 22)
    	PRINT 'JARAC'
	ELSE IF (@mjesec = 8 AND @dan >= 23) OR (@mjesec = 9 AND @dan <= 22)
    	PRINT 'VODENJAK'
	ELSE IF (@mjesec = 8 AND @dan >= 23) OR (@mjesec = 9 AND @dan <= 22)
    	PRINT 'RIBE'
	
END;

EXEC IzracunajHoroskopskiZnakHR '8/23/2000';
