import type { Animal } from './animal';

/**
 * RFID scan log entry from the database
 * This represents a single scan event stored in the rfid_log table
 */
export type RfidScanLog = {
  id: string;
  scan_time: string;
  user_id: string | null;
  animal_id: string | null;
  rfid_tag: string;
  animal_note: string | null;
  created_at?: string;
};

/**
 * Real-time event payload for RFID scans
 * This is what Supabase Realtime sends when a new scan is inserted
 * Allows for additional fields that Supabase might add
 */
export type RfidLogEvent = {
  id: string;
  scan_time: string;
  user_id: string | null;
  animal_id: string | null;
  rfid_tag: string;
  animal_note: string | null;
  [key: string]: unknown; // Allow additional fields from Supabase
};

/**
 * RFID Scan Data - simplified version for the scan modal
 * Used in components when displaying scan information
 */
export type RfidScanData = {
  id: string;
  scan_time: string;
  user_id: string | null;
  animal_id: string | null;
  rfid_tag: string;
  animal_note: string | null;
};

/**
 * Animal data specific to RFID context
 * This is a subset of Animal without timestamps, used in RFID components
 */
export type AnimalData = Omit<Animal, 'created_at' | 'updated_at'>;

/**
 * Types of notes that can be created for animals during RFID scans
 */
export type NoteType = 'General' | 'Behavioral' | 'Medical' | 'Feeding' | 'Exercise' | 'Grooming' | 'Training';

/**
 * Supabase Realtime channel type
 * Used for typing the realtime subscription channel
 */
export type SupabaseChannel = any; // Will be typed properly once we configure Supabase
