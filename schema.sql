CREATE TABLE item (
  id INT SERIAL PRIMARY KEY,
  genre INT REFERENCES genre(id),
  author INT REFERENCES author(id),
  label INT REFERENCES label(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

CREATE TABLE genre (
  id INT PRIMARY KEY,
  name VARCHAR(30) NOT NULL  
);

CREATE TABLE musicAlbum (
  id INT PRIMARY KEY REFERENCES item(id),
  on_spotify BOOLEAN NOT NULL
);
<<<<<<< HEAD

CREATE TABLE game (
  id INT PRIMARY KEY REFERENCES item(id),
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE,
  item_id INT
  FOREIGN KEY (item_id) REFERENCES item(id
);

CREATE TABLE author (
  id INT PRIMARY KEY REFERENCES item(id),
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL  
);
=======
>>>>>>> 5a5a971c082b84bfd16e2cb15dd58f28ff7e23b2
