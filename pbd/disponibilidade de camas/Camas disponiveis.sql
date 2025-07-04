SELECT
    v.id AS vaga_id,
    q.numero AS numero_quarto,
    v.numero_vaga,
    q.tem_banheiro,
    q.tipo_quarto,
    v.descricao_peculiaridades
FROM
    Vagas v
JOIN
    Quartos q ON v.quarto_id = q.id
WHERE
    v.disponivel = 1 -- A vaga deve estar marcada como disponível (1 para TRUE)
    AND NOT EXISTS (
        SELECT 1
        FROM Reservas r
        WHERE
            r.vaga_id = v.id
            AND r.status_reserva IN ('Pendente', 'Confirmada') -- Considera reservas ativas
            AND (
                -- Condição de sobreposição de datas:
                -- A reserva atual começa antes ou no dia que o usuário quer sair,
                -- E a reserva atual termina depois ou no dia que o usuário quer entrar.
                (r.data_checkin < TO_DATE('2025-07-12', 'YYYY-MM-DD') AND r.data_checkout > TO_DATE('2025-07-10', 'YYYY-MM-DD'))
            )
    );
