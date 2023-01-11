DROP TRIGGER IF EXISTS lower_code ON langs;

CREATE OR REPLACE FUNCTION lower_code_f() RETURNS trigger 
LANGUAGE plpgsql
AS
$$
     BEGIN
	 	  UPDATE langs
		  SET lang_name = upper(left(lang_name,1)) || lower(SUBSTRING(lang_name, 2, 50)) where langs.user_lang = NEW.user_lang;
		  RETURN NULL;
     END;
$$;



CREATE TRIGGER lower_code
AFTER INSERT ON langs
FOR EACH ROW EXECUTE FUNCTION lower_code_f();