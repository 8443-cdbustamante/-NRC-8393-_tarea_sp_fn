--TABLA INGENIERO
--select
Create or replace procedure sp_read_ing(txt_id in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_cedula_per", 
	"var_especialidad_ing"
	FROM tb_ingeniero
	WHERE "var_cedula_per" = txt_id;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_ing(txt_id in VARCHAR2, 
txt_espe in VARCHAR2)  
IS
BEGIN
	UPDATE tb_ingeniero
	SET 
	"var_especialidad_ing" = txt_espe
	WHERE "var_cedula_per" = txt_id;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_ing(txt_id in VARCHAR2, 
txt_espe in VARCHAR2)  
IS
BEGIN
	INSERT INTO tb_ingeniero
	VALUES (
	txt_id, 
	txt_espe
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
