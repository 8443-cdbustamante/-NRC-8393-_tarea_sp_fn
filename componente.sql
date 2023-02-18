--TABLA COMPONENTE
--select
Create or replace procedure sp_read_com(txt_id in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_id_com", 
	"var_nombre_com", 
	"var_tipo_com", 
	"var_status_com"
	FROM tb_componente
	WHERE "var_id_com" = txt_id;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_com(txt_id in VARCHAR2, 
txt_stat in VARCHAR2)  
IS
BEGIN
	UPDATE tb_componente
	SET  
	"var_status_com" = txt_stat
	WHERE "var_id_com" = txt_id;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_com(txt_id in VARCHAR2, 
txt_nom in VARCHAR2, txt_tipo in VARCHAR2,
txt_stat in VARCHAR2)  
IS
BEGIN
	INSERT INTO tb_componente
	VALUES (
	txt_id, 
	txt_nom,
	txt_tipo,
	txt_stat
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
