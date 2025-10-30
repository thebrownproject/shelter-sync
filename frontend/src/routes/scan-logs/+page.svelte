<script lang="ts">
  import type { PageData } from "./$types";
  import { columns } from "$lib/components/rfid/rfid-scan-table/rfid-scan-log-columns";
  import { RfidScanLogDataTable } from "$lib/components/rfid/rfid-scan-table";
  import { PageHeader } from "$lib/components/layout";

  // Get the data from the server
  export let data: PageData;
</script>

<div class="px-6 pt-6 pb-6">
  <div class="flex items-center justify-between mb-2">
    <div class="space-y-1">
      <h1 class="scroll-m-20 text-4xl font-extrabold tracking-tight lg:text-5xl">
        Scan Logs
      </h1>
      <p class="text-xl text-muted-foreground">
        View all recent scan logs for your animals.
      </p>
    </div>
  </div>

  <div class="mt-6">
    <RfidScanLogDataTable data={data.rfid_logs} {columns} />
  </div>
</div>
