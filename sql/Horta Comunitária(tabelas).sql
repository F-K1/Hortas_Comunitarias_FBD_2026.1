-- Criação das Tabelas Principais (Entidades Fortes)

CREATE TABLE usuario (
  id_usuario SERIAL PRIMARY KEY,
  cpf VARCHAR(11) UNIQUE NOT NULL,
  nome_completo VARCHAR(50) NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL,
  senha VARCHAR(255) NOT NULL,
  data_nascimento DATE NOT NULL,
  numero_endereco INT NOT NULL,
  complemento VARCHAR(10),
  cep INT NOT NULL,
  bairro VARCHAR(50) NOT NULL,
  estado VARCHAR(20) NOT NULL,
  cidade VARCHAR(50) NOT NULL
);

CREATE TABLE usuario_telefone (
  telefone VARCHAR(20) NOT NULL,
  id_usuario INT NOT NULL,
  PRIMARY KEY (telefone, id_usuario)
);

-- Subclasses (Herança)
CREATE TABLE voluntario (
  id_usuario INT PRIMARY KEY,
  disponibilidade BOOLEAN NOT NULL
);

CREATE TABLE morador (
  id_usuario INT PRIMARY KEY,
  numero_residencia INT NOT NULL
);

CREATE TABLE administrador (
  id_usuario INT PRIMARY KEY,
  cargo VARCHAR(50) NOT NULL
);

CREATE TABLE doador (
  id_usuario INT PRIMARY KEY,
  tipo VARCHAR(50) NOT NULL
);

-- Módulo de Cultivo
CREATE TABLE horta (
  id_horta SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  data_fundacao DATE NOT NULL,
  area_total FLOAT NOT NULL,
  logradouro VARCHAR(100) NOT NULL,
  numero INT NOT NULL,
  bairro VARCHAR(50) NOT NULL,
  cidade VARCHAR(50) NOT NULL,
  estado VARCHAR(20) NOT NULL,
  cep INT NOT NULL,
  id_usuario INT NOT NULL -- FK para Administrador
);

CREATE TABLE canteiro (
  id_canteiro SERIAL PRIMARY KEY,
  status VARCHAR(20) NOT NULL,
  tipo_solo VARCHAR(20) NOT NULL,
  largura FLOAT NOT NULL,
  comprimento FLOAT NOT NULL,
  id_horta INT NOT NULL
);

CREATE TABLE cultura (
  id_cultura SERIAL PRIMARY KEY,
  nome_comum VARCHAR(50) NOT NULL,
  nome_cientifica VARCHAR(50),
  quantidade_plantada INT NOT NULL,
  ciclo_dias INT NOT NULL,
  data_plantio DATE NOT NULL,
  data_colheita_real DATE,
  id_canteiro INT NOT NULL
);

CREATE TABLE colheita (
  id_colheita SERIAL PRIMARY KEY,
  data_colheita DATE NOT NULL,
  quantidade_colhida INT NOT NULL,
  observacoes VARCHAR(100),
  id_cultura INT NOT NULL
);

CREATE TABLE divisao_producao (
  id_divisao SERIAL NOT NULL,
  id_colheita INT NOT NULL,
  quantidade INT NOT NULL,
  id_usuario INT NOT NULL,
  PRIMARY KEY (id_divisao, id_colheita)
);

-- Módulo de Operações e Infraestrutura
CREATE TABLE tarefa (
  id_tarefa SERIAL PRIMARY KEY,
  tipo VARCHAR(50) NOT NULL,
  status VARCHAR(20) NOT NULL,
  descricao VARCHAR(100) NOT NULL,
  observacoes VARCHAR(100),
  data_prevista DATE NOT NULL,
  data_execucao DATE,
  id_usuario INT NOT NULL,
  id_canteiro INT NOT NULL
);

CREATE TABLE insumos (
  id_insumos SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  tipo VARCHAR(20) NOT NULL,
  unidade_medida VARCHAR(20) NOT NULL,
  estoque_minimo INT NOT NULL,
  estoque_atual INT NOT NULL
);

CREATE TABLE uso (
  id_uso SERIAL NOT NULL,
  id_tarefa INT NOT NULL,
  data_uso DATE NOT NULL,
  quantidade INT NOT NULL,
  id_insumos INT NOT NULL,
  PRIMARY KEY (id_uso, id_tarefa)
);

CREATE TABLE irrigacao (
  id_irrigacao SERIAL PRIMARY KEY,
  data_hora TIMESTAMP NOT NULL,
  volume_agua FLOAT NOT NULL,
  metodo_irrigacao VARCHAR(50) NOT NULL,
  descricao_clima VARCHAR(100) NOT NULL,
  umidade_percentual FLOAT,
  temperatura_celsius FLOAT,
  id_usuario INT NOT NULL,
  id_canteiro INT NOT NULL
);

CREATE TABLE ferramentas (
  id_ferramenta SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  quantidade INT NOT NULL,
  status VARCHAR(20) NOT NULL
);

CREATE TABLE emprestimos (
  id_emprestimo SERIAL NOT NULL,
  id_ferramenta INT NOT NULL,
  data_retirada DATE NOT NULL,
  data_devolucao DATE NOT NULL,
  status_emprestimo VARCHAR(20) NOT NULL,
  observacoes VARCHAR(100),
  id_usuario INT NOT NULL,
  PRIMARY KEY (id_emprestimo, id_ferramenta)
);

