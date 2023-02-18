--TABLA DEPARTAMENTO
--select
Create or replace procedure sp_read_dept(txt_id in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_id_dept", 
	"var_nombre_dept", 
	"var_tipo_dept", 
	"var_descripcion_dept", 
	"var_status_dept"
	FROM tb_departamento
	WHERE "var_id_dept" = txt_id;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_dept(txt_id in VARCHAR2, 
txt_descrip in VARCHAR2, txt_stat in VARCHAR2)  
IS
BEGIN
	UPDATE tb_departamento
	SET 
	"var_descripcion_dept" = txt_descrip, 
	"var_status_dept" = txt_stat
	WHERE "var_id_dept" = txt_id;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_dept(txt_id in VARCHAR2, 
txt_nom in VARCHAR2, txt_tipo in VARCHAR2,
txt_descrip in VARCHAR2, txt_stat in VARCHAR2)  
IS
BEGIN
	INSERT INTO tb_departamento
	VALUES (
	txt_id, 
	txt_nom,
	txt_tipo,
	txt_descrip,
	txt_stat
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
