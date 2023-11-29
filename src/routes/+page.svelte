<script lang="ts">
	import ProductCard from "$lib/productCard.svelte";
	import { onMount } from "svelte";

	let products : Product[] = [];
	products = [
		{
			id: 1,
			name: "coffee",
			price: 5.99
		},
		{
			id: 2,
			name: "sunglasses",
			price: 9.99
		},
		{
			id: 3,
			name: "water",
			price: 29.99
		},
	];

	onMount(async() => {
		const response = await fetch('https://w3mhrh3aadtac2yr45bw55iuce0hkfpv.lambda-url.us-east-1.on.aws/')
		products = await response.json()
		console.log(products)
	})
</script>

<div class="container h-full mx-auto flex justify-center items-center">
	<div class="grid grid-cols-3 gap-4">
		<div class="col-snap-3">
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