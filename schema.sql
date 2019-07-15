DROP TABLE IF EXISTS weathers;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS locations;

CREATE TABLE IF NOT EXISTS locations (
  id SERIAL PRIMARY KEY,
  search_query VARCHAR(255),
  formatted_query VARCHAR(255),
  latitude NUMERIC(10,7),
  longitude NUMERIC(10,7)
);

CREATE TABLE IF NOT EXISTS weathers (
  id SERIAL PRIMARY KEY,
  created_at BIGINT,
  forecast VARCHAR(255),
  time VARCHAR(255),
  location_id INTEGER NOT NULL,
  FOREIGN KEY (location_id) REFERENCES locations (id)
);

CREATE TABLE IF NOT EXISTS events (
  id SERIAL PRIMARY KEY,
  created_at BIGINT,
  link VARCHAR(255),
  name VARCHAR(255),
  event_date DATE,
  summary VARCHAR(255),
  location_id INTEGER NOT NULL,
  FOREIGN KEY (location_id) REFERENCES locations (id)
);

CREATE TABLE IF NOT EXISTS movies (
  id SERIAL PRIMARY KEY,
  created_at BIGINT,
  title VARCHAR(255),
  overview VARCHAR(255),
  average_votes VARCHAR(255),
  total_votes NUMERIC(10, 7),
  image_url VARCHAR(255),
  popularity NUMERIC(10, 7),
  released_on DATE,
  location_id INTEGER NOT NULL,
  FOREIGN KEY (location_id) REFERENCES locations (id)
);

CREATE TABLE IF NOT EXISTS restaurants (
  id SERIAL PRIMARY KEY,
  created_at BIGINT,
  name VARCHAR(255),
  image_url VARCHAR(255),
  price NUMERIC(10, 7),
  rating NUMERIC(10,7),
  url VARCHAR(255),
  location_id INTEGER NOT NULL,
  FOREIGN KEY (location_id) REFERENCES locations (id)
)