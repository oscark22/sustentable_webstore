<script lang="ts">
    import { get } from "svelte/store";
    import { cartItems, addToCart, removeFromCart } from "../cart";

    export let product : Product = {
        id: 0, name: "", price: 0, des: ""
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
     "https://th.bing.com/th/id/OIP.xgLdaFnb4skPcbRhtsYYgQHaE7?rs=1&pid=ImgDetMain",
    "https://th.bing.com/th?id=OIP.0n6SYtzfpHjb4HBEuzU7wAHaDe&w=298&h=204&c=12&rs=1&qlt=99&pcl=faf9f7&o=6&pid=13.1",
    "https://4.bp.blogspot.com/-atz5WgBqCys/VxasgrWNCEI/AAAAAAAB9Ao/ClzFWC9eEEcOWygTP4l3m0rEXVpRTX1ggCKgB/s1600/Perritos-cachorros-162.jpg"];
    
</script>

<a class="block card card-hover p-4" href="/">
    <header class="card-header mb-4">
        <h2 style="font-size: 24px"><strong>{ product.name }</strong></h2>
    </header>
    <div class="card-body p-4 max-h-[150px] overflow-auto space-y-4"> { product.des } </div>
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