-- =====================================================
-- DEMO SEED DATA: Famous Movie Animals
-- =====================================================
-- This script populates the animal table with 23 famous animals from movies/TV
-- Created: 2025-12-01
-- Usage: Copy and paste into Supabase Studio SQL Editor

-- Insert 23 famous movie animals
INSERT INTO animal (name, date_of_birth, species, breed, fur_colour, weight_kg, arrival_date, neutered, adoption_status, rfid_tag, description) VALUES

-- DOGS (9 total)
('Beethoven', '2018-04-15', 'Dog', 'St. Bernard', 'Brown and White', 68.5, '2024-09-12', TRUE, 'Available', 'RFID_DOG001', 'Lovable giant dog with a heart of gold. Very drool-y but incredibly gentle with children. Needs a large yard and patient family.'),
('Marley', '2019-07-22', 'Dog', 'Labrador Retriever', 'Golden', 32.4, '2024-08-05', TRUE, 'Adopted', 'RFID_DOG002', 'Energetic and mischievous lab who loves life. May chew furniture and cause chaos, but will steal your heart. Best dog ever.'),
('Lassie', '2017-03-10', 'Dog', 'Rough Collie', 'Sable and White', 28.6, '2024-07-18', TRUE, 'Available', 'RFID_DOG003', 'Intelligent and heroic collie. Will rescue you from wells, fires, and bad decisions. Excellent with families and children.'),
('Scooby-Doo', '2016-09-13', 'Dog', 'Great Dane', 'Brown', 72.3, '2024-10-01', TRUE, 'Available', 'RFID_DOG004', 'Cowardly but loveable Great Dane. Scared of everything except Scooby Snacks. Would do anything for food. Mystery-solving optional.'),
('Hooch', '2018-11-28', 'Dog', 'Dogue de Bordeaux', 'Red Fawn', 54.2, '2024-09-22', TRUE, 'Pending', 'RFID_DOG005', 'Massive drooling detective partner. Slobber not included (actually, it is). Protective, loyal, and messy. Very messy.'),
('Toto', '2020-05-14', 'Dog', 'Cairn Terrier', 'Black', 6.8, '2024-08-30', TRUE, 'Available', 'RFID_DOG006', 'Small but brave terrier. Will follow you to Oz and back. Not a fan of witches or tornados. Loves ruby slippers.'),
('Lady', '2019-02-14', 'Dog', 'Cocker Spaniel', 'Buff', 12.5, '2024-07-25', TRUE, 'Available', 'RFID_DOG007', 'Elegant and refined cocker spaniel. Enjoys spaghetti dinners by candlelight. Looking for someone to share meatballs with.'),
('Tramp', '2018-08-09', 'Dog', 'Mixed Breed', 'Gray', 11.2, '2024-07-25', TRUE, 'Available', 'RFID_DOG008', 'Street-smart charmer with a heart of gold. Knows all the best restaurants. Will romance your socks off. Bonded with Lady.'),
('Bolt', '2020-01-20', 'Dog', 'White German Shepherd', 'White', 35.7, '2024-09-15', TRUE, 'Available', 'RFID_DOG009', 'Believes he has superpowers (he doesn''t). Former TV star adjusting to normal dog life. Incredibly loyal and protective.'),

-- CATS (6 total)
('Garfield', '2016-06-19', 'Cat', 'Exotic Shorthair', 'Orange', 8.2, '2024-08-12', TRUE, 'Available', 'RFID_CAT001', 'Lasagna-loving cat with attitude. Hates Mondays, loves sleeping. Requires 18+ hours of sleep per day and unlimited pasta. Comes with sarcasm.'),
('Tom', '2017-11-03', 'Cat', 'Domestic Shorthair', 'Gray and White', 5.4, '2024-09-08', TRUE, 'Available', 'RFID_CAT002', 'Ambitious but unsuccessful mouse-catcher. Musical talent (plays piano poorly). Frequently outmaneuvered by smaller rodents.'),
('Salem', '2015-10-31', 'Cat', 'Bombay', 'Black', 4.9, '2024-07-13', TRUE, 'Adopted', 'RFID_CAT003', 'Sarcastic talking cat (okay, he doesn''t actually talk). Former witch''s familiar with opinions about everything. Knows magic (maybe).'),
('Cheshire', '2019-04-01', 'Cat', 'British Shorthair', 'Gray Tabby', 6.1, '2024-08-20', TRUE, 'Available', 'RFID_CAT004', 'Mysterious cat with permanent grin. Appears and disappears at will (or just hides really well). Offers cryptic advice and riddles.'),
('Duchess', '2018-07-17', 'Cat', 'Turkish Angora', 'White', 3.8, '2024-09-03', TRUE, 'Available', 'RFID_CAT005', 'Aristocratic and elegant white cat. Teaches her kittens manners and music. Very posh. Prefers cream over milk.'),
('Puss', '2017-12-25', 'Cat', 'Orange Tabby', 'Orange', 4.2, '2024-10-10', TRUE, 'Available', 'RFID_CAT006', 'Swashbuckling adventurer cat. Wears tiny boots (boots not included). Master of the "cute eyes" technique. En garde!'),

