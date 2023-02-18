--TABLA DEPARTAMENTO
--select
Create or replace procedure sp_read_per(txt_cedula in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_cedula_per", 
	"var_genero_per", 
	"var_nombre_per", 
	"var_email_per", 
	"dt_fecha_nac_per",
	"var_status_per",
	"var_id_dept"
	FROM tb_personal
	WHERE "var_cedula_per" = txt_cedula;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_per('1000179940');

--update
Create or replace procedure sp_update_per(txt_cedula in VARCHAR2, 
txt_email in VARCHAR2, txt_stat in VARCHAR2,
txt_id_dept in VARCHAR2)  
IS
BEGIN
	UPDATE tb_personal
	SET 
	"var_email_per" = txt_email, 
	"var_status_per" = txt_stat,
	"var_id_dept" = txt_id_dept
	WHERE "var_cedula_per" = txt_cedula;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_per('1737982492','brit.mart@nasa.dod.com','Activo','DPTO 84');

--insert
Create or replace procedure sp_insert_per(txt_cedula in VARCHAR2, 
txt_genero in VARCHAR2, txt_nombre in VARCHAR2,
txt_email in VARCHAR2, dt_fecha in DATE,
txt_status in VARCHAR2, txt_id_dept in VARCHAR2)  
IS
BEGIN
	INSERT INTO tb_personal
	VALUES (
	txt_cedula, 
	txt_genero,
	txt_nombre,
	txt_email,
	dt_fecha,
	txt_status,
	txt_id_dept
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_per('0502936594','male','Carlos Santana','car.san@nasa.dod.com','09/07/91','Activo','DPTO 5001');
