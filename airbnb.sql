-- Find a neighborhood where you can sleep on a real bed in a villa with internet while paying the lowest price possible.
create table if not exists airbnb (
	id INT,
	price DECIMAL(5,2),
	property_type VARCHAR(9),
	room_type VARCHAR(15),
	amenities VARCHAR(16),
	accommodates INT,
	bathrooms INT,
	bed_type VARCHAR(13),
	cancellation_policy VARCHAR(20),
	cleaning_fee VARCHAR(50),
	city VARCHAR(50),
	host_identity_verified VARCHAR(5),
	host_response_rate INT,
	host_since DATE,
	neighbourhood VARCHAR(10),
	number_of_reviews INT,
	review_scores_rating INT,
	zipcode VARCHAR(50) NOT NULL,
	bedrooms INT,
	beds INT
);
-- MySQL DATE syntax
insert into airbnb (id, price, property_type, room_type, amenities, accommodates, bathrooms, bed_type, cancellation_policy, cleaning_fee, city, host_identity_verified, host_response_rate, host_since, neighbourhood, number_of_reviews, review_scores_rating, zipcode, bedrooms, beds) values (1, 578.53, 'Condo', 'Entire home/apt', 'Heating', 5, 3, 'Pull-out Sofa', 'Super Strict 30 Days', false, 'Lagyná', 'True', 96, '2010-06-22', 'Midtown', 5, 51, '06115', 2, 2);
insert into airbnb (id, price, property_type, room_type, amenities, accommodates, bathrooms, bed_type, cancellation_policy, cleaning_fee, city, host_identity_verified, host_response_rate, host_since, neighbourhood, number_of_reviews, review_scores_rating, zipcode, bedrooms, beds) values (2, 497.86, 'House', 'Private room', 'Wifi', 2, 1, 'Airbed', 'Super Strict 60 Days', false, 'Lianpeng', 'False', 19, '2014-12-20', 'Suburbs', 21, 45, '06115', 3, 3);
insert into airbnb (id, price, property_type, room_type, amenities, accommodates, bathrooms, bed_type, cancellation_policy, cleaning_fee, city, host_identity_verified, host_response_rate, host_since, neighbourhood, number_of_reviews, review_scores_rating, zipcode, bedrooms, beds) values (3, 596.84, 'Villa', 'Entire home/apt', 'Air conditioning', 4, 1, 'Futon', 'Strict', false, 'Dukuhsawah', 'True', 77, '2005-04-08', 'Beachfront', 14, 92, '06115', 1, 5);
insert into airbnb (id, price, property_type, room_type, amenities, accommodates, bathrooms, bed_type, cancellation_policy, cleaning_fee, city, host_identity_verified, host_response_rate, host_since, neighbourhood, number_of_reviews, review_scores_rating, zipcode, bedrooms, beds) values (4, 651.4, 'Villa', 'Entire home/apt', 'Kitchen', 4, 2, 'Airbed', 'Strict', false, 'Liuzhi', 'True', 21, '2006-07-14', 'Midtown', 14, 70, '06115', 2, 4);
insert into airbnb (id, price, property_type, room_type, amenities, accommodates, bathrooms, bed_type, cancellation_policy, cleaning_fee, city, host_identity_verified, host_response_rate, host_since, neighbourhood, number_of_reviews, review_scores_rating, zipcode, bedrooms, beds) values (5, 322.17, 'Condo', 'Entire home/apt', 'Gym', 2, 2, 'Futon', 'Super Strict 30 Days', true, 'Kuwumkumambal', 'True', 64, '2017-07-14', 'Downtown', 44, 43, '06115', 2, 2);
insert into airbnb (id, price, property_type, room_type, amenities, accommodates, bathrooms, bed_type, cancellation_policy, cleaning_fee, city, host_identity_verified, host_response_rate, host_since, neighbourhood, number_of_reviews, review_scores_rating, zipcode, bedrooms, beds) values (6, 216.96, 'House', 'Shared room', 'Kitchen', 5, 3, 'Sofa Bed', 'Flexible', false, 'Övertorneå', 'True', 85, '2002-08-13', 'Uptown', 31, 82, '957 32', 4, 4);
insert into airbnb (id, price, property_type, room_type, amenities, accommodates, bathrooms, bed_type, cancellation_policy, cleaning_fee, city, host_identity_verified, host_response_rate, host_since, neighbourhood, number_of_reviews, review_scores_rating, zipcode, bedrooms, beds) values (7, 163.56, 'House', 'Entire home/apt', 'Pool', 5, 2, 'Airbed', 'Strict', true, 'Mae Sai', 'False', 84, '2008-08-24', 'Beachfront', 49, 47, '57130', 2, 2);
insert into airbnb (id, price, property_type, room_type, amenities, accommodates, bathrooms, bed_type, cancellation_policy, cleaning_fee, city, host_identity_verified, host_response_rate, host_since, neighbourhood, number_of_reviews, review_scores_rating, zipcode, bedrooms, beds) values (8, 328.08, 'Apartment', 'Entire home/apt', 'Dryer', 5, 3, 'Airbed', 'Super Strict 30 Days', true, 'Kuanheum', 'False', 80, '2018-07-30', 'Beachfront', 48, 76, '06115', 3, 1);
insert into airbnb (id, price, property_type, room_type, amenities, accommodates, bathrooms, bed_type, cancellation_policy, cleaning_fee, city, host_identity_verified, host_response_rate, host_since, neighbourhood, number_of_reviews, review_scores_rating, zipcode, bedrooms, beds) values (9, 481.52, 'Townhouse', 'Entire home/apt', 'Kitchen', 3, 4, 'Sofa Bed', 'Flexible', true, 'Noupoort', 'True', 35, '2018-01-01', 'Uptown', 45, 66, '5950', 1, 5);
insert into airbnb (id, price, property_type, room_type, amenities, accommodates, bathrooms, bed_type, cancellation_policy, cleaning_fee, city, host_identity_verified, host_response_rate, host_since, neighbourhood, number_of_reviews, review_scores_rating, zipcode, bedrooms, beds) values (10, 215.02, 'Villa', 'Shared room', 'Gym', 1, 1, 'Real Bed', 'Strict', true, 'Selmes', 'True', 71, '2001-09-17', 'Uptown', 31, 54, '7960-155', 2, 2);
insert into airbnb (id, price, property_type, room_type, amenities, accommodates, bathrooms, bed_type, cancellation_policy, cleaning_fee, city, host_identity_verified, host_response_rate, host_since, neighbourhood, number_of_reviews, review_scores_rating, zipcode, bedrooms, beds) values (11, 178.91, 'Villa', 'Entire home/apt', 'Free parking', 5, 4, 'Pull-out Sofa', 'Moderate', false, 'Karaundi', 'True', 77, '2006-07-01', 'Midtown', 48, 70, '30001', 3, 3);
insert into airbnb (id, price, property_type, room_type, amenities, accommodates, bathrooms, bed_type, cancellation_policy, cleaning_fee, city, host_identity_verified, host_response_rate, host_since, neighbourhood, number_of_reviews, review_scores_rating, zipcode, bedrooms, beds) values (12, 314.29, 'Townhouse', 'Shared room', 'Gym', 2, 4, 'Real Bed', 'Super Strict 60 Days', false, 'Ditang', 'False', 49, '2001-02-11', 'Uptown', 23, 67, '06115', 3, 4);
insert into airbnb (id, price, property_type, room_type, amenities, accommodates, bathrooms, bed_type, cancellation_policy, cleaning_fee, city, host_identity_verified, host_response_rate, host_since, neighbourhood, number_of_reviews, review_scores_rating, zipcode, bedrooms, beds) values (13, 395.77, 'Townhouse', 'Entire home/apt', 'Wifi', 1, 1, 'Futon', 'Flexible', true, 'Yandang', 'True', 58, '2005-01-21', 'Uptown', 28, 95, '06115', 1, 3);
insert into airbnb (id, price, property_type, room_type, amenities, accommodates, bathrooms, bed_type, cancellation_policy, cleaning_fee, city, host_identity_verified, host_response_rate, host_since, neighbourhood, number_of_reviews, review_scores_rating, zipcode, bedrooms, beds) values (14, 495.55, 'Villa', 'Private room', 'Free parking', 5, 4, 'Sofa Bed', 'Super Strict 30 Days', true, 'El Bolsón', 'True', 38, '2018-08-17', 'Suburbs', 9, 41, '8430', 1, 3);
insert into airbnb (id, price, property_type, room_type, amenities, accommodates, bathrooms, bed_type, cancellation_policy, cleaning_fee, city, host_identity_verified, host_response_rate, host_since, neighbourhood, number_of_reviews, review_scores_rating, zipcode, bedrooms, beds) values (15, 550.39, 'Apartment', 'Entire home/apt', 'Dryer', 3, 2, 'Sofa Bed', 'Strict', false, 'Krynki', 'False', 53, '2003-12-01', 'Midtown', 25, 44, '16-120', 3, 1);

select neighbourhood from airbnb_search_details WHERE bed_type = 'Real Bed' and property_type = 'Villa' and LOWER(amenities) LIKE '%internet%' ORDER BY price ASC LIMIT 1;

