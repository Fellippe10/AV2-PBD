--Selecionar todas as vagas

SELECT v.id, v.quarto_id, q.numero AS numero_quarto, v.numero_vaga, v.descricao_peculiaridades, v.disponivel
FROM Vagas v
JOIN Quartos q ON v.quarto_id = q.id;


--Selecionar as vagas por quarto

SELECT v.id, v.numero_vaga, v.descricao_peculiaridades, v.disponivel
FROM Vagas v
WHERE v.quarto_id = (SELECT id FROM Quartos WHERE numero = '101');
