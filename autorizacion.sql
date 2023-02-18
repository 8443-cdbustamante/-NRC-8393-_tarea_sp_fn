--TABLA AUTORIZACION
--select
Create or replace procedure sp_read_au(txt_perm in VARCHAR2,
txt_rol in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_id_perm", 
	"var_id_rol",  
	"var_descripcion_au", 
	"var_status_au"
	FROM tb_autorizacion
	WHERE "var_id_perm" = txt_perm AND "var_id_rol" = txt_rol;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_au(txt_perm in VARCHAR2,
txt_rol in VARCHAR2, txt_stat in VARCHAR2,
txt_desc in VARCHAR2)  
IS
BEGIN
	UPDATE tb_autorizacion
	SET 
	"var_descripcion_au" = txt_desc, 
	"var_status_au" = txt_stat
	WHERE "var_id_perm" = txt_perm AND "var_id_rol" = txt_rol;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_au(txt_perm in VARCHAR2,
txt_rol in VARCHAR2, txt_stat in VARCHAR2,
txt_desc in VARCHAR2)  
IS
BEGIN
	INSERT INTO tb_autorizacion
	VALUES (
	txt_desc, 
	txt_stat,
	txt_perm,
	txt_rol
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
