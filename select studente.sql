select studente.Matricola, esame.MatricolaStudente, esame.Voto, Max(esame.voto) as VotoMassimo, Min(esame.voto) as VotoMinimo, AVG(esame.voto) as VotoMedio

from studente left join esame on studente.Matricola = esame.MatricolaStudente

group by studente.Matricola, esame.MatricolaStudente, esame.Voto 

order by studente.Matricola;

