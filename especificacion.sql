--TABLA ESPECIFICACION
--select
Create or replace procedure sp_read_esp(txt_mis in VARCHAR2,
txt_par in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_id_mis", 
	"var_id_par", 
	"var_descripcion_esp"
	FROM tb_especificacion
	WHERE "var_id_mis" = txt_mis AND "var_id_par" = txt_par;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_esp(txt_mis in VARCHAR2,
txt_par in VARCHAR2, txt_descrip in VARCHAR2)  
IS
BEGIN
	UPDATE tb_especificacion
	SET 
	"var_descripcion_esp" = txt_descrip
	WHERE "var_id_mis" = txt_mis AND "var_id_par" = txt_par;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_esp(txt_mis in VARCHAR2,
txt_par in VARCHAR2, txt_descrip in VARCHAR2)  
IS
BEGIN
	INSERT INTO tb_especificacion
	VALUES (
	txt_mis, 
	txt_par,
	txt_descrip
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
