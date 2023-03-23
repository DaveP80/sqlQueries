create table emailregex (
	id INT,
	email VARCHAR(50),
	username VARCHAR(50)
);
insert into emailregex (id, email, username) values (1, 'ysisley0@wordpress.org', 'agriston0');
insert into emailregex (id, email, username) values (2, 'bmaseyk1^patch.com', 'hdenyer1');
insert into emailregex (id, email, username) values (3, 'jlosel2@issuu.com', 'emccusker2');
insert into emailregex (id, email, username) values (4, 'bbradock3@storify.com', 'ljacobs3');
insert into emailregex (id, email, username) values (5, 'aparkhouse4@free.fr', 'aeagers4');
insert into emailregex (id, email, username) values (6, 'vsatterly5@gov.uk', 'iboyington5');
insert into emailregex (id, email, username) values (7, 'mmahmood6@icio.us', 'wstefanovic6');
insert into emailregex (id, email, username) values (8, 'aconeybeare7@timesonline.co.uk', 'cmccarty7');
insert into emailregex (id, email, username) values (9, 'mpigny8@last.fm', 'bbroune8');
insert into emailregex (id, email, username) values (10, 'cmclennan9@blogtalkradio.com', 'hhoodless9');
insert into emailregex (id, email, username) values (11, ' bartkea@live.com', 'sgiaomozzoa');
insert into emailregex (id, email, username) values (12, 'ddrainb@msu.edu', 'rcomollib');
insert into emailregex (id, email, username) values (13, 'dbotterellc@psu.edu', 'mstockallc');
insert into emailregex (id, email, username) values (14, 'ibaumand@walmart.com', 'nrosewalld');
insert into emailregex (id, email, username) values (15, '_mansbridgee@goru', 'dlilione');

-- remove rows where email is invalid
DELETE FROM emailregex WHERE NOT (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');