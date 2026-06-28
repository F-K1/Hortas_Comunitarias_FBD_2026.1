# 📋 Especificação de Requisitos Funcionais (RF)

Este documento detalha os **15 Requisitos Funcionais** que compõem o escopo do **Sistema de Hortas Comunitárias**. Para facilitar a arquitetura do banco de dados e evitar poluição visual nos diagramas, os requisitos foram divididos em **4 Módulos de Negócio**.

---

## 🔑 Módulo 1: Acessos e Perfis
Este módulo centraliza o controle de participantes, dados de contato, níveis de acesso e o vínculo inicial com as hortas.

### RF01: Gerenciar Usuário
* **Descrição:** O sistema deve permitir cadastrar, editar, listar e excluir usuários.
* **Dados do Registro:** Código identificador único (gerado automaticamente), nome completo, CPF (único, 11 dígitos), data de nascimento, e-mail (único), senha (criptografada com hash), telefone (opcional e multivalorado) e endereço completo.
* **Perfis/Subclasses:** Um usuário pode ser especializado como Morador, Voluntário, Administrador ou Doador.

### RF06: Registrar Participação dos Usuários
* **Descrição:** O sistema deve registrar o histórico e o vínculo de cada usuário com uma ou mais hortas comunitárias.
* **Dados do Registro:** Identificador único, data de entrada, data de saída (opcional), papel exercido na horta (colaborador, coordenador ou observador) e horas contribuídas.

---

## 🌱 Módulo 2: Cultivo e Espaço (Core)
Representa o núcleo agrícola e físico do projeto, monitorando desde a estrutura dos canteiros até o destino final dos alimentos colhidos.

### RF02: Gerenciar Horta
* **Descrição:** O sistema deve permitir o gerenciamento das hortas comunitárias. Cada horta precisa ser vinculada a pelo menos um Administrador responsável.
* **Dados do Registro:** Identificador único, nome da horta, localização geográfica (endereço completo), área total (valor positivo), data de fundação e status (ativa ou inativa).

### RF03: Gerenciar Canteiro
* **Descrição:** O sistema deve permitir o gerenciamento de canteiros, sendo que cada canteiro pertence obrigatoriamente a uma horta cadastrada.
* **Dados do Registro:** Identificador único, número identificador (único dentro de cada horta), dimensões (largura e comprimento), tipo de solo e status atual (disponível, em uso ou em manutenção).

### RF04: Gerenciar Cultura
* **Descrição:** O sistema deve permitir o controle das culturas e plantios associados a cada canteiro.
* **Dados do Registro:** Identificador único, nome comum, nome científico (opcional), ciclo de cultivo em dias, quantidade plantada, data do plantio, data de colheita prevista (calculada automaticamente) e data de colheita real (preenchida na finalização).

### RF07: Registrar Colheitas e Divisão da Produção
* **Descrição:** O sistema deve registrar as colheitas realizadas a partir de uma cultura e documentar como essa produção foi distribuída entre os participantes.
* **Dados do Registro:**
  * *Colheita:* Identificador único, data da colheita, quantidade total colhida (positiva) e observações.
  * *Divisão:* Identificador único da divisão, quantidade recebida (positiva) e o vínculo com o usuário beneficiado.

### RF10: Registrar Ocorrências de Pragas e Doenças
* **Descrição:** O sistema deve registrar anomalias biológicas detectadas. Cada registro deve ser vinculado obrigatoriamente a um canteiro (e opcionalmente a uma cultura específica dele) e ao usuário que identificou o problema.
* **Dados do Registro:** Identificador único, data da identificação, tipo de problema (fungo, inseto, deficiência nutricional, etc.), descrição dos sintomas, nível de gravidade (baixo, médio ou alto) e status (ativo, tratado ou perda total).

---

## 🛠️ Módulo 3: Operações e Infraestrutura
Focado nas rotinas diárias de manutenção, cuidados de irrigação e controle de estoque de insumos e ferramentas.

### RF05: Gerenciar Tarefas de Manutenção
* **Descrição:** O sistema deve permitir o agendamento e atribuição de tarefas de manutenção de canteiros ou culturas para um ou mais usuários (Moradores ou Voluntários).
* **Dados do Registro:** Identificador único, tipo da tarefa (irrigação, adubação, poda, controle de pragas, etc.), descrição, data prevista, data de execução (opcional), status (pendente, concluída ou cancelada) e observações.

### RF08: Gerenciar Insumos e Recursos
* **Descrição:** O sistema deve controlar o estoque de materiais consumíveis e registrar quando e em qual quantidade foram utilizados nas tarefas.
* **Dados do Registro:**
  * *Insumo:* Identificador único, nome, tipo (adubo, defensivo, semente, etc.), unidade de medida, estoque atual (não negativo) e estoque mínimo de segurança.
  * *Uso de Insumo:* Identificador único do uso, quantidade gasta (positiva) e data de utilização.

### RF11: Gerenciar Empréstimo de Ferramentas
* **Descrição:** O sistema deve gerenciar ferramentas duráveis (ex.: enxadas, carrinhos de mão) pertencentes às hortas e registrar os empréstimos feitos aos participantes.
* **Dados do Registro:**
  * *Ferramenta:* Identificador único, nome, descrição, quantidade em estoque e status (disponível ou indisponível).
  * *Empréstimo:* Identificador único, data de retirada, data de devolução, status do empréstimo (em andamento, devolvida ou extraviada) e observações.

### RF15: Registrar Irrigação e Condições Climáticas
* **Descrição:** O sistema deve monitorar os turnos de rega aplicados nos canteiros, registrando as condições do clima no momento. O executor deve ser obrigatoriamente um participante ativo da horta correspondente.
* **Dados do Registro:** Identificador único, data e hora da rega, volume de água aplicado, método utilizado (manual, gotejamento, aspersão) e dados climáticos (temperatura, umidade e descrição do clima).

---

## 📢 Módulo 4: Engajamento Social
Concentra as interações com a comunidade externa, captação de recursos e comunicação interna.

### RF09: Gerar Relatórios de Produtividade
* **Descrição:** O sistema deve consolidar dados em relatórios de produtividade (total colhido, tarefas concluídas, participantes ativos e rankings de produção).
* **Restrição de Acesso:** Administradores visualizam o relatório completo do sistema; os demais usuários acessam apenas os dados das hortas em que participam ativamente.

### RF12: Registrar Doações e Financiamento
* **Descrição:** O sistema deve registrar contribuições em dinheiro ou materiais recebidos, obrigatoriamente vinculando-as a uma horta de destino e ao perfil do Doador.
* **Dados do Registro:** Identificador único, data da doação, tipo (monetária, sementes, equipamentos, etc.), valor estimado (positivo) e descrição.

### RF13: Sistema de Avisos e Mural
* **Descrição:** O sistema deve permitir a publicação de comunicados informativos no mural virtual de uma horta específica. Os avisos são criados exclusivamente por Administradores.
* **Dados do Registro:** Identificador único, título, conteúdo, data de publicação, data de expiração (opcional) e grau de importância (baixa, média, alta).

### RF14: Gerenciar Eventos e Capacitações
* **Descrição:** O sistema deve permitir a criação de eventos educativos abertos à comunidade e o gerenciamento das inscrições dos usuários.
* **Dados do Registro e Restrição:**
  * *Evento:* Identificador único, título, descrição, data/hora de início e fim, local, limite de vagas, status do evento e vagas disponíveis.
  * *Inscrição:* Identificador único, data da inscrição e status (confirmada, cancelada ou lista de espera). Ao atingir o limite de vagas do evento, as novas inscrições entram automaticamente como lista de espera.
