
/*  

BANCO DE DADOS, PSET 1
Lucas Bonato Soares
202307653
CC1Mc
lucasbonato4546@gmail.com

*/


/*
Primeiro, inicia-se o processo de criar o banco de dados 'uvv', um usuário 'lucasbonatosoares' e um esquema 'lojas'.
Cria-se o usuário, para então criar o banco de dados tendo como OWNER o usuário criado. Conecta-se ao banco de dados e muda-se o usuário para o usuário criado. Em seguida cria-se o esquema e muda o 'caminho de busca' do esquema público para o esquema criado para poder utiliza-lo na hora de criar a estrutura. 

Com essas ações, todas as próximas etapas (criação de tabelas, constraints, colunas, etc) ocorrerão dentro do banco de dados e esquema criados pelo usuário 'lucasbonatosoares'.
*/



-- Criação do banco de dados 'uvv'
DROP DATABASE IF EXISTS uvv;
CREATE DATABASE uvv;


-- Criação do usuário
DROP USER IF EXISTS lucasbonatosoares;
CREATE LOGIN lucasbonatosoares WITH PASSWORD = 'banana'


-- Criação do esquema 'lojas'
CREATE SCHEMA lojas AUTHORIZATION lucasbonatosoares;


-- Definição do esquema padrão do usuário para 'lojas'
ALTER USER lucasbonatosoares WITH DEFAULT_SCHEMA = lojas;


-- Conexão ao banco de dados 'uvv' (Sem gerar prompt de senha!!)
USE uvv;




/*
Com o banco de dados, usuário e esquema prontos, deve-se agora aplicar as entidades e relacionamentos do modelo lógico no banco de dados.

Vou começar com as entidades, criando todas as tabelas, colunas, constraints de PK, constraints de CHECK, comentários de tabela e comentários de coluna.
Com isso, todas as entidades do modelo lógico estarão aplicadas, para depois, então, aplicar os relacionamentos entre elas.
*/


-- Criação da tabela 'produtos', já definindo a coluna 'produto_id' como a PK
CREATE TABLE produtos (
                produto_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                preco_unitario NUMERIC(10,2),
                detalhes LONGBLOB,
                imagem LONGBLOB,
                imagem_mime_type VARCHAR(512),
                imagem_arquivo VARCHAR(512),
                imagem_charset VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                PRIMARY KEY (produto_id)
);


-- Definição de um comentário para a tabela 'produtos' 
ALTER TABLE produtos COMMENT 'Cadastro dos produtos que podem existir em um estoque de uma loja.';


-- Definição de um comentário para a coluna 'produto_id' da tabela 'produtos'
ALTER TABLE produtos MODIFY COLUMN produto_id NUMERIC(38) COMMENT 'PK da tabela. Identifica cada produto.';


-- Definição de um comentário para a coluna 'nome' da tabela 'produtos'
ALTER TABLE produtos MODIFY COLUMN nome VARCHAR(255) COMMENT 'Nome do produto, como no pacote.';


-- Definição de um comentário para a coluna 'preco_unitario' da tabela 'produtos'
ALTER TABLE produtos MODIFY COLUMN preco_unitario NUMERIC(10, 2) COMMENT 'Preço unitário do produto.';


-- Definição de um comentário para a coluna 'detalhes' da tabela 'produtos'
ALTER TABLE produtos MODIFY COLUMN detalhes BLOB COMMENT 'Detalhes adicionais sobre o produto.';


-- Definição de um comentário para a coluna 'imagem' da tabela 'produtos'
ALTER TABLE produtos MODIFY COLUMN imagem BLOB COMMENT 'Arquivo contendo imagem do produto.';


-- Definição de um comentário para a coluna 'imagem_mime_type' da tabela 'produtos'
ALTER TABLE produtos MODIFY COLUMN imagem_mime_type VARCHAR(512) COMMENT 'Tipo de mídia do arquivo de imagem do produto.';


-- Definição de um comentário para a coluna 'imagem_arquivo' da tabela 'produtos'
ALTER TABLE produtos MODIFY COLUMN imagem_arquivo VARCHAR(512) COMMENT 'Formato do arquivo em que o arquivo da imagem do produto está armazenado.';


