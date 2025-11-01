<script lang="ts">
  import { enhance } from "$app/forms";
  import { Button } from "$lib/components/ui/button/index.js";
  import * as Card from "$lib/components/ui/card/index.js";
  import { Label } from "$lib/components/ui/label/index.js";
  import { Input } from "$lib/components/ui/input/index.js";
  import RabbitIcon from "@lucide/svelte/icons/rabbit";
  import Loader2Icon from "@lucide/svelte/icons/loader-2";

  let { form } = $props();
  let isLoading = $state(false);

  const emailId = crypto.randomUUID();
  const passwordId = crypto.randomUUID();

  // Demo credentials
  let email = $state("");
  let password = $state("");

  function fillDemoCredentials() {
    email = "demo@shelter-sync.app";
    password = "letMeIn!!";
  }
</script>

<div
  class="bg-background flex min-h-svh flex-col items-center justify-center gap-6 p-6 md:p-10"
>
  <div class="flex w-full max-w-sm flex-col gap-6">
    <!-- Logo/Brand with Rabbit Icon -->
    <a class="flex items-center gap-2 self-center font-medium">
      <div
        class="bg-primary text-primary-foreground flex size-6 items-center justify-center rounded-md"
      >
        <RabbitIcon class="size-4" />
      </div>
      Shelter Sync
    </a>

    <!-- Auth Form Card -->
    <Card.Root>
      <Card.Header class="text-center">
        <Card.Title class="text-xl">Welcome back</Card.Title>
        <Card.Description>Sign in to your account to continue</Card.Description>
      </Card.Header>
      <Card.Content>
        <!-- Display messages/errors -->
        {#if form?.error}
          <div
            class="mb-4 p-3 bg-red-100 border border-red-400 text-red-700 rounded text-sm"
          >
            {form.error}
          </div>
        {/if}

        <form
          method="POST"
          action="?/login"
          use:enhance={() => {
            isLoading = true;
            return async ({ update }) => {
              await update();
              isLoading = false;
            };
          }}
        >
          <div class="grid gap-6">
            <div class="grid gap-3">
              <Label for="email-{emailId}">Email</Label>
              <Input
                id="email-{emailId}"
                name="email"
                type="email"
                placeholder="m@example.com"
                disabled={isLoading}
                bind:value={email}
                required
              />
            </div>
            <div class="grid gap-3">
              <Label for="password-{passwordId}">Password</Label>
              <Input
                id="password-{passwordId}"
                name="password"
                type="password"
                disabled={isLoading}
                bind:value={password}
                required
              />
            </div>
            <Button type="submit" class="w-full" disabled={isLoading}>
              {#if isLoading}
                <Loader2Icon class="mr-2 h-4 w-4 animate-spin" />
                Signing in...
              {:else}
                Login
              {/if}
            </Button>
          </div>
        </form>

        <!-- Demo credentials -->
        <div class="mt-6 rounded-lg border bg-muted/50 p-4">
          <p class="text-sm font-medium mb-2">Demo Account</p>
          <p class="text-xs text-muted-foreground mb-3">
            Try the application with pre-populated data
          </p>
          <Button
            type="button"
            variant="outline"
            size="sm"
            class="w-full"
            onclick={fillDemoCredentials}
            disabled={isLoading}
          >
            Use Demo Credentials
          </Button>
        </div>
      </Card.Content>
    </Card.Root>
  </div>
</div>
