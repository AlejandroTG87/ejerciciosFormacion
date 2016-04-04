--el porcentaje de clientes que gestiona ese empleado del total de la compañía.


ALTER TABLE EMPLOYEE MODIFY PORCENTAJE NUMBER(2,2);

SELECT E.ID,count(C.EMPLOYEE_ID) FROM EMPLOYEE E
LEFT OUTER JOIN CUSTOMER C ON (E.ID = C.EMPLOYEE_ID)
GROUP BY E.ID;

DECLARE

num_total_clientes number(2);

num_clientes_emp number(2);

porcentaje number (3,2);

cursor clientes_por_empleado is
SELECT count(C.EMPLOYEE_ID) FROM EMPLOYEE E
LEFT OUTER JOIN CUSTOMER C ON (E.ID = C.EMPLOYEE_ID)
GROUP BY E.ID;

BEGIN

    open clientes_por_empleado;
    fetch clientes_por_empleado into num_clientes_emp;
    
        loop
        
        SELECT COUNT(C.ID) INTO num_total_clientes FROM CUSTOMER C;
        porcentaje := (num_clientes_emp/num_total_clientes);
        porcentaje := porcentaje*100;
        
        INSERT INTO EMPLOYEE (PORCENTAJE) VALUES (porcentaje);
        
        end loop;
    
    close clientes_por_empleado;

END;

--como dato de cliente el porcentaje de productos que compra del total que ofrece la compañía.