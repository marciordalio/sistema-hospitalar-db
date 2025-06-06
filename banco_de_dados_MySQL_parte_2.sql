CREATE TABLE `medico` (
  `id_médico` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255),
  `crm` varchar(20),
  `cpf` varchar(14)
);

CREATE TABLE `especialidade` (
  `id_especialidade` int PRIMARY KEY AUTO_INCREMENT,
  `nome_especialidade` varchar(100)
);

CREATE TABLE `especialidade_medico` (
  `id_especialidadeMedico` int PRIMARY KEY AUTO_INCREMENT,
  `medico_id` int,
  `especialidade_id` int
);

CREATE TABLE `paciente` (
  `id_paciente` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255),
  `data_nascimento` date,
  `telefone` varchar(22),
  `cpf` varchar(14),
  `id_endereco` int,
  `id_convenio` int
);

CREATE TABLE `endereco` (
  `id_endereco` int PRIMARY KEY AUTO_INCREMENT,
  `rua` varchar(100),
  `numero` varchar(10),
  `complemento` varchar(50),
  `bairro` varchar(50),
  `cidade` varchar(50),
  `estado` char(2),
  `cep` varchar(9)
);

CREATE TABLE `consulta` (
  `id_consulta` int PRIMARY KEY AUTO_INCREMENT,
  `data_hora` datetime,
  `id_médico` int,
  `id_especialidade` int,
  `valor_consulta` decimal(10,2),
  `id_paciente` int,
  `id_convênio` int,
  `numero_carteira` varchar(22)
);

CREATE TABLE `convenio` (
  `id_convenio` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(111),
  `cnpj` varchar(18),
  `tempo_de_carencia` varchar(20)
);

CREATE TABLE `receita` (
  `id_receita` int PRIMARY KEY AUTO_INCREMENT,
  `data_emissao` datetime,
  `id_consulta` int,
  `id_medico` int,
  `id_paciente` int
);

CREATE TABLE `medicamento` (
  `id_medicamento` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255)
);

CREATE TABLE `receita_medicamento` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_receita` int,
  `id_medicamento` int,
  `dose` varchar(100),
  `frequencia` varchar(100),
  `quantidade` varchar(100),
  `instruções_uso` varchar(222)
);

CREATE TABLE `quarto` (
  `id_quartos` int PRIMARY KEY AUTO_INCREMENT,
  `numero` varchar(255),
  `tipo_de_quarto` int
);

CREATE TABLE `tipo_de_quarto` (
  `id_tipo_de_quarto` int PRIMARY KEY AUTO_INCREMENT,
  `descrição` text,
  `valor_diária` decimal(10,2)
);

CREATE TABLE `Internação` (
  `id_enfermeiro` int,
  `id_paciente` int,
  `id_medico` int,
  `id_quarto` int,
  `id_internacao` int PRIMARY KEY AUTO_INCREMENT,
  `data_entrada` datetime,
  `data_prev_alta` datetime,
  `data_alta` datetime,
  `procedimento` text
);

CREATE TABLE `enfermeiro` (
  `id_enfermeiro` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255),
  `cpf` varchar(14),
  `coren` varchar(20)
);

ALTER TABLE `especialidade_medico` ADD FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id_médico`);

ALTER TABLE `especialidade_medico` ADD FOREIGN KEY (`especialidade_id`) REFERENCES `especialidade` (`id_especialidade`);

ALTER TABLE `paciente` ADD FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`);

ALTER TABLE `paciente` ADD FOREIGN KEY (`id_convenio`) REFERENCES `convenio` (`id_convenio`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`id_médico`) REFERENCES `medico` (`id_médico`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`id_convênio`) REFERENCES `convenio` (`id_convenio`);

ALTER TABLE `receita` ADD FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id_consulta`);

ALTER TABLE `receita` ADD FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_médico`);

ALTER TABLE `receita` ADD FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `receita_medicamento` ADD FOREIGN KEY (`id_receita`) REFERENCES `receita` (`id_receita`);

ALTER TABLE `receita_medicamento` ADD FOREIGN KEY (`id_medicamento`) REFERENCES `medicamento` (`id_medicamento`);

ALTER TABLE `quarto` ADD FOREIGN KEY (`tipo_de_quarto`) REFERENCES `tipo_de_quarto` (`id_tipo_de_quarto`);

ALTER TABLE `Internação` ADD FOREIGN KEY (`id_enfermeiro`) REFERENCES `enfermeiro` (`id_enfermeiro`);

ALTER TABLE `Internação` ADD FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `Internação` ADD FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_médico`);

ALTER TABLE `Internação` ADD FOREIGN KEY (`id_quarto`) REFERENCES `quarto` (`id_quartos`);
