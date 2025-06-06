CREATE DATABASE hospital; 
USE hospital;
CREATE TABLE medico (
  id_médico int PRIMARY KEY AUTO_INCREMENT,
  nome varchar(255),
  crm varchar(20),
  cpf varchar(14)
);
CREATE TABLE medico_convenio (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_medico INT,
  id_convenio INT,
  FOREIGN KEY (id_medico) REFERENCES medico(id_médico),
  FOREIGN KEY (id_convenio) REFERENCES convenio(id_convenio)
);

CREATE TABLE especialidade (
  id_especialidade int PRIMARY KEY AUTO_INCREMENT,
  nome_especialidade varchar(100)
);

CREATE TABLE especialidade_medico (
  id_especialidadeMedico int PRIMARY KEY AUTO_INCREMENT,
  medico_id int,
  especialidade_id int
);

CREATE TABLE paciente (
  id_paciente int PRIMARY KEY AUTO_INCREMENT,
  nome varchar(255),
  data_nascimento date,
  telefone varchar(22),
  cpf varchar(14),
  id_endereco int,
  id_convenio int
);

CREATE TABLE endereco (
  id_endereco int PRIMARY KEY AUTO_INCREMENT,
  rua varchar(100),
  numero varchar(10),
  complemento varchar(50),
  bairro varchar(50),
  cidade varchar(50),
  estado char(2),
  cep varchar(9)
);

CREATE TABLE consulta (
  id_consulta int PRIMARY KEY AUTO_INCREMENT,
  data_hora datetime,
  id_médico int,
  id_especialidade int,
  valor_consulta decimal(10,2),
  id_paciente int,
  id_convênio int,
  numero_carteira varchar(22)
);

CREATE TABLE convenio (
  id_convenio int PRIMARY KEY AUTO_INCREMENT,
  nome varchar(111),
  cnpj varchar(18),
  tempo_de_carencia varchar(20)
);

CREATE TABLE receita (
  id_receita int PRIMARY KEY AUTO_INCREMENT,
  data_emissao datetime,
  id_consulta int,
  id_medico int,
  id_paciente int
);

CREATE TABLE medicamento (
  id_medicamento int PRIMARY KEY AUTO_INCREMENT,
  nome varchar(255)
);

CREATE TABLE receita_medicamento (
  id int PRIMARY KEY AUTO_INCREMENT,
  id_receita int,
  id_medicamento int,
  dose varchar(100),
  frequencia varchar(100),
  quantidade varchar(100),
  instruções_uso varchar(222)
);

CREATE TABLE quarto (
  id_quartos int PRIMARY KEY AUTO_INCREMENT,
  numero varchar(255),
  tipo_de_quarto int
);

CREATE TABLE tipo_de_quarto (
  id_tipo_de_quarto int PRIMARY KEY AUTO_INCREMENT,
  descrição text,
  valor_diária decimal(10,2)
);

CREATE TABLE Internação (
  id_enfermeiro int,
  id_paciente int,
  id_medico int,
  id_quarto int,
  id_internacao int PRIMARY KEY AUTO_INCREMENT,
  data_entrada datetime,
  data_prev_alta datetime,
  data_alta datetime,
  procedimento text
);

CREATE TABLE enfermeiro (
  id_enfermeiro int PRIMARY KEY AUTO_INCREMENT,
  nome varchar(256),
  cpf varchar(14),
  coren varchar(20)
);

ALTER TABLE Internação DROP FOREIGN KEY Internação_ibfk_1; -- ou o nome da FK se for diferente
ALTER TABLE Internação DROP COLUMN id_enfermeiro;


CREATE TABLE enfermeiro_internacao (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_enfermeiro INT,
  id_internacao INT,
  FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro(id_enfermeiro),
  FOREIGN KEY (id_internacao) REFERENCES Internação(id_internacao)
);
ALTER TABLE especialidade_medico ADD FOREIGN KEY (medico_id) REFERENCES medico (id_médico);

