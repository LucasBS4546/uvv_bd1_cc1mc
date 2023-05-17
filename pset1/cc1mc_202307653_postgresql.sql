-- Criar o usuário
CREATE USER lucasbonatosoares
CREATEDB
CREATEROLE
SUPERUSER
LOGIN
PASSWORD 'banana'
;


-- Criar o banco de dados
DROP DATABASE IF EXISTS uvv;

CREATE DATABASE uvv
    OWNER = lucasbonatosoares
    TEMPLATE = template0
    ENCODING = 'UTF8'
    LC_COLLATE = 'pt_BR.UTF-8'
    LC_CTYPE = 'pt_BR.UTF-8'
    CONNECTION LIMIT = -1;



-- Usar o banco de dados
\c uvv;


-- Criar o esquema 'lojas'
CREATE SCHEMA lojas AUTHORIZATION lucasbonatosoares;


-- Colocando o esquema 'lojas' como o padrão
ALTER USER lucasbonatosoares
SET SEARCH_PATH TO lojas, "$user", public;





CREATE TABLE produtos (
                produto_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                preco_unitario NUMERIC(10,2),
                detalhes BYTEA,
                imagem BYTEA,
                imagem_mime_type VARCHAR(512),
                imagem_arquivo VARCHAR(512),
                imagem_charset VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                CONSTRAINT pk_produtos PRIMARY KEY (produto_id)
);
COMMENT ON TABLE produtos IS 'Cadastro dos produtos que podem existir em um estoque de uma loja.';
COMMENT ON COLUMN produtos.produto_id IS 'PK da tabela. Identifica cada produto.';
COMMENT ON COLUMN produtos.nome IS 'Nome do produto, como no pacote.';
COMMENT ON COLUMN produtos.preco_unitario IS 'Preço unitário do produto.';
COMMENT ON COLUMN produtos.detalhes IS 'Detalhes adicionais sobre o produto.';
COMMENT ON COLUMN produtos.imagem IS 'Arquivo contendo imagem do produto.';
COMMENT ON COLUMN produtos.imagem_mime_type IS 'Tipo de mídia do arquivo de imagem do produto.';
COMMENT ON COLUMN produtos.imagem_arquivo IS 'Formato do arquivo em que o arquivo da imagem do produto está armazenado.';
COMMENT ON COLUMN produtos.imagem_charset IS 'O padrão de codificação de caracteres que é usado no arquivo da imagem do produto.';
COMMENT ON COLUMN produtos.imagem_ultima_atualizacao IS 'Registra quando ocorreu a ultima modificação no arquivo da imagem do produto.';


CREATE TABLE lojas (
                loja_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                endereco_web VARCHAR(100),
                endereco_fisico VARCHAR(512),
                latitude NUMERIC,
                longitude NUMERIC,
                logo BYTEA,
                logo_mime_type VARCHAR(512),
                logo_arquivo VARCHAR(512),
                logo_charset VARCHAR(512),
                logo_ultima_atualizacao DATE,
                CONSTRAINT pk_lojas PRIMARY KEY (loja_id)
);
COMMENT ON TABLE lojas IS 'Cadastro de todas as lojas associadas.';
COMMENT ON COLUMN lojas.loja_id IS 'PK da tabela. Identifica cada loja.';
COMMENT ON COLUMN lojas.nome IS 'Nome de cada loja.';
COMMENT ON COLUMN lojas.endereco_web IS 'Endereço web (site) de cada loja. Algumas lojas podem não ter um site.';
COMMENT ON COLUMN lojas.endereco_fisico IS 'Endereço físico da loja, incluindo cidade, bairro, rua e cep.';
COMMENT ON COLUMN lojas.latitude IS 'Coordenada geográfica da loja em relação ao equador.';
COMMENT ON COLUMN lojas.longitude IS 'Coordenada geográfica da loja em relação ao meridiano de Greenwich.';
COMMENT ON COLUMN lojas.logo IS 'Arquivo contendo a logo da loja.';
COMMENT ON COLUMN lojas.logo_mime_type IS 'Tipo de mídia do arquivo da logo da loja.';
COMMENT ON COLUMN lojas.logo_arquivo IS 'Formato do arquivo em que o arquivo da logo da loja está armazenado.';
COMMENT ON COLUMN lojas.logo_charset IS 'O padrão de codificação de caracteres que é usado no arquivo da logo da loja.';
COMMENT ON COLUMN lojas.logo_ultima_atualizacao IS 'Registra quando ocorreu a ultima modificação no arquivo da logo da loja.';


