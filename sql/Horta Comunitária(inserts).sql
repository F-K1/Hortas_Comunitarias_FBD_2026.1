--Inserindo Usuários
INSERT INTO usuario (id_usuario, cpf, nome_completo, email, senha, data_nascimento, numero_endereco, complemento, cep, bairro, estado, cidade) VALUES
(1, '11111111111', 'Ana Silva', 'ana@email.com', 'senha123', '1985-04-12', 120, 'Apto 1', 60000000, 'Centro', 'CE', 'Fortaleza'),
(2, '22222222222', 'Bruno Costa', 'bruno@email.com', 'senha123', '1990-08-25', 45, NULL, 60000001, 'Aldeota', 'CE', 'Fortaleza'),
(3, '33333333333', 'Carlos Mendes', 'carlos@email.com', 'senha123', '1978-11-03', 300, 'Casa', 63900000, 'Centro', 'CE', 'Quixadá'),
(4, '44444444444', 'Diana Rocha', 'diana@email.com', 'senha123', '1995-02-15', 12, 'Apto 4B', 63900001, 'Combate', 'CE', 'Quixadá'),
(5, '55555555555', 'Eduardo Lima', 'eduardo@email.com', 'senha123', '1982-07-09', 101, NULL, 60000002, 'Meireles', 'CE', 'Fortaleza'),
(6, '66666666666', 'Fernanda Souza', 'fernanda@email.com', 'senha123', '1998-12-20', 88, 'Fundos', 63900002, 'Baviera', 'CE', 'Quixadá'),
(7, '77777777777', 'Gustavo Alves', 'gustavo@email.com', 'senha123', '1975-05-30', 500, NULL, 60000003, 'Papicu', 'CE', 'Fortaleza'),
(8, '88888888888', 'Helena Nunes', 'helena@email.com', 'senha123', '1989-10-10', 22, 'Casa 2', 63900003, 'Planalto', 'CE', 'Quixadá'),
(9, '99999999999', 'Igor Santos', 'igor@email.com', 'senha123', '1992-03-18', 77, NULL, 60000004, 'Benfica', 'CE', 'Fortaleza'),
(10, '10101010101', 'Juliana Castro', 'juliana@email.com', 'senha123', '1980-09-05', 90, 'Apto 10', 63900004, 'Centro', 'CE', 'Quixadá');

--Inserindo Adms
INSERT INTO administrador (id_usuario, cargo) VALUES
(1, 'Coordenador Geral'),
(2, 'Gestor de Cultivo'),
(3, 'Supervisor de Área'),
(4, 'Coordenador Comunitário'),
(5, 'Gestor Financeiro'),
(6, 'Supervisor de Infraestrutura'),
(7, 'Diretor de Projetos'),
(8, 'Gestor de Insumos'),
(9, 'Coordenador de Eventos'),
(10, 'Agente de Campo');

--Inserindo Hortas
INSERT INTO horta (id_horta, nome, data_fundacao, area_total, logradouro, numero, bairro, cidade, estado, cep, id_usuario) VALUES
(1, 'Horta Esperança', '2021-03-15', 500.5, 'Rua das Flores', 100, 'Centro', 'Quixadá', 'CE', 63900000, 1),
(2, 'Horta Vida Verde', '2022-01-20', 300.0, 'Avenida Principal', 250, 'Combate', 'Quixadá', 'CE', 63900001, 2),
(3, 'Jardim Comunitário', '2020-11-10', 800.2, 'Praça da Matriz', 5, 'Centro', 'Fortaleza', 'CE', 60000000, 3),
(4, 'Horta Sol Nascente', '2023-02-05', 250.0, 'Rua do Sol', 45, 'Aldeota', 'Fortaleza', 'CE', 60000001, 4),
(5, 'Espaço Agroecológico', '2019-08-14', 1200.0, 'Estrada Velha', 1000, 'Baviera', 'Quixadá', 'CE', 63900002, 5),
(6, 'Horta Raízes', '2021-06-30', 450.5, 'Rua da Paz', 80, 'Meireles', 'Fortaleza', 'CE', 60000002, 6),
(7, 'Cantinho da Terra', '2022-09-07', 150.0, 'Travessa do Bosque', 12, 'Planalto', 'Quixadá', 'CE', 63900003, 7),
(8, 'Horta Boa Vista', '2020-04-22', 600.0, 'Rua Alta', 300, 'Papicu', 'Fortaleza', 'CE', 60000003, 8),
(9, 'Semente Cidadã', '2023-05-18', 350.0, 'Avenida dos Estudantes', 150, 'Benfica', 'Fortaleza', 'CE', 60000004, 9),
(10, 'Horta Aurora', '2021-12-01', 400.0, 'Rua Nova', 20, 'Centro', 'Quixadá', 'CE', 63900004, 10);

