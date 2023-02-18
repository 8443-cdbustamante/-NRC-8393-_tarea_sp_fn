--TABLA STOCK
--select
Create or replace procedure sp_read_stock(txt_pieza in VARCHAR2,
txt_pro in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_id_pro", 
	"var_id_pieza", 
	"dt_fecha_compra"
	FROM tb_stock
	WHERE "var_id_pro" = txt_pro AND "var_id_pieza" = txt_pieza;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_stock(txt_pieza in VARCHAR2, 
txt_pro in VARCHAR2, dt_fecha in DATE)  
IS
BEGIN
	UPDATE tb_stock
	SET 
	"dt_fecha_compra" = dt_fecha
	WHERE "var_id_pieza" = txt_pieza AND "var_id_pro" = txt_pro;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_stock(txt_pieza in VARCHAR2, 
txt_pro in VARCHAR2, dt_fecha in DATE)  
IS
BEGIN
	INSERT INTO tb_stock
	VALUES (
	txt_pieza, 
	txt_pro,
	dt_fecha
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
