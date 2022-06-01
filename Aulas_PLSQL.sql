set SERVEROUT ON
DECLARE
    v_contador NUMBER;
BEGIN
    SELECT COUNT(1) INTO v_contador
    FROM tb_departamento;
    
    if v_contador = 0 THEN 
      DBMS_OUTPUT.PUT_LINE('Nenhum funcionário cadastrado no esquema RH');
    ELSE
        dbms_output.put_line('Existem ' || to_char(v_contador) || ' funcionarios cadastrado no esquema RH');
    END IF;
EXCEPTION
    When  OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
-- Início de um bloco EXTERNO
DECLARE  -- seção declarativa
 v_contador NUMBER; -- declaração de variável
BEGIN --seção executável
-- o bloco abaixo está aninhado dentro do bloco pai
 BEGIN  -- início do bloco INTERNO
   SELECT 1 INTO v_contador --instrução SQL
   FROM tb_empregado
   WHERE ROWNUM = 1;
 EXCEPTION
   WHEN OTHERS THEN
   v_contador:=0;
 END;
 
 IF v_contador = 0 THEN
  DBMS_OUTPUT.PUT_LINE('Nenhum funcionário cadastrado no esquema de RH');
 
 ELSE
   DBMS_OUTPUT.PUT_LINE('Existe '|| TO_CHAR(v_contador) || 'funcionário cadastrado no esquema RH');
 END IF;
 EXCEPTION
  WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
-- Início de um bloco EXTERNO
DECLARE  -- seção declarativa
 v_contador NUMBER; -- declaração de variável
BEGIN
  SELECT 1 INTO v_contador
  FROM tb_empregado
  WHERE ROWNUM = 2;
 IF v_contador = 0 THEN
  DBMS_OUTPUT.PUT_LINE('Nenhum funcionário cadastrado no esquema de RH');
 ELSE
   DBMS_OUTPUT.PUT_LINE('Existe(m) '|| TO_CHAR(v_contador) || 'funcionário cadastrado no esquema RH');
 END IF;
 EXCEPTION
  WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
  
---------------------------------------------------------------------------------------

VARIABLE v_minha_string VARCHAR2(30);

BEGIN 
 :v_minha_string := 'Um string literal';
 END;
 
SET serveroutput ON
BEGIN 
  DBMS_output.put_line(:v_minha_string);
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE 
 v_minha_string VARCHAR2(30);
BEGIN
 v_minha_string := '&input';
 dbms_output.put_line('Testando:' || v_minha_string);
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
v_id_emp      tb_empregado.id_empregado%TYPE;
v_sobrenome   tb_empregado.sobrenome%TYPE;
BEGIN
 v_id_emp := 100301;
 v_sobrenome := 'Silva';
 dbms_output.put_line('ID:' || v_id_emp);
 dbms_output.put_line('Sobrenome:' || v_sobrenome);
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_emp_reg tb_empregado % ROWTYPE;
BEGIN
 SELECT * INTO v_emp_reg 
 FROM tb_empregado
 WHERE id_empregado = 125;
 dbms_output.put_line('Nome:' || v_emp_reg.nome || '' || v_emp_reg.sobrenome);
END;

------------------------------------------------------------AULA 08/03/2022---------------------------------------------------------------------------------------------------------------------

CREATE TABLE "tb_Demo"(
"id_Demo" NUMBER,
valor_demo VARCHAR2(20));

INSERT INTO "tb_Demo"
VALUES
(1, 'Linha um apenas');

---------------------------------------------------------------------------------------

SET serveroutput ON
BEGIN
 FOR i IN (SELECT "id_Demo", valor_demo
           FROM "tb_Demo") LOOP
      dbms_output.put_line(i."id_Demo");
      dbms_output.put_line(i.valor_demo);
 END LOOP;
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE -- seção declarativa
 v_nome VARCHAR2(50); -- declaração de variável
