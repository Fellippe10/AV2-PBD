--Selecionar todos os pagamentos

SELECT p.id, p.reserva_id, p.valor, p.data_pagamento, p.status_pagamento, r.status_reserva
FROM Pagamentos p
JOIN Reservas r ON p.reserva_id = r.id;


--Selecionar pagamento de uma reserva específica

SELECT p.id, p.valor, p.data_pagamento, p.status_pagamento
FROM Pagamentos p
WHERE p.reserva_id = 1;
