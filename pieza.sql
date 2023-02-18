--TABLA PIEZA
--select
Create or replace procedure sp_read_pieza(txt_id in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_id_pieza", 
	"var_nombre_pieza", 
	"var_tipo_pieza",
	"nbr_cantidad_pieza", 
	"dt_fecha_fac_pieza", 
	"var_status_pieza"
	FROM tb_pieza
	WHERE "var_id_pieza" = txt_id;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_pieza(txt_id in VARCHAR2, 
nbr_cantidad in NUMBER, txt_stat in VARCHAR2)  
IS
BEGIN
	UPDATE tb_pieza
	SET 
	"nbr_cantidad_pieza" = nbr_cantidad, 
	"var_status_pieza" = txt_stat
	WHERE "var_id_pieza" = txt_id;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_pieza(txt_id in VARCHAR2, 
txt_nombre in VARCHAR2, txt_tipo in VARCHAR2,
nbr_cantidad in NUMBER, dt_fecha in DATE, txt_stat in VARCHAR2)  
IS
BEGIN
	INSERT INTO tb_pieza
	VALUES (
	txt_id, 
	txt_nombre,
	txt_tipo,
	nbr_cantidad,
	dt_fecha,
	txt_stat
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
