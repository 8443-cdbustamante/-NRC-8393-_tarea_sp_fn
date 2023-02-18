--TABLA ADMINISTRADOR
--select
Create or replace procedure sp_read_adm(txt_id in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_cedula_per", 
	"nbr_num_proyectos_realizados" 
	FROM tb_administrador
	WHERE "var_cedula_per" = txt_id;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_adm(txt_id in VARCHAR2, 
nbr_num in NUMBER)  
IS
BEGIN
	UPDATE tb_administrador
	SET  
	"nbr_num_proyectos_realizados" = nbr_num
	WHERE "var_cedula_per" = txt_id;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_adm(txt_id in VARCHAR2, 
nbr_num in NUMBER)  
IS
BEGIN
	INSERT INTO tb_administrador
	VALUES (
	txt_id, 
	nbr_num
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
