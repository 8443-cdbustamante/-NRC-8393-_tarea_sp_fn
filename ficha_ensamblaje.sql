--TABLA FICHA_ENSAMBLAJE
--select
Create or replace procedure sp_read_ensa(txt_rol in VARCHAR2,
txt_per in VARCHAR2, txt_mis in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_id_rol", 
	"var_cedula_per", 
	"var_id_mis", 
	"dt_fecha_ensamblar"
	FROM tb_ficha_ensamblaje
	WHERE "var_id_rol" = txt_rol AND "var_cedula_per"= txt_per 
	AND "var_id_mis" = txt_mis;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_ensa(txt_rol in VARCHAR2,
txt_per in VARCHAR2, txt_mis in VARCHAR2, dt_fecha in DATE)  
IS
BEGIN
	UPDATE tb_ficha_ensamblaje
	SET  
	"dt_fecha_ensamblar" = dt_fecha
	WHERE "var_id_rol" = txt_rol AND "var_cedula_per"= txt_per 
	AND "var_id_mis" = txt_mis;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_ensa(txt_rol in VARCHAR2,
txt_per in VARCHAR2, txt_mis in VARCHAR2, dt_fecha in DATE)  
IS
BEGIN
	INSERT INTO tb_ficha_ensamblaje
	VALUES (
	dt_fecha, 
	txt_rol,
	txt_per,
	txt_mis
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
