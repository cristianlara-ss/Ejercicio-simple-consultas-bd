-- 1
SELECT TO_CHAR(C.NUMRUN, '09G999G999') ||'-'||C.DVRUN "RUT CLIENTE",
       C.PNOMBRE ||' '||C.SNOMBRE ||' '|| C.APPATERNO ||' '||C.APMATERNO "NOMBRE CLIENTE",
       extract(day from FECHA_NACIMIENTO) || ' de ' 
       || TO_CHAR(FECHA_NACIMIENTO, 'fmMonth') "D�A DE CUMPLEA�OS",
       SR.DIRECCION ||'/'||R.NOMBRE_REGION "DIRECCION SUCURSAL/ REGION SUCURSAL"
       
FROM REGION R JOIN SUCURSAL_RETAIL SR
ON R.COD_REGION = SR.COD_REGION
RIGHT JOIN CLIENTE C ON C.COD_REGION = R.COD_REGION
where FECHA_NACIMIENTO is not null
 and to_char(FECHA_NACIMIENTO, 'mm') = to_char(sysdate, 'mm') + 1
;