ALTER TABLE especialidade_medico ADD FOREIGN KEY (especialidade_id) REFERENCES especialidade (id_especialidade);

ALTER TABLE paciente ADD FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco);

ALTER TABLE paciente ADD FOREIGN KEY (id_convenio) REFERENCES convenio (id_convenio);

ALTER TABLE consulta ADD FOREIGN KEY (id_médico) REFERENCES medico (id_médico);

ALTER TABLE consulta ADD FOREIGN KEY (id_especialidade) REFERENCES especialidade (id_especialidade);

ALTER TABLE consulta ADD FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente);

ALTER TABLE consulta ADD FOREIGN KEY (id_convênio) REFERENCES convenio (id_convenio);

ALTER TABLE receita ADD FOREIGN KEY (id_consulta) REFERENCES consulta (id_consulta);

ALTER TABLE receita ADD FOREIGN KEY (id_medico) REFERENCES medico (id_médico);

ALTER TABLE receita ADD FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente);

ALTER TABLE receita_medicamento ADD FOREIGN KEY (id_receita) REFERENCES receita (id_receita);

ALTER TABLE receita_medicamento ADD FOREIGN KEY (id_medicamento) REFERENCES medicamento (id_medicamento);

ALTER TABLE quarto ADD FOREIGN KEY (tipo_de_quarto) REFERENCES tipo_de_quarto (id_tipo_de_quarto);

ALTER TABLE Internação ADD FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro (id_enfermeiro);

ALTER TABLE Internação ADD FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente);

ALTER TABLE Internação ADD FOREIGN KEY (id_medico) REFERENCES medico (id_médico);

ALTER TABLE Internação ADD FOREIGN KEY (id_quarto) REFERENCES quarto (id_quartos);

INSERT INTO medico (nome, crm, cpf) VALUES
('Dr. João Silva', '123456', '123.456.789-00'),
('Dra. Maria Oliveira', '234567', '234.567.890-11'),
('Dr. Ricardo Santos', '345678', '345.678.901-22'),
('Dra. Ana Lima', '456789', '456.789.012-33'),
('Dr. Pedro Almeida', '567890', '567.890.123-44'),
('Dra. Carolina Torres', '678901', '678.901.234-55'),
('Dr. Felipe Souza', '789012', '789.012.345-66'),
('Dra. Beatriz Costa', '890123', '890.123.456-77'),
('Dr. Marcos Mendes', '901234', '901.234.567-88'),
('Dra. Larissa Rocha', '012345', '012.345.678-99');

INSERT INTO especialidade (nome_especialidade) VALUES
('Pediatria'),
('Clínica Geral'),
('Gastrenterologia'),
('Dermatologia'),
('Cardiologia'),
('Neurologia'),
('Ortopedia');

INSERT INTO especialidade_medico (medico_id, especialidade_id) VALUES
(1, 1), -- Dr. João Silva - Pediatria
(2, 2), -- Dra. Maria Oliveira - Clínica Geral
(3, 3), -- Dr. Ricardo Santos - Gastrenterologia
(4, 4), -- Dra. Ana Lima - Dermatologia
(5, 5), -- Dr. Pedro Almeida - Cardiologia
(6, 6), -- Dra. Carolina Torres - Neurologia
(7, 7), -- Dr. Felipe Souza - Ortopedia
(8, 1), -- Dra. Beatriz Costa - Pediatria
(9, 2), -- Dr. Marcos Mendes - Clínica Geral
(10, 3); -- Dra. Larissa Rocha - Gastrenterologia

