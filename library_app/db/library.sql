DROP TABLE loans;
DROP TABLE book_topic_join;
DROP TABLE topics;
DROP TABLE books;
DROP TABLE borrowers;

CREATE TABLE borrowers (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE books (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255),
  published_date INT,
  price FLOAT,
  bought_date INT
);

CREATE TABLE topics (
  id SERIAL4 PRIMARY KEY,
  topic VARCHAR(255)
);

CREATE TABLE book_topic_join (
  id SERIAL4 PRIMARY KEY,
  book_id INT4 REFERENCES books(id) ON DELETE CASCADE,
  topic_id INT4 REFERENCES topics(id) ON DELETE CASCADE
);

CREATE TABLE loans (
  id SERIAL4 PRIMARY KEY,
  borrower_id INT4 REFERENCES borrowers(id)ON DELETE CASCADE,
  book_id INT4 REFERENCES books(id) ON DELETE CASCADE
);
