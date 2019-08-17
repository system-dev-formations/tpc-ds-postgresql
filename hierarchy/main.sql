CREATE TABLE employees (
  id serial,
  name varchar(255),
  manager_id int
);

INSERT INTO employees VALUES (1, 'Umur', null);
INSERT INTO employees VALUES (2, 'Craig', 1);
INSERT INTO employees VALUES (3, 'Daniel', 2);
INSERT INTO employees VALUES (4, 'Claire', 1);
INSERT INTO employees VALUES (5, 'Lindsay', 2);
INSERT INTO employees VALUES (6, 'Will', 2);
INSERT INTO employees VALUES (7, 'Burak', 2);
INSERT INTO employees VALUES (8, 'Eren', 2);
INSERT INTO employees VALUES (9, 'Katie', 3);
INSERT INTO employees VALUES (10, 'Teresa', 4);

WITH RECURSIVE managertree AS (
  SELECT id, name, manager_id
  FROM employees
  WHERE id = 2
  UNION ALL
  SELECT e.id, e.name, e.manager_id
  FROM employees e
  INNER JOIN managertree mtree ON mtree.id = e.manager_id
)

SELECT *
FROM managertree;
