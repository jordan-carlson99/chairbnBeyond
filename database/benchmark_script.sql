
-- users table --
\set usr_test random(1, 17)
\set host_test random(1, 4)
\set review_test random(1, 24)
\set booking_test random(1, 24)
\set listing_pic_test random(1, 20)
\set listing_test random(1, 4)
\set listing_amenities_test random(1, 110)
\set amenities_test random(1, 43)
\set amenity_type_test random(1, 14)
\set location_test random(1, 4)

-- servers --

-- about this place --
SELECT hostId, id, description FROM listings WHERE hostId = :host_test;

-- amenities --
SELECT * FROM amenities;
SELECT listing_amenities.id, amenities.amenity FROM listing_amenities JOIN amenities ON amenities.id = listing_amenities.amenityId WHERE listingId = :listing_test;
SELECT listing_amenities.id, amenities.amenity FROM listing_amenities JOIN amenities ON amenities.id = listing_amenities.amenityId WHERE listingId = :listing_test LIMIT 10;

-- gallery --
SELECT * FROM listing_photos;
SELECT photo_url FROM listing_photos WHERE listingid = :listing_test;

--  host --
SELECT fname, lname FROM users WHERE id = :usr_test;
SELECT * FROM hosts WHERE userId = :usr_test;
SELECT * FROM reviews;
SELECT photo_url FROM users WHERE id = :usr_test;

-- map --
SELECT latitude, longitude FROM locations WHERE id = :location_test;
SELECT description FROM listings WHERE id = :location_test;

-- reviews --
SELECT reviews.rating, reviews.review, users.fname, users.photo_url, bookings.enddate FROM reviews JOIN users ON users.id = reviews.userid JOIN bookings ON bookings.id = reviews.bookingid WHERE reviews.listingid = :listing_test;
SELECT reviews.rating, reviews.review, users.fname, users.photo_url, bookings.enddate FROM reviews JOIN users ON users.id = reviews.userid JOIN bookings ON bookings.id = reviews.bookingid WHERE reviews.listingid =  :listing_test;

-- titlebar --
-- SELECT l.id, l.title, l.price, loc.city, ROUND(AVG(r.rating), 2) AS average_rating, SUM(1) AS review_count, json_object_agg(r.id::text, r.review) AS reviews FROM listings l LEFT JOIN reviews r ON l.id = :review_test JOIN locations loc ON :location_test = loc.id WHERE l.id = :listing_test GROUP BY l.id, l.title, loc.city ORDER BY l.id;