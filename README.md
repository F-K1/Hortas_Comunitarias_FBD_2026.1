# Hortas_Comunitarias_FBD_2026.1

# Sistema de Gestão de Hortas Comunitárias 🌱

Projeto final da disciplina de **Fundamentos de Banco de Dados (2026.1)**. O objetivo é modelar e demonstrar um sistema para apoiar a administração de hortas comunitárias, com foco em cadastro de pessoas, organização de canteiros, controle de operações e persistência em PostgreSQL.

## Estado Atual

O repositório está organizado como uma solução de demonstração em notebook, com esquema relacional, dados iniciais e scripts auxiliares para apoio à modelagem e à execução no PostgreSQL.

O escopo documentado atualmente cobre 15 requisitos funcionais distribuídos em 4 módulos de negócio:

1. Acessos e Perfis
2. Cultivo e Espaço
3. Operações e Infraestrutura
4. Engajamento Social

## Estrutura do Projeto

O repositório está organizado da seguinte forma:

1. [README.md](README.md): visão geral do projeto e instruções de uso.
2. [app/HortaComunitaria.ipynb](app/HortaComunitaria.ipynb): notebook principal com a aplicação em Panel.
3. [app/.env-example](app/.env-example): exemplo de configuração das credenciais do banco.
4. [docs/REQUISITOS.md](docs/REQUISITOS.md): requisitos funcionais e de negócio.
5. [modelagem/Conceitual (EER)](modelagem/Conceitual%20%28EER%29): diagramas conceituais.
6. [modelagem/Lógico (Relacional)](modelagem/L%C3%B3gico%20%28Relacional%29): esquema relacional e artefatos relacionados.
7. [sql/Horta Comunitária(tabelas).sql](sql/Horta%20Comunit%C3%A1ria%28tabelas%29.sql): criação das tabelas e chaves estrangeiras.
8. [sql/Horta Comunitária(inserts).sql](sql/Horta%20Comunit%C3%A1ria%28inserts%29.sql): inserção de dados iniciais.
9. [sql/Horta_Triggers.sql](sql/Horta_Triggers.sql): regras e automatizações da base.

## Tecnologias Utilizadas

1. Python 3.10+
2. PostgreSQL
3. Pandas
4. Psycopg2
5. SQLAlchemy
6. Panel
7. Jupyter
8. python-dotenv

## Requisitos Funcionais

Os requisitos completos estão em [docs/REQUISITOS.md](docs/REQUISITOS.md). Em resumo, o sistema contempla:

1. Cadastro, gestão e vínculo de usuários com hortas.
2. Administração de hortas, canteiros, culturas, colheitas e ocorrências.
3. Controle de tarefas, insumos, irrigação, ferramentas e participação.
4. Funcionalidades sociais como eventos, avisos, doações e relatórios.

## Pré-requisitos

Para executar o notebook e recriar a base de dados, você precisa de:

1. Python instalado.
2. PostgreSQL disponível localmente ou na rede.
3. VS Code com suporte a notebooks, Jupyter ou JupyterLab.

## Configuração do Ambiente

As dependências principais usadas no notebook são pandas, psycopg2-binary, sqlalchemy, panel, python-dotenv e jupyter.

Se preferir usar ambiente virtual, siga um fluxo como este:

```bash
cd app
python -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install pandas psycopg2-binary sqlalchemy panel python-dotenv jupyter
```

No Windows, ative o ambiente com o comando equivalente do seu terminal antes da instalação.

## Configuração do `.env`

O notebook lê as credenciais do banco a partir de [app/.env](app/.env). O arquivo de exemplo está em [app/.env-example](app/.env-example).

1. Copie [app/.env-example](app/.env-example) para [app/.env](app/.env).
2. Ajuste as variáveis com os dados do seu ambiente.
3. Confirme que o banco informado em DB_NAME já existe e que o PostgreSQL está em execução.

Exemplo de variáveis esperadas:

```env
DB_HOST=localhost
DB_NAME=fbd-conexao
DB_USER=postgres
DB_PASS=root
```

## Execução do Projeto

1. Configure [app/.env](app/.env).
2. Instale as dependências.
3. Execute [sql/Horta Comunitária(tabelas).sql](sql/Horta%20Comunit%C3%A1ria%28tabelas%29.sql) para criar a estrutura do banco.
4. Execute [sql/Horta_Triggers.sql](sql/Horta_Triggers.sql), se quiser habilitar as regras automatizadas previstas no projeto.
5. Opcionalmente, execute [sql/Horta Comunitária(inserts).sql](sql/Horta%20Comunit%C3%A1ria%28inserts%29.sql) para popular a base.
6. Abra [app/HortaComunitaria.ipynb](app/HortaComunitaria.ipynb) e execute as células na ordem apresentada.

## Observações de Uso

1. O notebook usa conexão nativa com PostgreSQL para escrita e SQLAlchemy para consultas via Pandas.
2. A interface depende do Panel para montagem dos formulários, botões e tabelas.
3. A base foi pensada para apoiar a demonstração acadêmica do modelo, com entidades, relacionamentos e automações em SQL.

## Modelo do Projeto

O repositório reúne o material conceitual, lógico e físico do banco de dados, além da interface de demonstração. Isso facilita revisar o domínio, validar o esquema e testar as operações do sistema em um único lugar.
