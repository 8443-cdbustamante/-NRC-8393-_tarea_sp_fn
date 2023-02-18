--TABLA TECNICO
--select
Create or replace procedure sp_read_tec(txt_id in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_cedula_per", 
	"nbr_horas_experiencia"
	FROM tb_tecnico
	WHERE "var_cedula_per" = txt_id;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_tec(txt_id in VARCHAR2, 
nbr_expe in NUMBER)  
IS
BEGIN
	UPDATE tb_tecnico
	SET  
	"nbr_horas_experiencia" = nbr_expe
	WHERE "var_cedula_per" = txt_id;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_tec(txt_id in VARCHAR2, 
nbr_expe in NUMBER)  
IS
BEGIN
	INSERT INTO tb_tecnico
	VALUES (
	txt_id, 
	nbr_expe
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