-- RABBITS (3 total)
('Thumper', '2021-03-15', 'Rabbit', 'Eastern Cottontail', 'Gray', 1.8, '2024-08-08', TRUE, 'Available', 'RFID_RAB001', 'Energetic young rabbit who can''t stop thumping. Says whatever comes to mind. Great at making friends. Loves ice skating.'),
('Peter', '2020-04-10', 'Rabbit', 'European Rabbit', 'Brown', 2.1, '2024-07-30', TRUE, 'Pending', 'RFID_RAB002', 'Mischievous garden raider with blue jacket. Frequently gets into trouble with farmers. Fast runner. Lettuce enthusiast.'),
('Roger', '2019-06-21', 'Rabbit', 'American Rabbit', 'White', 2.4, '2024-09-18', TRUE, 'Available', 'RFID_RAB003', 'Cartoon rabbit married to human woman (don''t ask). Very animated personality. Enjoys jokes and making people laugh.'),

-- BIRDS (3 total)
('Tweety', '2022-05-12', 'Bird', 'Canary', 'Yellow', 0.02, '2024-08-25', FALSE, 'Available', 'RFID_BIRD001', 'Adorable yellow canary with speech impediment. Frequently pursued by cats. Smarter than she looks. "I tawt I taw a puddy tat!"'),
('Iago', '2018-09-08', 'Bird', 'Scarlet Macaw', 'Red and Blue', 0.9, '2024-07-28', FALSE, 'Available', 'RFID_BIRD002', 'Sarcastic parrot with attitude. Former villain turned good guy. Excellent talker. May scheme occasionally but means well. Mostly.'),
('Hedwig', '2019-07-31', 'Bird', 'Snowy Owl', 'White', 1.6, '2024-10-05', FALSE, 'Medical Hold', 'RFID_BIRD003', 'Loyal and intelligent snowy owl. Delivers mail with 100% accuracy. Currently recovering from minor wing injury. Magical companion.'),

-- GUINEA PIG (1 total)
('Darwin', '2021-02-28', 'Guinea Pig', 'American Guinea Pig', 'Brown and White', 0.9, '2024-09-12', TRUE, 'Available', 'RFID_GP001', 'Genius guinea pig from G-Force special ops team. Knows martial arts (for a guinea pig). Mission: find loving home. Highly intelligent.'),

-- OTHER (2 total)
('Babe', '2022-01-15', 'Other', 'Yorkshire Pig', 'Pink', 45.3, '2024-08-16', TRUE, 'Available', 'RFID_OTHER001', 'That''ll do, pig. That''ll do. Aspiring sheep-herder with big dreams. Polite, kind, and determined. Talks to other animals.'),
('Stuart', '2023-04-05', 'Other', 'Mouse', 'White', 0.03, '2024-09-28', TRUE, 'Available', 'RFID_OTHER002', 'Tiny mouse with big heart. Adopted by human family (looking for another). Excellent driver of toy cars. Brave adventurer despite size.');

-- Set bonded pairs
-- Lady and Tramp are bonded (classic love story)
UPDATE animal SET bonded_with = (SELECT id FROM animal WHERE name = 'Tramp') WHERE name = 'Lady';
UPDATE animal SET bonded_with = (SELECT id FROM animal WHERE name = 'Lady') WHERE name = 'Tramp';

-- Summary of inserted data
-- Total animals: 23
-- Dogs: 9 (Beethoven, Marley, Lassie, Scooby-Doo, Hooch, Toto, Lady, Tramp, Bolt)
-- Cats: 6 (Garfield, Tom, Salem, Cheshire, Duchess, Puss)
-- Rabbits: 3 (Thumper, Peter, Roger)
-- Birds: 3 (Tweety, Iago, Hedwig)
-- Guinea Pigs: 1 (Darwin)
-- Other: 2 (Babe, Stuart Little)
--
-- Adoption statuses:
-- Available: 18
-- Pending: 2 (Hooch, Peter)
-- Adopted: 2 (Marley, Salem)
-- Medical Hold: 1 (Hedwig)
--
-- Bonded pairs: 1 (Lady & Tramp)