--Inserindo Canteiro
INSERT INTO canteiro (id_canteiro, status, tipo_solo, largura, comprimento, id_horta) VALUES
(1, 'Ativo', 'Argiloso', 1.5, 5.0, 1),
(2, 'Ativo', 'Arenoso', 2.0, 10.0, 1),
(3, 'Em Preparo', 'Humífero', 1.2, 4.0, 2),
(4, 'Ativo', 'Argiloso', 1.5, 6.0, 3),
(5, 'Inativo', 'Arenoso', 1.0, 3.0, 4),
(6, 'Ativo', 'Humífero', 2.5, 8.0, 5),
(7, 'Em Manutenção', 'Misto', 1.5, 5.5, 6),
(8, 'Ativo', 'Argiloso', 2.0, 12.0, 7),
(9, 'Ativo', 'Humífero', 1.8, 7.0, 8),
(10, 'Em Preparo', 'Misto', 1.5, 6.0, 10);

--Inserindo Culturas
INSERT INTO cultura (id_cultura, nome_comum, nome_cientifica, quantidade_plantada, ciclo_dias, data_plantio, data_colheita_real, id_canteiro) VALUES
(1, 'Alface Crespa', 'Lactuca sativa', 50, 45, '2023-09-01', NULL, 1),
(2, 'Tomate Cereja', 'Solanum lycopersicum', 20, 90, '2023-08-15', NULL, 2),
(3, 'Cenoura', 'Daucus carota', 100, 75, '2023-07-20', '2023-10-05', 4),
(4, 'Cebolinha', 'Allium fistulosum', 200, 60, '2023-09-10', NULL, 6),
(5, 'Coentro', 'Coriandrum sativum', 150, 35, '2023-09-20', NULL, 8),
(6, 'Rabanete', 'Raphanus sativus', 80, 30, '2023-10-01', NULL, 9),
(7, 'Pimentão', 'Capsicum annuum', 30, 110, '2023-06-10', '2023-09-28', 1),
(8, 'Manjericão', 'Ocimum basilicum', 40, 60, '2023-08-05', NULL, 2),
(9, 'Beterraba', 'Beta vulgaris', 70, 80, '2023-07-15', '2023-10-02', 4),
(10, 'Couve Manteiga', 'Brassica oleracea', 25, 70, '2023-08-25', NULL, 6);

--Inserindo Inumos
INSERT INTO insumos (id_insumos, nome, tipo, unidade_medida, estoque_minimo, estoque_atual) VALUES
(1, 'Adubo Orgânico', 'Fertilizante', 'Kg', 10, 50),
(2, 'Semente de Alface', 'Semente', 'Gramas', 50, 200),
(3, 'Calcário', 'Corretivo', 'Kg', 20, 100),
(4, 'Óleo de Neem', 'Defensivo', 'Litros', 2, 5),
(5, 'Substrato', 'Terra', 'Kg', 15, 80),
(6, 'Semente de Tomate', 'Semente', 'Gramas', 20, 100),
(7, 'Esterco Bovino', 'Fertilizante', 'Kg', 30, 150),
(8, 'Húmus de Minhoca', 'Fertilizante', 'Kg', 10, 40),
(9, 'Semente de Cenoura', 'Semente', 'Gramas', 30, 120),
(10, 'Fungicida Natural', 'Defensivo', 'Litros', 1, 3);

