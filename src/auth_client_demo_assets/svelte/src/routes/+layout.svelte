<script>
    import '$lib/app.css'
	import Header from '$lib/header/Header.svelte';
	import LoggedOut from "../components/LoggedOut.svelte";
	import { auth } from "../stores/auth";
	import { onMount } from "svelte";
	// @ts-ignore
	import { onNavigate } from '$app/navigation'
	import { page } from '$app/stores';

	onMount(() => {
	  $auth.init();
	});

    import '../app.css'
	// @ts-ignore
	onNavigate((navigation) => {
		// @ts-ignore
		if (!document.startViewTransition) return

		return new Promise((resolve) => {
			// @ts-ignore
			document.startViewTransition(async () => {
				// @ts-ignore
				resolve()
				await navigation.complete
			})
		})
	})
</script>

<div class="hidden sm:block">
</div>
<main class='titanium'>
	{#if $auth.isReady}
	  {#if $auth.isAuthenticated}
		{#if $page.url.pathname === '/'}
			<Header />
			<div class='blur'>
			</div>
			<slot />
		{:else}
			<div class="test">
				<Header />
			</div>
			<div style:--widget="loginout" class="icon-container">
				<a href='/' class="icon">
				<i class="fi fi-ss-sign-out-alt"></i>
				</a>
			</div>
			<slot />
		{/if}
	  {:else}
	  <div>
		<LoggedOut />
		</div>
	  {/if}
	{/if}
</main>
  
<style>
	.test {
		margin:auto;
	}

	.blur {
		position: absolute;
		backdrop-filter: blur(10px);
		width: 100vw;
	    height: 100vh;
	}
	.icon {
		display: flex;
		align-self: flex-end;
		margin: -10px 0px 10px 0px;
		text-decoration:none; 
		color:inherit;
		width: 20px;
	}
	
	a {
		margin: 25px 20px;
		width: 10%;
		min-width:55px;
	}
	.icon-container {
	position: absolute;
	top: 0;
	right: 0;
	border: 0px;
	
	padding: 3.5rem 2.5rem 0rem 0rem;
	/* max-width: 365px; */
	/* min-width: 300px; */
	flex: 0 0 auto;
	display: flex;
	flex-direction: column;

	view-transition-name: var(--widget);
	}
</style>