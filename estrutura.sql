
CREATE SCHEMA imobiliaria;

SET search_path TO 'imobiliaria';

DROP TABLE IF EXISTS foto;
CREATE TABLE foto (
   id SERIAL PRIMARY KEY NOT NULL ,
   foto1 VARCHAR(250) DEFAULT NULL,
   foto2 VARCHAR(250) DEFAULT NULL,
   foto3 VARCHAR(250) DEFAULT NULL,
   UNIQUE(id)
);

INSERT INTO foto(id, foto1, foto2, foto3) VALUES (1,'','','');
INSERT INTO foto(id, foto1, foto2, foto3) VALUES (2,'','','');
INSERT INTO foto(id, foto1, foto2, foto3) VALUES (3,'','','');
INSERT INTO foto(id, foto1, foto2, foto3) VALUES (4,'','','');
INSERT INTO foto(id, foto1, foto2, foto3) VALUES (5,'','','');
INSERT INTO foto(id, foto1, foto2, foto3) VALUES (6,'','','');
INSERT INTO foto(id, foto1, foto2, foto3) VALUES (7,'','','');
INSERT INTO foto(id, foto1, foto2, foto3) VALUES (8,'','','');
INSERT INTO foto(id, foto1, foto2, foto3) VALUES (9,'','','');
INSERT INTO foto(id, foto1, foto2, foto3) VALUES (10,'','','');

DROP TABLE IF EXISTS bairro;
CREATE TABLE bairro (
    id SERIAL primary key NOT NULL ,
    nome VARCHAR(30)  NOT NULL,

    UNIQUE(nome),
    UNIQUE(id)  
);

INSERT INTO bairro (id, nome) VALUES (1, 'Carlota');
INSERT INTO bairro (id, nome) VALUES (2, 'Centro');
INSERT INTO bairro (id, nome) VALUES (3, 'Jardim dos Estados');
INSERT INTO bairro (id, nome) VALUES (4, 'Jardim Paulista');
INSERT INTO bairro (id, nome) VALUES (5, 'Pioneiros');
INSERT INTO bairro (id, nome) VALUES (6, 'Piratininga');
INSERT INTO bairro (id, nome) VALUES (7, 'TV Morena');
INSERT INTO bairro (id, nome) VALUES (8, 'Tiradentes');
INSERT INTO bairro (id, nome) VALUES (9, 'Planalto');

DROP TABLE IF EXISTS endereco;
CREATE TABLE endereco (
    id SERIAL PRIMARY KEY NOT NULL ,
    rua VARCHAR(250) NOT NULL,
    numero INT NOT NULL,
    cep INT NOT NULL,
    complemento VARCHAR(250),
    id_bairro INTEGER NOT NULL,
    UNIQUE(numero),
    UNIQUE(id),
    CONSTRAINT  id_bairro FOREIGN KEY (id_bairro)REFERENCES bairro (id)
);

INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (1, 'Rua Afonso', 980, 7905456, 'Próximo ao Atacadão', 1);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (2, 'Rua Flávio de Matos', 144, 7905479, 'Próximo à Lotérica', 9);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (3, 'Rua Hebert', 299, 7905478, 'Próximo ao posto Texaco', 9);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (4, 'Av. Costa e Silva', 445, 7905439, 'Vizinho à padaria Real', 1);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (5, 'Av. Mato Grosso', 764, 7905496, 'Próximo ao Hospital', 3);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (6, 'Av. Brasil', 223, 7907756, 'Próximo ao Shopping Central', 4);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (7, 'Rua dos Santos', 123, 7907456, 'Próximo ao HU', 2);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (8, 'Rua Pedro Celestino', 876, 7902356, 'Próximo à UFMS', 5);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (9, 'Rua Bahia', 347, 7906056, 'Próximo ao UBS Cosme Damião', 6);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (10, 'Rua da Paz', 400, 7905665, 'Próximo ao SESAU',7);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (11, 'Rua Afonso', 970, 7905456, 'Próximo ao Atacadão', 1);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (12, 'Rua Flávio de Matos', 164, 7905479, 'Próximo à Lotérica', 9);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (13, 'Rua Hebert', 301, 7905478, 'Próximo ao posto Texaco', 9);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (14, 'Av. Costa e Silva', 459, 7905439, 'Vizinho à padaria Real', 1);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (15, 'Av. Mato Grosso', 864, 7905496, 'Próximo ao Hospital', 3);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (16, 'Av. Brasil', 289, 7907756, 'Próximo ao Shopping Central', 4);
INSERT INTO endereco (id, rua, numero, cep, complemento, id_bairro) VALUES (17, 'Rua dos Santos', 142, 7907456, 'Próximo ao HU', 2);

