<script>
    let { placeholder, value = $bindable(), keydown} = $props();
</script>

<input type='text' placeholder={placeholder} class='p-2 border border-gray-300 rounded-lg' bind:value={value} onkeydown={keydown}/>