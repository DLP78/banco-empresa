# 💼 Banco de Dados - Empresa

Este projeto demonstra a criação e manipulação de um **banco de dados relacional MySQL** para uma empresa fictícia.  
O objetivo é representar o relacionamento entre **departamentos, funcionários e projetos**.

---

## 🧩 Estrutura do Banco

O banco de dados `empresa` contém as seguintes tabelas:

| Tabela | Descrição |
|--------|------------|
| `departamentos` | Armazena os departamentos da empresa |
| `funcionarios` | Registra os funcionários e seus cargos/salários |
| `projetos` | Contém os projetos em andamento |
| `funcionarios_projetos` | Relaciona funcionários aos projetos |

---

## 🧠 Relacionamentos

- Um **departamento** possui vários **funcionários** e **projetos**.  
- Um **funcionário** pode participar de **vários projetos**.  
- Cada **projeto** pertence a um único **departamento**.

---

## ⚙️ Exemplos de Consultas

### 🔹 Listar funcionários e seus departamentos
```sql
SELECT f.id, f.nome, f.cargo, f.salario, d.nome AS departamento
FROM funcionarios f
JOIN departamentos d ON f.departamento_id = d.id
ORDER BY f.nome;
