------------------------------
-- pgDesigner 1.2.17
--
-- Project    : novoDB
-- Date       : 09/14/2011 11:40:47.071
-- Description: Reestruturação do Banco de Dados (feito do zero)
------------------------------


-- Start Table's declaration
DROP TABLE IF EXISTS "planta" CASCADE;
CREATE TABLE "planta" (
"idplanta" varchar NOT NULL,
"tagplanta" varchar NOT NULL,
"descricao" text
) WITH OIDS;
ALTER TABLE "planta" ADD CONSTRAINT "planta_pk" PRIMARY KEY("idplanta");
COMMENT ON TABLE "planta" IS 'Informações da Planta';
COMMENT ON COLUMN "planta"."idplanta" IS 'Chave primária da tabela planta';
COMMENT ON COLUMN "planta"."tagplanta" IS 'TAG da planta';
COMMENT ON COLUMN "planta"."descricao" IS 'Descrição da planta';

DROP TABLE IF EXISTS "area" CASCADE;
CREATE TABLE "area" (
"idarea" varchar NOT NULL,
"idplanta" varchar NOT NULL,
"tagarea" varchar NOT NULL,
"descricao" text
) WITH OIDS;
ALTER TABLE "area" ADD CONSTRAINT "area_pk" PRIMARY KEY("idarea");
COMMENT ON TABLE "area" IS 'Informações da Área de uma Planta';
COMMENT ON COLUMN "area"."idarea" IS 'Chave primária da tabela área';
COMMENT ON COLUMN "area"."idplanta" IS 'Chave estrangeira';
COMMENT ON COLUMN "area"."tagarea" IS 'TAG da área';
COMMENT ON COLUMN "area"."descricao" IS 'Descrição da área';

DROP TABLE IF EXISTS "equipamento" CASCADE;
CREATE TABLE "equipamento" (
"idequipamento" varchar NOT NULL,
"idarea" varchar NOT NULL,
"tagequipamento" varchar NOT NULL,
"descricao" text,
"fabricante" varchar,
"tipo" varchar
) WITH OIDS;
ALTER TABLE "equipamento" ADD CONSTRAINT "equipamento_pk" PRIMARY KEY("idequipamento");
COMMENT ON TABLE "equipamento" IS 'Informações sobre os Equipamentos';
COMMENT ON COLUMN "equipamento"."idequipamento" IS 'Chave primária da tabela equipamento';
COMMENT ON COLUMN "equipamento"."idarea" IS 'Chave estrangeira';
COMMENT ON COLUMN "equipamento"."tagequipamento" IS 'TAG de Equipamento';
COMMENT ON COLUMN "equipamento"."descricao" IS 'Descrição do Equipamento';
COMMENT ON COLUMN "equipamento"."fabricante" IS 'Fabricante do equipamento';
COMMENT ON COLUMN "equipamento"."tipo" IS 'Tipo do equipamento: bomba, turbina, compressor, etc';

DROP TABLE IF EXISTS "componente" CASCADE;
CREATE TABLE "componente" (
"idcomponente" varchar NOT NULL,
"idequipamento" varchar NOT NULL,
"tagcomponente" varchar NOT NULL,
"descricao" text
) WITH OIDS;
ALTER TABLE "componente" ADD CONSTRAINT "componente_pk" PRIMARY KEY("idcomponente");
COMMENT ON TABLE "componente" IS 'Componentes de um Equipamento';
COMMENT ON COLUMN "componente"."idcomponente" IS 'Chave primária da tabela componente';
COMMENT ON COLUMN "componente"."idequipamento" IS 'Chave estrangeira';
COMMENT ON COLUMN "componente"."tagcomponente" IS 'TAG do componente';
COMMENT ON COLUMN "componente"."descricao" IS 'Descrição do componente';

