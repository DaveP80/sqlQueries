-- DataLemur https://datalemur.com/questions/top-fans-rank
-- Top 5 Artists [Spotify SQL Interview Question]
select
  *
from
  (
    SELECT
      artist_name,
      dense_rank() over(
        order by
          count(*) desc
      ) as artist_rank
    from
      artists ar
      join songs so on ar.artist_id = so.artist_id
      join global_song_rank gsr ON gsr.song_id = so.song_id
    where
      gsr.rank <= 10
    group by
      1
  ) z
where
  artist_rank <= 5;