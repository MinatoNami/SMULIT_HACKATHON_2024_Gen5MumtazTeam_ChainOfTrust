<script>
    import { onMount } from "svelte";
	import LoggedIn from "../components/LoggedIn.svelte";
  import { auth } from "../stores/auth";
  
	onMount(() => {
	  $auth.init();
	});

</script>

{#if $auth.isReady}
{#if $auth.isAuthenticated}
  <LoggedIn />
{:else}
<div class="container">
  <h1>Internet Identity Client</h1>
  <h2>You are not authenticated</h2>
  <p>To log in, click this button!</p>
  <button type="button" id="loginButton" on:click={$auth.login}>Log in</button>
</div>
{/if}
{/if}
