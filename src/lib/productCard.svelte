<script lang="ts">
    import { get } from "svelte/store";
    import { cartItems, addToCart, removeFromCart } from "../cart";

    export let product : Product = {
        id: 0, name: "", price: 0
    };
    let cart = get(cartItems);

    let cartItemIndex = cart.findIndex((item) => { return item.id == product.id });
    let cartProduct = cart[cartItemIndex];
    cartItems.subscribe((newCartValue) => {
        cart = newCartValue;
        cartItemIndex = cart.findIndex((item) => { return item.id == product.id });
        cartProduct = cart[cartItemIndex];
        console.log(cart);
    });

    console.log(product);
    let images = ["https://www.nationalgeographic.com.es/medio/2023/11/15/chu-lin-jugando-con-un-cubo_aaf092c6_231115174100_1280x900.jpg", 
    "https://th.bing.com/th/id/OIP.9dH67oWC1dVhFcUMRCUPkwHaFD?w=317&h=180&c=7&r=0&o=5&pid=1.7", 
    "https://th.bing.com/th/id/OIP.n9foEKmLvhSjTq6xD38CgAHaDs?rs=1&pid=ImgDetMain",
     "https://th.bing.com/th/id/OIP.xgLdaFnb4skPcbRhtsYYgQHaE7?rs=1&pid=ImgDetMain"];
    let des = "A pesar del número de ejemplares limitado y de las reducidas zonas donde habita, es uno de los animales más reconocibles de todos los rincones del mundo. Durante larga tiempo estuvo en grave riesgo de extinción y se convirtió el símbolo del Fondo Mundial para la Naturaleza. Actualmente la cantidad ejemplares en libertad está en aumento. El apetito de este mamífero es insaciable y puede llegar a pasar más de la mitad del día comiendo aquello que más le gusta sin descanso: bambú. Además también se alimenta de algunos frutos y pequeños animales. A pesar de su aspecto torpe y lento es un animal muy ágil trepando a los árboles así como desplazándose por el agua a nado. Suelen tener un comportamiento solitario, excepto cuando buscan aparearse. Las hembras pasan un periodo de gestación de 5 meses hasta que nace la cría, totalmente ciega y blanca.  Suelen vivir entre quince y veinte años, pesan unos 130 kilos y pueden llegar a medir 1.5 metros. Su hábitat natural son las zonas montañosas de China.";
    
</script>

<a class="block card card-hover p-4" href="/">
    <header class="card-header mb-4">
        <h2 style="font-size: 24px"><strong>{ product.name }</strong></h2>
    </header>
    <div class="card-body p-4 max-h-[150px] overflow-auto space-y-4"> { des } </div>
    {#if cartProduct !== undefined}
        <div class="card-body px-4">
            Cantidad: <strong>{ cartProduct.quantity }</strong>
        </div>
    {/if}
    <div class="card-body p-4">
        <!-- svelte-ignore a11y-missing-attribute -->
        <img src="{images[product.id-1]}">
    </div>
    <div class="card-body p-4">
        Precio: ${ product.price }
    </div>
    <footer class="card-footer">
        <button class="p-2 rounded variant-glass-primary hover:variant-filled-primary" on:click={() => addToCart(product.id)}>Añadir</button>
        <button class="p-2 rounded variant-ghost-error hover:variant-filled-error" on:click={() => removeFromCart(product.id)}>Eliminar</button>
    </footer>
</a>