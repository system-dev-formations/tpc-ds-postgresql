\c exercices hme
SET search_path = cd, pg_catalog;
\set AUTOCOMMIT off;
SELECT attname, format_type (atttypid, atttypmod)
FROM pg_attribute
WHERE attrelid::regclass::text='members'
ORDER BY attnum;

SELECT txid_current();

INSERT INTO members (memid, surname, firstname, address, zipcode, telephone, recommendedby, joindate) VALUES
(38, 'meftah', 'herve', '3 tower mill road', 4321, '07908705425', NULL, '2019-07-02 14:42:05');

-- \d members

SELECT attname, format_type (atttypid, atttypmod) FROM pg_attribute
WHERE attrelid::regclass::text='cd.members'
ORDER BY attnum;

-- terminal a
BEGIN;
SELECT txid_current();
DELETE FROM members WHERE memid = 38;

-- terminal b
SELECT xmin,xmax,cmin,cmax,* FROM members WHERE memid = 38;

CREATE TABLE SALARIE(
    id integer NOT NULL,
    nom text NOT NULL,
    salaire integer
);

INSERT into cd.salarie VALUES (generate_series(1,10),'avi',1);

 DELETE from cd.salarie where id > 5;

CREATE EXTENSION pageinspect;

 SELECT t_xmin, t_xmax, tuple_data_split('cd.SALARIE'::regclass, t_data, t_infomask, t_infomask2, t_bits) FROM heap_page_items(get_raw_page('cd.salarie', 0))