-- =====================================================
-- DEMO SEED DATA: RFID Scan Logs
-- =====================================================
-- This script populates the rfid_log table with 30 realistic scan events
-- Created: 2025-12-01
-- Usage: Copy and paste into Supabase Studio SQL Editor
-- Note: Run demo-animals.sql FIRST before running this script

-- Insert 30 RFID scan logs spread over the past few months
-- These logs show realistic shelter activity: check-ins, feeding, exercise, vet visits, etc.

INSERT INTO rfid_log (scan_time, user_id, animal_id, rfid_tag) VALUES

-- November 2024 scans (most recent)
('2024-11-30 09:15:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Beethoven'), 'RFID_DOG001'),
('2024-11-30 10:30:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Scooby-Doo'), 'RFID_DOG004'),
('2024-11-29 14:20:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Garfield'), 'RFID_CAT001'),
('2024-11-29 16:45:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Thumper'), 'RFID_RAB001'),
('2024-11-28 08:00:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Lassie'), 'RFID_DOG003'),
('2024-11-28 11:30:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Lady'), 'RFID_DOG007'),
('2024-11-28 11:35:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Tramp'), 'RFID_DOG008'),
('2024-11-27 15:10:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Puss'), 'RFID_CAT006'),
('2024-11-27 13:25:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Darwin'), 'RFID_GP001'),
('2024-11-26 09:50:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Babe'), 'RFID_OTHER001'),

-- October 2024 scans
('2024-10-25 10:15:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Tweety'), 'RFID_BIRD001'),
('2024-10-24 14:30:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Tom'), 'RFID_CAT002'),
('2024-10-23 08:45:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Hooch'), 'RFID_DOG005'),
('2024-10-22 16:20:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Duchess'), 'RFID_CAT005'),
('2024-10-21 11:00:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Peter'), 'RFID_RAB002'),
('2024-10-20 09:30:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Bolt'), 'RFID_DOG009'),
('2024-10-19 15:45:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Iago'), 'RFID_BIRD002'),
('2024-10-18 13:15:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Cheshire'), 'RFID_CAT004'),
('2024-10-17 10:50:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Roger'), 'RFID_RAB003'),
('2024-10-16 08:20:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Toto'), 'RFID_DOG006'),

-- September 2024 scans
('2024-09-30 14:10:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Stuart'), 'RFID_OTHER002'),
('2024-09-28 11:40:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Beethoven'), 'RFID_DOG001'),
('2024-09-25 09:25:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Scooby-Doo'), 'RFID_DOG004'),
('2024-09-22 15:30:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Garfield'), 'RFID_CAT001'),
('2024-09-20 10:15:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Lassie'), 'RFID_DOG003'),

-- August 2024 scans (older activity)
('2024-08-30 13:50:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Thumper'), 'RFID_RAB001'),
('2024-08-28 08:30:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Lady'), 'RFID_DOG007'),
('2024-08-28 08:32:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Tramp'), 'RFID_DOG008'),
('2024-08-25 16:05:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Darwin'), 'RFID_GP001'),
('2024-08-20 12:20:00', '8f7ebedb-63b2-46a7-9be5-e70f1a9c1111', (SELECT id FROM animal WHERE name = 'Babe'), 'RFID_OTHER001');

-- Summary of inserted data
-- Total RFID scans: 30
-- Time range: August 2024 - November 2024 (4 months)
-- Distribution:
--   November 2024: 10 scans (most recent activity)
--   October 2024: 10 scans
--   September 2024: 5 scans
--   August 2024: 5 scans (oldest activity)
--
-- Most scanned animals:
--   Beethoven: 2 scans
--   Scooby-Doo: 2 scans
--   Garfield: 2 scans
--   Lassie: 2 scans
--   Lady & Tramp: 2 scans each (bonded pair)
--   All others: 1 scan each
--
-- Note: user_id is NULL for all scans as we don't have volunteer/user data yet
-- Note: animal_note is NULL for all scans (could be added in future enhancement)
