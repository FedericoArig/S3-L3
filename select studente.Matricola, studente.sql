select studente.Matricola, studente.NomeStudente, studente.VotoLaurea, partecipaconcorsomaster.MatricolaStudente, partecipaconcorsomaster.CodiceMaster, partecipaconcorsomaster.DataInvioDomanda

from studente

left join partecipaconcorsomaster

on studente.Matricola = partecipaconcorsomaster.MatricolaStudente

where

studente.VotoLaurea > 100