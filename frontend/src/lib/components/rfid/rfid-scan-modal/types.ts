/**
 * Shared types for RFID Scan Modal components
 */

export type RfidScanData = {
  id: string;
  scan_time: string;
  user_id: string | null;
  animal_id: string | null;
  rfid_tag: string;
  animal_note: string | null;
};

export type AnimalData = {
  id: string;
  name: string;
  species: string;
  breed?: string;
  fur_colour?: string;
  weight_kg?: number;
  date_of_birth?: string;
  arrival_date?: string;
  adoption_status?: string;
  special_needs?: string;
  description?: string;
  rfid_tag?: string;
};

export type NoteType = 'General' | 'Behavioral' | 'Medical' | 'Feeding' | 'Exercise' | 'Grooming' | 'Training';
