CREATE OR REPLACE FUNCTION user_search(uname TEXT) RETURNS TABLE (usename name, passwd text) as
$$
  SELECT usename, passwd FROM pg_shadow WHERE usename=$1;
$$
LANGUAGE sql SECURITY DEFINER;
