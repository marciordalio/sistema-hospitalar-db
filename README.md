# Banco de Dados para um Hospital — Parte 1🏥
📌 Modelagem Conceitual e Relacional do Sistema Clínico

📖 Descrição do Projeto

Este repositório faz parte da primeira etapa de desenvolvimento de um sistema completo para gestão hospitalar. A Parte 1 é dedicada à estruturação do banco de dados, com foco na modelagem conceitual e relacional das entidades e relacionamentos principais da área clínica.

Nesta fase, foram definidos os principais componentes do sistema, incluindo:

- Cadastro de **médicos**, com vínculo a múltiplas especialidades (pediatria, clínica geral, etc.).

- Cadastro completo de **pacientes**, incluindo dados pessoais, documentos e convênio.

- Registro de **consultas**, associando médico, paciente, data/hora, valor ou convênio com número da carteira e especialidade buscada.

- Criação de **receitas médicas**, permitindo ao médico registrar os medicamentos, quantidade e instruções de uso.

- Relacionamentos entre todas as entidades, modelados em um **Diagrama Entidade-Relacionamento (DER)**.

O objetivo é garantir uma base sólida de dados para suportar, nas próximas partes, funcionalidades como visualização online de receitas, relatórios, e agendamento de consultas via sistema.



# 🚀 Mãos à Obra

📄 **Enunciado da Atividade**

**Analise a seguinte descrição e extraia dela os requisitos para o banco de dados:**

O hospital necessita de um sistema para sua área clínica que ajude a controlar consultas realizadas. Os médicos podem ser generalistas, especialistas ou residentes e têm seus dados pessoais cadastrados em planilhas digitais. Cada médico pode ter uma ou mais especialidades, que podem ser pediatria, clínica geral, gastroenterologia e dermatologia. Alguns registros antigos ainda estão em formulário de papel, mas será necessário incluir esses dados no novo sistema.

Os pacientes também precisam de cadastro, contendo dados pessoais (nome, data de nascimento, endereço, telefone e e-mail), documentos (CPF e RG) e convênio. Para cada convênio, são registrados nome, CNPJ e tempo de carência.

As consultas também têm sido registradas em planilhas, com data e hora de realização, médico responsável, paciente, valor da consulta ou nome do convênio, com o número da carteira. Também é necessário indicar na consulta qual a especialidade buscada pelo paciente.

Deseja-se ainda informatizar a receita do médico, de maneira que, no encerramento da consulta, ele possa registrar os medicamentos receitados, a quantidade e as instruções de uso. A partir disso, espera-se que o sistema imprima um relatório da receita ao paciente ou permita sua visualização via internet.



