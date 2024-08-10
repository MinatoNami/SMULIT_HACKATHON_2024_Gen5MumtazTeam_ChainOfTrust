<script>
	import { page } from '$app/stores';

</script>

<header>
	<div>
		<nav>
			<ul>
				<li class:active={$page.url.pathname === '/home'}>
					<a href="/home">
						<div class="moon-font">Home</div>
					</a>
				</li>
				<li class:active={$page.url.pathname === '/gpt'}>
					<a href="/gpt">
						<div class="moon-font">GPT</div>
					</a>
				</li>
				<li class:active={$page.url.pathname === '/logging'}>
					<a href="/logging">
						<div class="moon-font">Logging</div>
					</a>
				</li>
			</ul>
		</nav>
		<hr class="h-0.5">
	</div>
	
</header>

<style>
	header {
		padding-top: 20px;
		margin: auto;
		display: flex;
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

	hr {
		margin: 0px;
		border-left: 0px;
	}
</style>