INSERT INTO endereco (rua, numero, cidade, estado, cep) VALUES
('Rua A', 100, 'CidadeX', 'EX', '00000-000'),
('Rua B', 200, 'CidadeY', 'EY', '11111-111'),
('Rua C', 300, 'CidadeZ', 'EZ', '22222-222'),
('Rua D', 400, 'CidadeW', 'EW', '33333-333'),
('Rua E', 500, 'CidadeV', 'EV', '44444-444'),
('Rua F', 600, 'CidadeU', 'EU', '55555-555'),
('Rua G', 700, 'CidadeT', 'ET', '66666-666'),
('Rua H', 800, 'CidadeS', 'ES', '77777-777'),
('Rua I', 900, 'CidadeR', 'ER', '88888-888'),
('Rua J', 1000, 'CidadeQ', 'EQ', '99999-999'),
('Rua K', 1100, 'CidadeP', 'EP', '10101-101'),
('Rua L', 1200, 'CidadeO', 'EO', '20202-202'),
('Rua M', 1300, 'CidadeN', 'EN', '30303-303'),
('Rua N', 1400, 'CidadeM', 'EM', '40404-404'),
('Rua O', 1500, 'CidadeL', 'EL', '50505-505');

INSERT INTO convenio (nome, cnpj, tempo_de_carencia) VALUES
('Convênio VidaSaúde', '00.000.000/0001-00', 7),
('Convênio BemEstar', '11.111.111/0001-11', 14),
('Convênio SaúdeTotal', '22.222.222/0001-22', 30),
('Convênio Cuidado+', '33.333.333/0001-33', 0),
('Convênio AmigoSaúde', '44.444.444/0001-44', 10),
('Convênio ProVida', '55.555.555/0001-55', 5),
('Convênio BoaVida', '66.666.666/0001-66', 15),
('Convênio VitalCare', '77.777.777/0001-77', 20),
('Convênio SaúdeJá', '88.888.888/0001-88', 0),
('Convênio Essencial', '99.999.999/0001-99', 3),
('Convênio VidaPlena', '10.101.010/0001-10', 7),
('Convênio SaúdeMais', '20.202.020/0001-20', 0),
('Convênio VivaBem', '30.303.030/0001-30', 12),
('Convênio CuidarBem', '40.404.040/0001-40', 8),
('Convênio SaúdeFácil', '50.505.050/0001-50', 0);

INSERT INTO consulta (data_hora, id_médico, id_especialidade, valor_consulta, id_paciente, id_convênio, numero_carteira) VALUES
('2015-02-10 09:00:00', 1, 1, 150.00, 1, 1, '12345'),
('2015-03-15 10:30:00', 2, 2, 180.00, 2, 2, '67890'),
('2016-04-20 11:00:00', 3, 3, 200.00, 3, 3, '11121'),
('2016-05-25 14:00:00', 4, 4, 220.00, 4, 4, '13141'),
('2017-06-30 15:30:00', 5, 5, 250.00, 5, 5, '15161'),
('2017-07-05 09:00:00', 6, 6, 300.00, 6, 6, '17181'),
('2018-08-10 10:30:00', 7, 7, 270.00, 7, 7, '19202'),
('2018-09-15 11:00:00', 1, 1, 150.00, 8, 1, '21222'),
('2019-10-20 14:00:00', 2, 2, 180.00, 9, 2, '23242'),
('2019-11-25 15:30:00', 3, 3, 200.00, 10, 3, '25262'),
('2020-12-30 09:00:00', 4, 4, 220.00, 1, 4, '27282'),
('2020-01-05 10:30:00', 5, 5, 250.00, 2, 5, '29302'),
('2021-02-10 11:00:00', 6, 6, 300.00, 3, 6, '31322'),
('2021-03-15 14:00:00', 7, 7, 270.00, 4, 7, '33342'),
('2021-04-20 15:30:00', 1, 1, 150.00, 5, 1, '35362'),
('2021-05-25 09:00:00', 2, 2, 180.00, 6, 2, '37382'),
('2021-06-30 10:30:00', 3, 3, 200.00, 7, 3, '39402'),
('2021-07-05 11:00:00', 4, 4, 220.00, 8, 4, '41422'),
('2021-08-10 14:00:00', 5, 5, 250.00, 9, 5, '43442'),
('2021-09-15 15:30:00', 6, 6, 300.00, 10, 6, '45462');



