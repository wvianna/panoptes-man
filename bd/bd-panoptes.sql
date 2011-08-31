------------------------------
-- pgDesigner 1.2.17
--
-- Project    : novoDB
-- Date       : 08/31/2011 18:42:39.907
-- Description: Reestruturação do Banco de Dados (feito do zero)
------------------------------


-- Start Table's declaration
DROP TABLE IF EXISTS "planta" CASCADE;
CREATE TABLE "planta" (
"idplanta" serial NOT NULL,
"tagplanta" varchar NOT NULL,
"descricao" text
) WITH OIDS;
ALTER TABLE "planta" ADD CONSTRAINT "planta_pk" PRIMARY KEY("idplanta");
COMMENT ON COLUMN "planta"."idplanta" IS 'Chave primária da tabela Planta';
COMMENT ON COLUMN "planta"."tagplanta" IS 'TAG da planta';
COMMENT ON COLUMN "planta"."descricao" IS 'Descrição da planta';

DROP TABLE IF EXISTS "area" CASCADE;
CREATE TABLE "area" (
"idarea" serial NOT NULL,
"idplanta" integer NOT NULL,
"tagarea" varchar NOT NULL,
"descricao" text
) WITH OIDS;
ALTER TABLE "area" ADD CONSTRAINT "area_pk" PRIMARY KEY("idarea");
COMMENT ON COLUMN "area"."idarea" IS 'Chave primária da tabela Área';
COMMENT ON COLUMN "area"."idplanta" IS 'Chave estrangeira';
COMMENT ON COLUMN "area"."tagarea" IS 'TAG da área';
COMMENT ON COLUMN "area"."descricao" IS 'Descrição da área';

DROP TABLE IF EXISTS "equipamento" CASCADE;
CREATE TABLE "equipamento" (
"idequipamento" serial NOT NULL,
"idarea" integer NOT NULL,
"tagequipamento" varchar NOT NULL,
"descricao" text,
"fabricante" varchar,
"tipo" varchar
) WITH OIDS;
ALTER TABLE "equipamento" ADD CONSTRAINT "equipamento_pk" PRIMARY KEY("idequipamento");
COMMENT ON COLUMN "equipamento"."idequipamento" IS 'Chave primária da tabela Equipamento';
COMMENT ON COLUMN "equipamento"."idarea" IS 'Chave estrangeira';
COMMENT ON COLUMN "equipamento"."tagequipamento" IS 'TAG de Equipamento';
COMMENT ON COLUMN "equipamento"."descricao" IS 'Descrição do Equipamento';
COMMENT ON COLUMN "equipamento"."fabricante" IS 'Fabricante do equipamento';
COMMENT ON COLUMN "equipamento"."tipo" IS 'Tipo do equipamento: bomba, turbina, compressor, etc';

DROP TABLE IF EXISTS "componente" CASCADE;
CREATE TABLE "componente" (
"idcomponente" serial NOT NULL,
"idequipamento" integer NOT NULL,
"tagcomponente" varchar NOT NULL,
"descricao" text
) WITH OIDS;
ALTER TABLE "componente" ADD CONSTRAINT "componente_pk" PRIMARY KEY("idcomponente");
COMMENT ON COLUMN "componente"."idcomponente" IS 'Chave primária da tabela Componente';
COMMENT ON COLUMN "componente"."idequipamento" IS 'Chave estrangeira';
COMMENT ON COLUMN "componente"."tagcomponente" IS 'TAG do componente';
COMMENT ON COLUMN "componente"."descricao" IS 'Descrição do componente';

