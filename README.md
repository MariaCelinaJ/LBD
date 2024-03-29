# LBD
### Trabalho de Laboratório de Banco de Dados da FACOM - UFMS em 2020/1

#### Introduçã

O objetivo principal do trabalho é modelar um banco de dados relacional para um dado problema e realizar um conjunto de consultas SQL nesse banco.

1. Banco de Dados POSTGRESQL (9.2+);
2. Diagrama no brModelo;

Os alunos deverão modelar um banco de dados a partir do conjunto de requisitos descritos na seção 1. Além disso, deverão definir 2 requisitos adicionais ao problema, descrevê-los e modelá-los. Além da modelagem, os alunos criarão consultas SQL a serem executadas no banco de dados criado.

Os requisitos adicionais definidos pelos alunos devem gerar uma nova entidade, uma nova relação, o surgimento de uma agregação ou uma hierarquia. Não serão considerados requisitos adicionais que sejam modelados apenas acrescentando um novo atributo às entidades já descritas.

Quando os requisitos descritos não forem suficientes para fazer a modelagem, os alunos devem descrever o que eles estão supondo como requisitos para fazer a modelagem. Ex: se em um dado requisito gerar um tipo de relacionamento, mas não for possível estabelecer cardinalidade do mesmo ou a restrição de participação, os alunos deverão descrever o que será assumido nesse caso.

O trabalho é dividido em etapas. Em cada etapa uma tarefa (ou um conjunto de tarefas) deve ser realizado, conforme descrito a seguir:

**Tarefa 1:** Modelar o banco de dados usando o Modelo Entidade Relacionamento. Para esta atividade, o DER deve ser usado. É importante que os requisitos adicionais definidos pelos alunos sejam também entregues e modelados. Para cada um dos itens descritos na seção 3, os alunos devem informar como estes foram modelados usando o Modelo Entidade-Relacionamento. Um dicionário de dados deve ser desenvolvido para descrever cada tabela e cada atributo da modelagem.

**Tarefa 2:** Converter o modelo entidade relacionamento para o modelo relacional, comentando quais escolhas foram feitas para a conversão de cada uma das entidades, relacionamentos, hierarquias e agregações. O comando SQL de cada tabela deve ser fornecido. É importante que o DER corrigido seja também entregue.

**Tarefa 3:** Criar 10 consultas interessantes usando o banco de dados. As consultas devem ser pensadas com o intuito de auxiliar um gerente na tomada de decisão. A nota será baseada na complexidade e utilidade da consulta para o problema. A prioridade deve ser dada a consultas que sumarizem os dados contidos no banco por meio de operadores de agregação. É importante que o modelo relacional seja também entregue.

#### Requisitos do Sistema

#### Sistema de Imobiliária

A) Para a imobiliária é muito importante manter um cadastro dos imóveis que estão à venda e dos imóveis que estão disponíveis para locação.

B) Para cada imóvel registrado é importante saber se o imóvel está disponível para venda ou locação ou se ele já foi vendido ou locado. Isso ajudará a filtrar a pesquisa por imóveis.

C) Para cada imóvel e importante armazenar uma ou mais fotos. O armazenamento pode ser por exemplo, o nome do arquivo da foto do imóvel. Também é importante armazenar a data da construção do imóvel.

D) Os imóveis da imobiliária podem pertencer a uma dentre quatro categorias: casa, apartamento, terreno ou sala comercial.

E) Para os imóveis da categoria casa, as seguintes informações devem ser armazenadas: quantidade de quartos, quantidade de suítes, quantidade de salas de estar, quantidade de salas de jantar, número de vagas na garagem, área (em metros quadrados), se possui armário embutido, descrição (algum detalhe a mais que se deseja informar sobre a casa).

F) Para os imóveis da categoria apartamento, as seguintes informações devem ser armazenadas: quantidade de quartos, quantidade de suítes, quantidade de salas de estar, quantidade de salas de jantar, número de vagas na garagem, área (em metros quadrados), se possui armário embutido, descrição (algum detalhe a mais que se deseja informar sobre o apartamento), andar, valor do condomínio, indicativo se o condomínio possui portaria 24hs.

