--TABLA MISIL
--select
Create or replace procedure sp_read_mis(txt_id in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_id_mis", 
	"var_nombre_mis", 
	"var_tipo_mis", 
	"dt_fecha_entrega_mis", 
	"var_status_mis"
	FROM tb_misil
	WHERE "var_id_mis" = txt_id;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_mis(txt_id in VARCHAR2, 
txt_stat in VARCHAR2)  
IS
BEGIN
	UPDATE tb_misil
	SET  
	"var_status_mis" = txt_stat
	WHERE "var_id_mis" = txt_id;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_mis(txt_id in VARCHAR2, 
txt_nom in VARCHAR2, txt_tipo in VARCHAR2,
dt_fecha in DATE, txt_stat in VARCHAR2)  
IS
BEGIN
	INSERT INTO tb_departamento
	VALUES (
	txt_id, 
	txt_nom,
	txt_tipo,
	dt_fecha,
	txt_stat
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
