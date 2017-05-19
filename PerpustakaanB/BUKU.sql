--------------------------------------------------------
--  File created - Saturday-May-13-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BUKU
--------------------------------------------------------

  CREATE TABLE "PERPUSB"."BUKU" 
   (	"ISBN" VARCHAR2(20 BYTE), 
	"JUDUL" VARCHAR2(150 BYTE), 
	"PENULIS" VARCHAR2(150 BYTE), 
	"PENERBIT" VARCHAR2(50 BYTE), 
	"TAHUN" VARCHAR2(4 BYTE), 
	"COPY" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into PERPUSB.BUKU
SET DEFINE OFF;
Insert into PERPUSB.BUKU (ISBN,JUDUL,PENULIS,PENERBIT,TAHUN,COPY) values ('9781480177598','The Deep Dark Web: The Hidden World','Richard Gatomalo Amores, Peirluigi Paganini','CreateSpace Independent Publishing Platform','2012',1);
Insert into PERPUSB.BUKU (ISBN,JUDUL,PENULIS,PENERBIT,TAHUN,COPY) values ('9780544002937','Big Data: A Revolution That Will Transform How We Live, Work, and Think','Viktor Mayer-Schönberger, Kenneth Cukier','Houghton Mifflin Harcourt','2013',1);
Insert into PERPUSB.BUKU (ISBN,JUDUL,PENULIS,PENERBIT,TAHUN,COPY) values ('9780262035613','Deep Learning (Adaptive Computation adn Machine Learning Series)','Ian Goodfellow, Yoshua Bengio, & Aaron Courville','The MIT Press','2016',1);
Insert into PERPUSB.BUKU (ISBN,JUDUL,PENULIS,PENERBIT,TAHUN,COPY) values ('9781138035454','Game Engine Architecture, 3rd Edition','Jason Gregory','A.K. Peters / CRC Press','2018',1);
Insert into PERPUSB.BUKU (ISBN,JUDUL,PENULIS,PENERBIT,TAHUN,COPY) values ('9871449361327','Data Science for Business: What You Need to Know aboutt Data Mining and Data-Analytic Thinking','Foster Provost and Tom Fawcett','O''Reilly Media','2013',1);
--------------------------------------------------------
--  DDL for Index BUKU_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERPUSB"."BUKU_PK" ON "PERPUSB"."BUKU" ("ISBN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table BUKU
--------------------------------------------------------

  ALTER TABLE "PERPUSB"."BUKU" MODIFY ("COPY" NOT NULL ENABLE);
  ALTER TABLE "PERPUSB"."BUKU" MODIFY ("TAHUN" NOT NULL ENABLE);
  ALTER TABLE "PERPUSB"."BUKU" MODIFY ("PENERBIT" NOT NULL ENABLE);
  ALTER TABLE "PERPUSB"."BUKU" MODIFY ("PENULIS" NOT NULL ENABLE);
  ALTER TABLE "PERPUSB"."BUKU" MODIFY ("JUDUL" NOT NULL ENABLE);
  ALTER TABLE "PERPUSB"."BUKU" MODIFY ("ISBN" NOT NULL ENABLE);
  ALTER TABLE "PERPUSB"."BUKU" ADD CONSTRAINT "BUKU_PK" PRIMARY KEY ("ISBN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
