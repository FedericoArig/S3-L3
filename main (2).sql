-- create a table
CREATE TABLE STUDENTE(
    Matricola INT,
    Nome VARCHAR(255),
    Citta VARCHAR(255)
);

-- create a table
CREATE TABLE CORSO(
    Codice INT,
    Nome VARCHAR(255),
    MatricolaDocente INT
);

-- create a table
CREATE TABLE DOCENTE(
    Matricola INT,
    Nome VARCHAR(255)
);

-- create a table
CREATE TABLE ESAME(
    Codice INT,
    MatricolaStudente INT,
    Campo_data INT ,
    Voto INT,
    SettoreScientifico VARCHAR(255)
);

-- insert some values 

-- Popola la tabella STUDENTE
INSERT INTO STUDENTE (Matricola, Nome, Citta) VALUES
(1, 'Mario Rossi', 'Roma'),
(2, 'Anna Bianchi', 'Milano'),
(3, 'Luca Verdi', 'Firenze');

-- Popola la tabella CORSO
INSERT INTO CORSO (Codice, Nome, MatricolaDocente) VALUES
(101, 'Matematica', 201),
(102, 'Informatica', 202),
(103, 'Fisica', 203);

-- Popola la tabella DOCENTE
INSERT INTO DOCENTE (Matricola, Nome) VALUES
(201, 'Prof. Rossi'),
(202, 'Prof. Bianchi'),
(203, 'Prof. Verdi');

-- Popola la tabella ESAME
INSERT INTO ESAME (Codice, MatricolaStudente, Campo_data, Voto, SettoreScientifico) VALUES
(1, 1, 20231221, 30, 'Scienze Informatiche'),
(2, 2, 20231222, 29, 'Matematica'),
(3, 3, 20231223, 18, 'Fisica');

#Per ogni studente, visualizzare gli esami sostenuti con voto maggiore di 28 assieme alla matricola dello studente e al nome del docente che ha tenuto il corso.

#unisce le tabelle esame, corso , docente, attraverso chiavi esterne. La funzione e.voto > 28 identifica gli esami sostenuti con voto superiore al 28.

SELECT
    S.Matricola AS MatricolaStudente,
    S.Nome AS NomeStudente,
    E.Voto,
    D.Nome AS NomeDocente
FROM
    STUDENTE S
JOIN
    ESAME E ON S.Matricola = E.MatricolaStudente
JOIN
    CORSO C ON E.Codice = C.Codice
JOIN
    DOCENTE D ON C.MatricolaDocente = D.Matricola
WHERE
    E.Voto > 28;

#Per ogni docente, visualizzare il nome, il nome del corso di cui è titolare e il settore scientifico del corso.

SELECT
    D.Nome AS NomeDocente,
    C.Nome AS NomeCorso,
    D.SettoreScientifico
FROM
    DOCENTE D
JOIN
    CORSO C ON D.Matricola = C.MatricolaDocente
