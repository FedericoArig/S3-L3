-- create a table
CREATE TABLE DISCO (
  NroSerie INT,
  TitoloAlbum VARCHAR(255),
  Anno INT,
    Prezzo DECIMAL(10,2)
);

-- create a table
CREATE TABLE CONTIENE(
    NroSerieDisco INT,
    CodiceReg INT,
    NroProg INT
);

-- create a table
CREATE TABLE ESECUZIONE(
    CodiceReg INT,
    TitoloCanz VARCHAR(255),
    Anno INT
);

-- create a table
CREATE TABLE AUTORE(
    Nome VARCHAR(225),
    TitoloCanz VARCHAR(225)
);

-- create a table
CREATE TABLE CANTANTE(
    NomeCantante VARCHAR(225),
    CodiceReg INT 
);
    
-- insert some values
INSERT INTO DISCO(NroSerie,TitoloAlbum,Anno,Prezzo)VALUES
(1,'x2vr',2023,16.99),
(2,'nadie sabe lo que va a pasar manana',2023,20.00),
(3,'il coraggio dei bambini',2023,9.99),
(4,'Santeria',2016,16.99),
(5,'Emanuele',2019,20.00),
(6,'La Divina Commedia',2023,9.00),
(7,'INNOCENTE',2023,11.99);

-- insert some values
INSERT INTO CONTIENE(NroSerieDisco,CodiceReg,NroProg)VALUES
(1, 1, 1),
(2, 2, 1),
(2, 3, 2),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 7, 1);

-- insert some values
INSERT INTO ESECUZIONE( CodiceReg,TitoloCanz,Anno)VALUES
(1,'x2vr',2023),
(2,'nadie sabe lo que va a pasar manana',2023),
(3,'il coraggio dei bambini',2023),
(4,'Santeria',NULL),
(5,'Emanuele',NULL),
(6,'La Divina Commedia',2023),
(7,'INNOCENTE',NULL);

-- insert some values
INSERT INTO AUTORE(Nome,TitoloCanz)VALUES
('SferaEbbasta','Fragile'),
('BadBunny','NADIE SABE'),
('Geolier','IL MALE CHE MI FAI'),
('Marracash & Guè','INSTALOVA'),
('Geolier','Mala'),
('Tedua','La Divina Commedia'),
('Baby Gang','Cella 4');

-- insert some values
INSERT INTO CANTANTE(NomeCantante,CodiceReg)VALUES
('SferaEbbasta',3),
('BadBunny',5),
('Geolier',4),
('Marracash & Guè',1),
('Geolier',7),
('Tedua',2),
('Baby Gang',6);

-- insert some values

SELECT DISTINCT A.Nome
FROM AUTORE A
JOIN ESECUZIONE E ON A.TitoloCanz = E.TitoloCanz
JOIN CANTANTE C ON E.CodiceReg = C.CodiceReg
WHERE A.Nome LIKE 'D%';

-- insert some values
SELECT DISTINCT D.TitoloAlbum FROM DISCO D 
    JOIN CONTIENE C
    ON NroSerie= C. NroSerieDisco
    JOIN ESECUZIONE E ON C.CodiceReg= E.CodiceReg
    WHERE E.Anno IS NULL