DROP TABLE IF EXISTS "ponto" CASCADE;
CREATE TABLE "ponto" (
"idponto" varchar NOT NULL,
"idsensor" varchar NOT NULL,
"idcomponente" varchar NOT NULL,
"tagponto" varchar NOT NULL,
"posicao" varchar,
"tipomedicao" varchar,
"descricao" text,
"valoralerta" real DEFAULT 0.0,
"valorshutdown" real DEFAULT 0.0
) WITH OIDS;
ALTER TABLE "ponto" ADD CONSTRAINT "ponto_pk" PRIMARY KEY("idponto");
COMMENT ON TABLE "ponto" IS 'Pontos de análise de um Equipamento';
COMMENT ON COLUMN "ponto"."idponto" IS 'Chave primária da tabela ponto';
COMMENT ON COLUMN "ponto"."idsensor" IS 'Chave estrangeira';
COMMENT ON COLUMN "ponto"."idcomponente" IS 'Chave estrangeira';
COMMENT ON COLUMN "ponto"."tagponto" IS 'TAG do ponto';
COMMENT ON COLUMN "ponto"."posicao" IS 'Posição do sensor do ponto';
COMMENT ON COLUMN "ponto"."tipomedicao" IS 'Vibração, Aceleração, Deslocamento, Rotação';
COMMENT ON COLUMN "ponto"."descricao" IS 'Descrição do ponto';
COMMENT ON COLUMN "ponto"."valoralerta" IS 'Valor de Alerta';
COMMENT ON COLUMN "ponto"."valorshutdown" IS 'Valor de Shut Down';

DROP TABLE IF EXISTS "sensor" CASCADE;
CREATE TABLE "sensor" (
"idsensor" varchar NOT NULL,
"identificacao" varchar,
"range" varchar,
"sensibilidade" varchar,
"fabricante" varchar,
"modelo" varchar,
"tipo" varchar,
"descricao" text
) WITH OIDS;
ALTER TABLE "sensor" ADD CONSTRAINT "sensor_pk" PRIMARY KEY("idsensor");
COMMENT ON TABLE "sensor" IS 'Informações sobre um Sensor';
COMMENT ON COLUMN "sensor"."idsensor" IS 'Chave primária da tabela sensor';
COMMENT ON COLUMN "sensor"."identificacao" IS 'Nome do sensor';
COMMENT ON COLUMN "sensor"."range" IS 'Range de Medição';
COMMENT ON COLUMN "sensor"."sensibilidade" IS 'Sensibilidade do Sensor';
COMMENT ON COLUMN "sensor"."fabricante" IS 'Fabricante do Sensor';
COMMENT ON COLUMN "sensor"."modelo" IS 'Modelo do Sensor';
COMMENT ON COLUMN "sensor"."tipo" IS 'Acelerômetro, proxímetro, tacômetro';
COMMENT ON COLUMN "sensor"."descricao" IS 'Descrição do sensor';

DROP TABLE IF EXISTS "montagem" CASCADE;
CREATE TABLE "montagem" (
"idmontagem" varchar NOT NULL,
"observacao" text,
"dhiniciomontagem" timestamp NOT NULL,
"dhfimmontagem" timestamp
) WITH OIDS;
ALTER TABLE "montagem" ADD CONSTRAINT "montagem_pk" PRIMARY KEY("idmontagem");
COMMENT ON TABLE "montagem" IS 'Informações sobre uma Montagem';
COMMENT ON COLUMN "montagem"."idmontagem" IS 'Chave primária da tabela montagem';
COMMENT ON COLUMN "montagem"."observacao" IS 'Observações sobre a montagem';
COMMENT ON COLUMN "montagem"."dhiniciomontagem" IS 'Data hora do início da montagem';
COMMENT ON COLUMN "montagem"."dhfimmontagem" IS 'Data hora do fim da montagem';

DROP TABLE IF EXISTS "leitura" CASCADE;
CREATE TABLE "leitura" (
"idleitura" varchar NOT NULL,
"idpontosmontagens" varchar NOT NULL,
"datahora" timestamp NOT NULL,
"rotacao" real,
"deslocamento" real,
"rmstotal" real,
"rmspicos" real,
"rmsruido" real
) WITH OIDS;
ALTER TABLE "leitura" ADD CONSTRAINT "leitura_pk" PRIMARY KEY("idleitura");
COMMENT ON TABLE "leitura" IS 'Armazena dados lidos de um Ponto';
COMMENT ON COLUMN "leitura"."idleitura" IS 'Chave primária da tabela leitura';
COMMENT ON COLUMN "leitura"."idpontosmontagens" IS 'Chave estrangeira';
COMMENT ON COLUMN "leitura"."datahora" IS 'Data e hora da leitura';
COMMENT ON COLUMN "leitura"."rotacao" IS 'Rotação do eixo referente ao ponto';
COMMENT ON COLUMN "leitura"."deslocamento" IS 'Deslocamento do ponto.
Apenas para proxímetro';
COMMENT ON COLUMN "leitura"."rmstotal" IS 'RMS Total = RMS do espectro';
COMMENT ON COLUMN "leitura"."rmspicos" IS 'RMS Picos = RMS calculado com os picos acima do limite de corte';
COMMENT ON COLUMN "leitura"."rmsruido" IS 'RMS Ruido = RMS calculado com os picos abaixo do limite de corte';

