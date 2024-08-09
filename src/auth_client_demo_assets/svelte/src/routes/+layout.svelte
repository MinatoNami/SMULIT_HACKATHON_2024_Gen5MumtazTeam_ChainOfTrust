<script lang="ts">
	import Header from '$lib/header/Header.svelte';
	import { onNavigate } from '$app/navigation'

    import '$lib/app.css'
	onNavigate((navigation) => {
		// @ts-ignore
		if (!document.startViewTransition) return

		return new Promise((resolve) => {
			// @ts-ignore
			document.startViewTransition(async () => {
				resolve()
				await navigation.complete
			})
		})
	})
</script>

<div class="hidden sm:block">
</div>
<main class='titanium'>
    <slot />
</main>
