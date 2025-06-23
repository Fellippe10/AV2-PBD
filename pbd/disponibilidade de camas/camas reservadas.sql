SELECT
    r.id AS id_reserva,
    u.nome AS nome_usuario,
    q.numero AS numero_quarto,
    v.numero_vaga,
    v.descricao_peculiaridades,
    r.data_checkin,
    r.data_checkout,
    r.status_reserva
FROM
    Reservas r
JOIN
    Vagas v ON r.vaga_id = v.id
JOIN
    Quartos q ON v.quarto_id = q.id
JOIN
    Usuarios u ON r.usuario_id = u.id
WHERE
    r.status_reserva IN ('Pendente', 'Confirmada') -- Considera apenas reservas ativas
    AND (
        -- Condição de sobreposição de datas:
        (r.data_checkin < TO_DATE('2025-07-12', 'YYYY-MM-DD') AND r.data_checkout > TO_DATE('2025-07-10', 'YYYY-MM-DD'))
    )
ORDER BY
    r.data_checkin, q.numero, v.numero_vaga;