CREATE TABLE estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                CONSTRAINT pk_estoques PRIMARY KEY (estoque_id)
);
COMMENT ON TABLE estoques IS 'Cadastro do estoque relativo à produtos das lojas.';
COMMENT ON COLUMN estoques.estoque_id IS 'PK da tabela. Identifica cada estoque de um produto em uma loja.';
COMMENT ON COLUMN estoques.loja_id IS 'FK que faz referência à tabela lojas. Identifica a qual loja cada estoque se refere.';
COMMENT ON COLUMN estoques.produto_id IS 'FK que faz referência à tabela produtos. Identifica a qual produto cada estoque se refere.';
COMMENT ON COLUMN estoques.quantidade IS 'Quantidade em estoque do produto na loja.';


CREATE TABLE clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone2 VARCHAR(20),
                telefone3 VARCHAR(20),
                CONSTRAINT pk_clientes PRIMARY KEY (cliente_id)
);
COMMENT ON TABLE clientes IS 'Cadastro dos clientes das lojas.';
COMMENT ON COLUMN clientes.cliente_id IS 'PK da tabela. Identifica cada cliente.';
COMMENT ON COLUMN clientes.email IS 'E-mail de contato do cliente.';
COMMENT ON COLUMN clientes.nome IS 'Nome do cliente, como no RG.';
COMMENT ON COLUMN clientes.telefone1 IS 'Número de telefone do cliente.';
COMMENT ON COLUMN clientes.telefone2 IS 'Número de telefone adicional do cliente.';
COMMENT ON COLUMN clientes.telefone3 IS 'Número de telefone adicional do cliente.';


CREATE TABLE pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora TIMESTAMP NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                status VARCHAR(15) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                CONSTRAINT pk_pedidos PRIMARY KEY (pedido_id)
);
COMMENT ON TABLE pedidos IS 'Cadastro do(s) pedido(s) realizado(s) por um cliente.';
COMMENT ON COLUMN pedidos.pedido_id IS 'PK da tabela. Identifica cada pedido.';
COMMENT ON COLUMN pedidos.data_hora IS 'Data e hora em que o pedido foi realizado pelo cliente.';
COMMENT ON COLUMN pedidos.cliente_id IS 'FK que faz referência à tabela clientes. Identifica a qual cliente cada pedido se refere.';
COMMENT ON COLUMN pedidos.status IS 'Status do pedido em relação à sua conclusão.';
COMMENT ON COLUMN pedidos.loja_id IS 'FK que faz referência à tabela lojas. Identifica a qual loja cada pedido se direciona.';


CREATE TABLE envios (
                envio_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                CONSTRAINT pk_envios PRIMARY KEY (envio_id)
);
COMMENT ON TABLE envios IS 'Registra os envios de pedidos que devem ser entregues ao endereço do cliente.';
COMMENT ON COLUMN envios.envio_id IS 'PK da tabela. Identifica cada envio.';
COMMENT ON COLUMN envios.loja_id IS 'FK que faz referência à tabela lojas. Identifica a qual loja cada envio se refere.';
COMMENT ON COLUMN envios.cliente_id IS 'FK que faz referência à tabela clientes. Identifica a qual cliente cada envio se refere.';
COMMENT ON COLUMN envios.endereco_entrega IS 'Endereço do local de destino do envio, incluindo cidade, bairro, rua e cep.';
COMMENT ON COLUMN envios.status IS 'Status atual do envio em relação à sua conclusão.';


CREATE TABLE pedidos_itens (
                pedido_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                Quantidade NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38),
                CONSTRAINT pk_pedidos_itens PRIMARY KEY (pedido_id, produto_id)
);
COMMENT ON TABLE pedidos_itens IS 'Tabela de interseção entre pedidos e produtos. Cadastra detalhes sobre os produtos de cada pedido.';
COMMENT ON COLUMN pedidos_itens.pedido_id IS 'Faz parte da PK da tabela. Também é uma FK que faz referência à tabela pedidos. Identifica em conjunto com a coluna produto_id a qual produto e qual pedido cada linha da tabela se refere.';
COMMENT ON COLUMN pedidos_itens.produto_id IS 'Faz parte da PK da tabela. Também é uma FK que faz referência à tabela produtos. Identifica em conjunto com a coluna pedido_id  a qual produto e qual pedido cada linha da tabela se refere.';
COMMENT ON COLUMN pedidos_itens.numero_da_linha IS 'Número da linha do pedido.';
COMMENT ON COLUMN pedidos_itens.preco_unitario IS 'Preço unitário de cada pedido.';
COMMENT ON COLUMN pedidos_itens.Quantidade IS 'Quantidade de itens pedidos.';
COMMENT ON COLUMN pedidos_itens.envio_id IS 'FK que faz referência à tabela envios. Identifica a qual envio cada linha da tabela se refere. Esse relacionamento é opcional.';


ALTER TABLE estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE envios ADD CONSTRAINT fk_lojas_envios
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
