<div align="center">

# MoveUp

### Sustentabilidade em movimento

Projeto de Banco de Dados desenvolvido para a Sprint 3 do Challenge SoulUp — FIAP, com foco na implementação do modelo relacional da plataforma MoveUp utilizando Oracle Database e SQL.

<p align="center">
  <img src="https://img.shields.io/badge/Oracle%20Database-F80000?style=for-the-badge&logo=oracle&logoColor=white"><img src="https://img.shields.io/badge/SQL-4479A1?style=for-the-badge"><img src="https://img.shields.io/badge/FIAP-555555?style=for-the-badge"><img src="https://img.shields.io/badge/Challenge-ED145B?style=for-the-badge">
</p>

</div>

---

## Sobre o projeto

O **MoveUp** é uma solução desenvolvida para o Challenge SoulUp — FIAP, com a proposta de incentivar práticas sustentáveis por meio de um sistema de pontos que pode ser convertido em créditos para utilização no transporte público.

Nesta Sprint 3, foi desenvolvido o **modelo físico e relacional do banco de dados**, mantendo as entidades e regras de negócio definidas nas etapas anteriores do projeto.

O banco foi implementado utilizando **Oracle Database**, com um script DDL responsável pela criação das tabelas, relacionamentos e restrições de integridade.

---

## Funcionalidades

- Cadastro e armazenamento dos dados de pessoas e usuários
- Controle de pontos dos usuários
- Cadastro e gerenciamento de missões
- Registro da participação dos usuários nas missões
- Controle dos pontos obtidos nas missões
- Registro das conversões de pontos
- Cadastro dos tipos de transporte
- Geração e controle de vouchers
- Registro da utilização dos vouchers no transporte
- Registro do impacto ambiental
- Registro de ações para auditoria do sistema

---

## Tecnologias

| Tecnologia | Utilização |
|---|---|
| Oracle Database | Implementação do banco de dados relacional |
| Oracle SQL Developer | Execução e validação do script DDL |
| SQL | Definição da estrutura e restrições do banco |
| DDL | Criação das tabelas e relacionamentos |

---

## Estrutura do banco

O banco de dados é composto por **10 tabelas**, mantendo as entidades definidas nas etapas anteriores do projeto.

### PESSOA

Armazena os dados cadastrais das pessoas, incluindo informações como nome, CPF, e-mail, telefone e endereço.

### USUARIO

Responsável pelas informações relacionadas ao usuário da plataforma e seu saldo de pontos.

### MISSAO

Armazena as missões disponíveis na plataforma e suas respectivas recompensas em pontos.

### PARTICIPACAO_MISSAO

Registra a participação dos usuários nas missões e os pontos obtidos.

### TRANSPORTE

Armazena os tipos de transporte disponíveis e as informações relacionadas ao valor da passagem.

### CONVERSAO

Registra as conversões de pontos realizadas pelos usuários para utilização no transporte.

### VOUCHER

Armazena os vouchers gerados a partir das conversões, incluindo seu código, validade e status.

### USO_TRANSPORTE

Registra a utilização dos vouchers no transporte.

### IMPACTO_AMBIENTAL

Armazena informações relacionadas ao impacto ambiental gerado pela utilização do transporte.

### LOG_AUDITORIA

Registra ações realizadas no sistema para fins de auditoria e rastreabilidade.

---

## Evolução do modelo

Para a Sprint 3, não foram adicionadas ou removidas entidades do escopo do projeto.

As alterações realizadas tiveram caráter técnico e de padronização, buscando melhorar a organização do modelo e adequá-lo à implementação no Oracle Database.

### Padronização da nomenclatura

As tabelas foram padronizadas utilizando seus nomes por extenso:

```text
PESSOA
USUARIO
MISSAO
PARTICIPACAO_MISSAO
TRANSPORTE
CONVERSAO
VOUCHER
USO_TRANSPORTE
IMPACTO_AMBIENTAL
LOG_AUDITORIA
```

Essa padronização elimina abreviações utilizadas anteriormente no modelo lógico e facilita a identificação das entidades e de seus relacionamentos.

---

## Integridade dos dados

O DDL implementa diferentes restrições para garantir a consistência dos dados:

- **PRIMARY KEY** para identificação dos registros
- **FOREIGN KEY** para estabelecer os relacionamentos entre as tabelas
- **NOT NULL** para campos obrigatórios
- **UNIQUE** para evitar valores duplicados
- **CHECK** para validação de regras específicas

Entre as principais validações implementadas estão:

- CPF da pessoa como valor único
- E-mail da pessoa como valor único
- Código do voucher como valor único
- Relacionamento entre entidades por meio de chaves estrangeiras
- Valores de pontos não negativos
- Recompensa das missões maior que zero
- Valor da passagem maior que zero

---

## Modelos

O projeto conta com:

- **Modelo Lógico/Relacional**, utilizado como representação das entidades e relacionamentos
- **Modelo Físico/Relacional**, utilizado como base para a implementação no Oracle Database

O modelo físico atualizado contempla as 10 tabelas definidas no projeto.

---

## Implementação

O script DDL foi executado no **Oracle SQL Developer**, realizando a criação das tabelas e das estruturas definidas no modelo físico.

A implementação foi validada por meio da verificação das tabelas criadas no banco de dados.

O script utilizado está disponível neste repositório:

[moveup_ddl.sql](./moveup_ddl.sql)

---

## Como executar

### Pré-requisitos

- Oracle Database
- Oracle SQL Developer ou ferramenta compatível com Oracle SQL
- Usuário com permissão para criação das estruturas do banco

### Execução

1. Abra o Oracle SQL Developer.
2. Conecte-se ao banco de dados Oracle.
3. Abra o arquivo `moveup_ddl.sql`.
4. Execute o script.
5. Verifique a criação das 10 tabelas e seus respectivos relacionamentos.

---

## Documentação

A documentação completa da Sprint 3 está disponível no arquivo:

[Banco de Dados - Sprint 3](./Banco-de-Dados-Sprint-3.pdf)

O documento apresenta a justificativa das alterações técnicas, as evidências da criação das tabelas, o modelo físico/relacional, o modelo lógico/relacional e o teste de implementação.

---

## Challenge SoulUp — FIAP

O **MoveUp** foi desenvolvido no contexto do Challenge SoulUp — FIAP, com o objetivo de utilizar tecnologia para incentivar práticas sustentáveis e promover alternativas relacionadas ao transporte público.

Nesta Sprint, o banco de dados foi estruturado para fornecer a base necessária para o armazenamento e gerenciamento das informações da plataforma.

---

<div align="center">

**MoveUp — Sustentabilidade em movimento**

Desenvolvido por estudantes da FIAP — Turma 1TDSPH

</div>
