<script lang="ts">
  import type { PageData } from "./$types";
  import { AnimalDataTableWrapper } from "$lib/components/animals";
  import { PageHeader } from "$lib/components/layout";

  // Get the data from the server
  export let data: PageData;
</script>

<main class="p-6 pb-0" aria-labelledby="animals-title">
  <PageHeader
    title="Animals"
    description="Manage your animal shelter records"
  />

  <section aria-label="Animal management interface">
    <AnimalDataTableWrapper data={data.animals as any} />
  </section>
</main>