--Inserindo Ferramentas
INSERT INTO ferramentas (id_ferramenta, nome, quantidade, status) VALUES
(1, 'Enxada', 5, 'Disponível'),
(2, 'Pá de Bico', 3, 'Disponível'),
(3, 'Ancinho (Rastelo)', 4, 'Em Uso'),
(4, 'Regador 10L', 10, 'Disponível'),
(5, 'Carrinho de Mão', 2, 'Em Manutenção'),
(6, 'Tesoura de Poda', 6, 'Disponível'),
(7, 'Sacho', 4, 'Disponível'),
(8, 'Pá de Plantio', 8, 'Em Uso'),
(9, 'Mangueira 20m', 2, 'Disponível'),
(10, 'Pulverizador Costal', 1, 'Em Manutenção');

--Inserindo Colheitas
INSERT INTO colheita (id_colheita, data_colheita, quantidade_colhida, observacoes, id_cultura) VALUES
(1, '2023-10-05', 80, 'Colheita excelente, raízes bem desenvolvidas', 3),
(2, '2023-09-28', 25, 'Alguns frutos apresentaram manchas', 7),
(3, '2023-10-02', 65, 'Tamanho um pouco abaixo do esperado', 9),
(4, '2023-10-15', 40, 'Primeira leva da alface', 1),
(5, '2023-10-20', 150, 'Maços grandes e viçosos', 4),
(6, '2023-11-05', 75, 'Colheita rápida devido ao ciclo curto', 6),
(7, '2023-11-10', 120, 'Aroma muito forte e folhas saudáveis', 5),
(8, '2023-11-15', 15, 'Produção inicial de cerejas', 2),
(9, '2023-10-10', 35, 'Folhas perfeitas para uso imediato', 8),
(10, '2023-11-01', 20, 'Folhas de couve sem ataque de lagartas', 10);

--Inserindo Divisão de Produção
INSERT INTO divisao_producao (id_divisao, id_colheita, quantidade, id_usuario) VALUES
(1, 1, 10, 1),
(2, 1, 15, 2),
(3, 2, 5, 3),
(4, 2, 10, 4),
(5, 3, 20, 5),
(6, 4, 10, 6),
(7, 5, 30, 7),
(8, 6, 20, 8),
(9, 7, 25, 9),
(10, 8, 5, 10);

--Insserindo Uso de Insumos
INSERT INTO tarefa (id_tarefa, tipo, status, descricao, observacoes, data_prevista, data_execucao, id_usuario, id_canteiro) VALUES
(1, 'Adubação', 'Concluída', 'Adubação orgânica de cobertura', 'Usado húmus', '2023-09-10', '2023-09-10', 1, 1),
(2, 'Capina', 'Pendente', 'Retirada de mato invasor', NULL, '2023-10-25', NULL, 2, 2),
(3, 'Plantio', 'Concluída', 'Semeadura direta de cenoura', NULL, '2023-07-20', '2023-07-20', 3, 4),
(4, 'Pulverização', 'Concluída', 'Aplicação de óleo de neem', 'Prevenção de pulgões', '2023-09-15', '2023-09-16', 4, 6),
(5, 'Preparo de Solo', 'Em Andamento', 'Revolvimento e calagem', NULL, '2023-10-20', NULL, 5, 3),
(6, 'Rega Pesada', 'Concluída', 'Irrigação manual pós-plantio', NULL, '2023-09-01', '2023-09-01', 6, 1),
(7, 'Poda', 'Pendente', 'Retirada de galhos secos', 'Trazer tesoura afiada', '2023-10-28', NULL, 7, 7),
(8, 'Colheita', 'Concluída', 'Colheita de pimentão', NULL, '2023-09-28', '2023-09-28', 8, 1),
(9, 'Adubação', 'Pendente', 'Aplicação de esterco', NULL, '2023-10-30', NULL, 9, 8),
(10, 'Limpeza', 'Concluída', 'Retirada de restos de cultura', NULL, '2023-10-05', '2023-10-06', 10, 4);

