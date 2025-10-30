<script lang="ts">
  import type { RfidScanData } from './types';

  type Props = {
    scanData: RfidScanData | null;
  };

  const { scanData }: Props = $props();

  const formatDateTime = (v?: string) =>
    v ? new Date(v).toLocaleString() : "N/A";
</script>

{#if scanData}
  <section class="space-y-3">
    <h3
      class="text-xs font-medium uppercase tracking-wide text-neutral-500 dark:text-neutral-400 flex items-center gap-2"
    >
      <span class="h-3 w-0.5 rounded bg-indigo-500"></span> Scan Details
    </h3>
    <ul class="space-y-1 text-sm">
      <li
        class="flex justify-between gap-4 rounded-md px-3 py-2 bg-neutral-50 dark:bg-neutral-800/60"
      >
        <span class="text-neutral-600 dark:text-neutral-300">Scan Time</span>
        <span class="font-mono text-neutral-900 dark:text-neutral-100"
          >{formatDateTime(scanData.scan_time)}</span
        >
      </li>
      <li
        class="flex justify-between gap-4 rounded-md px-3 py-2 bg-neutral-50 dark:bg-neutral-800/60"
      >
        <span class="text-neutral-600 dark:text-neutral-300">User Scan</span>
        <span class="text-neutral-900 dark:text-neutral-100"
          >{scanData.user_id ? "Yes" : "No"}</span
        >
      </li>
    </ul>
  </section>
{/if}
