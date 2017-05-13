-- Function: public.liquidation(integer, text, date, date, integer)

-- DROP FUNCTION public.liquidation(integer, text, date, date, integer);

CREATE OR REPLACE FUNCTION public.liquidation(
    payday_master_id integer,
    payday_type text,
    payday_start_date date,
    payday_end_date date,
    employee integer)
  RETURNS text AS
$BODY$
DECLARE
  retorno TEXT;
BEGIN
  retorno = '';
  if (payday_type = 'Nómina') then
    select * from public.nomina_liquidation(payday_master_id, payday_type, payday_start_date, payday_end_date, employee) into retorno;
  end if;
  if (payday_type = 'Prima') then
    select * from public.prima_liquidation(payday_master_id, payday_type, payday_start_date, payday_end_date, employee) into retorno;
  end if;
  if (payday_type = 'Cesantías') then
    select * from public.cesantias_liquidation(payday_master_id, payday_type, payday_start_date, payday_end_date, employee) into retorno;
  end if;
  if (payday_type = 'Intereses de Cesantías') then
    select * from public.intcesantias_liquidation(payday_master_id, payday_type, payday_start_date, payday_end_date, employee) into retorno;
  end if;
  if (payday_type = 'Vacaciones') then
    select * from public.vacaciones_liquidation(payday_master_id, payday_type, payday_start_date, payday_end_date, employee) into retorno;
  end if;
  if (payday_type = 'Terminación') then
    select * from public.terminacion_liquidation(payday_master_id, payday_type, payday_start_date, payday_end_date, employee) into retorno;
  end if;
  RETURN retorno;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.liquidation(integer, text, date, date, integer)
  OWNER TO postgres;

-- Function: public.nomina_liquidation(integer, text, date, date, integer)

-- DROP FUNCTION public.nomina_liquidation(integer, text, date, date, integer);

CREATE OR REPLACE FUNCTION public.nomina_liquidation(
    payday_master_id integer,
    payday_type text,
    payday_start_date date,
    payday_end_date date,
    employee integer)
  RETURNS text AS
$BODY$
DECLARE
  retorno TEXT;
  nomina RECORD;
  payday_n TEXT;
  integral_base_n NUMERIC;
  salary_c INTEGER;
  aid_c INTEGER;
  health_c INTEGER;
  pension_c INTEGER;
  p_type TEXT;
BEGIN
  retorno = '';
  p_type = payday_type;
  --
  SELECT payday, integral_base FROM general_parameters INTO payday_n, integral_base_n;
  --
  SELECT id FROM concepts WHERE UPPER(concept_name) = 'SALARIO' INTO salary_c;
  SELECT id FROM concepts WHERE UPPER(concept_name) = 'AUXILIO DE TRANSPORTE' INTO aid_c;
  SELECT id FROM concepts WHERE UPPER(concept_name) = 'SALUD' INTO health_c;
  SELECT id FROM concepts WHERE UPPER(concept_name) = 'PENSIÓN' INTO pension_c;
  --
  UPDATE payday_masters SET description = p_type||' '||cast(payday_end_date as text) WHERE id = payday_master_id;
  --
  FOR nomina IN
    EXECUTE 'SELECT e.id, e.salary, e.transport_aid, e.integral_salary FROM employees e
		WHERE e.retirement_date IS NULL '
  LOOP
    IF payday_n = 'QUINCENAL' THEN
      EXECUTE 'INSERT INTO payday_details(base_value, win, loss, appropiation, worked_days, start_date, end_date, concept_id, employee_id, payday_master_id, created_at, updated_at) 
		VALUES ('||(nomina.salary/2)||','||(nomina.salary/2)||',0,0,15,'||quote_literal(payday_start_date)||','||quote_literal(payday_end_date)||','||salary_c||','||nomina.id||','||payday_master_id||',now(),now())';
      IF nomina.transport_aid THEN
        EXECUTE 'INSERT INTO payday_details(base_value, win, loss, appropiation, worked_days, start_date, end_date, concept_id, employee_id, payday_master_id, created_at, updated_at) 
		  VALUES ('||(nomina.salary/2)||',(83140/2),0,0,15,'||quote_literal(payday_start_date)||','||quote_literal(payday_end_date)||','||aid_c||','||nomina.id||','||payday_master_id||',now(),now())';
      END IF; 
      EXECUTE 'INSERT INTO payday_details(base_value, win, loss, appropiation, worked_days, start_date, end_date, concept_id, employee_id, payday_master_id, created_at, updated_at) 
		VALUES ('||(nomina.salary/2)||',0,'||((nomina.salary/2)*0.04)||',0,15,'||quote_literal(payday_start_date)||','||quote_literal(payday_end_date)||','||health_c||','||nomina.id||','||payday_master_id||',now(),now())';
      EXECUTE 'INSERT INTO payday_details(base_value, win, loss, appropiation, worked_days, start_date, end_date, concept_id, employee_id, payday_master_id, created_at, updated_at) 
		VALUES ('||(nomina.salary/2)||',0,'||((nomina.salary/2)*0.04)||',0,15,'||quote_literal(payday_start_date)||','||quote_literal(payday_end_date)||','||pension_c||','||nomina.id||','||payday_master_id||',now(),now())';
    ELSE
      EXECUTE 'INSERT INTO payday_details(base_value, win, loss, appropiation, worked_days, start_date, end_date, concept_id, employee_id, payday_master_id, created_at, updated_at) 
		VALUES ('||(nomina.salary)||','||(nomina.salary)||',0,0,30,'||quote_literal(payday_start_date)||','||quote_literal(payday_end_date)||','||salary_c||','||nomina.id||','||payday_master_id||',now(),now())';
      IF nomina.transport_aid THEN
        EXECUTE 'INSERT INTO payday_details(base_value, win, loss, appropiation, worked_days, start_date, end_date, concept_id, employee_id, payday_master_id, created_at, updated_at) 
		  VALUES ('||(nomina.salary)||',83140,0,0,30,'||quote_literal(payday_start_date)||','||quote_literal(payday_end_date)||','||aid_c||','||nomina.id||','||payday_master_id||',now(),now())';
      END IF;
      EXECUTE 'INSERT INTO payday_details(base_value, win, loss, appropiation, worked_days, start_date, end_date, concept_id, employee_id, payday_master_id, created_at, updated_at) 
		VALUES ('||(nomina.salary/2)||',0,'||((nomina.salary)*0.04)||',0,0,30,'||quote_literal(payday_start_date)||','||quote_literal(payday_end_date)||','||health_c||','||nomina.id||','||payday_master_id||',now(),now())';
      EXECUTE 'INSERT INTO payday_details(base_value, win, loss, appropiation, worked_days, start_date, end_date, concept_id, employee_id, payday_master_id, created_at, updated_at) 
		VALUES ('||(nomina.salary/2)||',0,'||((nomina.salary)*0.04)||',0,0,30,'||quote_literal(payday_start_date)||','||quote_literal(payday_end_date)||','||pension_c||','||nomina.id||','||payday_master_id||',now(),now())';    
    END IF;
  END LOOP;  
  RETURN retorno;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.nomina_liquidation(integer, text, date, date, integer)
  OWNER TO postgres;

