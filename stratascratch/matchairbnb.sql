-- stratascratch No. 10078
select distinct ah.host_id, g.guest_id from airbnb_hosts ah join airbnb_guests g on (g.gender, g.nationality) =
(ah.gender, ah.nationality);