INSERT INTO paciente (id_paciente, nome, data_nascimento, telefone) VALUES
(1, 'Paciente 1', '1980-01-01', '1111-1111'),
(2, 'Paciente 2', '1981-02-02', '2222-2222'),
(3, 'Paciente 3', '1982-03-03', '3333-3333'),
(4, 'Paciente 4', '1983-04-04', '4444-4444'),
(5, 'Paciente 5', '1984-05-05', '5555-5555'),
(6, 'Paciente 6', '1985-06-06', '6666-6666'),
(7, 'Paciente 7', '1986-07-07', '7777-7777'),
(8, 'Paciente 8', '1987-08-08', '8888-8888'),
(9, 'Paciente 9', '1988-09-09', '9999-9999'),
(10, 'Paciente 10', '1989-10-10', '1010-1010'),
(11, 'Paciente 11', '1990-11-11', '1111-1212'),
(12, 'Paciente 12', '1991-12-12', '1212-1313'),
(13, 'Paciente 13', '1992-01-13', '1313-1414'),
(14, 'Paciente 14', '1993-02-14', '1414-1515'),
(15, 'Paciente 15', '1994-03-15', '1515-1616'),
(16, 'Paciente 16', '1995-04-16', '1616-1717'),
(17, 'Paciente 17', '1996-05-17', '1717-1818'),
(18, 'Paciente 18', '1997-06-18', '1818-1919'),
(19, 'Paciente 19', '1998-07-19', '1919-2020'),
(20, 'Paciente 20', '1999-08-20', '2020-2121');

INSERT INTO consulta (data_hora, id_médico, id_especialidade, valor_consulta, id_paciente, id_convênio, numero_carteira) VALUES
('2015-02-15 09:00:00', 1, 1, 150.00, 1, 1, '12345'),
('2015-03-20 10:30:00', 2, 2, 180.00, 2, 2, '23456'),
('2016-04-22 14:00:00', 3, 3, 200.00, 3, 3, '34567'),
('2016-05-30 11:15:00', 4, 4, 220.00, 4, 4, '45678'),
('2017-06-18 13:30:00', 5, 5, 250.00, 5, 5, '56789'),
('2017-07-25 15:00:00', 6, 6, 300.00, 6, 6, '67890'),
('2018-08-10 16:45:00', 7, 7, 270.00, 7, 7, '78901'),
('2018-09-05 10:00:00', 8, 1, 150.00, 8, 1, '89012'),
('2019-10-12 08:30:00', 9, 2, 180.00, 9, 2, '90123'),
('2019-11-20 09:45:00', 10, 3, 200.00, 10, 3, '01234'),
('2020-12-10 11:00:00', 1, 1, 150.00, 1, 1, '22334'),
('2020-01-15 13:00:00', 2, 2, 180.00, 11, 2, '33445'),
('2021-02-10 14:15:00', 3, 3, 200.00, 12, 3, '44556'),
('2021-03-05 09:20:00', 4, 4, 220.00, 13, 4, '55667'),
('2021-04-18 15:50:00', 5, 5, 250.00, 14, 5, '66778'),
('2021-05-28 16:10:00', 6, 6, 300.00, 15, 6, '77889'),
('2021-06-03 10:10:00', 7, 7, 270.00, 16, 7, '88990'),
('2021-07-14 08:00:00', 8, 1, 150.00, 17, 1, '99001'),
('2021-08-23 11:35:00', 9, 2, 180.00, 18, 2, '10112'),
('2021-12-01 09:55:00', 10, 3, 200.00, 19, 3, '11123');


INSERT INTO medicamento (nome) VALUES
('Paracetamol'),
('Ibuprofeno'),
('Amoxicilina'),
('Omeprazol'),
('Dipirona'),
('Loratadina'),
('Azitromicina'),
('Prednisona'),
('Cefalexina'),
('Ranitidina');

INSERT INTO receita (id_receita) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);


