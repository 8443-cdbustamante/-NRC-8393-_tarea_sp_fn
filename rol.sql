--TABLA DEPARTAMENTO
--select
Create or replace procedure sp_read_rol(txt_id in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_id_rol", 
	"var_nombre_rol", 
	"dt_fecha_asigna_rol",
	"var_status_rol"
	FROM tb_rol
	WHERE "var_id_rol" = txt_id;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_rol(txt_id in VARCHAR2, 
txt_stat in VARCHAR2)  
IS
BEGIN
	UPDATE tb_rol
	SET 
	"var_status_rol" = txt_stat
	WHERE "var_id_rol" = txt_id;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_rol(txt_id in VARCHAR2, 
txt_nom in VARCHAR2, dt_fecha in DATE, txt_stat in VARCHAR2)  
IS
BEGIN
	INSERT INTO tb_rol
	VALUES (
	txt_id, 
	txt_nom,
	dt_fecha,
	txt_stat
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