BEGIN -- seção executável
 V_NOME := 'Treinamento PL/SQL Essencial'; --atribuição
 dbms_output.put_line('O conteúdo eh: ' || v_nome);
END;

---------------------------------------------------------------------------------------

DECLARE
v_salario            NUMBER(6,2);
v_horas_trabalhada   NUMBER:=40;
v_valor_hora         NUMBER:=22.50;
v_bonus              NUMBER:=150;
v_pais               VARCHAR2(128);
v_contador           NUMBER:=0;
v_controle           BOOLEAN:= FALSE;
v_id_validade        BOOLEAN;

BEGIN
 v_salario:= (v_horas_trabalhada * v_valor_hora) + v_bonus;
 v_pais:= 'Barsil'; -- String Literal
 v_pais:= UPPER('Canada');-- String Literal uppercase
  v_controle:=(v_contador > 100); -- FALSE
 v_id_validade:= TRUE; --BOOLEAN
END;

---------------------------------------------------------------------------------------

DECLARE
v_finalizado BOOLEAN := TRUE;
v_completo BOOLEAN;
v_true_or_false BOOLEAN;

BEGIN
v_finalizado := FALSE;
v_completo := NULL;
v_true_or_false:= (3 = 4);
v_true_or_false:= (3 < 4);
END;
   
---------------------------------------------------------------------------------------

DECLARE
 v_id_empregado        NUMBER(6);
 v_emp_ativo           BOOLEAN NOT NULL:= TRUE;
 v_salario_mensal      NUMBER(6) NOT NULL:= 200;
 v_valor_diaria        NUMBER(6,2);
 v_media_dias_trab_mes NUMBER(2) DEFAULT 21;
BEGIN
  NULL; -- A instituição NULL não faz nada
END;
   
---------------------------------------------------------------------------------------   
   
SET serveroutput ON
DECLARE
 TYPE registro_demo IS RECORD(
  id_aluno   NUMBER DEFAULT 1,
  nome   VARCHAR2(10) := 'Mário');
reg_demo REGISTRO_DEMO;
BEGIN
 dbms_output.put_line('[' || reg_demo.id_aluno || '][' || reg_demo.nome || ']');
END;
 
---------------------------------------------------------------------------------------   
   
SET serveroutput ON 
DECLARE
 TYPE tp_full_name IS RECORD(
  nome   VARCHAR2(10) := 'Ricardo',
  sobrenome   VARCHAR2(10) := 'Vargas');
TYPE tp_reg_aluno IS RECORD(
id_aluno   NUMBER DEFAULT 1,
nm_aluno   TP_FULL_NAME);
reg_demo   TP_REG_ALUNO;

BEGIN
 dbms_output.put_line ('[' || reg_demo.id_aluno || ']');
 dbms_output.put_line ('[' || reg_demo.nm_aluno.nome || ']');
 dbms_output.put_line ('[' || reg_demo.nm_aluno.sobrenome || ']');
END;
   
---------------------------------------------------------------------------------------   

SET serveroutput ON
DECLARE 
 TYPE varray_numerico IS VARRAY(5) OF NUMBER;
 v_lista VARRAY_NUMERICO := varray_numerico(1,2,3,NULL,NULL);
BEGIN
 FOR i IN 1.. v_lista.LIMIT LOOP
  dbms_output.put('[' || v_lista(i) || ']');
END LOOP;
dbms_output.new_line;
END;
   
------------------------------------------------------------AULA 11/03/2022---------------------------------------------------------------------------------------------------------------------
  
SET serveroutput ON
<<outer>> -- identificador do bloco pai/externo
DECLARE
 v_contador NUMBER;
BEGIN
 <<inner>> -- início do bloco filho/externo
 DECLARE
 v_contador NUMBER;
BEGIN
 SELECT 1 INTO inner.v_contador
 FROM tb_empregado
 WHERE ROWNUM = 1;
 outer.v_contador := inner.v_contador;
EXCEPTION
 WHEN OTHERS THEN 
  outer.v_contador := 0;