CREATE TABLE participacao (
  id_participacao SERIAL NOT NULL,
  id_usuario INT NOT NULL,
  data_entrada DATE NOT NULL,
  data_saida DATE,
  papel_na_horta VARCHAR(20) NOT NULL,
  status VARCHAR(20) NOT NULL,
  id_horta INT NOT NULL,
  PRIMARY KEY (id_participacao, id_usuario)
);

CREATE TABLE ocorrencia_pragas (
  id_ocorrencia SERIAL PRIMARY KEY,
  tipo_problema VARCHAR(50) NOT NULL,
  descricao_sintomas VARCHAR(100) NOT NULL,
  nivel_gravidade VARCHAR(20) NOT NULL,
  data_identificacao DATE NOT NULL,
  status VARCHAR(50) NOT NULL,
  id_cultura INT NOT NULL,
  id_usuario INT NOT NULL,
  id_canteiro INT NOT NULL
);

-- Módulo de Engajamento Social
CREATE TABLE evento (
  id_evento SERIAL PRIMARY KEY,
  titulo VARCHAR(50) NOT NULL,
  descricao VARCHAR(150) NOT NULL,
  local VARCHAR(100) NOT NULL,
  limite_vagas INT NOT NULL,
  status_evento VARCHAR(20) NOT NULL,
  data_hora_inicio TIMESTAMP NOT NULL,
  data_hora_fim TIMESTAMP NOT NULL
);

CREATE TABLE inscricao (
  id_inscricao SERIAL NOT NULL,
  id_evento INT NOT NULL,
  data_inscricao DATE NOT NULL,
  status VARCHAR(20) NOT NULL,
  id_usuario INT NOT NULL,
  PRIMARY KEY (id_inscricao, id_evento)
);

CREATE TABLE avisos (
  id_avisos SERIAL PRIMARY KEY,
  titulo VARCHAR(50) NOT NULL,
  conteudo TEXT NOT NULL,
  grau_importancia VARCHAR(20) NOT NULL,
  data_publicacao DATE NOT NULL,
  data_expiracao DATE,
  id_horta INT NOT NULL,
  id_usuario INT NOT NULL
);

CREATE TABLE doacoes (
  id_doacao SERIAL PRIMARY KEY,
  tipo_doacao VARCHAR(50) NOT NULL,
  valor_estimado FLOAT NOT NULL,
  data_doacao DATE NOT NULL,
  descricao VARCHAR(150),
  id_usuario INT NOT NULL,
  id_horta INT NOT NULL
);


-- ==========================================
-- CRIAÇÃO DAS CHAVES ESTRANGEIRAS (FOREIGN KEYS)
-- ==========================================

-- Acessos e Subclasses (Correção da herança)
ALTER TABLE usuario_telefone ADD FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);
ALTER TABLE voluntario ADD FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);
ALTER TABLE morador ADD FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);
ALTER TABLE administrador ADD FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);
ALTER TABLE doador ADD FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);

-- Cultivo e Core
ALTER TABLE horta ADD FOREIGN KEY (id_usuario) REFERENCES administrador (id_usuario);
ALTER TABLE canteiro ADD FOREIGN KEY (id_horta) REFERENCES horta (id_horta);
ALTER TABLE cultura ADD FOREIGN KEY (id_canteiro) REFERENCES canteiro (id_canteiro);
ALTER TABLE colheita ADD FOREIGN KEY (id_cultura) REFERENCES cultura (id_cultura);
ALTER TABLE divisao_producao ADD FOREIGN KEY (id_colheita) REFERENCES colheita (id_colheita);
ALTER TABLE divisao_producao ADD FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);

-- Operações e Infraestrutura
ALTER TABLE tarefa ADD FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);
ALTER TABLE tarefa ADD FOREIGN KEY (id_canteiro) REFERENCES canteiro (id_canteiro);
ALTER TABLE uso ADD FOREIGN KEY (id_tarefa) REFERENCES tarefa (id_tarefa);
ALTER TABLE uso ADD FOREIGN KEY (id_insumos) REFERENCES insumos (id_insumos);
ALTER TABLE irrigacao ADD FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);
ALTER TABLE irrigacao ADD FOREIGN KEY (id_canteiro) REFERENCES canteiro (id_canteiro);
ALTER TABLE emprestimos ADD FOREIGN KEY (id_ferramenta) REFERENCES ferramentas (id_ferramenta);
ALTER TABLE emprestimos ADD FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);
ALTER TABLE participacao ADD FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);
ALTER TABLE participacao ADD FOREIGN KEY (id_horta) REFERENCES horta (id_horta);
ALTER TABLE ocorrencia_pragas ADD FOREIGN KEY (id_cultura) REFERENCES cultura (id_cultura);
ALTER TABLE ocorrencia_pragas ADD FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);
ALTER TABLE ocorrencia_pragas ADD FOREIGN KEY (id_canteiro) REFERENCES canteiro (id_canteiro);

-- Engajamento Social
ALTER TABLE inscricao ADD FOREIGN KEY (id_evento) REFERENCES evento (id_evento);
ALTER TABLE inscricao ADD FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);
ALTER TABLE avisos ADD FOREIGN KEY (id_horta) REFERENCES horta (id_horta);
ALTER TABLE avisos ADD FOREIGN KEY (id_usuario) REFERENCES administrador (id_usuario);
ALTER TABLE doacoes ADD FOREIGN KEY (id_usuario) REFERENCES doador (id_usuario);
ALTER TABLE doacoes ADD FOREIGN KEY (id_horta) REFERENCES horta (id_horta);
