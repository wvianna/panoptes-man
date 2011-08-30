------------------------------
-- pgDesigner 1.2.17
--
-- Project    : novoDB
-- Date       : 08/30/2011 18:58:21.29
-- Description: Reestruturação do Banco de Dados (feito do zero)
------------------------------


-- Start Sequence's declaration
DROP SEQUENCE IF EXISTS "idplanta_primarykey" CASCADE;
CREATE SEQUENCE "idplanta_primarykey" NO MINVALUE NO MAXVALUE NO CYCLE;

DROP SEQUENCE IF EXISTS "idarea_primarykey" CASCADE;
CREATE SEQUENCE "idarea_primarykey" NO MINVALUE NO MAXVALUE NO CYCLE;

DROP SEQUENCE IF EXISTS "idequipamento_primarykey" CASCADE;
CREATE SEQUENCE "idequipamento_primarykey" NO MINVALUE NO MAXVALUE NO CYCLE;

DROP SEQUENCE IF EXISTS "idcomponente_primarykey" CASCADE;
CREATE SEQUENCE "idcomponente_primarykey" NO MINVALUE NO MAXVALUE NO CYCLE;

DROP SEQUENCE IF EXISTS "idponto_primarykey" CASCADE;
CREATE SEQUENCE "idponto_primarykey" NO MINVALUE NO MAXVALUE NO CYCLE;

DROP SEQUENCE IF EXISTS "idsensor_primarykey" CASCADE;
CREATE SEQUENCE "idsensor_primarykey" NO MINVALUE NO MAXVALUE NO CYCLE;

DROP SEQUENCE IF EXISTS "idmontagensequipamentos_primarykey" CASCADE;
CREATE SEQUENCE "idmontagensequipamentos_primarykey" NO MINVALUE NO MAXVALUE NO CYCLE;

DROP SEQUENCE IF EXISTS "idmontagem_primarykey" CASCADE;
CREATE SEQUENCE "idmontagem_primarykey" NO MINVALUE NO MAXVALUE NO CYCLE;

-- End Sequence's declaration

-- Start Table's declaration
DROP TABLE IF EXISTS "planta" CASCADE;
CREATE TABLE "planta" (
"idplanta" integer NOT NULL DEFAULT nextval('idplanta_primarykey'),
"tagplanta" varchar,
"descricao" text
) WITH OIDS;
ALTER TABLE "planta" ADD CONSTRAINT "planta_pk" PRIMARY KEY("idplanta");
COMMENT ON COLUMN "planta"."idplanta" IS 'Chave primária da tabela Planta';
COMMENT ON COLUMN "planta"."tagplanta" IS 'TAG da planta';
COMMENT ON COLUMN "planta"."descricao" IS 'Descrição da planta';

DROP TABLE IF EXISTS "area" CASCADE;
CREATE TABLE "area" (
"idarea" integer NOT NULL DEFAULT nextval('idarea_primarykey'),
"idplanta" integer NOT NULL,
"tagarea" varchar,
"descricao" text
) WITH OIDS;
ALTER TABLE "area" ADD CONSTRAINT "area_pk" PRIMARY KEY("idarea");
COMMENT ON COLUMN "area"."idarea" IS 'Chave primária da tabela Área';
COMMENT ON COLUMN "area"."idplanta" IS 'Chave estrangeira';
COMMENT ON COLUMN "area"."tagarea" IS 'TAG da área';
COMMENT ON COLUMN "area"."descricao" IS 'Descrição da área';

DROP TABLE IF EXISTS "equipamento" CASCADE;
CREATE TABLE "equipamento" (
"idequipamento" integer NOT NULL DEFAULT nextval('idequipamento_primarykey'),
"idarea" integer NOT NULL,
"tagequipamento" varchar,
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
"idcomponente" integer NOT NULL DEFAULT nextval('idcomponente_primarykey'),
"idequipamento" integer NOT NULL,
"tagcomponente" varchar,
"descricao" text
) WITH OIDS;
ALTER TABLE "componente" ADD CONSTRAINT "componente_pk" PRIMARY KEY("idcomponente");
COMMENT ON COLUMN "componente"."idcomponente" IS 'Chave primária da tabela Componente';
COMMENT ON COLUMN "componente"."idequipamento" IS 'Chave estrangeira';
COMMENT ON COLUMN "componente"."tagcomponente" IS 'TAG do componente';
COMMENT ON COLUMN "componente"."descricao" IS 'Descrição do componente';

DROP TABLE IF EXISTS "ponto" CASCADE;
CREATE TABLE "ponto" (
"idponto" integer NOT NULL DEFAULT nextval('idponto_primarykey'),
"idsensor" integer NOT NULL,
"idcomponente" integer NOT NULL,
"tagponto" varchar,
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
"idsensor" integer NOT NULL DEFAULT nextval('idsensor_primarykey'),
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
"idmontagem" integer NOT NULL DEFAULT nextval('idmontagem_primarykey'),
"idarea" integer NOT NULL,
"idmontagensequipamentos" integer NOT NULL,
"obs" text,
"ativo" boolean DEFAULT true
) WITH OIDS;
ALTER TABLE "montagem" ADD CONSTRAINT "montagem_pk" PRIMARY KEY("idmontagem");
COMMENT ON COLUMN "montagem"."idmontagem" IS 'Chave primária da tabela Montagem';
COMMENT ON COLUMN "montagem"."idarea" IS 'Chave estrangeira';
COMMENT ON COLUMN "montagem"."idmontagensequipamentos" IS 'Chave primária da tabela MontagensEquipamentos';
COMMENT ON COLUMN "montagem"."obs" IS 'Observações sobre a montagem';
COMMENT ON COLUMN "montagem"."ativo" IS 'Verifica se a Montagem se encontra ativa (true) ou inativa (false)';