END; -- fim do bloco filho
IF v_contador = 0 THEN
  dbms_output.put_line('Nenhum registro no esquema RH');
 ELSE
  dbms_output.put_line('Existe ' || to_char(outer.v_contador) || ' registro no esquema RH');
 END IF;
EXCEPTION
 WHEN OTHERS THEN
  dbms_output.put_line(SQLERRM);
END;
 
---------------------------------------------------------------------------------------   
   
SET serveroutput ON
DECLARE
 --Variáveis Globais
 v_num1 NUMBER := 95;
 v_num2 NUMBER := 85;
BEGIN
 dbms_output.put_line('Variável global v_num1: ' || v_num1);
 dbms_output.put_line('Variável global v_num2: ' || v_num2);
DECLARE
 --Variáveis Locais
 v_num1 NUMBER := 195;
 v_num2 NUMBER := 185;
BEGIN
  dbms_output.put_line('Variável local v_num1: ' || v_num1);
  dbms_output.put_line('Variável local v_num2: ' || v_num2);
 END;
END;
   
---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE -- secção declativa
 c_identificador CONSTANT VARCHAR2(30) := 'PL/SQL Essencial';
BEGIN -- secção executável
 dbms_output.put_line('Conteúdo da constante: ' || c_identificador);
END;
   
---------------------------------------------------------------------------------------   

SET serveroutput ON
DECLARE
-- Declaração da Constante
c_pi CONSTANT NUMBER := 3.141592654;
-- Outras Declarações
v_raio             NUMBER(5,2);
v_diametro         NUMBER(5,2);
v_circunferencia   NUMBER(7,2);
v_area             NUMBER(10,2);
BEGIN
 v_raio := 9.5;
 v_diametro := v_raio * 2;
 v_circunferencia := 2.0 * c_pi * v_raio;
 v_area := c_pi * v_raio * v_raio;
 --saida
 dbms_output.put_line(' Raio: ' || v_raio);
 dbms_output.put_line('Diâmetro: ' || v_diametro);
 dbms_output.put_line('Circunferência: ' || v_circunferencia);
 dbms_output.put_line('Área: ' || v_area);
END;

--------------------------------------------------------------------------------------- 

SET serveroutput ON
DECLARE
 v_soma_salario   NUMBER(10,2);
 v_nome           tb_empregado.nome%TYPE;
 v_sobrenome      tb_empregado.sobrenome%TYPE;
BEGIN
 SELECT SUM(NVL(salario,0)) INTO v_soma_salario
 FROM tb_empregado
 WHERE id_departamento = 10;
 
 dbms_output.put_line('A soma dos salários é: ' || v_soma_salario);
 
   SELECT nome, sobrenome INTO v_nome, v_sobrenome
   FROM tb_empregado
   WHERE id_empregado = 100;

   dbms_output.put_line('O nome completo do empregado é: ' || v_nome || '' || v_sobrenome);
END;

------------------------------------------------------------AULA 15/03/2022---------------------------------------------------------------------------------------------------------------------

BEGIN
  INSERT INTO tb_empregado (id_empregado, nome, sobrenome, email, data_admissao, id_funcao, salario)
 
  VALUES
  (sq_empregado.NEXTVAL, 'Geraldo', 'Henrique Neto', 'geraldohenrique@usp.br', SYSDATE, 'IT_PROG', 5000);
  
 COMMIT;
END;

SELECT*
FROM tb_empregado
WHERE nome = 'Geraldo'
AND sobrenome = 'Henrique Neto';

--------------------------------------------------------------------------------------- 

BEGIN
  UPDATE tb_empregado
  SET salario = 15000
  WHERE nome = 'Geraldo' AND sobrenome = 'Henrique Neto';
  
 COMMIT;
END;

SELECT*
FROM tb_empregado
WHERE nome = 'Geraldo'
AND sobrenome = 'Henrique Neto';

---------------------------------------------------------------------------------------