-- Definição de um comentário para a coluna 'imagem_charset' da tabela 'produtos'
ALTER TABLE produtos MODIFY COLUMN imagem_charset VARCHAR(512) COMMENT 'O padrão de codificação de caracteres que é usado no arquivo da imagem do produto.';


-- Definição de um comentário para a coluna 'imagem_ultima_atualizacao' da tabela 'produtos'
ALTER TABLE produtos MODIFY COLUMN imagem_ultima_atualizacao DATE COMMENT 'Registra quando ocorreu a ultima modificação no arquivo da imagem do produto.';


-- Definição de uma constraint CHECK para a coluna 'preco_unitario' da tabela 'produtos' que impede a inserção de preço negativo
ALTER TABLE produtos
ADD CONSTRAINT cc_produtos_preco_unitario
CHECK (preco_unitario >= 0);


-- Definição de uma constraint CHECK para a coluna 'produto_id' da tabela 'produtos' que impede a inserção de valores menores ou iguais a zero
ALTER TABLE produtos
ADD CONSTRAINT cc_produtos_produtoid
CHECK (produto_id > 0);



CREATE TABLE lojas (
                loja_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                endereco_web VARCHAR(100),
                endereco_fisico VARCHAR(512),
                latitude NUMERIC,
                longitude NUMERIC,
                logo LONGBLOB,
                logo_mime_type VARCHAR(512),
                logo_arquivo VARCHAR(512),
                logo_charset VARCHAR(512),
                logo_ultima_atualizacao DATE,
                PRIMARY KEY (loja_id)
);


-- Definição de um comentário para a tabela 'lojas'
ALTER TABLE lojas COMMENT 'Cadastro de todas as lojas associadas.';


-- Definição de um comentário para a coluna 'loja_id' da tabela 'lojas'
ALTER TABLE lojas MODIFY COLUMN loja_id NUMERIC(38) COMMENT 'PK da tabela. Identifica cada loja.';


-- Definição de um comentário para a coluna 'nome' da tabela 'lojas'
ALTER TABLE lojas MODIFY COLUMN nome VARCHAR(255) COMMENT 'Nome de cada loja.';


-- Definição de um comentário para a coluna 'endereco_web' da tabela 'lojas'
ALTER TABLE lojas MODIFY COLUMN endereco_web VARCHAR(100) COMMENT 'Endereço web (site) de cada loja. Algumas lojas podem não ter um site.';


-- Definição de um comentário para a coluna 'endereco_fisico' da tabela 'lojas'
ALTER TABLE lojas MODIFY COLUMN endereco_fisico VARCHAR(512) COMMENT 'Endereço físico da loja, incluindo cidade, bairro, rua e cep.';


-- Definição de um comentário para a coluna 'latitude' da tabela 'lojas'
ALTER TABLE lojas MODIFY COLUMN latitude NUMERIC COMMENT 'Coordenada geográfica da loja em relação ao equador.';


-- Definição de um comentário para a coluna 'longitude' da tabela 'lojas'
ALTER TABLE lojas MODIFY COLUMN longitude NUMERIC COMMENT 'Coordenada geográfica da loja em relação ao meridiano de Greenwich.';


-- Definição de um comentário para a coluna 'logo' da tabela 'lojas'
ALTER TABLE lojas MODIFY COLUMN logo BLOB COMMENT 'Arquivo contendo a logo da loja.';


-- Definição de um comentário para a coluna 'logo_mime_type' da tabela 'lojas'
ALTER TABLE lojas MODIFY COLUMN logo_mime_type VARCHAR(512) COMMENT 'Tipo de mídia do arquivo da logo da loja.';


-- Definição de um comentário para a coluna 'logo_arquivo' da tabela 'lojas'
ALTER TABLE lojas MODIFY COLUMN logo_arquivo VARCHAR(512) COMMENT 'Formato do arquivo em que o arquivo da logo da loja está armazenado.';


