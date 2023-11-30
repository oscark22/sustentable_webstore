<script lang="ts">
	import '../app.postcss';
	import { AppShell, AppBar } from '@skeletonlabs/skeleton';

	// Floating UI for Popups
	import { computePosition, autoUpdate, flip, shift, offset, arrow } from '@floating-ui/dom';
	import { storePopup } from '@skeletonlabs/skeleton';
	storePopup.set({ computePosition, autoUpdate, flip, shift, offset, arrow });
</script>

<!-- App Shell -->
<AppShell>
	<svelte:fragment slot="header">
		<!-- App Bar -->
		<AppBar>
		
			<svelte:fragment slot="lead">
				<h1 class="h1">
					<span class="font-sans font-bold bg-gradient-to-br from-green-500 to-cyan-200 bg-clip-text text-transparent box-decoration-clone px-12">e-Commerce Sustentable</span>
				</h1>			
								
				<div class="input-group input-group-divider grid-cols-[auto_1fr_auto]">
					<div class="input-group-shim">Search</div>
					<input type="search" placeholder="Search..." />
					<button class="variant-filled-secondary">Submit</button>
				</div>
						
			</svelte:fragment>
			<svelte:fragment slot="trail">
				<a
					class="btn btn-sm variant-ghost-surface"
					href="https://youtu.be/dQw4w9WgXcQ?si=MeRRvXvrRKOuZoF2"
					target="_blank"
					rel="noreferrer"
				>
					Carrito
				</a><span class="badge-icon variant-filled"> (icon) </span>

			</svelte:fragment>
		</AppBar>
	</svelte:fragment>
	<!-- Page Route Content -->
	<slot />
</AppShell>