DECLARE
 v_id_empregado NUMBER;
BEGIN
 SELECT sq_empregado.CURRVAL INTO v_id_empregado
 FROM dual;
 
 DELETE FROM tb_empregado
 WHERE id_empregado = v_id_empregado;
 COMMIT;
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_contador     NUMBER;
BEGIN
  FOR v_contador IN reverse 0..10 LOOP
     DBMS_OUTPUT.PUT_LINE(v_contador);
  END LOOP;
END;
/
@ /home/oracle/exemplo_01.sql

---------------------------------------------------------------------------------------

SET serverout ON 
DECLARE
 v_emp_count NUMBER;
BEGIN
 SELECT COUNT (1) INTO v_emp_count
 FROM tb_empregado
 WHERE id_departamento = &&id_departamento;
 
 DBMS_OUTPUT.PUT_LINE('Acontagem de empregados eh: ' || v_emp_count || 'para o depto com o ID de: ' || &id_departamento);
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
v_id_depto   NUMBER(4) := &id_depto;
v_nm_depto   VARCHAR2(30);
v_emp_count  NUMBER;
 
BEGIN
 SELECT COUNT(1) INTO v_emp_count
 FROM tb_empregado
 WHERE id_departamento = v_id_depto;
 
 SELECT nm_departamento INTO v_nm_depto
 FROM tb_departamento
 WHERE id_departamento = v_id_depto;

 DBMS_OUTPUT.PUT_LINE(' Existem ' || v_emp_count || ' empregado(s) ' || ' no departamento ' || v_nm_depto);
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_nome        VARCHAR2(20);
 v_sobrenome   VARCHAR2(25);
 v_emp_count   VARCHAR2(25) := '&v_emp_sobre';
 v_emp_count   NUMBER;
BEGIN
 SELECT COUNT(1) INTO v_emp_count
 FROM tb_empregado
 WHERE sobrenome = v_emp_sobre;
 IF v_emp_count > 1 THEN
  DBMS_OUTPUT.PUT_LINE('Existe mais de um empregado com o mesmo sobrenome');
 ELSE
  SELECT nome,sobrenome 
  INTO v_nome, v_sobrenome
  FROM tb_empregado
  WHERE sobrenome = v_emp_sobre;
  
 DBMS_OUTPUT.PUT_LINE('Nome completo do empregado: ' || v_nome || '' || v_sobrenome);
 END IF;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('Por favor, entre com um sobrenome diferente');
END;
 
------------------------------------------------------------AULA 22/03/2022---------------------------------------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_a NUMBER(2) := 10;
BEGIN
 v_a := 10;
 -- verifica a condição boolean usando a instrução IF 
 IF(v_a<20) THEN
 dbms_output.put_line('v_a eh menor que 20');
END IF;
 dbms_output.put_line('O valor de v_a eh: ' || v_a);
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE 
 v_contador NUMBER;
BEGIN
 SELECT COUNT(1) INTO v_contador
 FROM tb_empregado; 
 
 IF v_contador = 0 THEN
   dbms_output.put_line('Não existem empregados cadastrados');
 END IF;
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
    c_id_cliente tb_clientes.id_cliente%TYPE := 1;
    c_salario    tb_clientes.salario%TYPE;

BEGIN
    SELECT salario INTO c_salario
    FROM tb_clientes
    WHERE Id_cliente = c_id_cliente;
    
    IF (c_salario <= 2000) THEN 
        UPDATE tb_clientes SET salario = salario + 1000
        WHERE id_cliente = c_id_cliente;
        dbms_output.put_line ('Salário alterado com êxito');
    END IF; 
END;
 
 CREATE TABLE tb_clientes(
id_cliente    INT NOT NULL, 
nm_cliente    VARCHAR2(20) NOT NULL, 
idade         INT NOT NULL, 
endereco      VARCHAR2(25), 
salario       DECIMAL (18,2), 
PRIMARY KEY (id_cliente)
);

