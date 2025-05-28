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

# 🚀 Mãos à Obra

📄 **Enunciado da Atividade**

Faça a ligação do diagrama acima ao diagrama desenvolvido na atividade antrior, construindo relacionamentos com entidades relacionadas. E eleve o seu diagrama para que já selecionando os tipos de dados que serão trabalhados e em quais situações. 

Por último, crie um script SQL para a geração do banco de dados e para instruções de montagem de cada uma das entidades/tabelas presentes no diagrama completo (considerando as entidades do diagrama da atividade anterior e as novas entidades propostas no diagrama acima). Também crie tabelas para relacionamentos quando necessário. Aplique colunas e chaves primárias e estrangeiras.
Use ferramentas, como ERPlus, Lucidchart, draw.io (via web) e MySQL Workbench, ou mesmo um editor de imagens para o diagrama. 


![Diagrama Hospital drawio 2 drawio](https://github.com/user-attachments/assets/569edb8d-8f13-41bd-b914-893cf46f0058)


