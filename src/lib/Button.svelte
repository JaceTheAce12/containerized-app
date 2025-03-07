<script>
    let { name, buttonClass, onclick } = $props();
</script>

<button aria-label="Button" class={buttonClass} onclick={onclick}>{name}</button>