INSERT INTO tb_clientes (id_cliente, nm_cliente, idade, endereco, salario) 
VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 ); 

INSERT INTO tb_clientes (id_cliente, nm_cliente, idade, endereco, salario) 
VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 ); 

INSERT INTO tb_clientes (id_cliente, nm_cliente, idade, endereco, salario)  
VALUES (3, 'kaushik', 23, 'Kota', 2000.00 ); 

INSERT INTO tb_clientes (id_cliente, nm_cliente, idade, endereco, salario) 
VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 ); 

INSERT INTO tb_clientes (id_cliente, nm_cliente, idade, endereco, salario)  
VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00 ); 

INSERT INTO tb_clientes (id_cliente, nm_cliente, idade, endereco, salario) 
VALUES (6, 'Komal', 22, 'MP', 4500.00 );

COMMIT;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_a NUMBER(3) := 100;
BEGIN
 IF (v_a < 20) THEN
  dbms_output.put_line('v_a eh menor que 20');
 ELSE
  dbms_output.put_line('v_a eh menos que 20');
 END IF;
 dbms_output.put_line('O valor de v_a eh: ' || v_a);
END;

---------------------------------------------------------------------------------------

SET serverout ON
DECLARE
 v_contador   NUMBER;
BEGIN
 SELECT COUNT(1) INTO v_contador
 FROM tb_empregado;
 
 IF v_contador = 0 THEN
  dbms_output.put_line('Não existe(m) empregado(s) cadastrado(s)');
 ELSE 
  dbms_output.put_line('Existe(m) ' || TO_CHAR(v_contador) || ' empregado(s) cadastrado(s)');
 END IF;
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE 
 v_a NUMBER(3) := 100;
BEGIN
 IF (v_a = 10) THEN
  dbms_output.put_line('Valor de v_a eh 10');
 ELSIF (v_a = 20) THEN
  dbms_output.put_line('Valor de v_a eh 20');
 ELSIF (v_a = 30) THEN
  dbms_output.put_line('Valor de v_a eh 30');
 ELSE
  dbms_output.put_line('Nenhuma correspondência com os valores acima');
END IF;
 dbms_output.put_line('o valor exato de v_a eh: ' || v_a);
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE 
 v_contador   NUMBER;
BEGIN
 SELECT COUNT(1) INTO v_contador
 FROM tb_empregado;
 
 IF v_contador = 0 THEN
  dbms_output.put_line('Não existe empregado cadastrado');
 ELSIF v_contador > 100 THEN
  dbms_output.put_line('Existem mais de 100 empregados cadastrados');
 ELSE
  dbms_output.put_line('Existe(m)' || TO_CHAR(v_contador) || 'empregado(s) cadastrado(s)');
 END IF;
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_grade   CHAR(1) := 'A';
BEGIN
 CASE v_grade
      WHEN 'A' THEN dbms_output.put_line('Excelente');
      WHEN 'B' THEN dbms_output.put_line('Muito bom');
      WHEN 'C' THEN dbms_output.put_line('Bom');
      WHEN 'D' THEN dbms_output.put_line('Reprovado');
      WHEN 'F' THEN dbms_output.put_line('Tente novamente');
  ELSE dbms_output.put_line('Nenhuma classificação');
 END CASE;
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_contador   NUMBER;
 v_msg        VARCHAR2(100);
BEGIN
 SELECT COUNT(1) INTO v_contador
 FROM tb_empregado;
 
 CASE v_contador
   WHEN 0 THEN dbms_output.put_line('Nenhum empregado cadastrado');
  ELSE dbms_output.put_line('Existe(m) '|| TO_CHAR(v_contador) || ' empregado(s) cadastrado(s)');
 END CASE;
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_grade   CHAR(1) := 'B';
BEGIN
 CASE v_grade
      WHEN 'A' THEN dbms_output.put_line('Excelente');
      WHEN 'B' THEN dbms_output.put_line('Muito bom');
      WHEN 'C' THEN dbms_output.put_line('Bom');
      WHEN 'D' THEN dbms_output.put_line('Reprovado');
      WHEN 'E' THEN dbms_output.put_line('Tente novamente');
  ELSE dbms_output.put_line('Nenhuma classificação');
 END CASE;
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_contador   NUMBER;
 v_msg        VARCHAR(100);
