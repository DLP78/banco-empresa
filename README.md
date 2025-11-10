<h1 align="center">🏢 Banco de Dados – Empresa (MySQL)</h1>

<p align="center">
  <img src="https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Workbench-00758F?style=for-the-badge&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAARVBMVEUAAAD///+AgIAAAACfn5/v7+/o6OjZ2dn8/Pz4+Pjh4eFOTk6jo6Pd3d3BwcHe3t7Dw8PY2NhaWlo/Pz9oaGihoaGlpaX19fX7V8wSAAAAKklEQVQYV2NgQAMYGBhYGBBgYGQAAwwMDGxsQmB8eHgkJCTgAqRoAGpgdD2ZgrE4AAAAASUVORK5CYII=" alt="Workbench"/>
  <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white"/>
  <img src="https://img.shields.io/badge/Status-Concluído-success?style=for-the-badge"/>
</p>

---

## 📋 Descrição do Projeto

Este projeto foi desenvolvido como parte das atividades do curso de **Análise e Desenvolvimento de Sistemas (ADS)** na **Anhanguera**, com o objetivo de **modelar, criar e consultar um banco de dados relacional completo** que representa uma empresa fictícia.

O sistema foi projetado para demonstrar **relacionamentos entre departamentos, funcionários e projetos**, aplicando boas práticas de modelagem e SQL.

---

## 🧱 Estrutura do Banco de Dados

O banco foi criado em **MySQL**, contendo as seguintes tabelas principais:

| Tabela | Descrição |
|--------|------------|
| 🏢 **departamentos** | Armazena os setores da empresa (TI, RH, Financeiro, etc.) |
| 👩‍💼 **funcionarios** | Contém os dados dos colaboradores, salários e vínculos |
| 📁 **projetos** | Registra os projetos em andamento |
| 🔗 **funcionarios_projetos** | Relaciona os funcionários aos projetos com seus respectivos papéis |

---

## 💾 Principais comandos SQL utilizados

### 🧩 Criação de tabelas
```sql
CREATE TABLE departamentos (...);
CREATE TABLE funcionarios (...);
CREATE TABLE projetos (...);
CREATE TABLE funcionarios_projetos (...);


##🔍 Consultas com JOIN e GROUP BY

SELECT p.id, p.nome, d.nome AS departamento
FROM projetos p
JOIN departamentos d ON p.departamento_id = d.id;

SELECT d.nome AS departamento, ROUND(AVG(f.salario), 2) AS salario_medio
FROM funcionarios f
JOIN departamentos d ON f.departamento_id = d.id
GROUP BY d.nome;


##⚙️ Atualização e exclusão

UPDATE funcionarios f
JOIN departamentos d ON f.departamento_id = d.id
SET f.salario = f.salario * 1.10
WHERE d.sigla = 'TI';

###📊 Consultas executadas com sucesso

✅ Listagem de projetos e seus departamentos
✅ Associação de funcionários aos projetos
✅ Cálculo de salário médio por departamento
✅ Identificação do maior e menor salário
✅ Atualização de salários da área de TI

⚠️ A tentativa de exclusão de um funcionário foi impedida pelo modo safe update, garantindo a integridade do banco.


🧠 Conceitos aplicados

Normalização de dados

Chaves primárias e estrangeiras

Integridade referencial

Relacionamentos 1:N e N:N

Funções agregadas: AVG(), MAX(), MIN(), ROUND()

Consultas com JOIN, GROUP BY, ORDER BY


🚀 Tecnologias utilizadas
Ferramenta	Função
🐬 MySQL	Banco de dados relacional
🧰 MySQL Workbench	Criação e execução das queries
🧾 Git + GitHub	Controle de versão e portfólio
💻 VS Code / Git Bash	Edição e versionamento do projeto


🧑‍💻 Autor
Daniel Lima Proton
📍 Betim – MG
🎓 Estudante de Análise e Desenvolvimento de Sistemas – Anhanguera
💼 Em busca de estágio na área de TI

<p align="center"> <a href="https://github.com/DLP78" target="_blank"> <img src="https://img.shields.io/badge/GitHub-DLP78-181717?style=for-the-badge&logo=github"/> </a> </p>

📁 Arquivos do projeto

banco.sql → Script completo do banco de dados

README.md → Descrição do projeto

<p align="center">🧡 Projeto desenvolvido para fins acadêmicos e de portfólio.</p> ```
