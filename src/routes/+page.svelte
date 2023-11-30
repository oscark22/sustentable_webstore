<script lang="ts">
	import ProductCard from "$lib/productCard.svelte";
	import { AppRail, AppRailAnchor, AppRailTile } from "@skeletonlabs/skeleton";
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
	let currentTile: number = 0;
	let categorias = ["Reutilizables", "Biodegradables", "Reusables", "Higiene", "categoria", "Categoria", "Categoria", "Categoria", "Categoria"];
	onMount(async() => {
		const response = await fetch('https://w3mhrh3aadtac2yr45bw55iuce0hkfpv.lambda-url.us-east-1.on.aws/')
		products = await response.json()
		console.log(products)
	});
	
</script>

<br>
<div class="snap-x scroll-px-4 snap-mandatory scroll-smooth flex gap-4 overflow-x-auto px-2 py-2">
	{#each categorias as categoria}
		<a class="snap-start shrink-0 card py-4 w-40 md:w-80 text-center variant-filled-secondary hover:variant-filled-primary" style="font-size: 18px;" href="/"><h1><strong>{categoria}</strong></h1></a>
	{/each}
</div>
<div class="container h-full mx-auto flex justify-center items-center">
	<div class="md:grid grid-cols-3 gap-4">
		
		{#each products as product}
			<ProductCard product={product}/>
		{/each}

	</div>
</div>