DROP TABLE IF EXISTS "ponto" CASCADE;
CREATE TABLE "ponto" (
"idponto" serial4 NOT NULL,
"idsensor" integer NOT NULL,
"idcomponente" integer NOT NULL,
"tagponto" varchar NOT NULL,
"posicao" varchar,
"tipomedicao" varchar,
"descricao" text,
"al" real DEFAULT 0.0,
"sd" real DEFAULT 0.0
) WITH OIDS;
ALTER TABLE "ponto" ADD CONSTRAINT "ponto_pk" PRIMARY KEY("idponto");
COMMENT ON COLUMN "ponto"."idponto" IS 'Chave primária da tabela Ponto';
COMMENT ON COLUMN "ponto"."idsensor" IS 'Chave estrangeira';
COMMENT ON COLUMN "ponto"."idcomponente" IS 'Chave estrangeira';
COMMENT ON COLUMN "ponto"."tagponto" IS 'TAG do ponto';
COMMENT ON COLUMN "ponto"."posicao" IS 'Posição do sensor do ponto';
COMMENT ON COLUMN "ponto"."tipomedicao" IS 'Vibração, Aceleração, Deslocamento, Rotação';
COMMENT ON COLUMN "ponto"."descricao" IS 'Descrição do ponto';
COMMENT ON COLUMN "ponto"."al" IS 'Valor de Alerta';
COMMENT ON COLUMN "ponto"."sd" IS 'Valor de Shut Down';

DROP TABLE IF EXISTS "sensor" CASCADE;
CREATE TABLE "sensor" (
"idsensor" serial NOT NULL,
"idponto" integer NOT NULL,
"identificacao" varchar,
"range" varchar,
"sensibilidade" varchar,
"fabricante" varchar,
"modelo" varchar,
"tipo" varchar,
"descricao" text
) WITH OIDS;
ALTER TABLE "sensor" ADD CONSTRAINT "sensor_pk" PRIMARY KEY("idsensor");
COMMENT ON COLUMN "sensor"."idsensor" IS 'Chave primária da tabela Sensor';
COMMENT ON COLUMN "sensor"."idponto" IS 'Chave estrangeira';
COMMENT ON COLUMN "sensor"."identificacao" IS 'Nome do sensor';
COMMENT ON COLUMN "sensor"."range" IS 'Range de Medição';
COMMENT ON COLUMN "sensor"."sensibilidade" IS 'Sensibilidade do Sensor';
COMMENT ON COLUMN "sensor"."fabricante" IS 'Fabricante do Sensor';
COMMENT ON COLUMN "sensor"."modelo" IS 'Modelo do Sensor';
COMMENT ON COLUMN "sensor"."tipo" IS 'Acelerômetro, proxímetro, tacômetro';
COMMENT ON COLUMN "sensor"."descricao" IS 'Descrição do sensor';

DROP TABLE IF EXISTS "montagem" CASCADE;
CREATE TABLE "montagem" (
"idmontagem" serial NOT NULL,
"obs" text,
"dhiniciomontagem" timestamp NOT NULL,
"dhfimmontagem" timestamp
) WITH OIDS;
ALTER TABLE "montagem" ADD CONSTRAINT "montagem_pk" PRIMARY KEY("idmontagem");
COMMENT ON COLUMN "montagem"."idmontagem" IS 'Chave primária da tabela Montagem';
COMMENT ON COLUMN "montagem"."obs" IS 'Observações sobre a montagem';
COMMENT ON COLUMN "montagem"."dhiniciomontagem" IS 'Data hora do início da montagem';
COMMENT ON COLUMN "montagem"."dhfimmontagem" IS 'Data hora do fim da montagem';

DROP TABLE IF EXISTS "leitura" CASCADE;
CREATE TABLE "leitura" (
"idleitura" serial8 NOT NULL,
"idpontosmontagens" integer NOT NULL,
"datahora" timestamp NOT NULL,
"rotacao" real,
"deslocamento" real,
"rmstotal" real,
"rmspicos" real,
"rmsruido" real,
"picos" real[]
) WITH OIDS;
ALTER TABLE "leitura" ADD CONSTRAINT "leitura_pk" PRIMARY KEY("idleitura");
COMMENT ON COLUMN "leitura"."idleitura" IS 'Chave primária da tabela leitura';
COMMENT ON COLUMN "leitura"."idpontosmontagens" IS 'Chave estrangeira';
COMMENT ON COLUMN "leitura"."datahora" IS 'Data e hora da leitura';
COMMENT ON COLUMN "leitura"."rotacao" IS 'Rotação do eixo referente ao ponto';
COMMENT ON COLUMN "leitura"."deslocamento" IS 'Deslocamento do ponto.
Apenas para proxímetro';
COMMENT ON COLUMN "leitura"."rmstotal" IS 'RMS Total = RMS do espectro';
COMMENT ON COLUMN "leitura"."rmspicos" IS 'RMS Picos = RMS calculado com os picos acima do limite de corte';
COMMENT ON COLUMN "leitura"."rmsruido" IS 'RMS Ruido = RMS calculado com os picos abaixo do limite de corte';
COMMENT ON COLUMN "leitura"."picos" IS 'Matriz dos picos do espectro.
Coluna = frequência, amplitude e fase.
Linhas = N';

