DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS reviews CASCADE;
DROP TABLE IF EXISTS listings CASCADE;
DROP TABLE IF EXISTS bookings CASCADE;
DROP TABLE IF EXISTS amenity_types CASCADE;
DROP TABLE IF EXISTS amenities CASCADE;
DROP TABLE IF EXISTS listing_amenities CASCADE;
DROP TABLE IF EXISTS hosts CASCADE;
DROP TABLE IF EXISTS listing_photos CASCADE;

CREATE TABLE users (
    id serial PRIMARY KEY,
    fname text NOT NULL,
    lname text NOT NULL,
    email text NOT NULL ,
    password TEXT NOT NULL
);

CREATE TABLE hosts(
    id serial PRIMARY KEY,
    userId integer NOT NULL,
    about text NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(id)
);

CREATE TABLE listings (
    id serial PRIMARY KEY,
    title text,
    description text,
    price integer,
    location text,
    hostId integer NOT NULL,
    FOREIGN KEY (hostId) REFERENCES hosts(id)
);

CREATE TABLE listing_photos(
    id serial PRIMARY KEY,
    listingId integer NOT NULL,
    photo_url text NOT NULL,
    FOREIGN KEY (listingId) REFERENCES listings(id)
);

CREATE TABLE reviews (
    id serial PRIMARY KEY,
    listingId integer NOT NULL,
    userId integer NOT NULL,
    rating integer NOT NULL,
    review text,
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (listingId) REFERENCES listings(id)
);

CREATE TABLE bookings (
    id serial PRIMARY KEY,
    listingId integer NOT NULL,
    userId integer NOT NULL,
    startDate date NOT NULL,
    endDate date NOT NULL,
    numGuests integer NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (listingId) REFERENCES listings(id)
);

CREATE TABLE amenity_types(
    id serial PRIMARY KEY,
    amenity_type text NOT NULL
);

CREATE TABLE amenities(
    id serial PRIMARY KEY,
    amenity text NOT NULL,
    typeId integer NOT NULL,
    FOREIGN KEY (typeId) REFERENCES amenity_types(id)
);

CREATE TABLE listing_amenities(
    id serial PRIMARY KEY,
    listingId integer NOT NULL,
    amenityId integer NOT NULL,
    FOREIGN KEY (listingId) REFERENCES listings(id),
    FOREIGN KEY (amenityId) REFERENCES amenities(id)
);
