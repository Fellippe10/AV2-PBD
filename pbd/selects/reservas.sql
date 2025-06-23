--Selecionar todas as reservas

SELECT * FROM Reservas r
JOIN Usuarios u ON r.usuario_id = u.id
JOIN Vagas v ON r.vaga_id = v.id
JOIN Quartos q ON v.quarto_id = q.id;


--Selecionar as reservas por quartos 

SELECT * FROM Reservas r
JOIN Vagas v ON r.vaga_id = v.id
JOIN Quartos q ON v.quarto_id = q.id
WHERE r.usuario_id = (SELECT id FROM Usuarios WHERE email = 'joao.silva@email.com');