-- Definição de um comentário para a coluna 'logo_charset' da tabela 'lojas'
ALTER TABLE lojas MODIFY COLUMN logo_charset VARCHAR(512) COMMENT 'O padrão de codificação de caracteres que é usado no arquivo da logo da loja.';


-- Definição de um comentário para a coluna 'logo_ultima_atualizacao' da tabela 'lojas'
ALTER TABLE lojas MODIFY COLUMN logo_ultima_atualizacao DATE COMMENT 'Registra quando ocorreu a ultima modificação no arquivo da logo da loja.';


-- Definição de uma constraint CHECK para a coluna 'loja_id' da tabela 'lojas' que impede a inserção de valores menores ou iguais a zero
ALTER TABLE lojas
ADD CONSTRAINT cc_lojas_lojaid
CHECK (loja_id > 0);


-- Definição de uma constraint CHECK para a coluna 'latitude' da tabela 'lojas' para evitar latitudes inexistentes
ALTER TABLE lojas
ADD CONSTRAINT cc_lojas_latitude
CHECK (latitude BETWEEN -90 AND 90);


-- Definição de uma constraint CHECK para a coluna 'longitude' da tabela 'lojas' para evitar longitudes inexistentes
ALTER TABLE lojas
ADD CONSTRAINT cc_lojas_longitude
CHECK (longitude BETWEEN -180 AND 180);


-- Definição de uma constraint CHECK para a coluna 'endereco_fisico' e a coluna 'endereco_web' da tabela 'lojas' para impedir que ambas sejam nulas simultaneamente
ALTER TABLE lojas
ADD CONSTRAINT cc_lojas_enderecoweb_enderecofisico
CHECK (endereco_fisico IS NOT NULL OR endereco_web IS NOT NULL);



-- Criação da tabela 'estoques', já definindo a coluna 'estoque_id' como a PK
CREATE TABLE estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                PRIMARY KEY (estoque_id)
);


-- Definição de um comentário para a tabela 'estoques'
ALTER TABLE estoques COMMENT 'Cadastro do estoque relativo à produtos das lojas.';


-- Definição de um comentário para a coluna 'estoque_id' da tabela 'estoques'
ALTER TABLE estoques MODIFY COLUMN estoque_id NUMERIC(38) COMMENT 'PK da tabela. Identifica cada estoque de um produto em uma loja.';


-- Definição de um comentário para a coluna 'loja_id' da tabela 'estoques'
ALTER TABLE estoques MODIFY COLUMN loja_id NUMERIC(38) COMMENT 'FK que faz referência à tabela lojas. Identifica a qual loja cada estoque se refere.';


-- Definição de um comentário para a coluna 'produto_id' da tabela 'estoques'
ALTER TABLE estoques MODIFY COLUMN produto_id NUMERIC(38) COMMENT 'FK que faz referência à tabela produtos. Identifica a qual produto cada estoque se refere.';


-- Definição de um comentário para a coluna 'quantidade' da tabela 'estoques'
ALTER TABLE estoques MODIFY COLUMN quantidade NUMERIC(38) COMMENT 'Quantidade em estoque do produto na loja.';


-- Definição de uma constraint CHECK para a coluna 'estoque_id' da tabela 'estoques' que impede a inserção de valores menores ou iguais a zero
ALTER TABLE estoques
ADD CONSTRAINT cc_estoques_estoqueid
CHECK (estoque_id > 0);


-- Definição de uma constraint CHECK para a coluna 'quantidade' da tabela 'estoques' para evitar a inserção de quantidades negativas
ALTER TABLE estoques
ADD CONSTRAINT cc_estoques_quantidade
CHECK (quantidade >= 0);



-- Criação da tabela 'clientes', já definindo a coluna 'cliente_id' como a PK
CREATE TABLE clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone2 VARCHAR(20),
                telefone3 VARCHAR(20),
                PRIMARY KEY (cliente_id)
);


-- Definição de um comentário para a tabela 'clientes'
ALTER TABLE clientes COMMENT 'Cadastro dos clientes das lojas.';


-- Definição de um comentário para a coluna 'cliente_id' da tabela 'clientes'
ALTER TABLE clientes MODIFY COLUMN cliente_id NUMERIC(38) COMMENT 'PK da tabela. Identifica cada cliente.';