INSERT INTO receita_medicamento (id_receita, id_medicamento, dose, frequencia, quantidade, instruções_uso) VALUES
(1, 1, '500mg', '8/8h', '10 comprimidos', 'Após as refeições'),
(1, 2, '400mg', '12/12h', '6 comprimidos', 'Tomar com água'),

(2, 3, '250mg', '8/8h', '15 cápsulas', 'Antes das refeições'),
(2, 4, '20mg', '1x ao dia', '7 comprimidos', 'Jejum'),

(3, 5, '1g', '6/6h', '10 ml', 'Diluir em água'),
(3, 6, '10mg', '1x ao dia', '5 comprimidos', 'Antes de dormir'),

(4, 7, '500mg', '1x ao dia', '3 cápsulas', 'Após o almoço'),
(4, 8, '20mg', '2x ao dia', '7 comprimidos', 'Tomar com suco'),

(5, 1, '500mg', '6/6h', '20 comprimidos', 'Ingerir com água'),
(5, 9, '500mg', '8/8h', '10 cápsulas', 'Jejum'),

(6, 2, '400mg', '8/8h', '10 comprimidos', 'Evitar álcool'),
(6, 10, '150mg', '1x ao dia', '5 comprimidos', 'À noite'),

(7, 3, '250mg', '12/12h', '10 cápsulas', 'Ingerir com leite'),
(7, 6, '10mg', '1x ao dia', '5 comprimidos', 'Antes de dormir'),

(8, 4, '20mg', '1x ao dia', '7 comprimidos', 'Jejum'),
(8, 7, '500mg', '1x ao dia', '3 cápsulas', 'Após o almoço'),

(9, 5, '1g', '6/6h', '20 ml', 'Com água'),
(9, 10, '150mg', '1x ao dia', '7 comprimidos', 'À noite'),

(10, 1, '500mg', '8/8h', '10 comprimidos', 'Após refeições'),
(10, 2, '400mg', '12/12h', '6 comprimidos', 'Com água');

INSERT INTO paciente (nome, data_nascimento, telefone, cpf, id_endereco, id_convenio) VALUES
('Carlos Silva', '1985-01-15', '99999-1111', '111.222.333-44', 1, 1),
('Ana Pereira', '1990-05-20', '99999-2222', '222.333.444-55', 2, 2),
('Marcos Oliveira', '1978-07-11', '99999-3333', '333.444.555-66', 3, 3),
('Juliana Costa', '1982-09-25', '99999-4444', '444.555.666-77', 4, 4),
('Fernanda Souza', '1995-12-30', '99999-5555', '555.666.777-88', 5, 1);



INSERT INTO tipo_de_quarto (descrição, valor_diária) VALUES
('Enfermaria', 150.00),
('UTI', 500.00),
('Semi-privativo', 300.00),
('Privativo', 450.00);

INSERT INTO quarto (numero, tipo_de_quarto) VALUES
('101', 1),  -- Enfermaria
('102', 1),
('103', 1),
('104', 1),
('105', 1),
('201', 2),  -- UTI
('202', 2),
('203', 2),
('204', 2),
('205', 2),
('301', 3),  -- Semi-privativo
('302', 3),
('303', 3),
('304', 3),
('305', 3),
('401', 4),  -- Privativo
('402', 4),
('403', 4),
('404', 4),
('405', 4);


