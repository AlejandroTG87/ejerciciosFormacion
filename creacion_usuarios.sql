CREATE OR REPLACE PROCEDURE INITIALIZE 
(var_x IN number(8),
last_empl_id NUMBER(8),
last_cust_id number(8),
id_product number(8),
contador number(8)) IS


BEGIN


SELECT MAX(ID) INTO last_empl_id FROM EMPLOYEE;
SELECT MAX(ID) INTO last_cust_id FROM CUSTOMER;
select MAX(PRODUCT_ID) INTO id_product FROM PRODUCT_CUSTOMER;

contador := 1;    
    
    
FOR contador IN contador..var_x

LOOP
        last_empl_id := last_empl_id+1;
        last_cust_id := last_cust_id+1;
        id_product := id_product+1;
        
        insert into EMPLOYEE (ID,NAME,DATE_OF_BIRTH,SURNAME) VALUES (last_empl_id, 'Empleado_'|| last_empl_id,sysdate,'Apellido_'|| last_empl_id);
        insert into CUSTOMER (ID,NAME,EMPLOYEE_ID,SURNAME) VALUES (last_cust_id, 'Cliente_'|| last_cust_id,last_empl_id,'Apellido_'|| last_cust_id);
        insert into PRODUCT_CUSTOMER (PRODUCT_ID,CUSTOMER_ID,CREATION_DATE) VALUES (id_product,last_cust_id,sysdate);
    
    END LOOP;
END;