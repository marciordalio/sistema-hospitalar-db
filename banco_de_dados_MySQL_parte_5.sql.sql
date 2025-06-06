USE hospital;
SELECT *, 
       (SELECT AVG(valor_consulta) FROM consulta WHERE YEAR(data_hora) = 2020 AND id_convênio IS NOT NULL) AS media_valor_2020_convenio
FROM consulta
WHERE YEAR(data_hora) = 2020 AND id_convênio IS NOT NULL;

SELECT * 
FROM Internação
WHERE data_alta > data_prev_alta;

SELECT r.*, rm.*, m.nome AS nome_medicamento
FROM receita r
JOIN receita_medicamento rm ON r.id_receita = rm.id_receita
JOIN medicamento m ON rm.id_medicamento = m.id_medicamento
WHERE r.id_consulta = (
  SELECT MIN(id_consulta) FROM receita
);

SELECT * FROM consulta
WHERE id_convênio IS NULL
  AND (valor_consulta = (SELECT MAX(valor_consulta) FROM consulta WHERE id_convênio IS NULL)
    OR valor_consulta = (SELECT MIN(valor_consulta) FROM consulta WHERE id_convênio IS NULL));

SELECT i.*, q.numero, tq.descrição AS tipo_quarto, tq.valor_diária,
       DATEDIFF(i.data_alta, i.data_entrada) AS dias,
       DATEDIFF(i.data_alta, i.data_entrada) * tq.valor_diária AS valor_total
FROM Internação i
JOIN quarto q ON i.id_quarto = q.id_quartos
JOIN tipo_de_quarto tq ON q.tipo_de_quarto = tq.id_tipo_de_quarto;

SELECT i.data_entrada, i.procedimento, q.numero
FROM Internação i
JOIN quarto q ON i.id_quarto = q.id_quartos
JOIN tipo_de_quarto tq ON q.tipo_de_quarto = tq.id_tipo_de_quarto
WHERE tq.descrição = 'Apartamento';

SELECT p.nome AS paciente, c.data_hora, e.nome_especialidade
FROM consulta c
JOIN paciente p ON c.id_paciente = p.id_paciente
JOIN especialidade e ON c.id_especialidade = e.id_especialidade
WHERE TIMESTAMPDIFF(YEAR, p.data_nascimento, c.data_hora) < 18
  AND e.nome_especialidade <> 'Pediatria'
ORDER BY c.data_hora;

SELECT p.nome AS paciente, m.nome AS medico, i.data_entrada, i.procedimento
FROM Internação i
JOIN paciente p ON i.id_paciente = p.id_paciente
JOIN medico m ON i.id_medico = m.id_médico
JOIN especialidade_medico em ON m.id_médico = em.medico_id
JOIN especialidade e ON em.especialidade_id = e.id_especialidade
JOIN quarto q ON i.id_quarto = q.id_quartos
JOIN tipo_de_quarto tq ON q.tipo_de_quarto = tq.id_tipo_de_quarto
WHERE e.nome_especialidade = 'Gastrenterologia'
  AND tq.descrição = 'Enfermaria';

SELECT m.nome, m.crm, COUNT(c.id_consulta) AS total_consultas
FROM medico m
LEFT JOIN consulta c ON m.id_médico = c.id_médico
GROUP BY m.id_médico;

SELECT * FROM medico
WHERE nome LIKE '%Gabriel%';

SELECT e.nome, e.coren, COUNT(ei.id_internacao) AS total_internacoes
FROM enfermeiro e
JOIN enfermeiro_internacao ei ON e.id_enfermeiro = ei.id_enfermeiro
GROUP BY e.id_enfermeiro
HAVING COUNT(ei.id_internacao) > 1;
