DROP FUNCTION IF EXISTS get_langcode(varchar);
CREATE FUNCTION get_langcode(lang_arg varchar) RETURNS TABLE (lang varchar, langcode varchar)
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
        SELECT lang_name::varchar, user_lang::varchar
		FROM langs
		WHERE lang_name = lang_arg;
END;
$$

SELECT * FROM get_langcode('English')
SELECT * FROM get_langcode('French')