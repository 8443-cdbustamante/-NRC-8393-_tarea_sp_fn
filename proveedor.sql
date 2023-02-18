--TABLA PROVEEDOR
--select
Create or replace procedure sp_read_pro(txt_id in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_id_pro", 
	"var_nombre_pro", 
	"var_tipo_pro", 
	"var_email_pro", 
	"var_telefono_pro",
	"var_descripcion_pro",
	"var_status_pro"
	FROM tb_proveedor
	WHERE "var_id_pro" = txt_id;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_pro('PRO 1');

--update
Create or replace procedure sp_update_pro(txt_id in VARCHAR2,
txt_tipo in VARCHAR2, txt_email in VARCHAR2, txt_tel in VARCHAR2,
txt_descrip in VARCHAR2, txt_stat in VARCHAR2)  
IS
BEGIN
	UPDATE tb_proveedor
	SET 
	"var_tipo_pro" = txt_tipo,
	"var_email_pro" = txt_email,
	"var_telefono_pro" = txt_tel,
	"var_descripcion_pro" = txt_descrip, 
	"var_status_pro" = txt_stat
	WHERE "var_id_pro" = txt_id;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_pro('PRO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_pro(txt_id in VARCHAR2,
txt_nombre in VARCHAR2, txt_tipo in VARCHAR2, 
txt_email in VARCHAR2, txt_tel in VARCHAR2,
txt_descrip in VARCHAR2, txt_stat in VARCHAR2)  
IS
BEGIN
	INSERT INTO tb_proveedor
	VALUES (
	txt_id, 
	txt_nombre,
	txt_tipo,
	txt_email,
	txt_tel,
	txt_descrip,
	txt_stat
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_pro('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
