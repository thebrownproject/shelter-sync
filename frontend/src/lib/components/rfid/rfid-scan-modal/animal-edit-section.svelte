<script lang="ts">
  import { Button } from "$lib/components/ui/button/index.js";
  import { Input } from "$lib/components/ui/input/index.js";
  import { Label } from "$lib/components/ui/label/index.js";
  import { Textarea } from "$lib/components/ui/textarea/index.js";
  import * as Select from "$lib/components/ui/select/index.js";
  import { toast } from "svelte-sonner";
  import type { AnimalData } from './types';

  type Props = {
    animalData: AnimalData;
    onSave: (updatedData: AnimalData) => void;
    onCancel: () => void;
  };

  const { animalData, onSave, onCancel }: Props = $props();

  let saving = $state(false);
  let errorMsg: string | null = $state(null);
  let localData = $state({ ...animalData });

  async function submitUpdate(e: Event) {
    e.preventDefault();
    errorMsg = null;
    saving = true;

    const form = e.target as HTMLFormElement;
    const fd = new FormData(form);
    fd.set("id", localData.id);

    try {
      const res = await fetch("/animals?/put", {
        method: "POST",
        body: fd,
      });

      if (!res.ok) {
        const t = await res.text();
        errorMsg = t || "Update failed";
        toast.error(errorMsg);
      } else {
        // Update local data from form
        const updatedData = {
          ...localData,
          name: fd.get("name") as string,
          species: fd.get("species") as string,
          breed: fd.get("breed") as string || undefined,
          fur_colour: fd.get("fur_colour") as string || undefined,
          weight_kg: fd.get("weight_kg") ? parseFloat(fd.get("weight_kg") as string) : undefined,
          date_of_birth: fd.get("date_of_birth") as string || undefined,
          arrival_date: fd.get("arrival_date") as string || undefined,
          adoption_status: fd.get("adoption_status") as string || undefined,
          special_needs: fd.get("special_needs") as string || undefined,
          description: fd.get("description") as string || undefined,
        };

        toast.success("Animal updated successfully");
        onSave(updatedData);
      }
    } catch (err: any) {
      errorMsg = err?.message || "Unexpected error";
      toast.error(errorMsg);
    } finally {
      saving = false;
    }
  }
</script>

<form class="space-y-5" onsubmit={submitUpdate}>
  <h3
    class="text-xs font-medium uppercase tracking-wide text-neutral-500 dark:text-neutral-400 flex items-center gap-2"
  >
    <span class="h-3 w-0.5 rounded bg-indigo-500"></span> Edit Animal
  </h3>

  <div class="grid gap-4">
    <div class="grid gap-1.5">
      <Label for="name">Name</Label>
      <Input id="name" name="name" required bind:value={localData.name} />
    </div>
    <div class="grid gap-1.5">
      <Label for="species">Species</Label>
      <Input
        id="species"
        name="species"
        required
        bind:value={localData.species}
      />
    </div>
    <div class="grid gap-1.5">
      <Label for="breed">Breed</Label>
      <Input id="breed" name="breed" bind:value={localData.breed} />
    </div>
    <div class="grid gap-1.5">
      <Label for="fur_colour">Fur Colour</Label>
      <Input
        id="fur_colour"
        name="fur_colour"
        bind:value={localData.fur_colour}
      />
    </div>
    <div class="grid gap-1.5">
      <Label for="weight_kg">Weight (kg)</Label>
      <Input
        id="weight_kg"
        name="weight_kg"
        type="number"
        step="0.01"
        bind:value={localData.weight_kg}
      />
    </div>
    <div class="grid gap-1.5">
      <Label for="date_of_birth">Date of Birth</Label>
      <Input
        id="date_of_birth"
        name="date_of_birth"
        type="date"
        bind:value={localData.date_of_birth}
      />
    </div>
    <div class="grid gap-1.5">
      <Label for="arrival_date">Arrival Date</Label>
      <Input
        id="arrival_date"
        name="arrival_date"
        type="date"
        bind:value={localData.arrival_date}
      />
    </div>
    <div class="grid gap-1.5">
      <Label for="adoption_status">Adoption Status</Label>
      <Select.Root
        type="single"
        name="adoptionStatus"
        bind:value={localData.adoption_status}
      >
        <Select.Trigger class="w-[180px]">
          {localData.adoption_status || "Select adoption status"}
        </Select.Trigger>
        <Select.Content>
          <Select.Group>
            <Select.Label>Adoption Status</Select.Label>
            <Select.Item value="Available">Available</Select.Item>
            <Select.Item value="Pending">Pending</Select.Item>
            <Select.Item value="Adopted">Adopted</Select.Item>
            <Select.Item value="Hold">Hold</Select.Item>
            <Select.Item value="Medical Hold">Medical Hold</Select.Item>
            <Select.Item value="Not Available">Not Available</Select.Item>
          </Select.Group>
        </Select.Content>
      </Select.Root>
      <input
        type="hidden"
        name="adoption_status"
        value={localData.adoption_status || ""}
      />
    </div>
    <div class="grid gap-1.5">
      <Label for="special_needs">Special Needs</Label>
      <Input
        id="special_needs"
        name="special_needs"
        bind:value={localData.special_needs}
      />
    </div>
    <div class="grid gap-1.5">
      <Label for="description">Description</Label>
      <Textarea
        id="description"
        name="description"
        bind:value={localData.description}
      />
    </div>

    {#if errorMsg}
      <p class="text-sm text-rose-600 dark:text-rose-400">
        {errorMsg}
      </p>
    {/if}

    <div class="flex justify-end gap-2 pt-2">
      <Button type="button" variant="ghost" onclick={onCancel}>Cancel</Button>
      <Button type="submit" disabled={saving}>
        {saving ? "Saving..." : "Save"}
      </Button>
    </div>
  </div>
</form>
