<script lang="ts">
  import { supabase } from "$lib/supabaseClient.js";
  import { Button } from "$lib/components/ui/button/index.js";
  import { Textarea } from "$lib/components/ui/textarea/index.js";
  import * as Dialog from "$lib/components/ui/dialog/index.js";
  import * as Select from "$lib/components/ui/select/index.js";
  import { toast } from "svelte-sonner";
  import type { AnimalData, RfidScanData, NoteType } from './types';

  type Props = {
    animalData: AnimalData;
    scanData: RfidScanData | null;
    userID: string | null;
    onClose: () => void;
  };

  const { animalData, scanData, userID, onClose }: Props = $props();

  let newNoteData = $state("");
  let newNoteType = $state<NoteType>("General");

  const noteTypes: Array<{ value: NoteType; label: string }> = [
    { value: "General", label: "General" },
    { value: "Behavioral", label: "Behavioral" },
    { value: "Medical", label: "Medical" },
    { value: "Feeding", label: "Feeding" },
    { value: "Exercise", label: "Exercise" },
    { value: "Grooming", label: "Grooming" },
    { value: "Training", label: "Training" },
  ];

  const triggerContent = $derived(
    noteTypes.find((f) => f.value === newNoteType)?.label ?? "Select a note type"
  );

  async function createNewNote() {
    if (!newNoteData.trim()) {
      toast.error("Please enter note content");
      return;
    }

    try {
      // Insert a new note
      const { error } = await supabase.from("animal_note").insert([
        {
          animal_id: animalData.id,
          user_id: userID,
          note_content: newNoteData,
          note_type: newNoteType,
        },
      ]);

      if (error) {
        toast.error("Failed to create note: " + error.message);
        return;
      }

      // Fetch the created note
      const { data: dbNoteData, error: fetchError } = await supabase
        .from("animal_note")
        .select("id")
        .eq("animal_id", animalData.id)
        .eq("user_id", userID)
        .eq("note_content", newNoteData)
        .eq("note_type", newNoteType)
        .single();

      if (fetchError || !dbNoteData) {
        toast.error("Note created but failed to link to scan");
        return;
      }

      // Update the RFID log entry to link it to this note
      if (dbNoteData.id && scanData?.id) {
        const { error: updateError } = await supabase
          .from("rfid_log")
          .update({ animal_note: dbNoteData.id })
          .eq("id", scanData.id);

        if (updateError) {
          console.error("Error linking note to RFID log:", updateError);
        }
      }

      toast.success("Note created successfully");
      newNoteData = "";
      newNoteType = "General";
      onClose();
    } catch (error: any) {
      console.error("Error creating note:", error);
      toast.error("Failed to create note: " + error.message);
    }
  }
</script>

<Dialog.Root>
  <Dialog.Trigger asChild let:builder>
    <Button builders={[builder]} variant="outline">Add Note</Button>
  </Dialog.Trigger>
  <Dialog.Content>
    <Dialog.Title>Add a note for this animal</Dialog.Title>
    <Dialog.Description>
      <Textarea id="note" class="mb-3" bind:value={newNoteData} />
      <Select.Root type="single" name="noteType" bind:value={newNoteType}>
        <Select.Trigger class="w-[180px]">
          {triggerContent}
        </Select.Trigger>
        <Select.Content>
          <Select.Group>
            <Select.Label>Note Types</Select.Label>
            {#each noteTypes as noteType (noteType.value)}
              <Select.Item value={noteType.value} label={noteType.label}>
                {noteType.label}
              </Select.Item>
            {/each}
          </Select.Group>
        </Select.Content>
      </Select.Root>
    </Dialog.Description>

    <Dialog.Footer>
      <Button variant="outline" onclick={createNewNote}>Create note</Button>
    </Dialog.Footer>
  </Dialog.Content>
</Dialog.Root>
