--TABLA CONTENIDO
--select
Create or replace procedure sp_read_cont(txt_com in VARCHAR2, txt_pieza in VARCHAR2)
AS
  c1 SYS_REFCURSOR;  
BEGIN
	open c1 FOR
	SELECT
	"var_id_com", 
	"var_id_pieza", 
	"nbr_cantidad_necesaria"
	FROM tb_contenido
	WHERE "var_id_com" = txt_com AND "var_id_pieza" = txt_pieza;
	DBMS_SQL.RETURN_RESULT(c1);
END;
/

EXEC sp_read_dept('DPTO 1');

--update
Create or replace procedure sp_update_cont(txt_com in VARCHAR2, txt_pieza in VARCHAR2,
 nbr_cantidad in NUMBER)  
IS
BEGIN
	UPDATE tb_contenido
	SET 
	"nbr_cantidad_necesaria" = nbr_cantidad
	WHERE "var_id_com" = txt_com AND "var_id_pieza" = txt_pieza;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Actualización exitosa');
END;
/

EXEC sp_update_dept('DPTO 1','descrip1','Activo');

--insert
Create or replace procedure sp_insert_cont(txt_com in VARCHAR2, txt_pieza in VARCHAR2,
 nbr_cantidad in NUMBER)  
IS
BEGIN
	INSERT INTO tb_contenido
	VALUES (
	txt_com, 
	txt_pieza,
	nbr_cantidad
	);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insercion exitosa');
END;
/

EXEC sp_insert_dept('DPTO 5001','Departamento de Carga Explosiva','DOD','Descrip2','Inactivo');