DROP TABLE IF EXISTS "pontosmontagens" CASCADE;
CREATE TABLE "pontosmontagens" (
"idpontosmontagens" serial NOT NULL,
"idponto" integer NOT NULL,
"idmontagem" integer NOT NULL,
"sequencialmontagemponto" integer NOT NULL
) WITH OIDS;
ALTER TABLE "pontosmontagens" ADD CONSTRAINT "pontosmontagens_pk" PRIMARY KEY("idpontosmontagens");
COMMENT ON COLUMN "pontosmontagens"."idpontosmontagens" IS 'Chave Primaria';
COMMENT ON COLUMN "pontosmontagens"."idponto" IS 'Chave estrangeira';
COMMENT ON COLUMN "pontosmontagens"."idmontagem" IS 'Chave estrangeira';
COMMENT ON COLUMN "pontosmontagens"."sequencialmontagemponto" IS 'Sequencial de instalação';

-- End Table's declaration

-- Start Relation's declaration
ALTER TABLE "pontosmontagens" DROP CONSTRAINT "pontosmontagens_fkey1" CASCADE;
ALTER TABLE "pontosmontagens" ADD CONSTRAINT "pontosmontagens_fkey1" FOREIGN KEY ("idponto") REFERENCES "ponto"("idponto") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "pontosmontagens" DROP CONSTRAINT "pontosmontagens_fkey2" CASCADE;
ALTER TABLE "pontosmontagens" ADD CONSTRAINT "pontosmontagens_fkey2" FOREIGN KEY ("idmontagem") REFERENCES "montagem"("idmontagem") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "leitura" DROP CONSTRAINT "leitura_fkey1" CASCADE;
ALTER TABLE "leitura" ADD CONSTRAINT "leitura_fkey1" FOREIGN KEY ("idpontosmontagens") REFERENCES "pontosmontagens"("idpontosmontagens") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "equipamento" DROP CONSTRAINT "equipamento_fkey1" CASCADE;
ALTER TABLE "equipamento" ADD CONSTRAINT "equipamento_fkey1" FOREIGN KEY ("idarea") REFERENCES "area"("idarea") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "area" DROP CONSTRAINT "area_fkey1" CASCADE;
ALTER TABLE "area" ADD CONSTRAINT "area_fkey1" FOREIGN KEY ("idplanta") REFERENCES "planta"("idplanta") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "componente" DROP CONSTRAINT "componente_fkey1" CASCADE;
ALTER TABLE "componente" ADD CONSTRAINT "componente_fkey1" FOREIGN KEY ("idequipamento") REFERENCES "equipamento"("idequipamento") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "ponto" DROP CONSTRAINT "ponto_fkey1" CASCADE;
ALTER TABLE "ponto" ADD CONSTRAINT "ponto_fkey1" FOREIGN KEY ("idcomponente") REFERENCES "componente"("idcomponente") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "ponto" DROP CONSTRAINT "ponto_fkey2" CASCADE;
ALTER TABLE "ponto" ADD CONSTRAINT "ponto_fkey2" FOREIGN KEY ("idsensor") REFERENCES "sensor"("idsensor") ON UPDATE CASCADE ON DELETE RESTRICT;

-- End Relation's declaration

