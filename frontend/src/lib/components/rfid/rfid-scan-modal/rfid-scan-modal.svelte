<script lang="ts">
  import * as Dialog from "$lib/components/ui/dialog/index.js";
  import { Button } from "$lib/components/ui/button/index.js";
  import { Separator } from "$lib/components/ui/separator/index.js";
  import { ScrollArea } from "$lib/components/ui/scroll-area/index.js";
  import RfidScanDetailsSection from './rfid-scan-details-section.svelte';
  import AnimalDetailSection from './animal-detail-section.svelte';
  import AnimalEditSection from './animal-edit-section.svelte';
  import RfidAssignmentSection from './rfid-assignment-section.svelte';
  import AnimalNoteSection from './animal-note-section.svelte';
  import type { RfidScanData, AnimalData } from './types';

  type Props = {
    userID: string | null;
    animalData: AnimalData | null;
    rfidTag: string | null;
    scanData: RfidScanData | null;
    dialogOpen: boolean;
    onClose: () => void;
  };

  const {
    userID,
    animalData,
    rfidTag,
    scanData,
    dialogOpen,
    onClose,
  }: Props = $props();

  let editing = $state(false);
  let hasLocalChanges = $state(false);

  // Local copies of prop data that can be modified
  let localAnimalData = $state<AnimalData | null>(animalData);
  let localRfidTag = $state<string | null>(rfidTag);

  // Sync local state with props when they change (but only if no local changes)
  $effect(() => {
    if (!hasLocalChanges) {
      localAnimalData = animalData;
    }
  });

  $effect(() => {
    if (!hasLocalChanges) {
      localRfidTag = rfidTag;
    }
  });

  // Local state for dialog open/close handling
  let localDialogOpen = $state(false);

  // Sync local dialog state with prop
  $effect(() => {
    localDialogOpen = dialogOpen;
    // Reset local changes flag when dialog opens/closes
    if (!dialogOpen) {
      hasLocalChanges = false;
      editing = false;
    }
  });

  function handleSave(updatedData: AnimalData) {
    localAnimalData = updatedData;
    hasLocalChanges = true;
    editing = false;
  }

  function handleAssignSuccess(assignedAnimalData: AnimalData) {
    localAnimalData = assignedAnimalData;
    localRfidTag = null;
    hasLocalChanges = true;
  }
</script>

<Dialog.Root
  bind:open={localDialogOpen}
  onOpenChange={(open) => {
    if (!open) {
      onClose();
    }
  }}
>
  <Dialog.Content
    class="max-w-lg w-full rounded-xl border bg-white dark:bg-neutral-900 shadow-lg overflow-hidden"
  >
    <Dialog.Header class="px-6 pt-5 pb-4">
      <div class="flex items-start gap-3">
        <div
          class="shrink-0 p-2 rounded-md bg-indigo-100 dark:bg-indigo-500/20 text-indigo-600 dark:text-indigo-300"
        >
          <svg
            viewBox="0 0 24 24"
            class="w-5 h-5"
            fill="none"
            stroke="currentColor"
            stroke-width="1.8"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M4 8a8 8 0 0 1 8-8m0 16a8 8 0 0 0 8-8M9 8a3 3 0 1 1 6 0 8 8 0 0 1-8 8"
            />
          </svg>
        </div>
        <div class="flex-1 space-y-1">
          <Dialog.Title class="text-base font-semibold">
            RFID Scan Detected
          </Dialog.Title>
          <Dialog.Description
            class="text-sm text-neutral-500 dark:text-neutral-400 leading-snug"
          >
            {#if localAnimalData}
              Animal scan detected for <span
                class="font-medium text-neutral-900 dark:text-neutral-100"
                >{localAnimalData.name}</span
              >
            {:else}
              A new RFID scan has been detected.
            {/if}
          </Dialog.Description>
        </div>
        {#if localAnimalData}
          <Button
            variant="ghost"
            size="sm"
            class="mt-1"
            onclick={() => (editing = !editing)}
          >
            {editing ? "Cancel" : "Edit"}
          </Button>
        {/if}
      </div>
    </Dialog.Header>

    <Separator />

    <ScrollArea class="max-h-[60vh]">
      <div class="px-6 py-5 space-y-8">
        <!-- Scan Details Section -->
        <RfidScanDetailsSection {scanData} />

        <!-- Animal Details or Edit Section -->
        {#if localAnimalData}
          {#if editing}
            <AnimalEditSection
              animalData={localAnimalData}
              onSave={handleSave}
              onCancel={() => (editing = false)}
            />
          {:else}
            <AnimalDetailSection animalData={localAnimalData} />
          {/if}
        {/if}

        <!-- RFID Assignment Section -->
        {#if !localAnimalData && localRfidTag}
          <RfidAssignmentSection
            rfidTag={localRfidTag}
            onAssignSuccess={handleAssignSuccess}
          />
        {/if}
      </div>
    </ScrollArea>

    <Separator />

    <Dialog.Footer class="px-6 py-4 flex justify-end gap-2">
      {#if localAnimalData}
        <AnimalNoteSection
          animalData={localAnimalData}
          {scanData}
          {userID}
          {onClose}
        />
      {/if}
      <Button variant="outline" onclick={onClose}>Close</Button>
    </Dialog.Footer>
  </Dialog.Content>
</Dialog.Root>
