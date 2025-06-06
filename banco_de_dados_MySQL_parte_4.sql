SELECT * FROM hospital.medico;
ALTER TABLE hospital.medico ADD COLUMN em_atividade BOOLEAN DEFAULT TRUE;
UPDATE hospital.medico SET em_atividade = FALSE WHERE id_médico IN (3, 5);
UPDATE hospital.medico SET em_atividade = TRUE WHERE id_médico NOT IN (3, 5);

