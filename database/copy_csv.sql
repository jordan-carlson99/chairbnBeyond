COPY users(fname,lname,email,password, photo_url) FROM '/tmp/csv/test_users.csv' DELIMITER ',' CSV HEADER;
COPY reviews(listingId, userId, review, rating, cleanliness, communication, checkin, accuracy, location, value, bookingId) FROM '/tmp/csv/test_reviews.csv' DELIMITER ',' CSV HEADER;
COPY locations(latitude, longitude, city) FROM '/tmp/csv/test_locs.csv' DELIMITER ',' CSV HEADER;
COPY listings(title, description, price, locationid, hostId) FROM '/tmp/csv/test_listings.csv' DELIMITER ',' CSV HEADER;
COPY listing_photos(listingId, photo_url) FROM '/tmp/csv/test_listing_photos.csv' DELIMITER ',' CSV HEADER;
COPY listing_amenities(listingid, amenityid ) FROM '/tmp/csv/test_listing_amenities.csv' DELIMITER ',' CSV HEADER;
COPY hosts(userId, about) FROM '/tmp/csv/test_hosts.csv' DELIMITER ',' CSV HEADER;
COPY bookings(listingId, userId, startDate, endDate, numGuests) FROM '/tmp/csv/test_bookings.csv' DELIMITER ',' CSV HEADER;
COPY amenity_types(amenity_type) FROM '/tmp/csv/test_amenity_types.csv' DELIMITER ',' CSV HEADER;
COPY amenities(amenity, typeId) FROM '/tmp/csv/test_amenities.csv' DELIMITER ',' CSV HEADER;
