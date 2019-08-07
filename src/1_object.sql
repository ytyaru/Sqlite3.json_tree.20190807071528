create table users(id int primary key, json text);
insert into users values(1, '{"id": 1, "name": "yamada", "class": "A"}');
insert into users values(2, '{"id": 2, "name": "suzuki", "class": "B"}');
insert into users values(3, '{}');
.headers on
.mode column
select key, json_extract(json, fullkey) from (select * from users, json_tree(users.json));
select rowid, key, json_extract(json, fullkey) from (select * from (select rowid, json from users) as users, json_tree(users.json));
select rowid, key, json_extract(json, fullkey) from (select * from (select rowid, json from users) as users, json_tree(users.json) where key!='');