![Diagrama Hospital drawio](https://github.com/user-attachments/assets/dc8125f5-13f5-41e7-876c-7f93cc8888ea)

# Banco de Dados para um Hospital — Parte 2
📌 Modelagem Conceitual e Relacional das Internações e Profissionais de Enfermagem


📖 Descrição do Projeto
Esta é a segunda etapa do desenvolvimento do sistema de gestão hospitalar focada na área clínica. Nesta fase, a modelagem do banco de dados foi ampliada para incluir a gestão de internações, quartos, tipos de quartos e profissionais de enfermagem.

Foram incorporados novos requisitos, conforme descrito:

-Registro detalhado das internações, incluindo datas (entrada, prevista de alta, alta efetiva) e procedimentos.

-Associação das internações aos quartos do hospital, com numeração e tipo.

-Tipos de quartos categorizados (apartamento, quarto duplo, enfermaria), cada um com descrição e valor diário.

-Cadastro dos enfermeiros responsáveis pelo acompanhamento dos pacientes durante as internações, contendo nome, CPF e registro COREN.

-Vinculação de cada internação a um paciente e a um médico responsável.

O objetivo é ampliar o sistema, mantendo a integração com as entidades já modeladas na Parte 1 (médicos, pacientes, consultas, receitas), criando uma visão completa da operação clínica do hospital.

# 🚀 Mãos à Obra  Mãos à Obra

📄 **Enunciado da Atividade**

Faça a ligação do diagrama acima ao diagrama desenvolvido na atividade antrior, construindo relacionamentos com entidades relacionadas. E eleve o seu diagrama para que já selecionando os tipos de dados que serão trabalhados e em quais situações. 

Por último, crie um script SQL para a geração do banco de dados e para instruções de montagem de cada uma das entidades/tabelas presentes no diagrama completo (considerando as entidades do diagrama da atividade anterior e as novas entidades propostas no diagrama acima). Também crie tabelas para relacionamentos quando necessário. Aplique colunas e chaves primárias e estrangeiras.
Use ferramentas, como ERPlus, Lucidchart, draw.io (via web) e MySQL Workbench, ou mesmo um editor de imagens para o diagrama. 


![Diagrama Hospital drawio 2 drawio](https://github.com/user-attachments/assets/569edb8d-8f13-41bd-b914-893cf46f0058)
![Untitled](https://github.com/user-attachments/assets/0be24ddd-2d2b-4724-ad12-0519f97430e9)

# [Arquivo MySQL Banco de Dados - Parte 2](https://github.com/marciordalio/sistema-hospitalar-db-/blob/main/banco_de_dados_MySQL_parte_2)


📋 Entidades (Em Tabelas)

# 🩺 Médico

Armazena os dados dos médicos. 

| Campo     | Tipo         | Descrição                                      |
|-----------|--------------|-------------------------------------------------|
| id_médico | int [PK]     | Identificador único do médico                  |
| nome      | varchar(255) | Nome completo do médico                        |
| crm       | varchar(20)  | Registro no Conselho Regional de Medicina (CRM)|
| cpf       | varchar(14)  | Cadastro de Pessoa Física                      |

# 🎓 Especialidade

Lista de especialidades médicas.

| Campo              | Tipo           | Descrição                      |
|--------------------|----------------|-------------------------------|
| id_especialidade   | int [PK]       | Identificador da especialidade|
| nome_especialidade | varchar(100)   | Nome da especialidade         |

# 📂 Especialidade_Medico

Relaciona médicos com suas especialidades.

| Campo                 | Tipo       | Descrição                         |
|-----------------------|------------|------------------------------------|
| id_especialidadeMedico| int [PK]   | Identificador da relação           |
| medico_id             | int        | FK para o médico                   |
| especialidade_id      | int        | FK para a especialidade            |

# 🧑Paciente

Armazena os dados dos pacientes.

| Campo          | Tipo          | Descrição                          |
|----------------|---------------|-------------------------------------|
| id_paciente    | int [PK]      | Identificador do paciente           |
| nome           | varchar(255)  | Nome completo                       |
| data_nascimento| date          | Data de nascimento                  |
| telefone       | varchar(22)   | Telefone                            |
| cpf            | varchar(14)   | CPF                                 |
| id_endereco    | int           | FK para endereço                    |
| id_convenio    | int           | FK para convênio                    |


# 🏠 Endereço

Endereço dos pacientes.

| Campo       | Tipo         | Descrição               |
|-------------|--------------|--------------------------|
| id_endereco | int [PK]     | Identificador do endereço|
| rua         | varchar(100) | Nome da rua              |
| numero      | varchar(10)  | Número da residência     |
| complemento | varchar(50)  | Complemento (opcional)   |
| bairro      | varchar(50)  | Bairro                   |
| cidade      | varchar(50)  | Cidade                   |
| estado      | char(2)      | Unidade federativa       |
| cep         | varchar(9)   | CEP                      |

# 📅 Consulta

Dados das consultas médicas.

| Campo            | Tipo           | Descrição                             |
|------------------|----------------|----------------------------------------|
| id_consulta      | int [PK]       | Identificador da consulta              |
| data_hora        | datetime       | Data e hora da consulta                |
| id_médico        | int            | FK para médico                         |
| id_especialidade | int            | FK para especialidade                  |
| valor_consulta   | decimal(10,2)  | Valor da consulta                      |
| id_paciente      | int            | FK para paciente                       |
| id_convênio      | int            | FK para convênio                       |
| numero_carteira  | varchar(22)    | Número da carteirinha do convênio     |

# 💳 Convênio

Dados dos convênios.

| Campo             | Tipo          | Descrição                    |
|-------------------|---------------|-------------------------------|
| id_convenio       | int [PK]      | Identificador do convênio    |
| nome              | varchar(111)  | Nome do convênio              |
| cnpj              | varchar(18)   | CNPJ da operadora             |
| tempo_de_carencia | varchar(20)   | Tempo de carência do convênio|

# 📄 Receita

Armazena as receitas médicas.

| Campo        | Tipo      | Descrição                   |
|--------------|-----------|------------------------------|
| id_receita   | int [PK]  | Identificador da receita     |
| data_emissao | datetime  | Data de emissão da receita   |
| id_consulta  | int       | FK para consulta             |
| id_medico    | int       | FK para médico               |
| id_paciente  | int       | FK para paciente             |

# 💊 Medicamento

Lista de medicamentos.

| Campo          | Tipo         | Descrição                  |
|----------------|--------------|-----------------------------|
| id_medicamento | int [PK]     | Identificador do medicamento|
| nome           | varchar(255) | Nome do medicamento         |

# 💉 Receita_Medicamento

Medicamentos receitados por receita.

| Campo           | Tipo           | Descrição                      |
|-----------------|----------------|---------------------------------|
| id              | int [PK]       | Identificador da linha          |
| id_receita      | int            | FK para receita                 |
| id_medicamento  | int            | FK para medicamento             |
| dose            | varchar(100)   | Dose a ser administrada         |
| frequencia      | varchar(100)   | Frequência do uso               |
| quantidade      | varchar(100)   | Quantidade a ser administrada   |
| instruções_uso  | varchar(222)   | Instruções de uso               |

# 🏨 Quarto

Informações sobre os quartos do hospital.

| Campo          | Tipo         | Descrição               |
|----------------|--------------|--------------------------|
| id_quartos     | int [PK]     | Identificador do quarto |
| numero         | varchar(255) | Número do quarto        |
| tipo_de_quarto | int          | FK para tipo de quarto  |

# 🗂️ Tipo_de_Quarto

Tipos e valores de diária dos quartos.

| Campo             | Tipo           | Descrição                 |
|-------------------|----------------|----------------------------|
| id_tipo_de_quarto | int [PK]       | Identificador do tipo     |
| descrição         | text           | Descrição do tipo de quarto|
| valor_diária      | decimal(10,2)  | Valor da diária            |

# 🛏️ Internação

Registra as internações hospitalares.

| Campo          | Tipo       | Descrição                         |
|----------------|------------|------------------------------------|
| id_internacao  | int [PK]   | Identificador da internação       |
| id_enfermeiro  | int        | FK para enfermeiro                |
| id_paciente    | int        | FK para paciente                  |
| id_medico      | int        | FK para médico                    |
| id_quarto      | int        | FK para quarto                    |
| data_entrada   | datetime   | Data de entrada                   |
| data_prev_alta | datetime   | Data prevista de alta             |
| data_alta      | datetime   | Data de alta real                 |
| procedimento   | text       | Procedimentos realizados          |

# 👩‍⚕️ Enfermeiro

Dados dos enfermeiros.


| Campo         | Tipo         | Descrição                         |
|---------------|--------------|------------------------------------|
| id_enfermeiro | int [PK]     | Identificador do enfermeiro        |
| nome          | varchar(255) | Nome completo                      |
| cpf           | varchar(14)  | CPF                                |
| coren         | varchar(20)  | Registro no Conselho de Enfermagem |

---



# Banco de Dados para um Hospital — Parte 3 Alimentando o banco de dados

# 🏥 De que serve o banco sem dados? Então vamos alimentar o banco!

Com a estrutura do banco de dados do sistema hospitalar finalizada, chegou a hora de realizar o **povoamento inicial**, garantindo que todas as tabelas estejam devidamente preenchidas para possibilitar testes e validações no sistema.

Nesta etapa, desenvolvemos **scripts SQL completos para inserção de dados** nas tabelas criadas anteriormente, seguindo regras específicas e exigências funcionais que garantem a veracidade e funcionalidade do sistema hospitalar simulado.


## ✅ Objetivos da atividade
  📄 **Enunciado da Atividade**
- Criar **scripts de inserção (INSERT)** para as tabelas do banco de dados.
- Garantir que os dados sejam consistentes e reflitam uma estrutura hospitalar realista.
- Separar os scripts iniciais obrigatórios para o funcionamento do sistema desde a sua instalação.



## 📋 Requisitos atendidos

- [x] Inserção de **10 médicos** com diferentes especialidades.
- [x] Cadastro de **7 especialidades** médicas (incluindo: Pediatria, Clínica Geral, Gastrenterologia e Dermatologia).
- [x] Registro de **15 pacientes** distintos.
- [x] Registro de **20 consultas**, com:
  - Datas entre **01/01/2015 e 01/01/2022**.
  - Pacientes com múltiplas consultas.
  - **10 consultas com receituários** contendo **2 ou mais medicamentos**.
- [x] Cadastro de **4 convênios médicos**, associados a pelo menos **5 pacientes** e **5 consultas**.
- [x] Criação de:
  - Relacionamento entre **médicos e especialidades**.
  - Relacionamento entre **internações e enfermeiros**.
- [x] Correções nas **chaves estrangeiras** (ex: entre convênio e médico, internação e enfermeiro, etc).
- [x] Inclusão de **7 internações**, com:
  - Dois pacientes internados mais de uma vez.
  - Ocorrências entre **2015 e 2022**.
- [x] Cadastro de **3 tipos de quartos** com valores distintos (apartamento, quarto duplo e enfermaria).
- [x] Inserção de **10 enfermeiros**, com **dupla associação por internação**.

## 📂 Arquivos incluídos
Os dados foram inseridos no script SQL principal `Base_Hospital.sql`, contendo:

- Criação de todas as tabelas e relacionamentos com `FOREIGN KEY`.
- Inserções de dados (`INSERT INTO`) para todas as entidades:
  - Médicos
  - Especialidades
  - Pacientes
  - Endereços
  - Consultas
  - Receitas
  - Medicamentos
  - Convênios
  - Quartos e tipos de quarto
  - Internações
  - Enfermeiros
  - Relacionamentos (enfermeiro_internacao, especialidade_medico, etc)

# 📁 Arquivo principal: [Arquivo MySQL Banco de Dados - Parte 3](https://github.com/marciordalio/sistema-hospitalar-db-/blob/main/banco_de_dados_MySQL_parte_3.sql)
                    