-- Function: public.cesantias_liquidation(integer, text, date, date, integer)

-- DROP FUNCTION public.cesantias_liquidation(integer, text, date, date, integer);

CREATE OR REPLACE FUNCTION public.cesantias_liquidation(
    payday_master_id integer,
    payday_type text,
    payday_start_date date,
    payday_end_date date,
    employee integer)
  RETURNS text AS
$BODY$
DECLARE
  retorno TEXT;
  nomina RECORD;
  cesantias_c INTEGER;
  p_type TEXT;
BEGIN
  retorno = '';
  p_type = payday_type;
  --
  SELECT id FROM concepts WHERE UPPER(concept_name) = 'CESANTÍAS' INTO cesantias_c;
  --
  UPDATE payday_masters SET description = p_type||' '||cast(payday_end_date as text) WHERE id = payday_master_id;
  --
  FOR nomina IN
    EXECUTE 'SELECT e.id, e.salary, e.transport_aid, e.integral_salary FROM employees e
		WHERE e.retirement_date IS NULL '
  LOOP
    IF nomina.transport_aid THEN
	EXECUTE 'INSERT INTO payday_details(base_value, win, loss, appropiation, worked_days, start_date, end_date, concept_id, employee_id, payday_master_id, created_at, updated_at) 
		  VALUES ('||(nomina.salary)||','||(nomina.salary)||'+83140,0,0,360,'||quote_literal(payday_start_date)||','||quote_literal(payday_end_date)||','||cesantias_c||','||nomina.id||','||payday_master_id||',now(),now())';
    ELSE
	EXECUTE 'INSERT INTO payday_details(base_value, win, loss, appropiation, worked_days, start_date, end_date, concept_id, employee_id, payday_master_id, created_at, updated_at) 
		VALUES ('||(nomina.salary)||','||(nomina.salary)||',0,0,360,'||quote_literal(payday_start_date)||','||quote_literal(payday_end_date)||','||cesantias_c||','||nomina.id||','||payday_master_id||',now(),now())';
    END IF;       
  END LOOP;  
  RETURN retorno;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.cesantias_liquidation(integer, text, date, date, integer)
  OWNER TO postgres;

-- Function: public.intcesantias_liquidation(integer, text, date, date, integer)

-- DROP FUNCTION public.intcesantias_liquidation(integer, text, date, date, integer);

