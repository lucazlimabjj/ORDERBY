🧮 Praticando GROUP BY no PostgreSQL

Este repositório contém um conjunto de scripts SQL projetados para treinar GROUP BY, HAVING e funções de agregação no PostgreSQL, utilizando um cenário simples de tabelas comerciais (clientes, produtos e vendas).

O objetivo é oferecer um ambiente prático para estudo, ideal para iniciantes ou para reforçar conceitos fundamentais de análise com SQL.

📂 Arquivos do Repositório

create_tables_and_inserts.sql
• Cria o schema comercial
• Cria as tabelas clientes, produtos e vendas
• Insere dados fictícios para prática

exercicios.sql
• Lista de exercícios organizados por nível (básico, intermediário e avançado)
• Cada exercício possui comentários explicativos

ex_resolvidos.sql
• Soluções dos exercícios
• Mantém a mesma ordem do arquivo de exercícios

🛠️ Tecnologias Utilizadas

PostgreSQL

SQL

Funções de agregação (SUM, COUNT, AVG, etc.)

Cláusulas GROUP BY e HAVING

Ferramentas: pgAdmin / DBeaver / DataGrip / psql

🚀 Como Executar
1️⃣ Execute o script de criação

Carregue no PostgreSQL o arquivo:

create_tables_and_inserts.sql


Isso criará o ambiente completo para realizar os exercícios.

2️⃣ Pratique com os exercícios

Abra:

exercicios.sql


Os exercícios incluem:

Nível 1 – Básico:
• Total de vendas por cliente
• Total de vendas por produto
• Total de vendas por forma de pagamento
• Total por status

Nível 2 – Intermediário:
• Uso de HAVING para filtrar agregações
• Clientes com vendas menores que X
• Produtos com total maior que X

Nível 3 – Avançado:
• Agrupamentos combinados
• Métricas múltiplas (total, média, contagem distinta)

3️⃣ Confira as soluções

Depois de tentar resolver, abra:

ex_resolvidos.sql


As consultas seguem exatamente a mesma ordem dos exercícios.

🎯 Objetivo do Projeto

Este repositório foi criado para ajudar estudantes e iniciantes em SQL a:

Entender melhor o funcionamento de GROUP BY

Praticar agregações em cenários reais

Criar portfólio no GitHub com exercícios de banco de dados

Preparar-se para vagas de BI, Análise de Dados e SQL Developer

👤 Autor

Lucas Lima
Estudante de Análise e Desenvolvimento de Sistemas e Data Analytics.

LinkedIn: https://linkedin.com/in/lucas-lima-6113ab355

GitHub: https://github.com/lucazlimabjj