DROP TABLE IF EXISTS "pontosmontagens" CASCADE;
CREATE TABLE "pontosmontagens" (
"idpontosmontagens" varchar NOT NULL,
"idponto" varchar NOT NULL,
"idmontagem" varchar NOT NULL,
"sequencialmontagemponto" integer NOT NULL
) WITH OIDS;
ALTER TABLE "pontosmontagens" ADD CONSTRAINT "pontosmontagens_pk" PRIMARY KEY("idpontosmontagens");
COMMENT ON TABLE "pontosmontagens" IS 'Relação N * M entre Ponto e Montagem';
COMMENT ON COLUMN "pontosmontagens"."idpontosmontagens" IS 'Chave primária da tabela pontosmontagens';
COMMENT ON COLUMN "pontosmontagens"."idponto" IS 'Chave estrangeira';
COMMENT ON COLUMN "pontosmontagens"."idmontagem" IS 'Chave estrangeira';
COMMENT ON COLUMN "pontosmontagens"."sequencialmontagemponto" IS 'Sequencial de instalação';

DROP TABLE IF EXISTS "pico" CASCADE;
CREATE TABLE "pico" (
"idpico" varchar NOT NULL,
"idleitura" varchar NOT NULL,
"valorpico" real,
"datahora" timestamp
) WITH OIDS;
ALTER TABLE "pico" ADD CONSTRAINT "pico_pk" PRIMARY KEY("idpico");
COMMENT ON COLUMN "pico"."idpico" IS 'Chave primária da tabela pico';
COMMENT ON COLUMN "pico"."idleitura" IS 'Chave estrangeira';
COMMENT ON COLUMN "pico"."valorpico" IS 'Valor de pico';
COMMENT ON COLUMN "pico"."datahora" IS 'Data hora do pico';

-- End Table's declaration

-- Start Relation's declaration
ALTER TABLE "pontosmontagens" DROP CONSTRAINT "ponto_to_pontosmontagens_fkey" CASCADE;
ALTER TABLE "pontosmontagens" ADD CONSTRAINT "ponto_to_pontosmontagens_fkey" FOREIGN KEY ("idponto") REFERENCES "ponto"("idponto") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "pontosmontagens" DROP CONSTRAINT "montagem_to_pontosmontagens_fkey" CASCADE;
ALTER TABLE "pontosmontagens" ADD CONSTRAINT "montagem_to_pontosmontagens_fkey" FOREIGN KEY ("idmontagem") REFERENCES "montagem"("idmontagem") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "leitura" DROP CONSTRAINT "pontosmontagens_to_leitura_fkey" CASCADE;
ALTER TABLE "leitura" ADD CONSTRAINT "pontosmontagens_to_leitura_fkey" FOREIGN KEY ("idpontosmontagens") REFERENCES "pontosmontagens"("idpontosmontagens") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "equipamento" DROP CONSTRAINT "area_to_equipamento_fkey" CASCADE;
ALTER TABLE "equipamento" ADD CONSTRAINT "area_to_equipamento_fkey" FOREIGN KEY ("idarea") REFERENCES "area"("idarea") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "area" DROP CONSTRAINT "planta_to_area_fkey" CASCADE;
ALTER TABLE "area" ADD CONSTRAINT "planta_to_area_fkey" FOREIGN KEY ("idplanta") REFERENCES "planta"("idplanta") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "componente" DROP CONSTRAINT "equipamento_to_componente_fkey" CASCADE;
ALTER TABLE "componente" ADD CONSTRAINT "equipamento_to_componente_fkey" FOREIGN KEY ("idequipamento") REFERENCES "equipamento"("idequipamento") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "ponto" DROP CONSTRAINT "componente_to_ponto_fkey" CASCADE;
ALTER TABLE "ponto" ADD CONSTRAINT "componente_to_ponto_fkey" FOREIGN KEY ("idcomponente") REFERENCES "componente"("idcomponente") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "ponto" DROP CONSTRAINT "sensor_to_ponto_fkey" CASCADE;
ALTER TABLE "ponto" ADD CONSTRAINT "sensor_to_ponto_fkey" FOREIGN KEY ("idsensor") REFERENCES "sensor"("idsensor") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "pico" DROP CONSTRAINT "leitura_to_pico_fkey" CASCADE;
ALTER TABLE "pico" ADD CONSTRAINT "leitura_to_pico_fkey" FOREIGN KEY ("idleitura") REFERENCES "leitura"("idleitura") ON UPDATE CASCADE ON DELETE RESTRICT;

-- End Relation's declaration

