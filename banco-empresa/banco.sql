-- Banco de Dados: empresa
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

-- ==============================
-- TABELA DEPARTAMENTOS
-- ==============================
CREATE TABLE IF NOT EXISTS departamentos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  sigla VARCHAR(10) UNIQUE,
  localizacao VARCHAR(100)
);

INSERT INTO departamentos (nome, sigla, localizacao) VALUES
('Tecnologia da Informação', 'TI', 'Andar 2'),
('Recursos Humanos', 'RH', 'Andar 1'),
('Financeiro', 'FIN', 'Andar 3'),
('Administração', 'ADM', 'Andar 4');

-- ==============================
-- TABELA FUNCIONÁRIOS
-- ==============================
CREATE TABLE IF NOT EXISTS funcionarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cargo VARCHAR(50),
  salario DECIMAL(10,2),
  data_admissao DATE DEFAULT (CURRENT_DATE),
  departamento_id INT,
  FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

INSERT INTO funcionarios (nome, cargo, salario, departamento_id) VALUES
('Ana Silva', 'Gerente', 7500.00, 4),
('Carlos Souza', 'Analista', 4500.00, 1),
('Maria Lima', 'Assistente', 2500.00, 3),
('Paulo Ramos', 'Desenvolvedor', 5200.00, 1),
('Juliana Costa', 'Estagiária', 1800.00, 2);

-- ==============================
-- TABELA PROJETOS
-- ==============================
CREATE TABLE IF NOT EXISTS projetos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT,
  departamento_id INT,
  FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

INSERT INTO projetos (nome, descricao, departamento_id) VALUES
('Sistema Interno', 'Desenvolvimento de sistema de gestão para uso interno da empresa.', 1),
('Campanha de Recrutamento', 'Nova estratégia de recrutamento de talentos.', 2),
('Controle Financeiro', 'Aprimoramento do sistema de controle financeiro.', 3);

-- ==============================
-- TABELA FUNCIONÁRIOS X PROJETOS
-- ==============================
CREATE TABLE IF NOT EXISTS funcionarios_projetos (
  funcionario_id INT,
  projeto_id INT,
  papel VARCHAR(50),
  PRIMARY KEY (funcionario_id, projeto_id),
  FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id),
  FOREIGN KEY (projeto_id) REFERENCES projetos(id)
);

INSERT INTO funcionarios_projetos (funcionario_id, projeto_id, papel) VALUES
(2, 1, 'Desenvolvedor Back-end'),
(4, 1, 'Desenvolvedor Front-end'),
(5, 2, 'Assistente de RH'),
(1, 3, 'Gerente do Projeto'),
(3, 3, 'Analista Financeiro');

-- ==============================
-- CONSULTAS SQL
-- ==============================

-- Listar funcionários com seus departamentos
SELECT f.id, f.nome, f.cargo, f.salario, d.nome AS departamento
FROM funcionarios f
JOIN departamentos d ON f.departamento_id = d.id
ORDER BY f.nome;

-- Média salarial por departamento
SELECT d.nome AS departamento, ROUND(AVG(f.salario), 2) AS salario_medio
FROM funcionarios f
JOIN departamentos d ON f.departamento_id = d.id
GROUP BY d.nome;

-- Maior e menor salário da empresa
SELECT MAX(salario) AS maior_salario, MIN(salario) AS menor_salario
FROM funcionarios;

-- Funcionários acima da média salarial
SELECT nome, cargo, salario
FROM funcionarios
WHERE salario > (SELECT AVG(salario) FROM funcionarios)
ORDER BY salario DESC;

-- Reajuste de 10% para funcionários do departamento de TI
UPDATE funcionarios f
JOIN departamentos d ON f.departamento_id = d.id
SET f.salario = f.salario * 1.10
WHERE d.sigla = 'TI';
