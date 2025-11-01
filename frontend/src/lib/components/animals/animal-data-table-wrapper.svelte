<script lang="ts">
  import { AnimalDataTable } from "$lib/components/animals/animal-table";
  import { columns } from "$lib/components/animals/animal-table/animal-columns";
  import { AnimalFilters, AnimalCreateForm } from "$lib/components/forms";
  import { AnimalModal } from "$lib/components/animals";
  import * as Dialog from "$lib/components/ui/dialog/index.js";
  import { Button } from "$lib/components/ui/button/index.js";
  import type { Animal, AnimalModalMode } from "$lib/types";
  import { supabase } from "$lib/supabaseClient";
  import { invalidateAll } from "$app/navigation";
  import { toast } from "svelte-sonner";

  export let data: Animal[] = [];

  // Modal state
  let showAnimalModal = false;
  let viewingAnimal: Animal | null = null;
  let modalMode: AnimalModalMode = "view";

  // Form state
  let showCreateForm = false;

  // Delete confirmation state
  let showDeleteDialog = false;
  let animalToDelete: Animal | null = null;

  // Filtered animals
  let filteredAnimals: Animal[] = data;

  // Update filtered animals when data prop changes
  $: if (data) {
    filteredAnimals = data;
  }

  // Handle filter changes
  function handleFilterChange(filtered: Animal[]) {
    filteredAnimals = filtered;
  }

  // Handle edit from data table
  function handleEdit(animal: Animal) {
    viewingAnimal = { ...animal };
    modalMode = "edit";
    showCreateForm = false;
    showAnimalModal = true;
  }

  // Handle view from data table
  function handleView(animal: Animal) {
    viewingAnimal = { ...animal };
    modalMode = "view";
    showAnimalModal = true;
  }

  // Handle delete from data table (opens confirmation dialog)
  function handleDelete(animal: Animal) {
    if (!animal.id) {
      toast.error(`Cannot delete ${animal.name}: Invalid ID`);
      return;
    }

    animalToDelete = animal;
    showDeleteDialog = true;
  }

  // Confirm and execute delete
  async function confirmDelete() {
    if (!animalToDelete) return;

    try {
      const { error } = await supabase
        .from('animal')
        .delete()
        .eq('id', animalToDelete.id);

      if (error) {
        toast.error(`Failed to delete ${animalToDelete.name}: ${error.message}`);
        return;
      }

      toast.success(`${animalToDelete.name} has been deleted successfully`);
      await invalidateAll();
      showAnimalModal = false;
      showCreateForm = false;
      showDeleteDialog = false;
      animalToDelete = null;
    } catch (err) {
      toast.error(`Failed to delete ${animalToDelete.name}: An unexpected error occurred`);
    }
  }

  function cancelDelete() {
    showDeleteDialog = false;
    animalToDelete = null;
  }

  // Handle create new animal
  function handleCreate() {
    showCreateForm = true;
    showAnimalModal = false;
  }

  function handleCancel() {
    showCreateForm = false;
    showAnimalModal = false;
    viewingAnimal = null;
    modalMode = "view";
  }

  function handleFormSubmit() {
    showCreateForm = false;
  }
</script>

<!-- Search and Filter Section -->
<AnimalFilters
  animals={data}
  onFilterChange={handleFilterChange}
  onCreateClick={handleCreate}
/>

<!-- Paginated Animal Data Table -->
<AnimalDataTable
  data={filteredAnimals}
  {columns}
  onView={handleView}
  onEdit={handleEdit}
  onDelete={handleDelete}
/>

<!-- Create New Animal Dialog -->
<Dialog.Root bind:open={showCreateForm}>
  <Dialog.Content class="max-w-2xl max-h-[90vh] flex flex-col">
    <Dialog.Header class="flex-shrink-0">
      <Dialog.Title>Add New Animal</Dialog.Title>
      <Dialog.Description>
        Fill in the details below to add a new animal to the shelter.
      </Dialog.Description>
    </Dialog.Header>

    <div class="flex-1 overflow-y-auto px-6">
      <AnimalCreateForm allAnimals={data} onSubmit={handleFormSubmit} />
    </div>

    <Dialog.Footer class="flex-shrink-0">
      <Button type="button" variant="outline" onclick={handleCancel}>
        Cancel
      </Button>
      <Button type="submit" form="create-animal-form">Create Animal</Button>
    </Dialog.Footer>
  </Dialog.Content>
</Dialog.Root>

<!-- Animal Modal -->
<AnimalModal
  animal={viewingAnimal}
  bind:open={showAnimalModal}
  mode={modalMode}
  allAnimals={data}
/>

<!-- Delete Confirmation Dialog -->
<Dialog.Root bind:open={showDeleteDialog}>
  <Dialog.Content>
    <Dialog.Header>
      <Dialog.Title>Delete Animal</Dialog.Title>
      <Dialog.Description>
        Are you sure you want to delete <strong>{animalToDelete?.name}</strong>?
        This action cannot be undone.
      </Dialog.Description>
    </Dialog.Header>
    <Dialog.Footer>
      <Button type="button" variant="outline" onclick={cancelDelete}>
        Cancel
      </Button>
      <Button type="button" variant="destructive" onclick={confirmDelete}>
        Delete
      </Button>
    </Dialog.Footer>
  </Dialog.Content>
</Dialog.Root>
