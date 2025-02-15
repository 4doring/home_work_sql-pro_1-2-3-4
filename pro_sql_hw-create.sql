
-- создание таблицы genre
CREATE TABLE IF NOT EXISTS genre (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(20) NOT NULL UNIQUE
);


-- создание таблицы Musican
CREATE TABLE IF NOT EXISTS musican (
    musican_id SERIAL PRIMARY KEY,
    musican_name VARCHAR(40) NOT NULL
);


-- создание таблицы genre-musican (many to many)
CREATE TABLE IF NOT EXISTS genre_musican (
    genre_id INTEGER REFERENCES genre(genre_id),
    musican_id INTEGER REFERENCES musican(musican_id),
    CONSTRAINT pk_GM PRIMARY KEY (genre_id, musican_id)
);


-- создание таблицы album
CREATE TABLE IF NOT EXISTS album (
    album_id SERIAL PRIMARY KEY,
    album_name VARCHAR(40) NOT NULL,
    album_release_year INTEGER NOT NULL CHECK (album_release_year BETWEEN 1900 AND 3000)
);


-- создание таблицы musician-album (many to many)
CREATE TABLE IF NOT EXISTS musican_album (
    musican_id INTEGER REFERENCES musican(musican_id),
    album_id INTEGER REFERENCES album(album_id),
    CONSTRAINT pk_MA PRIMARY KEY (musican_id, album_id)
);


-- создание таблицы collection_of_hits
CREATE TABLE IF NOT EXISTS collection_of_hits (
    collection_of_hits_id SERIAL PRIMARY KEY,
    collection_of_hits_name VARCHAR(80) NOT NULL,
    hits_release_year INTEGER NOT NULL CHECK (hits_release_year BETWEEN 1900 AND 3000)
);


-- создание таблицы track
CREATE TABLE IF NOT EXISTS track (
    track_id SERIAL PRIMARY KEY,
    track_name VARCHAR(80) NOT NULL,
    track_lenght_seс INTEGER NOT NULL CHECK (Track_lenght_seс BETWEEN 1 AND 3600),
    album_id INTEGER REFERENCES album(album_id)
);


-- создание таблицы collection_of_hits-track (many to many)
CREATE TABLE IF NOT EXISTS collection_Track (
    collection_of_hits_id INTEGER REFERENCES collection_of_hits(collection_of_hits_id),
    track_id INTEGER REFERENCES track(track_id),
    CONSTRAINT pk_CT PRIMARY KEY (collection_of_hits_id, track_id)
);
