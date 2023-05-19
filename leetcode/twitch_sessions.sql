-- From users who had their first session as a viewer, how many streamer sessions have they had? Return 
-- the user id and number of sessions in descending order. In case there are users with the same number 
-- of sessions, order them by ascending user id.
-- PSQL
create table twitch_sessions (
	user_id INT,
	session_start DATE,
	session_end DATE,
	session_id INT,
	session_type VARCHAR(8)
);
insert into twitch_sessions (user_id, session_start, session_end, session_id, session_type) values (1, '2021-03-10 09:59:36', '2020-12-28 22:53:01', 291, 'viewer');
insert into twitch_sessions (user_id, session_start, session_end, session_id, session_type) values (2, '2021-05-02 14:38:32', '2020-05-14 04:05:37', 287, 'viewer');
insert into twitch_sessions (user_id, session_start, session_end, session_id, session_type) values (3, '2021-12-10 18:31:38', '2022-03-12 23:57:26', 171, 'viewer');
insert into twitch_sessions (user_id, session_start, session_end, session_id, session_type) values (4, '2020-09-19 16:46:35', '2020-06-16 02:53:30', 411, 'viewer');
insert into twitch_sessions (user_id, session_start, session_end, session_id, session_type) values (5, '2021-05-24 18:37:20', '2021-01-29 13:40:07', 468, 'viewer');
insert into twitch_sessions (user_id, session_start, session_end, session_id, session_type) values (6, '2021-02-12 14:25:34', '2020-01-13 05:46:04', 156, 'streamer');
insert into twitch_sessions (user_id, session_start, session_end, session_id, session_type) values (7, '2020-12-01 13:05:33', '2022-08-27 19:35:44', 507, 'viewer');
insert into twitch_sessions (user_id, session_start, session_end, session_id, session_type) values (2, '2021-08-29 03:58:26', '2022-01-20 21:56:20', 436, 'streamer');
insert into twitch_sessions (user_id, session_start, session_end, session_id, session_type) values (1, '2020-05-10 18:09:18', '2020-06-16 22:52:18', 302, 'streamer');
insert into twitch_sessions (user_id, session_start, session_end, session_id, session_type) values (2, '2022-07-29 09:00:55', '2022-08-22 05:32:07', 264, 'viewer');
insert into twitch_sessions (user_id, session_start, session_end, session_id, session_type) values (0, '2022-10-06 06:38:01', '2020-05-11 10:48:18', 129, 'streamer');
insert into twitch_sessions (user_id, session_start, session_end, session_id, session_type) values (0, '2021-11-06 20:55:30', '2020-03-03 12:42:24', 405, 'streamer');

SELECT twitch_sessions.user_id, COUNT(*) AS n_sessions
FROM twitch_sessions JOIN
(SELECT DISTINCT user_id, FIRST_VALUE(session_type) OVER (PARTITION BY user_id ORDER BY session_start) AS first_session
FROM twitch_sessions) user_first_session
ON twitch_sessions.user_id = user_first_session.user_id
WHERE twitch_sessions.session_type = 'streamer'
AND first_session = 'viewer'
GROUP BY twitch_sessions.user_id
ORDER BY n_sessions DESC;