DROP TABLE IF EXISTS imovel;
CREATE TABLE imovel (
    id SERIAL PRIMARY KEY NOT NULL ,
    nome_categoria VARCHAR(250) NOT NULL,
    id_endereco INTEGER NOT NULL,
    data_construcao DATE NOT NULL,
    data_alugado_vendido DATE NULL,
    data_postagem DATE NOT NULL,
    id_foto INTEGER NOT NULL,
    valor_sugerido_cliente_proprietario NUMERIC NOT NULL,
    status VARCHAR(250) NOT NULL,
    area NUMERIC NOT NULL,
    UNIQUE(id_foto),
    UNIQUE(id_endereco),
    UNIQUE(id),
    CONSTRAINT id_foto FOREIGN KEY (id_foto) REFERENCES foto(id),
    CONSTRAINT id_endereco FOREIGN KEY (id_endereco) REFERENCES endereco (id),
    CONSTRAINT imovel_valor_sugerido_cliente_proprietario_check CHECK ((valor_sugerido_cliente_proprietario > (0)::numeric))
    
);


INSERT INTO imovel (id, nome_categoria, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario, status, area) 
             VALUES (1, 'Casa',1, '2015-07-15', NULL, '2020-05-11', 1, 140000, 'Disponível para Venda', 600);
INSERT INTO imovel (id, nome_categoria, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario, status, area) 
             VALUES (2, 'Casa',2, '2016-09-12', NULL, '2020-06-15', 2, 240000, 'Indisponível para venda, retirado da imobiliária por decisão do cliente proprietário', 380);
INSERT INTO imovel (id, nome_categoria, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario, status, area) 
             VALUES (3,'Casa',3, '2015-07-23', '2020-06-12', '2020-05-22', 3, 6000, 'Alugado', 300);
INSERT INTO imovel (id, nome_categoria, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario, status, area) 
             VALUES (4, 'Apartamento',4, '2015-06-15', NULL, '2020-05-27', 4, 7000, 'Disponível para Aluguel', 650);
INSERT INTO imovel (id, nome_categoria, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario, status, area) 
             VALUES (5, 'Apartamento',5, '2012-04-26', '2020-06-15', '2020-06-01', 5, 856000, 'Vendido', 400);
INSERT INTO imovel (id, nome_categoria, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario, status, area) 
             VALUES (6,'Sala Comercial',6, '2011-03-18', NULL, '2020-05-11', 6, 35000, 'Disponível para Venda', 300);
INSERT INTO imovel (id, nome_categoria, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario, status, area) 
             VALUES (7, 'Sala Comercial',7, '2010-08-19', '2020-06-11', '2020-05-12', 7, 340000, 'Disponível para Aluguel', 400);
INSERT INTO imovel (id, nome_categoria, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario, status, area) 
             VALUES (8, 'Terreno',8, '2010-11-12', NULL, '2020-06-10', 8, 135000, 'Disponível para Venda', 455);
INSERT INTO imovel (id, nome_categoria, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario, status, area) 
             VALUES (9, 'Terreno',9, '2019-12-30', NULL, '2020-05-30', 9, 130000, 'Indisponível para venda, retirado da imobiliária por decisão do cliente proprietário', 630);
INSERT INTO imovel (id, nome_categoria, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario, status, area) 
             VALUES (10, 'Terreno',10, '2005-01-17', '2020-05-19', '2020-05-11', 10, 180000, 'Vendido', 380);


--
DROP TABLE IF EXISTS pessoa;
CREATE TABLE pessoa (
    id SERIAL PRIMARY KEY NOT NULL ,
    nome VARCHAR(250) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    id_endereco INTEGER NOT NULL,
    est_civil VARCHAR(15) NOT NULL,
    sexo  CHARACTER(2) NOT NULL,
    id_tel_email INTEGER NOT NULL,
    UNIQUE(id_tel_email),
    UNIQUE(cpf),
    UNIQUE(id),
    UNIQUE(id_endereco),
    CONSTRAINT id_endereco FOREIGN KEY (id_endereco) REFERENCES endereco (id),
    CONSTRAINT pessoa_sexo_check CHECK ((sexo = ANY (ARRAY ['F'::bpchar, 'M'::bpchar])))
);

INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (1, 'João da Silva', '02246317599', 1, 'Solteiro', 'M', 1);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (2, 'Rodrigo da Costa', '02246317432', 2, 'Solteiro', 'M', 2);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (3, 'Rodrigo Godoy', '42246317597', 3, 'Casado', 'M', 3);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (4, 'Pedro Silva', '53246317599', 4, 'Casado', 'M', 4);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (5, 'Ana Furtado', '02946317545', 5, 'Solteira', 'F', 5);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (6, 'Eliane de Paula', '02846317555', 6, 'Casada', 'F', 6);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (7, 'Helena Salgado', '32246317586', 7, 'Viúva', 'F', 7);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (8, 'Maria dos Santos', '62246317500', 8, 'Solteira', 'F', 8);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (9, 'Alan Medina', '05246317523', 9, 'Solteiro', 'M', 9);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (10, 'Lucas Rezende', '09246317565', 10, 'Casado', 'M', 10);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (11, 'Gabriel de Lima', '09546317565', 11, 'Casado', 'M', 11);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (12, 'Gabriel Duarte', '09276317565', 12, 'Solteiro', 'M', 12);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (13, 'João de Freitas', '09946317565', 13, 'Viúvo', 'M', 13);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (14, 'Gabriel de Freitas', '09886317565', 14, 'Casado', 'M', 14);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (15, 'Amanda da Silva', '09246347565', 15, 'Casada', 'M', 15);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (16, 'Amanda Rezende', '09246325565', 16, 'Solteira', 'M', 16);
INSERT INTO pessoa (id, nome, cpf, id_endereco, est_civil, sexo, id_tel_email) VALUES (17, 'Carla Morais', '09246317175', 17, 'Solteira', 'M', 17);

