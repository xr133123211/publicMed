use publicMedicine

create table temp_access_vote
(
id bigInt IDENTITY (1,1)primary key,
userId bigInt,
accessId bigInt,
votePoint int,
status int,
authDate datetime
)

create table trust
(
id bigInt IDENTITY (1,1)primary key,
user_id bigInt,
org_id bigInt,
trustDate datetime, 
weight int,
status int,
type int
)

create table users
(
id bigInt IDENTITY (1,1)primary key,
name varchar(32),
password varchar(32),
type int,
phone char(32),
threshold int,
status int
)



create table temp_access
(
id bigInt IDENTITY (1,1)primary key,
name varchar(32),
detail varchar(100),
accedd_id bigInt,
type int,
phone char(32),
status int,
authDate datetime

)