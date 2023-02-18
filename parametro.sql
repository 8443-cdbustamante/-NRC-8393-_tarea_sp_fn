--TABLA PARAMETRO
--select
Create or replace procedure sp_read_par(txt_id in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_id_par", 
	"var_descripcion_par",
	"var_decreto_par",
	"var_status_par"
	FROM tb_parametro
	WHERE "var_id_par" = txt_id;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_par(txt_id in VARCHAR2, 
txt_stat in VARCHAR2)  
IS
BEGIN
	UPDATE tb_parametro
	SET 
	"var_status_par" = txt_stat
	WHERE "var_id_par" = txt_id;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_par(txt_id in VARCHAR2, 
txt_descrip in VARCHAR2, txt_decre in VARCHAR2,
txt_stat in VARCHAR2)  
IS
BEGIN
	INSERT INTO tb_parametro
	VALUES (
	txt_id, 
	txt_descrip,
	txt_decre,
	txt_stat
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
