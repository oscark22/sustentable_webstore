<script lang="ts">
	import ProductCard from "$lib/productCard.svelte";

	const products : Product[] = [
		{
			id: "1",
			name: "coffee",
			price: 5
		},
		{
			id: "2",
			name: "sunglasses",
			price: 10
		},
		{
			id: "3",
			name: "water",
			price: 50
		},
	];
</script>

<div class="container h-full mx-auto flex justify-center items-center">
	<div class="grid grid-cols-3 gap-4">
		<div class="col-snap-3">
			<h1>Hola</h1>
		</div>

		{#each products as product}	
			<ProductCard product={product}/>
		{/each}

		<div class="col-snap-3">
			<button class="btn variant-filled-primary">
				Ckeckout with Stripe API
			</button>
		</div>
	</div>
</div>