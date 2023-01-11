DROP PROCEDURE IF EXISTS insert_lang(varchar,varchar);
CREATE OR REPLACE PROCEDURE insert_lang(lang varchar, langcode varchar)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    INSERT INTO langs VALUES (langcode, lang);
END;
$$;

SELECT * FROM langs

CALL insert_lang('German', 'de')