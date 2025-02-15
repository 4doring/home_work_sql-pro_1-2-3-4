-- Задание 2


-- Название и продолжительность самого длительного трека.
-- вариант 1
SELECT track_name, track_lenght_seс * INTERVAL '1 sec' AS time_minutes
FROM track
ORDER BY track_lenght_seс DESC
LIMIT 1;

-- вариант 2
SELECT track_name, track_lenght_seс * INTERVAL '1 sec' AS time_minutes
FROM track
WHERE track_lenght_seс = (SELECT MAX(track_lenght_seс ) FROM track);


-- Название треков, продолжительность которых не менее 3,5 минут.
SELECT track_name, track_lenght_seс * INTERVAL '1 sec' AS time_minutes
FROM track
WHERE track_lenght_seс / 60 > 3.5
ORDER BY track_lenght_seс DESC;


-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT collection_of_hits_name, hits_release_year 
FROM collection_of_hits ch
WHERE ch.hits_release_year BETWEEN 2018 AND 2020;


-- Исполнители, чьё имя состоит из одного слова.
SELECT musican_name
FROM musican
WHERE musican_name NOT ILIKE '% %';


-- Название треков, которые содержат слово «мой» или «my».
-- вариант 1
SELECT track_name
FROM track
WHERE track_name ILIKE '% my %';

-- варианта 2
SELECT track_name
FROM track
WHERE LOWER (track_name) LIKE LOWER ('% my %');




-- Задание 3

-- Количество исполнителей в каждом жанре.
-- вариант 1
SELECT genre_name, COUNT (*) AS musican_in_genre
FROM genre g, musican m, genre_musican gm
WHERE gm.genre_id = g.genre_id AND gm.musican_id = m.musican_id
GROUP BY g.genre_name;

--вариант 2
SELECT genre_name, COUNT (*) AS musican_in_genre
FROM genre g
JOIN genre_musican gm ON g.genre_id  = gm.genre_id 
JOIN musican m ON m.musican_id = gm.musican_id 
GROUP BY g.genre_name;


-- Количество треков, вошедших в альбомы 2019–2020 годов.
-- вариант 1
SELECT COUNT (t.track_name) AS Sum_tracks_from_2019_to_2020
FROM track t, album a
WHERE t.album_id IN (a.album_id) AND a.album_release_year BETWEEN 2019 AND 2020;

-- вариант 2
SELECT COUNT (t.track_name) AS Sum_tracks_from_2019_to_2020
FROM track t
JOIN album a ON t.album_id = a.album_id 
WHERE t.album_id = a.album_id AND a.album_release_year BETWEEN 2019 AND 2020;


-- Средняя продолжительность треков по каждому альбому.
SELECT a.album_name, SUM (t.track_lenght_seс) / COUNT (t.track_lenght_seс) * INTERVAL '1 sec' AS AVG_time_album_tracks
FROM album a, track t 
WHERE t.album_id = a.album_id 
GROUP BY a.album_name;


-- Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT m.musican_name AS Havent_album_in_2020, a.album_release_year
FROM musican m
JOIN musican_album ma ON m.musican_id = ma.musican_id
JOIN album a ON a.album_id = ma.album_id 
WHERE a.album_release_year != 2020;


-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
-- Elvis Presley
SELECT coh.collection_of_hits_name, m.musican_name 
FROM collection_of_hits coh
JOIN collection_track ct ON ct.collection_of_hits_id = coh.collection_of_hits_id 
JOIN track t ON t.track_id = ct.track_id 
JOIN album a ON t.album_id = a.album_id
JOIN musican_album ma ON ma.album_id = a.album_id
JOIN musican m ON m.musican_id = ma.musican_id 
WHERE m.musican_name ILIKE 'Elvis Presley'
GROUP BY coh.collection_of_hits_name, m.musican_name; 


-- Задание 4(необязательное)

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра
-- ! решение выполнено для collection, т.к. album содержит треки одного музыканта

-- варианта 1
SELECT coh.collection_of_hits_name, COUNT(DISTINCT g.genre_name) AS count_genre
FROM collection_of_hits coh 
JOIN collection_track ct ON ct.collection_of_hits_id = coh.collection_of_hits_id 
JOIN track t ON t.track_id = ct.track_id
JOIN album a ON a.album_id = t.album_id 
JOIN musican_album ma ON ma.album_id = a.album_id 
JOIN musican m ON ma.musican_id = m.musican_id 
JOIN genre_musican gm ON gm.musican_id = m.musican_id 
JOIN genre g ON gm.genre_id = g.genre_id 
GROUP BY coh.collection_of_hits_name
HAVING COUNT(DISTINCT g.genre_name) != 1;
 
-- вариант 2
SELECT coh.collection_of_hits_name, COUNT(DISTINCT g.genre_name) AS count_genre
FROM collection_of_hits coh, track t, album a, musican_album ma,musican m, genre_musican gm, genre g, collection_track ct 
WHERE coh.collection_of_hits_id = ct.collection_of_hits_id AND t.track_id = ct.track_id 
AND t.album_id = a.album_id AND a.album_id = ma.album_id AND ma.musican_id = m.musican_id 
AND m.musican_id = gm.musican_id AND g.genre_id = gm.genre_id
GROUP BY coh.collection_of_hits_name
HAVING COUNT (DISTINCT g.genre_id) != 1;


-- Наименования треков, которые не входят в сборники
SELECT  t.track_name
FROM track t, collection_track ct
WHERE ct.track_id NOT IN (t.track_id)
GROUP BY t.track_name;


-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек,
-- — теоретически таких треков может быть несколько.

-- вариант 1
SELECT  m.musican_name, t.track_lenght_seс * INTERVAL '1 sec' AS time_track
FROM musican m  
JOIN musican_album ma ON m.musican_id = ma.musican_id
JOIN album a ON a.album_id = ma.album_id
JOIN track t ON t.album_id = a.album_id 
WHERE t.track_lenght_seс = (SELECT MIN (t.track_lenght_seс) FROM track t);

-- вариант 2
SELECT  m.musican_name, t.track_lenght_seс * INTERVAL '1 sec' AS time_track
FROM musican m  
JOIN musican_album ma ON m.musican_id = ma.musican_id
JOIN album a ON a.album_id = ma.album_id
JOIN track t ON t.album_id = a.album_id 
ORDER BY t.track_lenght_seс
LIMIT 1;


-- Названия альбомов, содержащих наименьшее количество треков.
SELECT a.album_name, COUNT(*) AS number_of_trecks
FROM track t 
JOIN album a ON t.album_id = a.album_id 
GROUP BY a.album_name
ORDER BY COUNT(t.album_id)
LIMIT 1