DROP TABLE IF EXISTS "montagensequipamentos" CASCADE;
CREATE TABLE "montagensequipamentos" (
"idmontagensequipamentos" integer NOT NULL DEFAULT nextval('idmontagensequipamentos_primarykey'),
"idequipamento" integer NOT NULL,
"idmontagem" integer NOT NULL
) WITH OIDS;
ALTER TABLE "montagensequipamentos" ADD CONSTRAINT "montagensequipamentos_pk" PRIMARY KEY("idmontagensequipamentos");
COMMENT ON COLUMN "montagensequipamentos"."idmontagensequipamentos" IS 'Chave primária da tabela montagensequipamentos';
COMMENT ON COLUMN "montagensequipamentos"."idequipamento" IS 'Chave estrangeira';
COMMENT ON COLUMN "montagensequipamentos"."idmontagem" IS 'Chave estrangeira';

DROP TABLE IF EXISTS "leitura" CASCADE;
CREATE TABLE "leitura" (
"idmontagem" integer NOT NULL,
"idponto" integer NOT NULL,
"tagponto" varchar NOT NULL,
"datahora" timestamp NOT NULL,
"rotacao" real,
"deslocamento" real,
"rmstotal" real,
"rmspicos" real,
"rmsruido" real,
"picos" real[]
) WITH OIDS;
ALTER TABLE "leitura" ADD CONSTRAINT "leitura_pk" PRIMARY KEY("idmontagem","idponto","tagponto","datahora");
COMMENT ON COLUMN "leitura"."idmontagem" IS 'Chave estrangeira';
COMMENT ON COLUMN "leitura"."idponto" IS 'Chave estrangeira';
COMMENT ON COLUMN "leitura"."tagponto" IS 'Chave estrangeira';
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

-- End Table's declaration

-- Start Relation's declaration
ALTER TABLE "area" DROP CONSTRAINT "planta_to_area_foreignkey" CASCADE;
ALTER TABLE "area" ADD CONSTRAINT "planta_to_area_foreignkey" FOREIGN KEY ("idplanta") REFERENCES "planta"("idplanta") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "equipamento" DROP CONSTRAINT "area_to_equipamento_foreignkey" CASCADE;
ALTER TABLE "equipamento" ADD CONSTRAINT "area_to_equipamento_foreignkey" FOREIGN KEY ("idarea") REFERENCES "area"("idarea") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "componente" DROP CONSTRAINT "equipamento_to_componente_foreignkey" CASCADE;
ALTER TABLE "componente" ADD CONSTRAINT "equipamento_to_componente_foreignkey" FOREIGN KEY ("idequipamento") REFERENCES "equipamento"("idequipamento") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "ponto" DROP CONSTRAINT "componente_to_ponto_foreignkey" CASCADE;
ALTER TABLE "ponto" ADD CONSTRAINT "componente_to_ponto_foreignkey" FOREIGN KEY ("idcomponente") REFERENCES "componente"("idcomponente") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "ponto" DROP CONSTRAINT "sensor_to_ponto_foreignkey" CASCADE;
ALTER TABLE "ponto" ADD CONSTRAINT "sensor_to_ponto_foreignkey" FOREIGN KEY ("idsensor") REFERENCES "sensor"("idsensor") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "montagensequipamentos" DROP CONSTRAINT "equipamento_to_montagensequipamentos_foreignkey" CASCADE;
ALTER TABLE "montagensequipamentos" ADD CONSTRAINT "equipamento_to_montagensequipamentos_foreignkey" FOREIGN KEY ("idequipamento") REFERENCES "equipamento"("idequipamento") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "montagem" DROP CONSTRAINT "area_to_montagem_foreignkey" CASCADE;
ALTER TABLE "montagem" ADD CONSTRAINT "area_to_montagem_foreignkey" FOREIGN KEY ("idarea") REFERENCES "area"("idarea") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "leitura" DROP CONSTRAINT "ponto_to_leitura_foreignkey" CASCADE;
ALTER TABLE "leitura" ADD CONSTRAINT "ponto_to_leitura_foreignkey" FOREIGN KEY ("idponto") REFERENCES "ponto"("idponto") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "leitura" DROP CONSTRAINT "montagem_to_leitura_foreignkey" CASCADE;
ALTER TABLE "leitura" ADD CONSTRAINT "montagem_to_leitura_foreignkey" FOREIGN KEY ("idmontagem") REFERENCES "montagem"("idmontagem") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "montagensequipamentos" DROP CONSTRAINT "montagem_to_montagensequipamentos_foreignkey" CASCADE;
ALTER TABLE "montagensequipamentos" ADD CONSTRAINT "montagem_to_montagensequipamentos_foreignkey" FOREIGN KEY ("idmontagem") REFERENCES "montagem"("idmontagem") ON UPDATE CASCADE ON DELETE RESTRICT;

-- End Relation's declaration

