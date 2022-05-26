CREATE TABLE IF NOT EXISTS Singers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	genre_id INTEGER CHECK (genre_id > 0)
	);

CREATE TABLE IF NOT EXISTS Albums (
	id_album SERIAL PRIMARY KEY,
	id_singer INTEGER REFERENCES Singers(id),
	title varchar(50) NOT NULL,
	year_production INTEGER CHECK (year_production > 1850 AND year_production < 2023)
    );

CREATE TABLE IF NOT EXISTS Genre_singers (
	id_genre INTEGER REFERENCES Genre(id_genre),
	id_singer INTEGER REFERENCES Singers(id),
	CONSTRAINT Genre_singers_pk PRIMARY KEY (id_genre, id_singer)
	);
              
CREATE TABLE IF NOT EXISTS Genre (
	id_genre SERIAL PRIMARY KEY,
	title VARCHAR(50) 
    );

CREATE TABLE IF NOT EXISTS Tracks (
	id_track SERIAL PRIMARY KEY,
	id_album INTEGER REFERENCES Albums(id_album),
	title VARCHAR(100) NOT NULL,
	duration VARCHAR(30) NOT NULL
	);