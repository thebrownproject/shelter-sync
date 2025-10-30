<script lang="ts">
  import { supabase } from "$lib/supabaseClient.js";
  import { Button } from "$lib/components/ui/button/index.js";
  import { Badge } from "$lib/components/ui/badge/index.js";
  import * as Popover from "$lib/components/ui/popover/index.js";
  import {
    Command,
    CommandInput,
    CommandList,
    CommandEmpty,
    CommandItem,
  } from "$lib/components/ui/command/index.js";
  import { toast } from "svelte-sonner";
  import type { AnimalData } from './types';

  type Props = {
    rfidTag: string;
    onAssignSuccess: (animalData: AnimalData) => void;
  };

  const { rfidTag, onAssignSuccess }: Props = $props();

  let animals = $state<AnimalData[]>([]);
  let loadingAnimals = $state(false);
  let selectedAnimalId = $state<string | null>(null);
  let assigning = $state(false);
  let popoverOpen = $state(false);

  async function loadAnimalsIfNeeded() {
    if (animals.length || loadingAnimals) return;
    loadingAnimals = true;
    try {
      const { data, error } = await supabase.from("animal").select("*");

      if (data) {
        animals = data;
      } else {
        console.warn("Animals fetch failed:", error);
        toast.error("Failed to load animals");
      }
    } catch (e) {
      console.warn("Failed to fetch animals list for RFID assignment", e);
      toast.error("Failed to load animals");
    } finally {
      loadingAnimals = false;
    }
  }

  async function assignRFID() {
    if (!selectedAnimalId || !rfidTag) {
      toast.error("Select an animal first");
      return;
    }

    assigning = true;
    try {
      const { error } = await supabase
        .from("animal")
        .update({ rfid_tag: rfidTag })
        .eq("id", selectedAnimalId);

      if (error) {
        toast.error(error.message || "Failed to assign tag");
      } else {
        const selectedAnimal = animals.find((a) => a.id === selectedAnimalId);
        if (selectedAnimal) {
          toast.success(`RFID tag assigned to ${selectedAnimal.name}`);
          onAssignSuccess({ ...selectedAnimal, rfid_tag: rfidTag });
        }
        popoverOpen = false;
      }
    } catch (err: any) {
      toast.error(err?.message || "Unexpected error");
    } finally {
      assigning = false;
    }
  }
</script>

<section class="space-y-4">
  <h3
    class="text-xs font-medium uppercase tracking-wide text-neutral-500 dark:text-neutral-400 flex items-center gap-2"
  >
    <span class="h-3 w-0.5 rounded bg-indigo-500"></span> Assign RFID Tag
  </h3>
  <p class="text-sm text-neutral-600 dark:text-neutral-400">
    Tag <code
      class="font-mono px-1.5 py-0.5 rounded bg-neutral-100 dark:bg-neutral-800"
      >{rfidTag}</code
    > is unassigned. Select an animal to associate it.
  </p>

  <div class="flex flex-col gap-3">
    <div class="flex items-center gap-2">
      <Popover.Root bind:open={popoverOpen}>
        <Popover.Trigger>
          <Button
            type="button"
            variant="outline"
            role="combobox"
            aria-expanded={popoverOpen}
            class="w-72 justify-between"
            onclick={loadAnimalsIfNeeded}
          >
            {#if selectedAnimalId}
              {#key selectedAnimalId}
                {animals.find((a) => a.id === selectedAnimalId)?.name ||
                  "Select animal"}
              {/key}
            {:else if loadingAnimals}
              Loading animals...
            {:else}
              Select animal
            {/if}
            <svg
              class="ml-2 h-4 w-4 opacity-60"
              viewBox="0 0 20 20"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
            >
              <path
                d="M6 8l4 4 4-4"
                stroke-linecap="round"
                stroke-linejoin="round"
              />
            </svg>
          </Button>
        </Popover.Trigger>
        <Popover.Content class="w-72 p-0" align="start">
          <Command>
            <CommandInput placeholder="Search animals..." />
            <CommandList>
              <CommandEmpty>No animals found.</CommandEmpty>
              {#each animals as a (a.id)}
                <CommandItem
                  value={a.name}
                  onSelect={() => {
                    selectedAnimalId = a.id;
                    popoverOpen = false;
                  }}
                >
                  <span class="truncate">{a.name} ({a.species})</span>
                  {#if selectedAnimalId === a.id}
                    <svg
                      class="ml-auto h-4 w-4 text-indigo-500"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="currentColor"
                      stroke-width="2"
                    >
                      <path
                        d="M5 12l5 5L20 7"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                      />
                    </svg>
                  {/if}
                </CommandItem>
              {/each}
            </CommandList>
          </Command>
        </Popover.Content>
      </Popover.Root>

      {#if selectedAnimalId}
        <Badge variant="outline" class="max-w-[140px] truncate">
          {animals.find((a) => a.id === selectedAnimalId)?.species}
        </Badge>
      {/if}
    </div>

    <Button onclick={assignRFID} disabled={!selectedAnimalId || assigning}>
      {assigning ? "Assigning..." : "Assign Tag"}
    </Button>
  </div>
</section>
