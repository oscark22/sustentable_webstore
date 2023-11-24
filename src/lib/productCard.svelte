<script lang="ts">
    export let product : Product = {
        id: "", name: "", price: 0
    };

    console.log(product);
</script>

<div class="card">
    <header class="card-header">
        <h2>Nombre del producto</h2>
    </header>
    <div class="card-body px-4">
        Cantidad: <strong>4</strong>
    </div>
    <div class="card-body px-4">
        Price : $10
    </div>
    <footer class="card-footer">
        <button class="p-2 rounded variant-glass-primary">Añadir</button>
        <button class="p-2 rounded variant-glass-error">Añadir</button>
    </footer>
</div>