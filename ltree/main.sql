-- create table tree(
--    id serial primary key,
--    letter char,
---    parent_id integer references tree (id) -- self-referencing
--- );
-- CREATE EXTENSION LTREE;
create table tree(
    id serial primary key,
    letter char,
    path ltree
);
create index tree_path_idx on tree using gist (path);
insert into tree (letter, path) values ('A', 'A');
insert into tree (letter, path) values ('B', 'A.B');
insert into tree (letter, path) values ('C', 'A.C');
insert into tree (letter, path) values ('D', 'A.C.D');
insert into tree (letter, path) values ('E', 'A.C.E');
insert into tree (letter, path) values ('F', 'A.C.F');
insert into tree (letter, path) values ('G', 'A.B.G');

select count(*) from tree where 'A' @> path;

select count(*) from tree where 'A.C' @> path;