-- Definição de um comentário para a coluna 'email' da tabela 'clientes'
ALTER TABLE clientes MODIFY COLUMN email VARCHAR(255) COMMENT 'E-mail de contato do cliente.';


-- Definição de um comentário para a coluna 'nome' da tabela 'clientes'
ALTER TABLE clientes MODIFY COLUMN nome VARCHAR(255) COMMENT 'Nome do cliente, como no RG.';


-- Definição de um comentário para a coluna 'telefone1' da tabela 'clientes'
ALTER TABLE clientes MODIFY COLUMN telefone1 VARCHAR(20) COMMENT 'Número de telefone do cliente.';


-- Definição de um comentário para a coluna 'telefone2' da tabela 'clientes'
ALTER TABLE clientes MODIFY COLUMN telefone2 VARCHAR(20) COMMENT 'Número de telefone adicional do cliente.';


-- Definição de um comentário para a coluna 'telefone3' da tabela 'clientes'
ALTER TABLE clientes MODIFY COLUMN telefone3 VARCHAR(20) COMMENT 'Número de telefone adicional do cliente.';


-- Definição de uma constraint CHECK para a coluna 'cliente_id' da tabela 'clientes' que impede a inserção de valores menores ou iguais a zero
ALTER TABLE clientes
ADD CONSTRAINT cc_clientes_clienteid
CHECK (cliente_id > 0);


--Definição de uma constraint CHECK para a coluna 'email' da tabela 'clientes' que obriga a presença de pelo menos um '@' na inserção de dados
ALTER TABLE clientes
ADD CONSTRAINT cc_clientes_email
CHECK (email LIKE '%@%');



-- Criação da tabela 'pedidos', já definindo a coluna 'pedido_id' como a PK
CREATE TABLE pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora DATETIME NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                status VARCHAR(15) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                PRIMARY KEY (pedido_id)
);


-- Definição de um comentário para a tabela 'pedidos'
ALTER TABLE pedidos COMMENT 'Cadastro do(s) pedido(s) realizado(s) por um cliente.';


-- Definição de um comentário para a coluna 'pedido_id' da tabela 'pedidos'
ALTER TABLE pedidos MODIFY COLUMN pedido_id NUMERIC(38) COMMENT 'PK da tabela. Identifica cada pedido.';


-- Definição de um comentário para a coluna 'data_hora' da tabela 'pedidos'
ALTER TABLE pedidos MODIFY COLUMN data_hora TIMESTAMP COMMENT 'Data e hora em que o pedido foi realizado pelo cliente.';


-- Definição de um comentário para a coluna 'cliente_id' da tabela 'pedidos'
ALTER TABLE pedidos MODIFY COLUMN cliente_id NUMERIC(38) COMMENT 'FK que faz referência à tabela clientes. Identifica a qual cliente cada pedido se refere.';


-- Definição de um comentário para a coluna 'status' da tabela 'pedidos'
ALTER TABLE pedidos MODIFY COLUMN status VARCHAR(15) COMMENT 'Status do pedido em relação à sua conclusão.';


-- Definição de um comentário para a coluna 'loja_id' da tabela 'pedidos'
ALTER TABLE pedidos MODIFY COLUMN loja_id NUMERIC(38) COMMENT 'FK que faz referência à tabela lojas. Identifica a qual loja cada pedido se direciona.';


-- Definição de uma constraint CHECK para a coluna 'pedido_id' da tabela 'pedidos' que impede a inserção de valores menores ou iguais a zero
ALTER TABLE pedidos
ADD CONSTRAINT cc_pedidos_pedidoid
CHECK (pedido_id > 0);


-- Definição de uma constraint CHECK para a coluna 'status' da tabela 'pedidos'
ALTER TABLE pedidos
ADD CONSTRAINT cc_pedidos_status
CHECK (status IN ('CANCELADO','COMPLETO','ABERTO','PAGO','REEMBOLSADO','ENVIADO'));



-- Criação da tabela 'envios', já definindo a coluna 'envio_id' como a PK
CREATE TABLE envios (
                envio_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                PRIMARY KEY (envio_id)
);


