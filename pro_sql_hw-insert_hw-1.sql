-- Задание 1


-- добавление genre
 INSERT INTO genre (genre_id, genre_name)
      VALUES (1, 'heavy metal'),
             (2, 'pop'),
             (3, 'rap'),
             (4, 'rock');


-- добавление musician
INSERT INTO musican (musican_id, musican_name) 
     VALUES (1, 'Ozzy Osbourne'),
            (2, 'Elvis Presley'),
            (3, 'Snoop Dogg'),
            (4, 'John Lennon'),
            (5, 'Selena Gomez'),
            (6, 'Bob Dylan'),
            (7, 'Prince'),
            (8, 'Feel Star');
	

-- добавление genre_musician
INSERT INTO genre_musican (genre_id, musican_id)
     VALUES (1, 1),
            (2, 5),
            (3, 3),
            (4, 2),
            (4, 4),
            (4, 6),
            (2, 7),
            (3, 8),
            (1, 6);

-- добавление album
INSERT INTO album (album_id, album_name, album_release_year)
     VALUES (1, 'Nativity In Black', 1994),
            (2, 'Elvis', 1956),
            (3, 'No Limit Top Dogg', 2022),
            (4, 'Imagine', 2020),
            (5, 'Kiss & Tell', 2019),
            (6, 'Blonde on Blonde', 1966),
            (7, 'Prince feat Kiss', 2020),
            (8, 'Unknown album', 2015),
            (9, 'Prince One', 2016);


-- добавление musican_album
INSERT INTO musican_album (musican_id, album_id)
     VALUES (1, 1),
            (2, 2),
            (3, 3),
            (4, 4),
            (5, 5),
            (6, 6),
            (7, 7),
            (8, 8),
            (6, 8),	
            (7, 9);		

-- добавление track
INSERT INTO track (track_name, track_lenght_seс , album_id)
     VALUES ('No More Tears', 443, 1), 
            ('Time After Time', 260, 1),
            ('Rip It Up', 110, 2),
            ('Love Me', 161, 2),
            ('When My Blue Moon Turns to Gold Again', 138, 2),
            ('Long Tall Sally', 111, 2),
            ('First in Line', 201, 2),
            ('Paralyzed', 138, 2),
            ('Dolomite', 27, 3),
            ('Trust Me', 249, 3),
            ('Snoopafella', 322, 3),
            ('In Love with a Thug', 224, 3),
            ('Imagine',178, 4),
            ('Crippled Inside', 227, 4),
            ('Jealous Guy', 256, 4),
            ('It’s So Hard', 145, 4),
            ('I Don’t Wanna Be a Soldier', 365, 4),
            ('Gimme Some Truth', 196, 4),
            ('Kiss & Tell', 197, 5),
            ('I Won’t Apologize', 186, 5),
            ('Falling Down	Bruner', 185, 5),
            ('I Promise You	Isaac Hasson', 200, 5),
            ('Crush	Bruner', 199, 5),
            ('Naturally', 202, 6),
            ('Just Like a Woman', 293, 6),
            ('Compassion', 237, 7),
            ('Beginning Endlessly', 327, 7),
            ('Future Soul Song', 308, 7),
            ('Sticky Like Glue', 286, 7),
            ('myself', 350, 8),
            ('by myself', 247, 8),
            ('bemy self', 145, 8),
            ('myself by', 247, 8),
            ('by myself by', 333, 8),
            ('beemy', 545, 8),
            ('premyne', 234, 8),
            ('my own', 333, 8),
            ('own my', 243, 8),
            ('my', 123, 8),
            ('oh my god', 215, 8);
            

-- добавление collection_of_hits
INSERT INTO collection_of_hits (collection_of_hits_id, collection_of_hits_name, hits_release_year)
     VALUES (1, 'The Best Rock and Heavy Metal (2016)', 2016),
            (2, 'Greatest Hits (2018)', 2018),
            (3, 'Greatest Hits of Netology (2020)', 2020),
            (4, 'Rock VS DisneyMania (2019)', 2019),
            (5, 'Only Prince HIT (2008)', 2008);

-- добавление collection_track
INSERT INTO collection_track (collection_of_hits_id, track_id)
     VALUES (1, 1),
            (1, 2),
            (1, 5),
            (1, 7),
            (1, 4),
            (2, 9),
            (2, 10),
            (2, 12),
            (2, 13),
            (2, 17),
            (3, 19),
            (3, 20),
            (3, 21),
            (3, 23),
            (3, 7),
            (3, 8),
            (4, 1),
            (4, 2),
            (4, 19),
            (4, 20),
            (4, 21),
            (4, 22),
            (4, 23),
            (5, 26),
            (5, 27),
            (5, 28),
            (5, 29),
            (3, 28);

