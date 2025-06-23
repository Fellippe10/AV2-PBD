Entidades e Atributos


-USUARIOS

id: Identificador único do usuário (chave primária).
nome: Nome completo do usuário.
email: Endereço de e-mail do usuário (único).
senha: Senha do usuário (hash).
telefone: Número de telefone do usuário.
tipo_usuario: Tipo de usuário (ex: "Hospede", "Administrador").


-QUARTOS

id: Identificador único do quarto (chave primária).
numero: Número ou identificação do quarto (único).
capacidade: Número total de vagas disponíveis no quarto.
tem_banheiro: Booleano indicando se o quarto possui banheiro (Verdadeiro/Falso).
tipo_quarto: Descrição do tipo de quarto (ex: "Quatro Vagas", "Oito Vagas", "Doze Vagas").


-VAGAS

id: Identificador único da vaga (chave primária).
quarto_id: Chave estrangeira para a entidade QUARTOS.
numero_vaga: Número sequencial da vaga dentro do quarto (ex: 1, 2, 3).
descricao_peculiaridades: Detalhes específicos da vaga (ex: "Cama beliche superior", "perto da janela", "sol da manhã", "quarto não pega sol").
disponivel: Booleano indicando se a vaga está atualmente disponível para reserva (Verdadeiro/Falso).


-RESERVAS

id: Identificador único da reserva (chave primária).
usuario_id: Chave estrangeira para a entidade USUARIOS.
vaga_id: Chave estrangeira para a entidade VAGAS.
data_checkin: Data de início da reserva (meio-dia).
data_checkout: Data de término da reserva (meio-dia).
valor_total: Valor total da reserva.
data_reserva: Timestamp da criação da reserva.
status_reserva: Status atual da reserva (ex: "Pendente", "Confirmada", "Cancelada", "Concluída").
metodo_pagamento: Método de pagamento utilizado (ex: "Cartão de Crédito").


-PAGAMENTOS

id: Identificador único do pagamento (chave primária).
reserva_id: Chave estrangeira para a entidade RESERVAS (única, um pagamento por reserva).
valor: Valor do pagamento.
data_pagamento: Timestamp do processamento do pagamento.
status_pagamento: Status do pagamento (ex: "Aprovado", "Negado", "Pendente").


-Relacionamentos

USUARIOS 1:N RESERVAS: Um usuário pode fazer várias reservas.
QUARTOS 1:N VAGAS: Um quarto pode conter várias vagas.
VAGAS 1:N RESERVAS: Uma vaga pode ser reservada múltiplas vezes ao longo do tempo.
RESERVAS 1:1 PAGAMENTOS: Cada reserva tem um e apenas um registro de pagamento.
