/******************************************************************************/
/***                               GP_RATEIO                                ***/
/******************************************************************************/

/******************************************************************************/
/***      Following SET SQL DIALECT is just for the Database Comparer       ***/
/******************************************************************************/
SET SQL DIALECT 3;



/******************************************************************************/
/***                                 Tables                                 ***/
/******************************************************************************/



CREATE TABLE GP_RATEIO (
    COD_RATEIO        INTEGER NOT NULL,
    DESC_RATEIO       VARCHAR(50) NOT NULL,
    DATA_CRIACAO      TIMESTAMP,
    DATA_MODIFICACAO  TIMESTAMP
);




/******************************************************************************/
/***                              Primary Keys                              ***/
/******************************************************************************/

ALTER TABLE GP_RATEIO ADD CONSTRAINT PK_GP_RATEIO PRIMARY KEY (COD_RATEIO);


/******************************************************************************/
/***                                Triggers                                ***/
/******************************************************************************/


SET TERM ^ ;



/******************************************************************************/
/***                          Triggers for tables                           ***/
/******************************************************************************/



/* Trigger: GP_RATEIO_BI0 */
CREATE OR ALTER TRIGGER GP_RATEIO_BI0 FOR GP_RATEIO
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  /* Trigger text */
  NEW.data_criacao = current_timestamp;
  NEW.data_modificacao = current_timestamp;
end
^


/* Trigger: GP_RATEIO_BU0 */
CREATE OR ALTER TRIGGER GP_RATEIO_BU0 FOR GP_RATEIO
ACTIVE BEFORE UPDATE POSITION 0
AS
begin
  /* Trigger text */
  NEW.data_modificacao = current_timestamp;
end
^


SET TERM ; ^



/******************************************************************************/
/***                              Descriptions                              ***/
/******************************************************************************/

COMMENT ON TABLE GP_RATEIO IS 
'   Tabela onde é gravado os perfis dos rateios usados na tela GP_Rateio de entrada no estoque';



/******************************************************************************/
/***                          Fields descriptions                           ***/
/******************************************************************************/

COMMENT ON COLUMN GP_RATEIO.COD_RATEIO IS 
'Chave Primária do Perfil do Rateio';

COMMENT ON COLUMN GP_RATEIO.DESC_RATEIO IS 
'Descrição do Perfil';


/******************************************************************************/
/***                             GP_RATEIO_ITENS                            ***/
/******************************************************************************/

/******************************************************************************/
/***      Following SET SQL DIALECT is just for the Database Comparer       ***/
/******************************************************************************/
SET SQL DIALECT 3;



/******************************************************************************/
/***                                 Tables                                 ***/
/******************************************************************************/



CREATE TABLE GP_RATEIO_ITENS (
    COD_RATEIO       INTEGER NOT NULL,
    COD_RATEIO_ITEM  INTEGER NOT NULL,
    COD_PRODUTO      VARCHAR(13) NOT NULL,
    COD_GRADE        VARCHAR(25) NOT NULL,
    PORCENTAGEM      NUMERIC(15,5) NOT NULL
);




/******************************************************************************/
/***                              Primary Keys                              ***/
/******************************************************************************/

ALTER TABLE GP_RATEIO_ITENS ADD CONSTRAINT PK_GP_RATEIO_ITENS PRIMARY KEY (COD_RATEIO, COD_RATEIO_ITEM);


/******************************************************************************/
/***                              Foreign Keys                              ***/
/******************************************************************************/

ALTER TABLE GP_RATEIO_ITENS ADD CONSTRAINT FK_GP_RATEIO_ITENS_GP_RATEIO FOREIGN KEY (COD_RATEIO) REFERENCES GP_RATEIO (COD_RATEIO);
ALTER TABLE GP_RATEIO_ITENS ADD CONSTRAINT FK_GP_RATEIO_ITENS_PROD_GRADE FOREIGN KEY (COD_PRODUTO, COD_GRADE) REFERENCES PRODUTOS_GRADE (COD_PRODUTO, COD_GRADE);


/******************************************************************************/
/***                                Triggers                                ***/
/******************************************************************************/


SET TERM ^ ;



/******************************************************************************/
/***                          Triggers for tables                           ***/
/******************************************************************************/



/* Trigger: GP_RATEIO_ITENS_BIU0 */
CREATE OR ALTER TRIGGER GP_RATEIO_ITENS_BIU0 FOR GP_RATEIO_ITENS
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
begin
  /* Trigger text */
  if (NEW.porcentagem IS NULL) then
    NEW.porcentagem = 0;
end
^


SET TERM ; ^



/******************************************************************************/
/***                              Descriptions                              ***/
/******************************************************************************/

COMMENT ON TABLE GP_RATEIO_ITENS IS 
'Tabela onde são gravados os itens pertencentes ao perfil do rateio';



/******************************************************************************/
/***                          Fields descriptions                           ***/
/******************************************************************************/

COMMENT ON COLUMN GP_RATEIO_ITENS.COD_RATEIO IS 
'Chave estrangeira da tabela GP_Rateio';

COMMENT ON COLUMN GP_RATEIO_ITENS.COD_RATEIO_ITEM IS 
'Chave primaria junto com o COD_RATEIO';

COMMENT ON COLUMN GP_RATEIO_ITENS.COD_PRODUTO IS 
'Codigo do produto pertencente ao perfil 
do rateio.
Chave estrangeira da tabela PRODUTOS';

COMMENT ON COLUMN GP_RATEIO_ITENS.COD_GRADE IS 
'Codigo da grade do produto.
Chave estrangeira da tabela PRODUTOS_GRADE';

COMMENT ON COLUMN GP_RATEIO_ITENS.PORCENTAGEM IS 
'Valor em % que este produto vale na
quantidade total do rateio';

/******************************************************************************/
/***                          GENERATOR                                     ***/
/******************************************************************************/

CREATE SEQUENCE SGP_RATEIO;
ALTER SEQUENCE SGP_RATEIO RESTART WITH 7;

/* Old syntax is:
CREATE GENERATOR SGP_RATEIO;
SET GENERATOR SGP_RATEIO TO 7;
*/

