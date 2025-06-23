
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `tipo_usuario` enum('HOSPEDE','ADMINISTRADOR') NOT NULL DEFAULT 'HOSPEDE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `usuarios` (`id_usuario`, `nome`, `email`, `senha`, `telefone`, `tipo_usuario`) VALUES
(1, 'Pedro Alcântara', 'pedro.a@albergue.com', 'senha_pedro_123', '21987650001', 'HOSPEDE'),
(2, 'Lívia Bastos', 'livia.b@albergue.com', 'senha_livia_456', '21987650002', 'HOSPEDE'),
(3, 'Fernando Dantas', 'fernando.d@albergue.com', 'senha_fer_789', '21987650003', 'HOSPEDE'),
(4, 'Sofia Guedes', 'sofia.g@albergue.com', 'senha_sofia_101', '21987650004', 'HOSPEDE'),
(5, 'Ricardo Nunes', 'ricardo.n@albergue.com', 'senha_ric_112', '21987650005', 'HOSPEDE'),
(6, 'Clara Oliveira', 'clara.o@albergue.com', 'senha_clara_131', '21987650006', 'HOSPEDE'),
(7, 'Marcos Vinicius', 'marcos.v@albergue.com', 'senha_marcos_141', '21987650007', 'HOSPEDE'),
(8, 'Julia Azevedo', 'julia.a@albergue.com', 'senha_julia_151', '21987650008', 'HOSPEDE'),
(9, 'Gustavo Barros', 'gustavo.b@albergue.com', 'senha_guga_161', '21987650009', 'HOSPEDE'),
(10, 'Beatriz Cardoso', 'beatriz.c@albergue.com', 'senha_bia_171', '21987650010', 'HOSPEDE'),
(11, 'Administrador Master', 'admin@albergue.com', 'senha_admin_master', '21900000000', 'ADMINISTRADOR');


CREATE TABLE `quartos` (
  `id_quarto` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `capacidade` int(11) NOT NULL,
  `tem_banheiro` tinyint(1) NOT NULL,
  `tipo_quarto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `quartos` (`id_quarto`, `numero`, `capacidade`, `tem_banheiro`, `tipo_quarto`) VALUES
(1, '101', 4, 1, 'Quatro Vagas'),
(2, '102', 4, 1, 'Quatro Vagas'),
(3, '201', 8, 0, 'Oito Vagas'),
(4, '202', 8, 0, 'Oito Vagas'),
(5, '301', 12, 1, 'Doze Vagas');


CREATE TABLE `vagas` (
  `id_vaga` int(11) NOT NULL,
  `fk_quarto` int(11) NOT NULL,
  `numero_vaga` int(11) NOT NULL,
  `descricao_peculiaridades` text DEFAULT NULL,
  `disponivel` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `vagas` (`id_vaga`, `fk_quarto`, `numero_vaga`, `descricao_peculiaridades`, `disponivel`) VALUES
(1, 1, 1, 'Cama beliche superior, perto da janela, sol da manhã', 1),
(2, 1, 2, 'Cama beliche inferior, perto da porta', 1),
(3, 1, 3, 'Cama individual, vista para o quintal', 1),
(4, 1, 4, 'Cama individual, mais reservada', 1),
(5, 2, 1, 'Cama beliche superior', 1),
(6, 2, 2, 'Cama beliche inferior', 1),
(7, 3, 1, 'Cama beliche superior, quarto sem sol', 1),
(8, 3, 2, 'Cama beliche inferior, quarto sem sol', 1),
(9, 3, 3, 'Cama beliche superior', 1),
(10, 3, 4, 'Cama beliche inferior', 1),
(11, 4, 1, 'Cama beliche superior', 1),
(12, 4, 2, 'Cama beliche inferior', 1),
(13, 5, 1, 'Cama beliche superior, banheiro no quarto', 1),
(14, 5, 2, 'Cama beliche inferior, banheiro no quarto', 1);


CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL,
  `fk_usuario` int(11) NOT NULL,
  `fk_vaga` int(11) NOT NULL,
  `data_checkin` date NOT NULL,
  `data_checkout` date NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `data_reserva` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_reserva` enum('PENDENTE','CONFIRMADA','CANCELADA','CONCLUIDA') NOT NULL DEFAULT 'PENDENTE',
  `metodo_pagamento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `reservas` (`id_reserva`, `fk_usuario`, `fk_vaga`, `data_checkin`, `data_checkout`, `valor_total`, `data_reserva`, `status_reserva`, `metodo_pagamento`) VALUES
(1, 1, 1, '2025-07-01', '2025-07-05', 260.00, '2025-06-20 09:00:00', 'CONFIRMADA', 'Cartão de Crédito'),
(2, 2, 7, '2025-07-03', '2025-07-07', 200.00, '2025-06-21 10:30:00', 'PENDENTE', 'Cartão de Crédito'),
(3, 3, 3, '2025-07-10', '2025-07-12', 130.00, '2025-06-22 14:00:00', 'CONFIRMADA', 'Cartão de Crédito'),
(4, 4, 13, '2025-07-15', '2025-07-18', 135.00, '2025-06-22 18:45:00', 'PENDENTE', 'Cartão de Crédito'),
(5, 5, 2, '2025-07-20', '2025-07-21', 65.00, '2025-06-23 08:00:00', 'CONFIRMADA', 'Cartão de Crédito');


CREATE TABLE `pagamentos` (
  `id_pagamento` int(11) NOT NULL,
  `fk_reserva` int(11) UNIQUE NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_pagamento` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_pagamento` enum('APROVADO','NEGADO','PENDENTE') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `pagamentos` (`id_pagamento`, `fk_reserva`, `valor`, `data_pagamento`, `status_pagamento`) VALUES
(1, 1, 260.00, '2025-06-20 09:05:00', 'APROVADO'),
(2, 3, 130.00, '2025-06-22 14:05:00', 'APROVADO'),
(3, 5, 65.00, '2025-06-23 08:05:00', 'APROVADO');


ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);


ALTER TABLE `quartos`
  ADD PRIMARY KEY (`id_quarto`),
  ADD UNIQUE KEY `numero` (`numero`);


ALTER TABLE `vagas`
  ADD PRIMARY KEY (`id_vaga`),
  ADD KEY `fk_vaga_quarto` (`fk_quarto`);


ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `fk_reserva_usuario` (`fk_usuario`),
  ADD KEY `fk_reserva_vaga` (`fk_vaga`);


ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD UNIQUE KEY `fk_reserva` (`fk_reserva`);


ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


ALTER TABLE `quartos`
  MODIFY `id_quarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `vagas`
  MODIFY `id_vaga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;


ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `pagamentos`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `vagas`
  ADD CONSTRAINT `fk_vaga_quarto` FOREIGN KEY (`fk_quarto`) REFERENCES `quartos` (`id_quarto`);


ALTER TABLE `reservas`
  ADD CONSTRAINT `fk_reserva_usuario` FOREIGN KEY (`fk_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `fk_reserva_vaga` FOREIGN KEY (`fk_vaga`) REFERENCES `vagas` (`id_vaga`);


ALTER TABLE `pagamentos`
  ADD CONSTRAINT `fk_pagamento_reserva` FOREIGN KEY (`fk_reserva`) REFERENCES `reservas` (`id_reserva`);
COMMIT;
