use apple_music_db;
select * from play_history_duration;

alter table play_history_duration
add Artist_Name varchar (50);

alter table play_history_duration
add Song_Name varchar (50);

alter table play_history_duration
add Featured_Artist varchar (50);
-- --
create table top_genre (
Genre varchar (50), Play_Duration_Minutes decimal (6,2));
-- --
SELECT * FROM apple_music_db.top_content;
alter table top_content
drop Rankings;

-- Most played artist based in play time
select Artist_Name, Play_Duration_Minutes from top_content
order by Play_Duration_Minutes desc
limit 1;
-- --
SELECT * FROM apple_music_db.top_genre;
-- what is the most popular genre
select Play_Duration_Minutes, Genre from top_genre
order by Play_Duration_Minutes desc
limit 3;
-- --
use apple_music_db;
SELECT * FROM apple_music_db.play_history_duration;
select count(Song_Name) as Total_Songs from play_history_duration;
select count(distinct(Song_Name)) as Distinct_Songs from play_history_duration;
-- most played song in 2016
select Song_Name,Play_Count, Date_Played from play_history_duration
where Date_Played like '2016%';

select max(Play_Count), Date_Played, Song_Name from play_history_duration
where 1=1 
and Song_Name = ' Close to You'
and Date_Played like '2016%';
-- most played song
select sum(Play_Count) as Num_Of_Plays, Song_Name from play_history_duration
group by Song_Name
order by sum(Play_Count) desc
limit 3;

-- most skipped song
select sum(Skip_Count) as Num_Of_Skips, Song_Name from play_history_duration
group by Song_Name
order by sum(Skip_Count) desc
limit 3;
-- which day of the week are the most songs played
SELECT DAYNAME(Date_Played) as day_of_week, COUNT(*) as play_count 
FROM play_history_duration
GROUP BY day_of_week 
ORDER BY play_count DESC 
LIMIT 1;
-- top songs played group by artist
select Artist_Name, Song_Name, Play_Count from play_history_duration
having Play_Count > 7
order by Play_Count desc;