DROP TABLE IF EXISTS cargo;
CREATE TABLE cargo (
    id SERIAL PRIMARY KEY NOT NULL ,
    descricao VARCHAR(230) NOT NULL,
    salario_base INT NOT NULL,
    UNIQUE(id),
    UNIQUE(descricao)
);

INSERT INTO cargo (id, descricao, salario_base) VALUES (1, 'Corretor', 1500);
INSERT INTO cargo (id, descricao, salario_base) VALUES (2, 'Sub-Gerente', 4000);
INSERT INTO cargo (id, descricao, salario_base) VALUES (3, 'Gerente', 6000);

DROP TABLE IF EXISTS pagamento;
CREATE TABLE pagamento (
    id SERIAL PRIMARY KEY NOT NULL ,
    valor NUMERIC NOT NULL,
    forma_pagamento VARCHAR(30) NOT NULL,
    UNIQUE(id)
);

INSERT INTO pagamento (id, valor, forma_pagamento) VALUES (1, 3000, 'Cartão de Débito');
INSERT INTO pagamento (id, valor, forma_pagamento) VALUES (2, 856000, 'Cartão de Crédito');
INSERT INTO pagamento (id, valor, forma_pagamento) VALUES (3, 1500, 'Dinheiro');
INSERT INTO pagamento (id, valor, forma_pagamento) VALUES (4, 6000, 'Boleto');
INSERT INTO pagamento (id, valor, forma_pagamento) VALUES (5, 180000, 'Dinheiro');
INSERT INTO pagamento (id, valor, forma_pagamento) VALUES (6, 25000, 'Cartão de Crédito');
INSERT INTO pagamento (id, valor, forma_pagamento) VALUES (7, 4300, 'Cartão de Débito');
INSERT INTO pagamento (id, valor, forma_pagamento) VALUES (8, 2100, 'Boleto');
INSERT INTO pagamento (id, valor, forma_pagamento) VALUES (9, 3200, 'Boleto');
INSERT INTO pagamento (id, valor, forma_pagamento) VALUES (10, 4600, 'Dinheiro');


DROP TABLE IF EXISTS cliente_proprietario;
CREATE TABLE cliente_proprietario (
    id_pessoa INTEGER PRIMARY KEY NOT NULL ,
    profissao VARCHAR(100) NOT NULL,
    
    CONSTRAINT id_pessoa_fk FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)

);

INSERT INTO cliente_proprietario(id_pessoa, profissao) VALUES (4, 'Advogado');
INSERT INTO cliente_proprietario(id_pessoa, profissao) VALUES (5, 'Médico');
INSERT INTO cliente_proprietario(id_pessoa, profissao) VALUES (6, 'Professor');
INSERT INTO cliente_proprietario(id_pessoa, profissao) VALUES (7, 'Contador');

DROP TABLE IF EXISTS cliente_usuario;
CREATE TABLE cliente_usuario (
    id_pessoa INTEGER PRIMARY KEY NOT NULL ,
    profissao VARCHAR(100) NOT NULL,
    
    CONSTRAINT id_pessoa_fk FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
);

INSERT INTO cliente_usuario(id_pessoa, profissao) VALUES (8, 'Administrador');
INSERT INTO cliente_usuario(id_pessoa, profissao) VALUES (9, 'Enfermeiro');
INSERT INTO cliente_usuario(id_pessoa, profissao) VALUES (10, 'Analista de Sistemas');

DROP TABLE IF EXISTS fiador;
CREATE TABLE fiador (
    id_pessoa INTEGER PRIMARY KEY NOT NULL ,
    id_pessoa_fiador1 INTEGER NOT NULL ,
    id_pessoa_fiador2 INTEGER DEFAULT NULL ,
    id_pessoa_fiador3 INTEGER DEFAULT NULL ,
    
    CONSTRAINT id_pessoa_fk FOREIGN KEY (id_pessoa) REFERENCES cliente_usuario (id_pessoa),
    CONSTRAINT id_pessoa_fiador1_fk FOREIGN KEY (id_pessoa_fiador1) REFERENCES pessoa (id),
    CONSTRAINT id_pessoa_fiador2_fk FOREIGN KEY (id_pessoa_fiador2) REFERENCES pessoa (id),
    CONSTRAINT id_pessoa_fiador3_fk FOREIGN KEY (id_pessoa_fiador3) REFERENCES pessoa (id)
);