-- Definição de um comentário para a tabela 'envios'
ALTER TABLE envios COMMENT 'Registra os envios de pedidos que devem ser entregues ao endereço do cliente.';


-- Definição de um comentário para a coluna 'envio_id' da tabela 'envios'
ALTER TABLE envios MODIFY COLUMN envio_id NUMERIC(38) COMMENT 'PK da tabela. Identifica cada envio.';


-- Definição de um comentário para a coluna 'loja_id' da tabela 'envios'
ALTER TABLE envios MODIFY COLUMN loja_id NUMERIC(38) COMMENT 'FK que faz referência à tabela lojas. Identifica a qual loja cada envio se refere.';


-- Definição de um comentário para a coluna 'cliente_id' da tabela 'envios'
ALTER TABLE envios MODIFY COLUMN cliente_id NUMERIC(38) COMMENT 'FK que faz referência à tabela clientes. Identifica a qual cliente cada envio se refere.';


-- Definição de um comentário para a coluna 'endereco_entrega' da tabela 'envios'
ALTER TABLE envios MODIFY COLUMN endereco_entrega VARCHAR(512) COMMENT 'Endereço do local de destino do envio, incluindo cidade, bairro, rua e cep.';


-- Definição de um comentário para a coluna 'status' da tabela 'envios'
ALTER TABLE envios MODIFY COLUMN status VARCHAR(15) COMMENT 'Status atual do envio em relação à sua conclusão.';


-- Definição de uma constraint CHECK para a coluna 'envio_id' da tabela 'envios' que impede a inserção de valores menores ou iguais a zero
ALTER TABLE envios
ADD CONSTRAINT cc_envios_envioid
CHECK (envio_id > 0);


-- Definição de uma constraint CHECK para a coluna 'status' da tabela 'envios'
ALTER TABLE envios
ADD CONSTRAINT cc_envios_status
CHECK (status IN ('CRIADO','ENVIADO','TRANSITO','ENTREGUE'));




-- Criação da tabela 'pedidos_itens', já definindo as colunas 'pedido_id' e 'produto_id' como a PK composta
CREATE TABLE pedidos_itens (
                pedido_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                Quantidade NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38),
                PRIMARY KEY (pedido_id, produto_id)
);


-- Definição de um comentário para a tabela 'pedidos_itens'
ALTER TABLE pedidos_itens COMMENT 'Tabela de interseção entre pedidos e produtos. Cadastra detalhes sobre os produtos de cada pedido.';


-- Definição de um comentário para a coluna 'pedido_id' da tabela 'pedidos_itens'
ALTER TABLE pedidos_itens MODIFY COLUMN pedido_id NUMERIC(38) COMMENT 'Faz parte da PK da tabela. Também é uma FK que faz referência à tabela pedidos. Identifica em conjunto com a coluna produto_id a qual produto e qual pedido cada linha da tabela se refere.';


-- Definição de um comentário para a coluna 'produto_id' da tabela 'pedidos_itens'
ALTER TABLE pedidos_itens MODIFY COLUMN produto_id NUMERIC(38) COMMENT 'Faz parte da PK da tabela. Também é uma FK que faz referência à tabela produtos. Identifica em conjunto com a coluna pedido_id  a qual produto e qual pedido cada linha da tabela se refere.';


-- Definição de um comentário para a coluna 'numero_da_linha' da tabela 'pedidos_itens'
ALTER TABLE pedidos_itens MODIFY COLUMN numero_da_linha NUMERIC(38) COMMENT 'Número da linha do pedido.';


-- Definição de um comentário para a coluna 'preco_unitario' da tabela 'pedidos_itens'
ALTER TABLE pedidos_itens MODIFY COLUMN preco_unitario NUMERIC(10, 2) COMMENT 'Preço unitário de cada pedido.';


-- Definição de um comentário para a coluna 'quantidade' da tabela 'pedidos_itens'
ALTER TABLE pedidos_itens MODIFY COLUMN Quantidade NUMERIC(38) COMMENT 'Quantidade de itens pedidos.';