CREATE OR REPLACE FUNCTION public.intcesantias_liquidation(
    payday_master_id integer,
    payday_type text,
    payday_start_date date,
    payday_end_date date,
    employee integer)
  RETURNS text AS
$BODY$
DECLARE
  retorno TEXT;
  nomina RECORD;
  cesantias_c INTEGER;
  p_type TEXT;
BEGIN
  retorno = '';
  p_type = payday_type;
  --
  SELECT id FROM concepts WHERE UPPER(concept_name) = 'INTERESES DE CESANTÍAS' INTO cesantias_c;
  --
  UPDATE payday_masters SET description = p_type||' '||cast(payday_end_date as text) WHERE id = payday_master_id;
  --
  FOR nomina IN
    EXECUTE 'SELECT e.id, e.salary, e.transport_aid, e.integral_salary FROM employees e
		WHERE e.retirement_date IS NULL '
  LOOP
    IF nomina.transport_aid THEN
	EXECUTE 'INSERT INTO payday_details(base_value, win, loss, appropiation, worked_days, start_date, end_date, concept_id, employee_id, payday_master_id, created_at, updated_at) 
		  VALUES ('||(nomina.salary)||',('||(nomina.salary)||'+83140)*0.12,0,0,360,'||quote_literal(payday_start_date)||','||quote_literal(payday_end_date)||','||cesantias_c||','||nomina.id||','||payday_master_id||',now(),now())';
    ELSE
	EXECUTE 'INSERT INTO payday_details(base_value, win, loss, appropiation, worked_days, start_date, end_date, concept_id, employee_id, payday_master_id, created_at, updated_at) 
		VALUES ('||(nomina.salary)||','||(nomina.salary)||'*0.12,0,0,360,'||quote_literal(payday_start_date)||','||quote_literal(payday_end_date)||','||cesantias_c||','||nomina.id||','||payday_master_id||',now(),now())';
    END IF;       
  END LOOP;  
  RETURN retorno;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.intcesantias_liquidation(integer, text, date, date, integer)
  OWNER TO postgres;

-- Function: public.prima_liquidation(integer, text, date, date, integer)

-- DROP FUNCTION public.prima_liquidation(integer, text, date, date, integer);

CREATE OR REPLACE FUNCTION public.prima_liquidation(
    payday_master_id integer,
    payday_type text,
    payday_start_date date,
    payday_end_date date,
    employee integer)
  RETURNS text AS
$BODY$
DECLARE
  retorno TEXT;
  nomina RECORD;
  prima_c INTEGER;
  p_type TEXT;
BEGIN
  retorno = '';
  p_type = payday_type;
  --
  SELECT id FROM concepts WHERE UPPER(concept_name) = 'PRIMA' INTO prima_c;
  --
  UPDATE payday_masters SET description = p_type||' '||cast(payday_end_date as text) WHERE id = payday_master_id;
  --
  FOR nomina IN
    EXECUTE 'SELECT e.id, e.salary, e.transport_aid, e.integral_salary FROM employees e
		WHERE e.retirement_date IS NULL '
  LOOP
    IF nomina.transport_aid THEN
	EXECUTE 'INSERT INTO payday_details(base_value, win, loss, appropiation, worked_days, start_date, end_date, concept_id, employee_id, payday_master_id, created_at, updated_at) 
		  VALUES ('||(nomina.salary/2)||','||(nomina.salary/2)||'+(83140/2),0,0,180,'||quote_literal(payday_start_date)||','||quote_literal(payday_end_date)||','||prima_c||','||nomina.id||','||payday_master_id||',now(),now())';
    ELSE
	EXECUTE 'INSERT INTO payday_details(base_value, win, loss, appropiation, worked_days, start_date, end_date, concept_id, employee_id, payday_master_id, created_at, updated_at) 
		VALUES ('||(nomina.salary/2)||','||(nomina.salary/2)||',0,0,180,'||quote_literal(payday_start_date)||','||quote_literal(payday_end_date)||','||prima_c||','||nomina.id||','||payday_master_id||',now(),now())';
    END IF;       
  END LOOP;  
  RETURN retorno;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.prima_liquidation(integer, text, date, date, integer)
  OWNER TO postgres;

-- Function: public.liquidate()

-- DROP FUNCTION public.liquidate();

CREATE OR REPLACE FUNCTION public.liquidate()
  RETURNS trigger AS
$BODY$
BEGIN
    PERFORM public.liquidation(cast(NEW.id as integer), cast(NEW.payday_type as text), cast(NEW.payday_date as date), cast(NEW.payday_date as date), cast(NEW.description as integer));
    RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.liquidate()
  OWNER TO postgres;

-- Trigger: liquidate on public.payday_masters

-- DROP TRIGGER liquidate ON public.payday_masters;

CREATE TRIGGER liquidate
  AFTER INSERT
  ON public.payday_masters
  FOR EACH ROW
  EXECUTE PROCEDURE public.liquidate();