BEGIN
 SELECT COUNT(1) INTO v_contador
 FROM tb_empregado;
 
 v_msg := CASE
            WHEN v_contador = 0 THEN 'Nenhum empregado cadastrado'
            WHEN v_contador > 100 THEN 'Existem mais de 100 empregados cadastrados'
            ELSE 'Existe(m)' || TO_CHAR(v_contador) || 'emprefado(s) cadastrado(s)'
          END;
 dbms_output.put_line(v_msg);
END;
            
---------------------------------------------------------------------------------------

SELECT COUNT (CASE WHEN salario < 2000 THEN 1 ELSE NULL END) contador_1,
       COUNT (CASE WHEN salario BETWEEN 2001 AND 4000 THEN 1 ELSE NULL END) contador_2,
       COUNT (CASE WHEN salario > 4000 THEN 1 ELSE NULL END) contador_3
FROM tb_empregado;

------------------------------------------------------------AULA 25/03/2022---------------------------------------------------------------------------------------------------------------------

SELECT COUNT(1)
FROM tb_empregado
WHERE salario < 2000
UNION ALL
SELECT COUNT(1)
FROM tb_empregado
WHERE salario BETWEEN 2001 AND 4000
UNION ALL
SELECT COUNT(1)
FROM tb_empregado
WHERE salario > 4000;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE 
 v_a   NUMBER(3) := 100;
 v_b   NUMBER(3) := 200;
BEGIN
 IF (v_a = 100) THEN
  IF ( v_b = 200) THEN
   dbms_output.put_line('Valor de v_a eh 100 e v_b eh 200');
  END IF;
 END IF;
 dbms_output.put_line('Valor exato de v_a eh: ' || v_a);
 dbms_output.put_line('Valor exato de v_b eh: ' || v_b);
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_x   NUMBER := 10;
BEGIN
 LOOP
  dbms_output.put_line(v_x);
  v_x := v_x + 10;
  IF v_x > 50 THEN
   EXIT;
  END IF;
 END LOOP;
 dbms_output.put_line('Depois do EXIT v_x eh: ' || v_x);
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_x   NUMBER := 10;
BEGIN
 LOOP
  dbms_output.put_line(v_x);
  v_x := v_x + 10;
   EXIT WHEN v_x > 50;
 END LOOP;
 dbms_output.put_line('Depois do EXIT v_x eh: ' || v_x);
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_a   NUMBER(2) := 10;
BEGIN
 WHILE v_a < 20 LOOP
   dbms_output.put_line('Valor de v_a: ' || v_a);
   v_a := v_a + 1;
 END LOOP;
END;
  
---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_a   NUMBER(2);
BEGIN
 FOR v_a IN 10..20 LOOP
  dbms_output.put_line('Valor de v_a: ' || v_a);
 END LOOP;
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_contador   NUMBER := 0;
BEGIN
  FOR i IN 1..100 LOOP
   v_contador := v_contador + 1;
  END LOOP;
  
  dbms_output.put_line('O valor final de v_contador eh: ' || v_contador);
END;
  
---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
    v_a NUMBER(2);
BEGIN
    FOR v_a IN REVERSE 10..20 LOOP
        dbms_output.put_line('Valor de v_a: ' || v_a);
    END LOOP;
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE 
 v_contador   NUMBER := 1;
BEGIN
<<loop_pai>>
 FOR i IN 1..1000 LOOP
  <<loop_filho>>
  LOOP
  EXIT loop_pai WHEN v_contador > 10;
  EXIT loop_filho WHEN MOD(v_contador,10) = 0;
  v_contador := v_contador + 1;
