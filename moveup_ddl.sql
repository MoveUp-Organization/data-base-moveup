-- =========================================================
-- PROJETO MOVE UP - 3ª SPRINT
-- BUILDING RELATIONAL DATABASE
-- FIAP 2026 - TURMA 1TDSPH
-- =========================================================

CREATE TABLE PESSOA (
    id_pessoa      NUMBER PRIMARY KEY,
    nm_usuario     VARCHAR2(100) NOT NULL,
    num_cpf        CHAR(11) NOT NULL UNIQUE,
    ds_email       VARCHAR2(100) NOT NULL UNIQUE,
    num_telefone   VARCHAR2(20),
    ds_senha       VARCHAR2(100) NOT NULL,
    nm_cidade      VARCHAR2(100) NOT NULL,
    nm_bairro      VARCHAR2(100) NOT NULL,
    nm_rua         VARCHAR2(100) NOT NULL,
    num_residencia NUMBER NOT NULL
);

CREATE TABLE USUARIO (
    id_usuario       NUMBER PRIMARY KEY,
    qtd_pontos       NUMBER NOT NULL,
    ds_status        VARCHAR2(20) NOT NULL,
    PESSOA_id_pessoa NUMBER NOT NULL UNIQUE,
    FOREIGN KEY (PESSOA_id_pessoa)
        REFERENCES PESSOA(id_pessoa),
    CHECK (qtd_pontos >= 0)
);

CREATE TABLE MISSAO (
    id_missao            NUMBER PRIMARY KEY,
    nm_missao            VARCHAR2(100) NOT NULL,
    ds_tipoMissao        VARCHAR2(50) NOT NULL,
    qtd_pontosRecompensa NUMBER NOT NULL,
    ds_statusMissao      VARCHAR2(255) NOT NULL,
    CHECK (qtd_pontosRecompensa > 0)
);

CREATE TABLE PARTICIPACAO_MISSAO (
    id_participacao       NUMBER PRIMARY KEY,
    dt_participacao       DATE NOT NULL,
    qtd_pontosGanhos      NUMBER NOT NULL,
    ds_statusParticipacao VARCHAR2(20) NOT NULL,
    USUARIO_id_usuario    NUMBER NOT NULL,
    MISSAO_id_missao      NUMBER NOT NULL,
    FOREIGN KEY (USUARIO_id_usuario)
        REFERENCES USUARIO(id_usuario),
    FOREIGN KEY (MISSAO_id_missao)
        REFERENCES MISSAO(id_missao),
    CHECK (qtd_pontosGanhos >= 0)
);

CREATE TABLE CONVERSAO (
    id_conversao          NUMBER PRIMARY KEY,
    qtd_pontos_movidos    NUMBER NOT NULL,
    dt_conversao          DATE NOT NULL,
    vl_convertidoPassagem NUMBER NOT NULL,
    USUARIO_id_usuario    NUMBER NOT NULL,
    FOREIGN KEY (USUARIO_id_usuario)
        REFERENCES USUARIO(id_usuario),
    CHECK (qtd_pontos_movidos > 0)
);

CREATE TABLE TRANSPORTE (
    id_transporte          NUMBER PRIMARY KEY,
    ds_tipoTransporte      VARCHAR2(50) NOT NULL,
    vl_passagemTransporte  NUMBER(10,2) NOT NULL,
    ds_descricaoTransporte VARCHAR2(250) NOT NULL,
    CHECK (vl_passagemTransporte > 0)
);

CREATE TABLE VOUCHER (
    id_voucher               NUMBER PRIMARY KEY,
    ds_codigoVoucher         VARCHAR2(100) NOT NULL UNIQUE,
    dt_geracaoVoucher        DATE NOT NULL,
    dt_validadeVoucher       DATE NOT NULL,
    ds_statusVoucher         VARCHAR2(20) NOT NULL,
    qtd_pontosUtilizados     NUMBER NOT NULL,
    CONVERSAO_id_conversao   NUMBER NOT NULL,
    TRANSPORTE_id_transporte NUMBER NOT NULL,
    FOREIGN KEY (CONVERSAO_id_conversao)
        REFERENCES CONVERSAO(id_conversao),
    FOREIGN KEY (TRANSPORTE_id_transporte)
        REFERENCES TRANSPORTE(id_transporte)
);

CREATE TABLE USO_TRANSPORTE (
    id_uso             NUMBER PRIMARY KEY,
    dt_uso             DATE NOT NULL,
    ds_local           VARCHAR2(100) NOT NULL,
    ds_metodoUso       VARCHAR2(30) NOT NULL,
    VOUCHER_id_voucher NUMBER NOT NULL,
    FOREIGN KEY (VOUCHER_id_voucher)
        REFERENCES VOUCHER(id_voucher)
);

CREATE TABLE IMPACTO_AMBIENTAL (
    id_impactoAmbiental NUMBER PRIMARY KEY,
    vl_co2_economizado  NUMBER NOT NULL,
    ds_calculo          NUMBER NOT NULL,
    dt_registro         DATE NOT NULL,
    USO_TRANSP_id_uso   NUMBER NOT NULL UNIQUE,
    FOREIGN KEY (USO_TRANSP_id_uso)
        REFERENCES USO_TRANSPORTE(id_uso)
);

CREATE TABLE LOG_AUDITORIA (
    id_log             NUMBER PRIMARY KEY,
    ds_acao            VARCHAR2(100) NOT NULL,
    dt_acao            DATE,
    ds_detalhe         VARCHAR2(250),
    ds_ipDispositivo   VARCHAR2(50) NOT NULL,
    ds_tipoDispositivo VARCHAR2(100) NOT NULL,
    ds_resultado       VARCHAR2(30),
    USUARIO_id_usuario NUMBER NOT NULL,
    FOREIGN KEY (USUARIO_id_usuario)
        REFERENCES USUARIO(id_usuario)
);