-- Definição de um comentário para a coluna 'envio_id' da tabela 'pedidos_itens'
ALTER TABLE pedidos_itens MODIFY COLUMN envio_id NUMERIC(38) COMMENT 'FK que faz referência à tabela envios. Identifica a qual envio cada linha da tabela se refere. Esse relacionamento é opcional.';


-- Definição de uma constraint CHECK para a coluna 'numero_da_linha' da tabela 'pedidos_itens' para evitar valores negativos
ALTER TABLE pedidos_itens
ADD CONSTRAINT cc_pedidositens_numerodalinha
CHECK (numero_da_linha >= 0);


-- Definição de uma constraint CHECK para a coluna 'quantidade' da tabela 'pedidos_itens' para evitar valores negativos
ALTER TABLE pedidos_itens
ADD CONSTRAINT cc_pedidositens_quantidade
CHECK (quantidade >= 0);


-- Definição de uma constraint CHECK para a coluna 'preco_unitario' da tabela 'pedidos_itens' para evitar valores negativos
ALTER TABLE pedidos_itens
ADD CONSTRAINT cc_pedidositens_precounitario
CHECK (preco_unitario >= 0);



/*
Com as entidades aplicadas, resta aplicar os relacionamentos entre elas.
Para tal, deve-se criar as constraints de FK, fazendo referências entre as tabelas por meio de certas colunas.
Com isso, a estrutura do banco de dados estará completa.
*/


-- Criação da FK que relaciona a tabela 'estoques' com a tabela 'produtos' por meio da coluna 'produto_id' presente nas duas tabelas
ALTER TABLE estoques ADD CONSTRAINT fk_produtos_estoques
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


-- Criação da FK que relaciona a tabela 'pedidos_itens' com a tabela 'produtos' por meio da coluna 'produto_id' presente nas duas tabelas
ALTER TABLE pedidos_itens ADD CONSTRAINT fk_produtos_pedidos_itens
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;



-- Criação da FK que relaciona a tabela 'envios' com a tabela 'lojas' por meio da coluna 'loja_id' presente nas duas tabelas
ALTER TABLE envios ADD CONSTRAINT fk_lojas_envios
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


-- Criação da FK que relaciona a tabela 'pedidos' com a tabela 'lojas' por meio da coluna 'loja_id' presente nas duas tabelas
ALTER TABLE pedidos ADD CONSTRAINT fk_lojas_pedidos
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


-- Criação da FK que relaciona a tabela 'estoques' com a tabela 'lojas' por meio da coluna 'loja_id' presente nas duas tabelas
ALTER TABLE estoques ADD CONSTRAINT fk_lojas_estoques
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


-- Criação da FK que relaciona a tabela 'envios' com a tabela 'clientes' por meio da coluna 'cliente_id' presente nas duas tabelas
ALTER TABLE envios ADD CONSTRAINT fk_clientes_envios
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


-- Criação da FK que relaciona a tabela 'pedidos' com a tabela 'clientes' por meio da coluna 'cliente_id' presente nas duas tabelas
ALTER TABLE pedidos ADD CONSTRAINT fk_clientes_pedidos
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


-- Criação da FK que relaciona a tabela 'pedidos_itens' com a tabela 'pedidos' por meio da coluna 'pedido_id' presente nas duas tabelas
ALTER TABLE pedidos_itens ADD CONSTRAINT fk_pedidos_pedidos_itens
FOREIGN KEY (pedido_id)
REFERENCES pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


-- Criação da FK que relaciona a tabela 'pedidos_itens' com a tabela 'envios' por meio da coluna 'envio_id' presente nas duas tabelas
ALTER TABLE pedidos_itens ADD CONSTRAINT fk_envios_pedidos_itens
FOREIGN KEY (envio_id)
REFERENCES envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


/*
Agora todos os relacionamentos foram implementados no banco de dados.

Com isso, a criação do banco de dados 'uvv', de seu esquema 'lojas' e de suas tabelas e colunas foi completada.
Criou-se, ainda, chaves primárias, chaves estrangeiras, constraints de check, comentários de tabela, comentários de coluna e um comentário para o banco de dados.
*/
