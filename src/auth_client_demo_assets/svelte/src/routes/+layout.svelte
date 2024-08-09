<script lang="ts">
	import Header from '$lib/header/Header.svelte';
	// @ts-ignore
	import { onNavigate } from '$app/navigation'

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
	<!-- <Header /> -->
</div>
<main class='titanium'>
    <slot />
</main>