INSERT INTO enfermeiro (id_enfermeiro, nome) VALUES
(1, 'Enfermeiro A'),
(2, 'Enfermeiro B');
INSERT INTO Internação (id_enfermeiro, id_paciente, id_medico, id_quarto, data_entrada, data_prev_alta, data_alta, procedimento)
VALUES
(1, 1, 1, 1, '2015-03-10 08:00:00', '2015-03-20 08:00:00', '2015-03-19 15:00:00', 'Cirurgia de apendicite'),
(2, 2, 2, 2, '2016-05-15 10:00:00', '2016-05-25 10:00:00', '2016-05-24 14:30:00', 'Tratamento de pneumonia'),
(1, 3, 1, 1, '2017-09-01 12:00:00', '2017-09-10 12:00:00', '2017-09-10 09:00:00', 'Observação por febre alta'),
(2, 1, 2, 3, '2018-01-20 09:30:00', '2018-01-30 09:30:00', '2018-01-29 17:00:00', 'Tratamento de infecção urinária'),
(1, 4, 2, 2, '2019-04-10 07:00:00', '2019-04-17 07:00:00', '2019-04-16 10:00:00', 'Recuperação de fratura no braço'),
(2, 2, 1, 3, '2020-11-05 14:00:00', '2020-11-15 14:00:00', '2020-11-14 11:00:00', 'Revisão pós-operatória'),
(1, 1, 2, 1, '2021-08-25 10:00:00', '2021-09-05 10:00:00', '2021-09-04 16:30:00', 'Tratamento para dor crônica'); 

INSERT INTO enfermeiro (id_enfermeiro, nome) VALUES
(3, 'Enfermeiro 3'),
(4, 'Enfermeiro 4'),
(17, 'Enfermeiro 17');

INSERT INTO tipo_de_quarto (descrição, valor_diária) VALUES
('Apartamento', 450.00),
('Quarto Duplo', 300.00),
('Enfermaria', 180.00);


INSERT INTO tipo_de_quarto (descrição, valor_diária) VALUES
('Apartamento', 350.00),
('Quarto Duplo', 200.00),
('Enfermaria', 100.00);


INSERT INTO enfermeiro (nome, cpf, coren) VALUES ('Ana Paula Souza', '123.456.789-00', 'COREN-001');
INSERT INTO enfermeiro (nome, cpf, coren) VALUES ('Carlos Henrique Lima', '234.567.890-11', 'COREN-002');
INSERT INTO enfermeiro (nome, cpf, coren) VALUES ('Fernanda Gomes', '345.678.901-22', 'COREN-003');
INSERT INTO enfermeiro (nome, cpf, coren) VALUES ('Lucas Pereira', '456.789.012-33', 'COREN-004');
INSERT INTO enfermeiro (nome, cpf, coren) VALUES ('Juliana Alves', '567.890.123-44', 'COREN-005');
INSERT INTO enfermeiro (nome, cpf, coren) VALUES ('Marcos Vinícius', '678.901.234-55', 'COREN-006');
INSERT INTO enfermeiro (nome, cpf, coren) VALUES ('Patrícia Rocha', '789.012.345-66', 'COREN-007');
INSERT INTO enfermeiro (nome, cpf, coren) VALUES ('Ricardo Martins', '890.123.456-77', 'COREN-008');
INSERT INTO enfermeiro (nome, cpf, coren) VALUES ('Tatiane Ribeiro', '901.234.567-88', 'COREN-009');
INSERT INTO enfermeiro (nome, cpf, coren) VALUES ('Vinícius Teixeira', '012.345.678-99', 'COREN-010');

INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (1, 1);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (4, 1);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (2, 2);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (5, 2);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (3, 3);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (6, 3);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (4, 4);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (7, 4);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (5, 5);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (8, 5);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (6, 6);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (9, 6);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (7, 7);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (10, 7);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (8, 8);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (1, 8);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (9, 9);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (2, 9);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (10, 10);
INSERT INTO enfermeiro_internacao (id_enfermeiro, id_internacao) VALUES (3, 10);
INSERT IGNORE INTO tipo_de_quarto (descrição, valor_diária) VALUES ('Quarto Simples', 100.00);

INSERT INTO tipo_de_quarto (descrição, valor_diária) VALUES
('Quarto Coletivo', 150.00),
('Apartamento Simples', 300.00),
('Apartamento Luxo', 500.00),
('UTI', 1000.00);


ALTER TABLE Internação ADD FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro (id_enfermeiro);


INSERT INTO quarto (numero, tipo_de_quarto) VALUES
('101', 1),
('102', 2),
('103', 3),
('201', 4);



