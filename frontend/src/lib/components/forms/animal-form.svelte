<script lang="ts">
  import AnimalFormField from "$lib/components/forms/animal-form-field.svelte";
  import * as Select from "$lib/components/ui/select/index.js";
  import { Checkbox } from "$lib/components/ui/checkbox/index.js";
  import { Label } from "$lib/components/ui/label/index.js";
  import type { Animal, AnimalCreateData } from "$lib/types";
  import { ANIMAL_SPECIES, ADOPTION_STATUSES } from "$lib/types";

  type Props = {
    mode: 'create' | 'edit';
    animal?: Animal;
    allAnimals?: Animal[];
    onSubmit?: (event: Event) => void;
  };

  const {
    mode,
    animal,
    allAnimals = [],
    onSubmit = () => {}
  }: Props = $props();

  // Initialize form data based on mode
  let formData = $state<Animal | AnimalCreateData>(
    mode === 'edit' && animal
      ? { ...animal }
      : {
          name: "",
          species: "Rabbit",
          breed: "",
          date_of_birth: "",
          fur_colour: "",
          weight_kg: "",
          arrival_date: new Date().toISOString().split("T")[0],
          neutered: false,
          adoption_status: "Available",
          bonded_with: "",
          rfid_tag: "",
          special_needs: "",
          description: "",
        }
  );

  // Update form data when animal prop changes in edit mode
  $effect(() => {
    if (mode === 'edit' && animal) {
      formData = { ...animal };
    }
  });

  // Generate IDs based on mode
  const idPrefix = mode === 'create' ? 'create' : 'edit';
  const formId = `${idPrefix}-animal-form`;
  const formAction = mode === 'create' ? '?/create' : '?/update';

  // Species and status options
  const speciesOptions = ANIMAL_SPECIES;
  const adoptionStatusOptions = ADOPTION_STATUSES;

  // Filter animals for bonded_with dropdown
  const bondedWithOptions = $derived(
    mode === 'edit' && 'id' in formData
      ? allAnimals.filter(a => a.id !== formData.id)
      : allAnimals
  );
</script>

<form
  id={formId}
  method="POST"
  action={formAction}
  on:submit={onSubmit}
  class="space-y-4"
  class:flex-1={mode === 'edit'}
  class:overflow-y-auto={mode === 'edit'}
>
  <!-- Hidden ID field for edit mode -->
  {#if mode === 'edit' && 'id' in formData}
    <input type="hidden" name="id" value={formData.id} />
  {/if}

  <!-- Name -->
  <AnimalFormField
    id="{idPrefix}-name"
    label="Name"
    type="text"
    name="name"
    bind:value={formData.name}
    required={true}
  />

  <!-- Species -->
  <div class="space-y-2">
    <Label for="{idPrefix}-species">Species *</Label>
    <Select.Root type="single" bind:value={formData.species}>
      <Select.Trigger>
        {formData.species}
      </Select.Trigger>
      <Select.Content>
        {#each speciesOptions as species}
          <Select.Item value={species}>{species}</Select.Item>
        {/each}
      </Select.Content>
    </Select.Root>
    <input type="hidden" name="species" bind:value={formData.species} />
  </div>

  <!-- Breed -->
  <AnimalFormField
    id="{idPrefix}-breed"
    label="Breed"
    type="text"
    name="breed"
    bind:value={formData.breed}
  />

  <!-- Date of Birth -->
  <AnimalFormField
    id="{idPrefix}-date-of-birth"
    label="Date of Birth"
    type="date"
    name="date_of_birth"
    bind:value={formData.date_of_birth}
  />

  <!-- Fur Colour -->
  <AnimalFormField
    id="{idPrefix}-fur-colour"
    label="Fur Colour"
    type="text"
    name="fur_colour"
    bind:value={formData.fur_colour}
  />

  <!-- Weight -->
  <AnimalFormField
    id="{idPrefix}-weight"
    label="Weight (kg)"
    type="number"
    name="weight_kg"
    bind:value={formData.weight_kg}
    step="0.1"
  />

  <!-- Arrival Date -->
  <AnimalFormField
    id="{idPrefix}-arrival-date"
    label="Arrival Date"
    type="date"
    name="arrival_date"
    bind:value={formData.arrival_date}
    required={true}
  />

  <!-- Neutered -->
  <div class="flex items-center space-x-2">
    <Checkbox
      id="{idPrefix}-neutered"
      name="neutered"
      bind:checked={formData.neutered}
    />
    <Label for="{idPrefix}-neutered">Neutered/Spayed</Label>
  </div>

  <!-- Adoption Status -->
  <div class="space-y-2">
    <Label for="{idPrefix}-adoption-status">Adoption Status *</Label>
    <Select.Root type="single" bind:value={formData.adoption_status}>
      <Select.Trigger>
        {formData.adoption_status}
      </Select.Trigger>
      <Select.Content>
        {#each adoptionStatusOptions as status}
          <Select.Item value={status}>{status}</Select.Item>
        {/each}
      </Select.Content>
    </Select.Root>
    <input type="hidden" name="adoption_status" bind:value={formData.adoption_status} />
  </div>

  <!-- RFID Tag -->
  <AnimalFormField
    id="{idPrefix}-rfid-tag"
    label="RFID Tag"
    type="text"
    name="rfid_tag"
    bind:value={formData.rfid_tag}
  />

  <!-- Bonded With -->
  <div class="space-y-2">
    <Label for="{idPrefix}-bonded-with">Bonded With</Label>
    <Select.Root type="single" bind:value={formData.bonded_with}>
      <Select.Trigger>
        {#if formData.bonded_with}
          {allAnimals.find(a => a.id === formData.bonded_with)?.name || formData.bonded_with}
        {:else}
          Select an animal...
        {/if}
      </Select.Trigger>
      <Select.Content>
        <Select.Item value="">None</Select.Item>
        {#each bondedWithOptions as bondAnimal}
          <Select.Item value={bondAnimal.id}>{bondAnimal.name} ({bondAnimal.species})</Select.Item>
        {/each}
      </Select.Content>
    </Select.Root>
    <input type="hidden" name="bonded_with" bind:value={formData.bonded_with} />
  </div>

  <!-- Special Needs -->
  <AnimalFormField
    id="{idPrefix}-special-needs"
    label="Special Needs"
    type="textarea"
    name="special_needs"
    bind:value={formData.special_needs}
    placeholder="Any special care requirements..."
  />

  <!-- Description -->
  <AnimalFormField
    id="{idPrefix}-description"
    label="Description"
    type="textarea"
    name="description"
    bind:value={formData.description}
    placeholder="General description of the animal..."
  />
</form>
