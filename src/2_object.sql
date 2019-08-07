create table users(id int primary key, json text);
insert into users values(1, '{"id": 1, "name": "yamada", "class": "A"}');
insert into users values(2, '{"id": 2, "name": "suzuki", "class": "B"}');
insert into users values(3, '{}');
.headers on
.mode column

-- name='yamada'の行番号は何か
.headers off
select 'name=''yamada''の行番号は何か？';
.headers on
select rowid from (select rowid, key, json_extract(json, fullkey) as value from (select * from (select rowid, json from users) as users, json_tree(users.json) where key!='')) where key='name' and value='yamada';