INSERT INTO fiador(id_pessoa, id_pessoa_fiador1, id_pessoa_fiador2, id_pessoa_fiador3) VALUES (8, 11, NULL, NULL);
INSERT INTO fiador(id_pessoa, id_pessoa_fiador1, id_pessoa_fiador2, id_pessoa_fiador3) VALUES (9, 12, NULL, NULL);
INSERT INTO fiador(id_pessoa, id_pessoa_fiador1, id_pessoa_fiador2, id_pessoa_fiador3) VALUES (10, 13, NULL, NULL);

DROP TABLE IF EXISTS indicacao;
CREATE TABLE indicacao (
    id_pessoa INTEGER PRIMARY KEY NOT NULL ,
    id_pessoa_indicacao1 INTEGER NOT NULL ,
    id_pessoa_indicacao2 INTEGER NOT NULL ,
    id_pessoa_indicacao3 INTEGER DEFAULT NULL ,
    id_pessoa_indicacao4 INTEGER DEFAULT NULL ,
    
    CONSTRAINT id_pessoa_fk FOREIGN KEY (id_pessoa) REFERENCES cliente_usuario (id_pessoa),
    CONSTRAINT id_pessoa_indicacao1_fk FOREIGN KEY (id_pessoa_indicacao1) REFERENCES pessoa (id),
    CONSTRAINT id_pessoa_indicacao2_fk FOREIGN KEY (id_pessoa_indicacao2) REFERENCES pessoa (id),
    CONSTRAINT id_pessoa_indicacao3_fk FOREIGN KEY (id_pessoa_indicacao3) REFERENCES pessoa (id),
    CONSTRAINT id_pessoa_indicacao4_fk FOREIGN KEY (id_pessoa_indicacao4) REFERENCES pessoa (id)
);

INSERT INTO indicacao(id_pessoa, id_pessoa_indicacao1, id_pessoa_indicacao2, id_pessoa_indicacao3, id_pessoa_indicacao4) VALUES (8, 14, 15, NULL, NULL);
INSERT INTO indicacao(id_pessoa, id_pessoa_indicacao1, id_pessoa_indicacao2, id_pessoa_indicacao3, id_pessoa_indicacao4) VALUES (9, 16, 17, NULL, NULL);
INSERT INTO indicacao(id_pessoa, id_pessoa_indicacao1, id_pessoa_indicacao2, id_pessoa_indicacao3, id_pessoa_indicacao4) VALUES (10, 17, 14, NULL, NULL);


DROP TABLE IF EXISTS funcionario;
CREATE TABLE funcionario (
    id_pessoa INTEGER PRIMARY KEY NOT NULL ,
    data_ingresso_imobiliaria DATE NOT NULL,
    id_cargo INTEGER NOT NULL,
    usuario VARCHAR(100) NOT NULL,
    senha VARCHAR(128) NOT NULL,
    UNIQUE(usuario),
    CONSTRAINT id_pessoafk FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)

);

INSERT INTO funcionario(id_pessoa, data_ingresso_imobiliaria, id_cargo, usuario, senha) VALUES (1, '2013-07-09', 3, 'usuario.gerente', 'gerentesenha');
INSERT INTO funcionario(id_pessoa, data_ingresso_imobiliaria, id_cargo, usuario, senha) VALUES (2, '2015-07-09', 2, 'usuario.subgerente', 'subgerentesenha');
INSERT INTO funcionario(id_pessoa, data_ingresso_imobiliaria, id_cargo, usuario, senha) VALUES (3, '2014-07-09', 1, 'usuario.corretor', 'corretorsenha');

DROP TABLE IF EXISTS relacao_proprietario_imovel;
CREATE TABLE relacao_proprietario_imovel (
    id SERIAL PRIMARY KEY NOT NULL ,
    id_imovel INTEGER NOT NULL,
    id_proprietario INTEGER NOT NULL,
    UNIQUE (id),
  CONSTRAINT id_imovel FOREIGN KEY (id_imovel) REFERENCES imovel (id),
  CONSTRAINT id_proprietario FOREIGN KEY (id_proprietario) REFERENCES cliente_proprietario (id_pessoa)

);

INSERT INTO relacao_proprietario_imovel (id, id_imovel, id_proprietario) VALUES (1, 1, 4);
INSERT INTO relacao_proprietario_imovel (id, id_imovel, id_proprietario) VALUES (2, 7, 5);
INSERT INTO relacao_proprietario_imovel (id, id_imovel, id_proprietario) VALUES (3, 4, 6);
INSERT INTO relacao_proprietario_imovel (id, id_imovel, id_proprietario) VALUES (4, 9, 6);
INSERT INTO relacao_proprietario_imovel (id, id_imovel, id_proprietario) VALUES (5, 4, 7);
INSERT INTO relacao_proprietario_imovel (id, id_imovel, id_proprietario) VALUES (6, 6, 7);
INSERT INTO relacao_proprietario_imovel (id, id_imovel, id_proprietario) VALUES (7, 8, 4);
INSERT INTO relacao_proprietario_imovel (id, id_imovel, id_proprietario) VALUES (8, 2, 4);
INSERT INTO relacao_proprietario_imovel (id, id_imovel, id_proprietario) VALUES (9, 3, 7);
INSERT INTO relacao_proprietario_imovel (id, id_imovel, id_proprietario) VALUES (10, 10, 5);


