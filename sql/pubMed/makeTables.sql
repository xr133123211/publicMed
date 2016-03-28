use publicMedicine
create table users
(
id bigInt IDENTITY (1,1)primary key,
name varchar(32),
password varchar(32),
type int,
phone char(32),
status int
)