END LOOP loop_filho;
  v_contador := v_contador + 1;
END LOOP loop_pai;

dbms_output.put_line('O valor de v_contador eh: ' || v_contador);
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_a   NUMBER(2) := 10;
BEGIN
 WHILE v_a < 20 LOOP
  dbms_output.put_line('Valor de v_a: ' || v_a);
  v_a := v_a + 1;
  IF v_a > 15 THEN
  -- finalizando o loop usando a instrução EXIT
   EXIT;
  END IF;
 END LOOP;
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_a   NUMBER(2) := 10;
BEGIN
 WHILE v_a < 20 LOOP
  dbms_output.put_line('Valor de v_a: ' || v_a);
  v_a := v_a + 1;
  -- finalizando o loop usando a instrução EXIT
   EXIT WHEN v_a > 15; 
 END LOOP;
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_a   NUMBER(2) := 10;
BEGIN 
 WHILE v_a < 20 LOOP
  dbms_output.put_line('Valor de v_a: ' || v_a);
  v_a := v_a + 1;
  IF v_a = 15 THEN
   v_a := v_a + 1;
   CONTINUE;
  END IF;
 END LOOP;
 END;
 
---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_a   NUMBER(2) := 10;
BEGIN 
 <<inicio_loop>>
 WHILE v_a < 20 LOOP
  dbms_output.put_line('Valor de v_a: ' || v_a);
  v_a := v_a + 1;
  IF v_a = 15 THEN
   v_a := v_a + 1;
   GOTO inicio_loop;
  END IF;
 END LOOP;
END;

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE 
        v_resultado     BOOLEAN;
        v_compare1      BOOLEAN;
        v_compare2      BOOLEAN;
BEGIN 
        v_compare1 := true;
        v_compare1 := true;
        v_resultado := v_compare1 AND v_compare2;
        dbms_output.put_line('O valor de v_resultado é: ' || CASE v_resultado
        WHEN TRUE THEN 'TRUE' WHEN FALSE THEN 'FALSE' ELSE 'NULL' END);
END;

------------------------------------------------------------AULA 05/04/2022---------------------------------------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 v_resultado   BOOLEAN;
 v_compare1    BOOLEAN;
 v_compare2    BOOLEAN;
 BEGIN
  v_compare1 := null;
  v_compare2 := false;
  v_resultado := v_compare1 OR v_compare2;
  dbms_output.put_line('O valor de v_resultado é: ' || CASE v_resultado WHEN TRUE THEN 'TRUE' WHEN FALSE THEN 'FALSE' ELSE 'NULL' END);
END;

---------------------------------------------------------------------------------------

SELECT DECODE(cidade, 'Sao Paulo', 'São Paulo', cidade) AS CIDADE
FROM tb_localizacao;

---------------------------------------------------------------------------------------

SELECT nome || ' ' || sobrenome, salario + salario * NVL(percentual_comissao, 0) AS Total_Salario
FROM tb_empregado;

---------------------------------------------------------------------------------------

SELECT COALESCE (NULL, NULL, NULL, 1)
FROM dual;

---------------------------------------------------------------------------------------

ALTER TABLE tb_empregado
ADD (percentual_comissao_maxima NUMBER);

---------------------------------------------------------------------------------------

SELECT percentual_comissao,
   COALESCE (percentual_comissao_maxima, percentual_comissao, 0.1),
   COALESCE (percentual_comissao_maxima, percentual_comissao, 0.1) * salario AS Valor_Comissao
FROM tb_empregado
WHERE id_departamento IN(70,80);

---------------------------------------------------------------------------------------

SELECT AVG (salario)
FROM tb_empregado
WHERE id_departamento = 100;

---------------------------------------------------------------------------------------

SELECT MIN (salario)
FROM tb_empregado
WHERE id_departamento = 100;

---------------------------------------------------------------------------------------

SELECT MAX (salario)
FROM tb_empregado
WHERE id_departamento = 100;

