-- Selecionar todos os quartos

SELECT id, numero, capacidade, tem_banheiro, tipo_quarto FROM Quartos;


-- Selecionar um quarto em específico

SELECT id, numero, capacidade, tem_banheiro, tipo_quarto FROM Quartos
WHERE id = 1;
