CREATE OR REPLACE PROCEDURE INITIALIZE (var_x IN number) IS

last_empl_id NUMBER(8);
last_cust_id number(8);
id_product number(8);

BEGIN


SELECT MAX(ID) INTO last_empl_id FROM EMPLOYEE;
SELECT MAX(ID) INTO last_cust_id FROM CUSTOMER;
select MAX(ID) INTO id_product FROM PRODUCT;   
    

el mismo tipo de datos que de la variable que corresponde al límite de iteraciones (en este caso es var_x).*/
 
FOR contador IN 1..var_x

LOOP

        last_empl_id := last_empl_id+1;
        last_cust_id := last_cust_id+1;
        id_product := id_product+1;
        
        insert into EMPLOYEE (ID,NAME,DATE_OF_BIRTH,SURNAME) VALUES (last_empl_id, 'Empleado_'|| last_empl_id,sysdate,'Apellido_'|| last_empl_id);
        insert into CUSTOMER (ID,NAME,EMPLOYEE_ID,SURNAME) VALUES (last_cust_id, 'Cliente_'|| last_cust_id,last_empl_id,'Apellido_'|| last_cust_id);
        insert into PRODUCT (ID,NAME,DESCRIPTION) VALUES (id_product, 'Producto'||id_product, 'No hay');
        insert into PRODUCT_CUSTOMER (PRODUCT_ID,CUSTOMER_ID,CREATION_DATE) VALUES (id_product,last_cust_id,sysdate);
    
    END LOOP;
  COMMIT;
END;