---------------------------------------------------------------------------------------

SELECT COUNT(*)
FROM tb_empregado
WHERE id_departamento = 100;

---------------------------------------------------------------------------------------

SELECT SUM (salario)
FROM tb_empregado
WHERE id_departamento = 100;

---------------------------------------------------------------------------------------

SELECT TO_CHAR (data_admissao, 'dd/mm/yyyy') AS Data_Admissão
FROM tb_empregado
WHERE id_departamento = 100;

---------------------------------------------------------------------------------------

SELECT TO_DATE ('15/JAN/2021')
FROM dual;

---------------------------------------------------------------------------------------

SELECT TO_NUMBER ('15.79', '99.99')
FROM dual;

---------------------------------------------------------------------------------------

SELECT LENGTH ('PL/SQL Essencial')
FROM dual;

---------------------------------------------------------------------------------------

SELECT LOWER (nome)
FROM tb_empregado;

---------------------------------------------------------------------------------------

SELECT UPPER (nome)
FROM tb_empregado;

---------------------------------------------------------------------------------------

SELECT INITCAP (nm_departamento)
FROM tb_departamento;

---------------------------------------------------------------------------------------

SELECT nome, sobrenome, REPLACE(sobrenome,'a')
FROM tb_empregado;

---------------------------------------------------------------------------------------

SELECT USER
FROM dual;

---------------------------------------------------------------------------------------

-- MANIPULAÇÃO DE TIPOS DE DADOS COMPOSTOS

---------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
    TYPE tipo_reg_emp IS RECORD(
    id_empregado NUMBER(6),
    nome    VARCHAR2(20),
    sobrenome   VARCHAR(25));
registro_emp tipo_reg_emp;
BEGIN
    SELECT id_empregado, nome, sobrenome INTO registro_emp
    FROM tb_empregado
    WHERE ROWNUM = 1;
    DBMS_OUTPUT.PUT('O nome do empregado com ID'|| registro_emp.id_empregado
    || 'eh: '|| registro_emp.nome|| '' || registro_emp.sobrenome);
END;

---------------------------------------------------------------------------------------

SET serveroutput ON 
DECLARE
    registro_emp tb_empregado%ROWTYPE;
BEGIN
SELECT * INTO registro_emp
FROM tb_empregado
WHERE ROWNUM = 1;

DBMS_OUTPUT.PUT_LINE('O nome do empregado com ID'
    || registro_emp.id_empregado
    || 'eh' || registro_emp.nome
    || '' || registro_emp.sobrenome);
END;

------------------------------------------------------------AULA 08/04/2022---------------------------------------------------------------------------------------------------------------------

SET serveroutput ON
DECLARE
 TYPE tipo_emp IS TABLE OF tb_empregado&ROWTIPE;
 registro_emp    tipo_emp;
BEGIN
 SELECT * BULK COLLECT INTO registro_emp
 FROM tb_empregado
 WHERE ROWNUM = 1;
  FOR i IN registro_emp.first..registro_emp.last LOOP
 dbms_output.put_line('O nome do empregado com ID'
                      || registro_emp(i).id_empregado
                      || 'eh: ' || registro_emp(i).nome || ''
                      || registro_emp(i).sobrenome);
  END LOOP;
END;


------------------------------------------------------------AULA 31/05/2022---------------------------------------------------------------------------------------------------------------------


SET serveroutput ON
DECLARE
 CURSOR cur_emp IS
  SELECT nome, sobrenome, telefone
  FROM tb_empregado;
 v_emp tb_empregado%ROWTYPE;
 BEGIN
  FOR v_emp IN cur_emp LOOP
   IF v_emp.telefone IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE(RPAD(v_emp.nome || '' || v_emp.sobrenome, 35, '.') || v_emp.telefone);
   ELSE
    DBMS_OUTPUT.PUT_LINE(v_emp.nome || '' || v_emp.sobrenome || ' não possui número de telefone');
   END IF;
  END LOOP;
END;




















