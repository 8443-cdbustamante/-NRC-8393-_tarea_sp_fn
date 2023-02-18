--TABLA ITEMS
--select
Create or replace procedure sp_read_itm(txt_com in VARCHAR2,
txt_mis in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_id_com", 
	"var_id_mis", 
	"var_status_itm"
	FROM tb_items
	WHERE "var_id_com" = txt_com AND "var_id_mis" = txt_mis;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_itm(txt_com in VARCHAR2,
txt_mis in VARCHAR2, txt_stat in VARCHAR2)  
IS
BEGIN
	UPDATE tb_items
	SET  
	"var_status_itm" = txt_stat
	WHERE "var_id_com" = txt_com AND "var_id_mis" = txt_mis;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_itm(txt_com in VARCHAR2,
txt_mis in VARCHAR2, txt_stat in VARCHAR2)  
IS
BEGIN
	INSERT INTO tb_items
	VALUES (
	txt_stat, 
	txt_com,
	txt_mis
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
