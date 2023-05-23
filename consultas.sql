SET search_path TO 'imobiliaria';

--1)Calcula o valor total de comissão para cada funcionário no mês atual, e o salario final somando as comissões ao salário base

SELECT f.id_pessoa, p.nome, c.salario_base, 
ROUND(SUM((t.bonus_func/100)*i.valor_sugerido_cliente_proprietario),2) AS comissao_mes,
ROUND(c.salario_base + SUM((t.bonus_func/100)*i.valor_sugerido_cliente_proprietario), 2) AS salario_final
	FROM funcionario AS f
	JOIN pessoa AS p ON p.id = f.id_pessoa
	JOIN transacao AS t ON t.id_func_responsavel = f.id_pessoa
	JOIN imovel AS i ON i.id = t.id_imovel
	JOIN cargo AS c ON f.id_cargo = c.id
	WHERE EXTRACT(YEAR FROM t.data_transacao) = EXTRACT(YEAR FROM CURRENT_DATE)
	AND EXTRACT(MONTH FROM t.data_transacao) = EXTRACT(MONTH FROM CURRENT_DATE)
	GROUP BY p.nome, f.id_pessoa, c.salario_base
	ORDER BY f.id_pessoa


-- 2)Listar todos apartamentos com valor_sugerido_cliente_proprietario menor do que 7000

SELECT i.id, a.descricao, a.andar, a.valor_condominio, i.status, i.valor_sugerido_cliente_proprietario AS valor_sugerido
	FROM apartamento AS a
	JOIN imovel AS i ON i.id = a.id_imovel
	WHERE valor_sugerido_cliente_proprietario <= 7000
	

--3) Listar o numero de imóveis que cada cliente_proprietario tem no sistema, ordenado dos clientes com maior numero de imoveis pro menor

SELECT COUNT(c) AS numero_propriedades, p.nome, p.cpf
	FROM cliente_proprietario AS c
	JOIN relacao_proprietario_imovel AS r ON r.id_proprietario = c.id_pessoa 
	JOIN pessoa AS p ON p.id = c.id_pessoa
	GROUP BY c, p.nome, p.cpf
	ORDER BY COUNT(c) DESC 

-- 4) Retornar o tempo, em anos, que cada funcionário trabalha na empresa
SELECT p.nome,  f.data_ingresso_imobiliaria AS data_ingresso, (CURRENT_DATE - f.data_ingresso_imobiliaria )/365 AS anos_na_empresa
	FROM funcionario AS f
	JOIN pessoa AS p ON p.id = f.id_pessoa

-- 5) Retorna o líder de vendas/aluguel dentro da imobiliaria durante o ano atual, considerando valor do imóvel

SELECT f.id_pessoa, p.nome, p.cpf, c.descricao, SUM(i.valor_sugerido_cliente_proprietario) AS valor_total_vendas 
	FROM funcionario AS f
	JOIN pessoa AS p ON p.id = f.id_pessoa
	JOIN transacao AS t ON t.id_func_responsavel = f.id_pessoa
	JOIN imovel AS i ON i.id = t.id_imovel
	JOIN cargo AS c ON f.id_cargo = c.id
	WHERE EXTRACT(YEAR FROM t.data_transacao) = EXTRACT(YEAR FROM CURRENT_DATE)
	GROUP BY p.nome, f.id_pessoa, p.cpf, c.descricao
	ORDER BY SUM(i.valor_sugerido_cliente_proprietario) DESC
	LIMIT 1

-- 6) Lista todos imoveis cujo status seja disponível, listando a categoria do imóvel e o seu endereço, ordenando pela categoria do imovel

SELECT i.nome_categoria AS categoria, i.valor_sugerido_cliente_proprietario, b.nome AS bairro, e.rua, e.numero, e.cep
	FROM imovel AS i
	JOIN endereco AS e ON e.id = i.id_endereco
	JOIN bairro AS b ON b.id = e.id_bairro
	WHERE i.status ILIKE 'disponível%'
	ORDER BY i.nome_categoria

-- 7) Listar somente os imóveis que ja foram vendidos/alugados no passado

SELECT i.nome_categoria AS categoria, i.valor_sugerido_cliente_proprietario, b.nome AS bairro, e.rua, e.numero, e.cep
	FROM imovel AS i
	JOIN endereco AS e ON e.id = i.id_endereco
	JOIN bairro AS b ON b.id = e.id_bairro
	WHERE i.id IN (SELECT id_imovel FROM transacao)
-- 8) Listar os dados de todos os funcionários da imobiliaria

SELECT p.id AS id, p.nome, p.cpf, p.est_civil AS estado_civil, p.sexo, c.descricao, c.salario_base AS salario
	FROM funcionario AS f
	JOIN pessoa AS p ON p.id = f.id_pessoa
	JOIN cargo AS c ON c.id = f.id_cargo
	ORDER BY p.nome

-- 9) Listar os dados do cliente e do imovel de todas as transações da imobiliaria

SELECT t.data_transacao, p.nome AS cliente_nome, p.cpf AS cliente_cpf, p.sexo AS cliente_sexo,i.status, i.nome_categoria AS categoria_imovel, i.valor_sugerido_cliente_proprietario AS valor
	FROM transacao AS t
	JOIN relacao_cliente_usuario_imovel AS relacao ON relacao.id_cliente_usuario = t.id_rel_clienteUsuario_imovel
	JOIN cliente_usuario AS cliente ON cliente.id_pessoa = relacao.id_cliente_usuario
	JOIN pessoa AS p ON p.id = cliente.id_pessoa
	JOIN imovel AS i ON i.id = t.id_imovel

-- 10) Lista o endereço e contato de todos funcionários

SELECT p.nome, p.cpf, tel_email.email, tel_email.telefone_contato, tel_email.telefone_celular, b.nome AS bairro, e.rua, e.numero, e.complemento
	FROM funcionario AS f
	JOIN pessoa AS p ON p.id = f.id_pessoa
	JOIN endereco AS e ON e.id = p.id_endereco
	JOIN bairro AS b ON	b.id = e.id_bairro
	JOIN tel_email ON tel_email.id = p.id_tel_email
	ORDER BY p.nome
