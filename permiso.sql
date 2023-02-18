--TABLA PERMISO
--select
Create or replace procedure sp_read_perm(txt_id in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_id_perm", 
	"var_entidad_perm", 
	"var_tipo_perm", 
	"dt_fecha_asigna_perm", 
	"dt_fecha_caduca_perm",
	"var_status_perm"
	FROM tb_permiso
	WHERE "var_id_perm" = txt_id;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_perm(txt_id in VARCHAR2, 
txt_ent in VARCHAR2, txt_tipo in VARCHAR2,
dt_asigna in DATE, dt_caduca in DATE,
txt_stat in VARCHAR2)  
IS
BEGIN
	UPDATE tb_permiso
	SET 
	"var_entidad_perm" = txt_ent, 
	"var_tipo_perm" = txt_tipo, 
	"dt_fecha_asigna_perm" = dt_asigna, 
	"dt_fecha_caduca_perm" = dt_caduca,
	"var_status_perm" = txt_stat
	WHERE "var_id_perm" = txt_id;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_perm(txt_id in VARCHAR2, 
txt_ent in VARCHAR2, txt_tipo in VARCHAR2,
dt_asigna in DATE, dt_caduca in DATE,
txt_stat in VARCHAR2)  
IS
BEGIN
	INSERT INTO tb_permiso
	VALUES (
	txt_id, 
	txt_ent, 
	txt_tipo, 
	dt_asigna, 
	dt_caduca,
	txt_stat
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
