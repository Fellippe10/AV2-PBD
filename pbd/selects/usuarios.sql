-- Selecionar todos os usuarios

SELECT id, nome, email, telefone, tipo_usuario FROM Usuarios;


-- Selecionar um usuario em específico

SELECT id, nome, email, telefone, tipo_usuario FROM Usuarios
WHERE id = 1;