--Inserindo Emprestimo de Ferramentas
INSERT INTO emprestimos (id_emprestimo, id_ferramenta, data_retirada, data_devolucao, status_emprestimo, observacoes, id_usuario) VALUES
(1, 3, '2023-10-01', '2023-10-02', 'Devolvido', 'Cabo um pouco frouxo', 1),
(2, 8, '2023-10-15', '2023-10-15', 'Em Uso', NULL, 2),
(3, 1, '2023-09-20', '2023-09-21', 'Devolvido', NULL, 3),
(4, 5, '2023-10-10', '2023-10-12', 'Atrasado', 'Pneu furou', 4),
(5, 6, '2023-10-20', '2023-10-20', 'Devolvido', NULL, 5),
(6, 4, '2023-10-22', '2023-10-22', 'Em Uso', NULL, 6),
(7, 2, '2023-09-05', '2023-09-06', 'Devolvido', NULL, 7),
(8, 9, '2023-10-18', '2023-10-18', 'Devolvido', 'Mangueira dobrada', 8),
(9, 10, '2023-10-01', '2023-10-05', 'Em Manutenção', 'Bico entupido', 9),
(10, 7, '2023-10-24', '2023-10-25', 'Em Uso', NULL, 10);

--Inserindo Eventos
INSERT INTO evento (id_evento, titulo, descricao, local, limite_vagas, status_evento, data_hora_inicio, data_hora_fim) VALUES
(1, 'Oficina de Compostagem', 'Aprenda a fazer adubo em casa', 'Horta Esperança', 30, 'Concluído', '2023-08-10 09:00:00', '2023-08-10 12:00:00'),
(2, 'Mutirão de Limpeza', 'Ajude a preparar novos canteiros', 'Horta Vida Verde', 50, 'Concluído', '2023-09-15 08:00:00', '2023-09-15 16:00:00'),
(3, 'Curso de Controle de Pragas', 'Uso de defensivos naturais', 'Espaço Agroecológico', 25, 'Planejado', '2023-11-20 14:00:00', '2023-11-20 17:00:00'),
(4, 'Feira de Troca de Sementes', 'Traga suas sementes crioulas', 'Jardim Comunitário', 100, 'Planejado', '2023-12-05 09:00:00', '2023-12-05 13:00:00'),
(5, 'Palestra: Agricultura Urbana', 'Os benefícios para a cidade', 'Auditório Central', 80, 'Cancelado', '2023-07-10 19:00:00', '2023-07-10 21:00:00'),
(6, 'Dia das Crianças na Horta', 'Atividades lúdicas e plantio', 'Horta Aurora', 40, 'Concluído', '2023-10-12 09:00:00', '2023-10-12 12:00:00'),
(7, 'Workshop de Irrigação', 'Montagem de sistemas simples', 'Horta Sol Nascente', 20, 'Planejado', '2023-11-15 10:00:00', '2023-11-15 12:00:00'),
(8, 'Colheita Coletiva', 'Venha colher sua própria salada', 'Horta Raízes', 60, 'Planejado', '2023-11-25 08:00:00', '2023-11-25 11:00:00'),
(9, 'Aula de Culinária Viva', 'Receitas com produtos da horta', 'Cantinho da Terra', 15, 'Concluído', '2023-09-30 15:00:00', '2023-09-30 18:00:00'),
(10, 'Reunião de Planejamento', 'Definição do próximo semestre', 'Horta Boa Vista', 30, 'Planejado', '2023-12-15 18:00:00', '2023-12-15 20:00:00');

--Inserindo Inscrições
INSERT INTO inscricao (id_inscricao, id_evento, data_inscricao, status, id_usuario) VALUES
(1, 1, '2023-08-01', 'Confirmada', 1),
(2, 1, '2023-08-05', 'Confirmada', 2),
(3, 2, '2023-09-10', 'Presente', 3),
(4, 2, '2023-09-11', 'Faltou', 4),
(5, 3, '2023-10-25', 'Confirmada', 5),
(6, 4, '2023-11-01', 'Na Fila', 6),
(7, 6, '2023-10-05', 'Presente', 7),
(8, 7, '2023-11-10', 'Confirmada', 8),
(9, 8, '2023-11-20', 'Confirmada', 9),
(10, 9, '2023-09-20', 'Presente', 10);