DROP TABLE IF EXISTS relacao_cliente_usuario_imovel;
CREATE TABLE relacao_cliente_usuario_imovel (
    id SERIAL PRIMARY KEY NOT NULL ,
    id_imovel_usuario INTEGER NOT NULL,
    id_cliente_usuario INTEGER  NOT NULL,
    UNIQUE (id),
	UNIQUE (id_cliente_usuario),
    CONSTRAINT id_imovel_usuario_fk FOREIGN KEY (id_imovel_usuario)REFERENCES imovel(id),
    CONSTRAINT id_cliente_usuario_fk FOREIGN KEY (id_cliente_usuario) REFERENCES cliente_usuario (id_pessoa)

);

INSERT INTO relacao_cliente_usuario_imovel (id, id_imovel_usuario, id_cliente_usuario) VALUES (1, 3, 8);
INSERT INTO relacao_cliente_usuario_imovel (id, id_imovel_usuario, id_cliente_usuario) VALUES (2, 5, 9);
INSERT INTO relacao_cliente_usuario_imovel (id, id_imovel_usuario, id_cliente_usuario) VALUES (3, 10, 10);


DROP TABLE IF EXISTS contrato;
CREATE TABLE contrato (
    id SERIAL PRIMARY KEY NOT NULL ,
    comissao_imobiliaria NUMERIC NOT NULL,
   
    UNIQUE (id)
    
);

INSERT INTO contrato (id, comissao_imobiliaria) VALUES (1, 20);
INSERT INTO contrato (id, comissao_imobiliaria) VALUES (2, 21);
INSERT INTO contrato (id, comissao_imobiliaria) VALUES (3, 15);

--refazer atributos DER bonus_funcionario
DROP TABLE IF EXISTS transacao;
CREATE TABLE transacao (
    id SERIAL PRIMARY KEY NOT NULL ,
    id_rel_clienteUsuario_imovel INTEGER NOT NULL,
    id_func_responsavel INTEGER NOT NULL,
    data_transacao DATE NOT NULL,
    bonus_func NUMERIC NOT NULL,
    id_pgto INTEGER NOT NULL,
    id_imovel INTEGER NOT NULL,
    nro_contrato INTEGER NOT NULL,
    UNIQUE (id),
  
    CONSTRAINT id_pgto_fk FOREIGN KEY (id_pgto) REFERENCES pagamento (id),
    CONSTRAINT id_func_responsavel_fk FOREIGN KEY (id_func_responsavel) REFERENCES funcionario (id_pessoa),
    CONSTRAINT id_imovel_fk FOREIGN KEY (id_imovel) REFERENCES imovel (id),
    CONSTRAINT nro_contrato_fk FOREIGN KEY (nro_contrato) REFERENCES contrato (id),
    CONSTRAINT id_rel_usuario_imovel_fk FOREIGN KEY (id_rel_clienteUsuario_imovel)REFERENCES relacao_cliente_usuario_imovel (id_cliente_usuario)
    
);


INSERT INTO transacao (id, id_rel_clienteUsuario_imovel, id_func_responsavel, data_transacao, bonus_func, id_pgto, id_imovel, nro_contrato) 
        VALUES (1, 9, 2, '2020-06-12', 5, 4, 3, 1);
INSERT INTO transacao (id, id_rel_clienteUsuario_imovel, id_func_responsavel, data_transacao, bonus_func, id_pgto, id_imovel, nro_contrato) 
        VALUES (2, 8, 3, '2020-06-15', 4, 2, 5, 2);
INSERT INTO transacao (id, id_rel_clienteUsuario_imovel, id_func_responsavel, data_transacao, bonus_func, id_pgto, id_imovel, nro_contrato) 
        VALUES (3, 10, 3, '2020-05-19', 7, 5, 10, 3);