G) Para os imóveis da categoria sala comercial, as seguintes informações devem ser armazenadas: área em metros quadrados, quantidade de banheiros, quantidade de cômodos.

H) Para os imóveis da categoria terreno, as seguintes informações devem ser armazenadas: área (em metros quadrados), largura, comprimento, se o terreno possui aclive/declive.

I) Para cada imóvel disponível para locação ou venda é importante saber o seu endereço completo, sendo muito importante cadastrar o bairro no qual o imóvel está localizado, pois este campo ajudará a filtrar várias pesquisas feitas por cliente.

J)É também importante armazenar o valor de venda ou de aluguel de cada imóvel. Este é o valor sugerido pelo cliente.

K) Após o imóvel ser alugado/vendido é importante registrar o valor real de aluguel/venda, indicando quanto desse valor será destinado à imobiliária.

L) Cada imóvel disponível para venda ou locação deve estar associado a um cliente da imobiliária, nomeado cliente proprietário. Um imóvel pode pertencer a mais de um cliente proprietário e um cliente proprietário pode ter mais de um imóvel na imobiliária.

M) Os clientes proprietários da imobiliária devem ser cadastrados no sistema e as seguintes informações devem ser cadastradas: cpf, nome, endereço, telefones de contato, email, sexo, estado civil, profissão,

N) Cada imóvel vendido ou alugado deve estar associado a um cliente da imobiliária, nomeado cliente usuário.

O) Os clientes usuários da imobiliária devem ser cadastrados no sistema e as seguintes informações devem ser cadastradas: cpf, nome, endereço, telefones de contato, e-mail, sexo, estado civil, profissão. Caso o cliente usuário vá alugar um imóvel também devem ser armazenados: fiador (pelo menos 1) e indicações (pelo menos 2).

P)É importante registrar a data que um imóvel foi colocado à venda ou para alugar. Também é importante registrar quando o imóvel foi alugado ou vendido.

Q) Alguns imóveis, embora sejam anunciados para venda ou aluguel, acabam sendo retirados da imobiliária por decisão do cliente proprietário. É preciso armazenar no banco a informação de que o imóvel não foi alugado/vendido, mas não está mais disponível para locação/venda.

R) Para cada venda ou aluguel é necessário registrar o funcionário que fez a transação, bem como o valor da comissão que será destinado a esse funcionário. Um funcionário pode realizar mais de uma transação.

S) Para cada um dos funcionários da imobiliária é importante armazenar: nome, telefone, cpf, endereço, telefone contato, telefone celular, data ingresso imobiliária, cargo e salário, o qual é calculado a partir do seu salário base mais a porcentagem das comissões que ele recebe. Também é importante armazenar os dados para login no sistema, como usuário e senha. Para a senha é importante ter um campo que consiga armazenar pelo menos 128 caracteres. Você pode supor que a criptografia da senha será feita por software.

T) Os cargos disponíveis na imobiliária devem ser previamente cadastrados. Cada cargo possui um salário base.

U) Para cada transação (venda ou aluguel) é necessário realizar um registro no banco que contenha além dos dados do imóvel, do cliente e do funcionário, a data que foi realizada a transação, o nro do contrato (que é um número sequencial que identifica cada um dos contratos da empresa) e a forma de pagamento.

V) As formas de pagamento disponíveis na empresa devem ser previamente cadastradas.

W) Se um mesmo imóvel é colocado mais de uma vez para venda ou aluguel, somente a informação mais recente deve ser armazenada. As informações mais antigas a respeito do imóvel vão para uma tabela de histórico.

Material a ser entregue

Na Tarefa 1 entregue um arquivo PDF (der.pdf) ou PNG (der.png) contendo o diagrama da modelagem. Na Tarefa 2, deve ser entregue o arquivo estrutura.sql (COM DADOS) com os comandos SQL usados para criar as tabelas, bem como respectivo arquivo PDF chamado dicionario_de_dados.pdf, contendo todo o dicionário de dados após construir o modelo relacional. Na Tarefa 3, os comandos SQL usados em cada consulta devem ser entregues em um arquivo chamado consultas.sql.


