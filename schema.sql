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

CREATE TABLE books (
  id INTEGER PRIMARY KEY,
  publisher TEXT NOT NULL,
  cover_state TEXT NOT NULL,
  item_id INTEGER NOT NULL,
  FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE label (
  id INTEGER PRIMARY KEY,
  color TEXT NOT NULL,
  title TEXT NOT NULL
);