DROP TABLE IF EXISTS tel_email;
CREATE TABLE tel_email (
    id SERIAL PRIMARY KEY NOT NULL ,
    id_pessoa INTEGER NOT NULL,
    telefone_contato VARCHAR(15) NOT NULL,
    telefone_celular VARCHAR(15) NOT NULL,
    email VARCHAR(250) NOT NULL,
    UNIQUE (id),
    UNIQUE (id_pessoa),
    UNIQUE (telefone_contato),
    UNIQUE (telefone_celular),
    UNIQUE(email),
    CONSTRAINT id_pessoa_fk FOREIGN KEY (id_pessoa)REFERENCES pessoa (id)

);
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (1, 1, '556798466541', '556799254742', 'joao@gmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (2, 2, '556752366526', '556793547853', 'rodrigo@hotmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (3, 3, '5567652366527', '556798254775', 'rd@gmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (4, 4, '55672366147', '556795254785', 'pedro@gmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (5, 5, '55679866577', '556794254775', 'ana@hotmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (6, 6, '556797366567', '556799254735', 'elianes@hotmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (7, 7, '556799366522', '5567961254789', 'helena@hotmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (8, 8, '556750966519', '556791254753', 'maria@gmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (9, 9, '5567593687521', '556798254712', 'alan@gmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (10, 10, '556798366587', '556791232741', 'gabriel@hotmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (11, 11, '5567238466541', '556799257842', 'gabriellima@gmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (12, 12, '556745366526', '556793521853', 'gabrielduarteo@hotmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (13, 13, '5567656766527', '556798674775', 'joaofreitas@gmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (14, 14, '55672332147', '556795434785', 'gabrielfreitas@gmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (15, 15, '55679866677', '556794674775', 'amanda_s@hotmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (16, 16, '556797321567', '556729254735', 'amanda_r@hotmail.com');
INSERT INTO tel_email (id, id_pessoa, telefone_contato, telefone_celular, email) VALUES (17, 17, '556799366672', '5477961254789', 'carla@hotmail.com');

DROP TABLE IF EXISTS apartamento;
CREATE TABLE apartamento (
    id_imovel INTEGER PRIMARY KEY NOT NULL,
    descricao VARCHAR(250) NOT NULL,
    armario_embutido SMALLINT NOT NULL,
    nro_vagas_garagem INTEGER NOT NULL,
    qntd_sala_jantar INTEGER NOT NULL,
    qntd_sala_estar INTEGER NOT NULL,
    qntd_suite INTEGER NOT NULL,
    qntd_quarto INTEGER NOT NULL,
    andar INTEGER NOT NULL,
    valor_condominio NUMERIC NOT NULL,
    tem_portaria SMALLINT NOT NULL,
    CONSTRAINT id_imovel_fk FOREIGN KEY (id_imovel) REFERENCES imovel (id)
);

INSERT INTO apartamento(id_imovel, descricao,  armario_embutido, nro_vagas_garagem, qntd_sala_jantar, qntd_sala_estar, qntd_suite, qntd_quarto,
    andar, valor_condominio, tem_portaria)
VALUES (4, 'Apartamento em ótimo estado de conservação, pintura em dia com suíte e armário embutido', 2, 2, 1, 2, 3, 1, 3, 1600, 1);
INSERT INTO apartamento(id_imovel, descricao,  armario_embutido, nro_vagas_garagem, qntd_sala_jantar, qntd_sala_estar, qntd_suite, qntd_quarto,
    andar, valor_condominio, tem_portaria)
VALUES (5, 'Belo apartamento com 2 vagas na garagem, armário embutido e 3 enormes suites', 2, 2, 1, 2, 3, 1, 7, 1750, 1);

DROP TABLE IF EXISTS casa;
CREATE TABLE casa (
    id_imovel INTEGER PRIMARY KEY NOT NULL,
    descricao VARCHAR(250) NOT NULL,
    armario_embutido SMALLINT NOT NULL,
    nro_vagas_garagem INTEGER NOT NULL,
    qntd_sala_jantar INTEGER NOT NULL,
    qntd_sala_estar INTEGER NOT NULL,
    qntd_suite INTEGER NOT NULL,
    qntd_quarto INTEGER NOT NULL,
    
    CONSTRAINT id_imovel_fk FOREIGN KEY (id_imovel) REFERENCES imovel (id)
);

INSERT INTO casa(id_imovel, descricao, armario_embutido, nro_vagas_garagem, qntd_sala_jantar, qntd_sala_estar, qntd_suite, qntd_quarto)
VALUES (1,'Ótima casa com jardim encantador! Com 3 grandes suítes, 2 vagas na garagem e 2 belos armários.',2, 2, 1, 2, 3, 1);
INSERT INTO casa(id_imovel, descricao, armario_embutido, nro_vagas_garagem, qntd_sala_jantar, qntd_sala_estar, qntd_suite, qntd_quarto)
VALUES (2, 'Bela casa com jardim impecável! Com 3 vagas na garagem, 2 salas de estar, uma suíte enorme e dois quartos.', 1, 3, 1, 2, 1, 2);
INSERT INTO casa(id_imovel, descricao,  armario_embutido, nro_vagas_garagem, qntd_sala_jantar, qntd_sala_estar, qntd_suite, qntd_quarto)
VALUES (3, 'Ótima Casa com 2 belos armários, 2 vagas na garagem, 3 grandes suítes e 1 quarto. ', 2, 2, 1, 2, 3, 1);

DROP TABLE IF EXISTS sala_comercial;
CREATE TABLE sala_comercial (
    id_imovel INTEGER PRIMARY KEY NOT NULL,
    qntd_banheiro INTEGER NOT NULL,
    qntd_comodo INTEGER NOT NULL,
    
    CONSTRAINT id_imovel_fk FOREIGN KEY (id_imovel) REFERENCES imovel (id)
);

INSERT INTO sala_comercial(id_imovel, qntd_banheiro, qntd_comodo)
VALUES (6, 3, 2);
INSERT INTO sala_comercial(id_imovel, qntd_banheiro, qntd_comodo)
VALUES (7, 12, 4);

DROP TABLE IF EXISTS terreno;
CREATE TABLE terreno (
    id_imovel INTEGER PRIMARY KEY NOT NULL,
    largura NUMERIC NOT NULL,
    comprimento NUMERIC NOT NULL,
    tipo_inclinacao VARCHAR(30) NOT NULL,
    CONSTRAINT id_imovel_fk FOREIGN KEY (id_imovel) REFERENCES imovel (id)
);

INSERT INTO terreno(id_imovel, largura, comprimento, tipo_inclinacao)
VALUES (8, 45, 30, 'Aclive');
INSERT INTO terreno(id_imovel, largura, comprimento, tipo_inclinacao)
VALUES (9, 85, 25, 'Declive');
INSERT INTO terreno(id_imovel, largura, comprimento, tipo_inclinacao)
VALUES (10, 50, 20, 'Sem inclinação');

DROP TABLE IF EXISTS historico;
CREATE TABLE historico (
    id SERIAL PRIMARY KEY NOT NULL,
    id_endereco INTEGER NOT NULL,
    data_construcao DATE NOT NULL,
    data_alugado_vendido DATE NULL,
    data_postagem DATE NOT NULL,
    id_foto INTEGER NOT NULL,
    valor_sugerido_cliente_proprietario NUMERIC NOT NULL,
    status VARCHAR(250) NOT NULL,
    area NUMERIC NOT NULL,
    id_imovel INTEGER NOT NULL,
    UNIQUE (id),
    UNIQUE (id_imovel),
    UNIQUE (id_endereco),
    UNIQUE (id_foto),
	CONSTRAINT id_imovel_fk FOREIGN KEY (id_imovel)REFERENCES imovel (id),
    CONSTRAINT id_endereco_fk FOREIGN KEY (id_endereco)REFERENCES endereco (id),
    CONSTRAINT id_foto_fk FOREIGN KEY (id_foto) REFERENCES foto(id)

);

INSERT INTO historico(id, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario,
    status, area, id_imovel) VALUES (1, 1, '2015-07-15', NULL, '2020-05-11', 1, 140000, 'Disponível para Venda', 600, 1);
INSERT INTO historico(id, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario,
    status, area, id_imovel) VALUES (2, 2, '2015-07-15', NULL, '2020-05-11', 2, 240000, 'Indisponível para venda, retirado da imobiliária por decisão do cliente proprietário', 380, 2);
INSERT INTO historico(id, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario,
    status, area, id_imovel) VALUES (3, 3, '2015-07-15', '2020-06-12', '2020-05-11', 3, 6000, 'Alugado', 300, 3);
INSERT INTO historico(id, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario,
    status, area, id_imovel) VALUES (4, 4, '2015-07-15', NULL, '2020-05-11', 4, 7000, 'Disponível para Aluguel', 650, 4);
INSERT INTO historico(id, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario,
    status, area, id_imovel) VALUES (5, 5, '2015-07-15', '2020-06-15', '2020-05-11', 5, 856000, 'Vendido', 400, 5);
INSERT INTO historico(id, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario,
    status, area, id_imovel) VALUES (6, 6, '2015-07-15', NULL, '2020-05-11', 6, 35000, 'Disponível para Venda', 300, 6);
INSERT INTO historico(id, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario,
    status, area, id_imovel) VALUES (7, 7, '2015-07-15', NULL, '2020-05-11', 7, 340000, 'Disponível para Aluguel', 400, 7);
INSERT INTO historico(id, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario,
    status, area, id_imovel) VALUES (8, 8, '2015-07-15', NULL, '2020-05-11', 8, 135000, 'Disponível para Venda', 455, 10);
INSERT INTO historico(id, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario,
    status, area, id_imovel) VALUES (9, 9, '2015-07-15', NULL, '2020-05-11', 9, 130000, 'Indisponível para venda, retirado da imobiliária por decisão do cliente proprietário', 630, 9);
INSERT INTO historico(id, id_endereco, data_construcao, data_alugado_vendido, data_postagem, id_foto, valor_sugerido_cliente_proprietario,
    status, area, id_imovel) VALUES (10, 10, '2015-07-15', '2020-05-19', '2020-05-11', 10, 180000, 'Vendido', 380, 8);

DROP TABLE IF EXISTS demanda;
CREATE TABLE demanda (
    id SERIAL PRIMARY KEY NOT NULL ,
    data_dem TIMESTAMP NOT NULL,
    disponibilidade VARCHAR(200) NOT NULL,
    id_rl_cliente_usuario_agenda INTEGER NOT NULL,
    id_imovel INTEGER NOT NULL,
    id_agenda INTEGER NOT NULL,
    UNIQUE (id),
    CONSTRAINT id_imovel_fk FOREIGN KEY (id_imovel)REFERENCES imovel(id)

);

INSERT INTO demanda (id, data_dem, disponibilidade, id_rl_cliente_usuario_agenda, id_imovel, id_agenda) 
      VALUES (1, '2020-06-08 08:00', 'Segunda e quarta de manhã', 8, 1, 1);
INSERT INTO demanda (id, data_dem, disponibilidade, id_rl_cliente_usuario_agenda, id_imovel, id_agenda) 
      VALUES (2, '2020-06-03 09:00', 'Quarta de manhã', 10, 4, 2);
INSERT INTO demanda (id, data_dem, disponibilidade, id_rl_cliente_usuario_agenda, id_imovel, id_agenda) 
      VALUES (3, '2020-06-12 13:00', 'Sexta no período da tarde', 9, 6, 3);
--refazer cardinalidade
DROP TABLE IF EXISTS agenda;
CREATE TABLE agenda (
    id SERIAL PRIMARY KEY NOT NULL ,
    id_rl_cliente_usuario_agenda INTEGER NOT NULL,
    id_funcionario INTEGER NOT NULL,
    data_ DATE NOT NULL,
    id_imovel INTEGER NOT NULL,
    inicio_visita INTEGER,
    fim_visita INTEGER,
    hora_inicio time,
    hora_fim time,
    visitado VARCHAR(25),
    observacao VARCHAR(250) NOT NULL,
    UNIQUE (id),
    CONSTRAINT id_funcionario_fk FOREIGN KEY (id_funcionario)REFERENCES funcionario(id_pessoa),
    CONSTRAINT id_imovel_fk FOREIGN KEY (id_imovel)REFERENCES imovel(id)
);

INSERT INTO agenda(id, id_rl_cliente_usuario_agenda, id_funcionario, data_, id_imovel, inicio_visita, fim_visita, hora_inicio, hora_fim,
    visitado, observacao) VALUES (1, 8, 3, '2020-06-08', 1, 8, 9, '08:00', '09:00', 'Sim', 'Cliente usuário entrará em contato para possível negociação');
INSERT INTO agenda(id, id_rl_cliente_usuario_agenda, id_funcionario, data_, id_imovel, inicio_visita, fim_visita, hora_inicio, hora_fim,
    visitado, observacao) VALUES (2, 10, 3, '2020-06-03', 4, 9, 10, '09:00', '10:00', 'Não', 'Cliente usuário não compareceu ao local e horário agendado');
INSERT INTO agenda(id, id_rl_cliente_usuario_agenda, id_funcionario, data_, id_imovel, inicio_visita, fim_visita, hora_inicio, hora_fim,
    visitado, observacao) VALUES (3, 9, 2, '2020-06-12', 3, 13, 14, '13:00', '14:00', 'Sim', 'Cliente usuário alugou imóvel');

--colocar atributo na relacao DER
DROP TABLE IF EXISTS relacao_cliente_usuario_agenda;
CREATE TABLE relacao_cliente_usuario_agenda (
    id SERIAL PRIMARY KEY NOT NULL ,
    id_agenda_usuario INTEGER NOT NULL,
    id_cliente_usuario INTEGER NOT NULL,
    UNIQUE (id),
	UNIQUE (id_cliente_usuario),
	
    CONSTRAINT id_agenda_usuario_fk FOREIGN KEY (id_agenda_usuario)REFERENCES agenda(id),
    CONSTRAINT id_cliente_usuario_fk FOREIGN KEY (id_cliente_usuario) REFERENCES cliente_usuario (id_pessoa)
);

INSERT INTO relacao_cliente_usuario_agenda(id, id_agenda_usuario, id_cliente_usuario) VALUES (1, 1, 8);
INSERT INTO relacao_cliente_usuario_agenda(id, id_agenda_usuario, id_cliente_usuario) VALUES (2, 2, 10);
INSERT INTO relacao_cliente_usuario_agenda(id, id_agenda_usuario, id_cliente_usuario) VALUES (3, 3, 9);


ALTER TABLE agenda ADD CONSTRAINT id_rl_cliente_usuario_agenda_fk FOREIGN KEY (id_rl_cliente_usuario_agenda)
    REFERENCES relacao_cliente_usuario_agenda (id_cliente_usuario);

ALTER TABLE demanda ADD CONSTRAINT id_agenda_fk FOREIGN KEY (id_agenda)
REFERENCES agenda (id);

ALTER TABLE demanda ADD CONSTRAINT id_rl_cliente_usuario_agenda_fk FOREIGN KEY (id_rl_cliente_usuario_agenda)
REFERENCES relacao_cliente_usuario_agenda (id_cliente_usuario);
