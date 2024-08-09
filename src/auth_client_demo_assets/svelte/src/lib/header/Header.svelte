<script>
	import { page } from '$app/stores';
</script>

<header>
	<div class="hidden sm:block">
		<nav>
			<ul>
				<li class:active={$page.url.pathname === '/'}><a href="/"><div class="base-font">Home</div></a></li>
				<li class:active={$page.url.pathname === '/about'}>
					<a href="/about"><div class="base-font">About</div></a>
				</li>
				<li class:active={$page.url.pathname === '/contact'}>
					<a href="/contact">Contact</a>
				</li>
			</ul>
		</nav>
	</div>
	
</header>

<style>
	header {
		display: flex;
		justify-content: space-between;
	}

	nav {
		display: flex;
		justify-content: center;
		/* --background: rgba(255, 255, 255, 0.7); */
	}

	ul {
		position: relative;
		padding: 0;
		margin: 0;
		height: 3em;
		display: flex;
		justify-content: center;
		align-items: center;
		list-style: none;
		background: var(--background);
		background-size: contain;
	}

	li {
		position: relative;
		height: 100%;
	}

	li.active::before {
		--size: 6px;
		content: '';
		width: 0;
		height: 0;
		position: absolute;
		top: 0;
		left: calc(50% - var(--size));
		border: var(--size) solid transparent;
		border-top: var(--size) solid var(--accent-color);
	}

	nav a {
		display: flex;
		height: 100%;
		align-items: center;
		padding: 0 1em;
		color: var(--heading-color);
		font-weight: 700;
		font-size: 1rem;
		text-transform: uppercase;
		letter-spacing: 0.1em;
		text-decoration: none;
		transition: color 0.2s linear;
	}

	a:hover {
		color: var(--accent-color);
	}
</style>
