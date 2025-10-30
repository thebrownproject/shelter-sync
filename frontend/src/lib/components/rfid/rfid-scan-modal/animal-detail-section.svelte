<script lang="ts">
  import { Badge } from "$lib/components/ui/badge/index.js";
  import type { AnimalData } from './types';

  type Props = {
    animalData: AnimalData;
  };

  const { animalData }: Props = $props();

  const formatDate = (v?: string) =>
    v ? new Date(v).toLocaleDateString() : "N/A";
  const formatWeight = (w?: number) => (w ? `${w} kg` : "N/A");

  const adoptionStatusVariant = (status?: string) => {
    const s = (status || "").toLowerCase();
    if (s.includes("adopted")) return "secondary";
    if (s.includes("pending")) return "outline";
    if (s.includes("medical")) return "destructive";
    return "default";
  };
</script>

<section class="space-y-3">
  <h3
    class="text-xs font-medium uppercase tracking-wide text-neutral-500 dark:text-neutral-400 flex items-center gap-2"
  >
    <span class="h-3 w-0.5 rounded bg-indigo-500"></span> Animal Details
  </h3>
  <div class="grid gap-2">
    <div class="flex justify-between text-sm px-2 py-1">
      <span class="text-neutral-500 dark:text-neutral-400">Name</span>
      <span class="font-medium text-neutral-900 dark:text-neutral-100"
        >{animalData.name}</span
      >
    </div>
    <div class="flex justify-between text-sm px-2 py-1">
      <span class="text-neutral-500 dark:text-neutral-400">Species</span>
      <span class="text-neutral-900 dark:text-neutral-100"
        >{animalData.species}</span
      >
    </div>
    <div class="flex justify-between text-sm px-2 py-1">
      <span class="text-neutral-500 dark:text-neutral-400">Breed</span>
      <span class="text-neutral-900 dark:text-neutral-100"
        >{animalData.breed || "N/A"}</span
      >
    </div>
    <div class="flex justify-between text-sm px-2 py-1">
      <span class="text-neutral-500 dark:text-neutral-400">Fur Colour</span>
      <span class="text-neutral-900 dark:text-neutral-100"
        >{animalData.fur_colour || "N/A"}</span
      >
    </div>
    <div class="flex justify-between text-sm px-2 py-1">
      <span class="text-neutral-500 dark:text-neutral-400">Weight</span>
      <span class="text-neutral-900 dark:text-neutral-100"
        >{formatWeight(animalData.weight_kg)}</span
      >
    </div>
    <div class="flex justify-between text-sm px-2 py-1">
      <span class="text-neutral-500 dark:text-neutral-400">Date of Birth</span>
      <span class="text-neutral-900 dark:text-neutral-100"
        >{formatDate(animalData.date_of_birth)}</span
      >
    </div>
    <div class="flex justify-between text-sm px-2 py-1">
      <span class="text-neutral-500 dark:text-neutral-400">Arrival Date</span>
      <span class="text-neutral-900 dark:text-neutral-100"
        >{formatDate(animalData.arrival_date)}</span
      >
    </div>
    <div class="flex items-center justify-between text-sm px-2 py-1">
      <span class="text-neutral-500 dark:text-neutral-400">Status</span>
      <Badge
        variant={adoptionStatusVariant(animalData.adoption_status)}
        class="capitalize"
      >
        {animalData.adoption_status || "Unknown"}
      </Badge>
    </div>
    {#if animalData.special_needs}
      <div
        class="mt-2 rounded-md border bg-rose-50 dark:bg-rose-500/10 dark:border-rose-500/30 p-3"
      >
        <p class="text-xs font-medium text-rose-700 dark:text-rose-300 mb-1">
          Special Needs
        </p>
        <p class="text-xs text-rose-800 dark:text-rose-200 leading-snug">
          {animalData.special_needs}
        </p>
      </div>
    {/if}

    {#if animalData.description}
      <div class="mt-2 rounded-md border dark:border-gray-500/30 p-3">
        <p class="text-xs font-medium text-neutral-900 dark:text-neutral-100 mb-1">
          Description
        </p>
        <p class="text-xs text-neutral-800 dark:text-neutral-200 leading-snug">
          {animalData.description}
        </p>
      </div>
    {/if}
  </div>
</section>
