<script>
    import Button from "./Button.svelte";
    let { todo, onToggle, onDelete, onEdit} = $props();
    let editing = $state(false);
    let originalText = $state(todo.text);

    function editTodo() {
        editing = true;
        console.log(originalText);
    }

    function deleteTodo() {
        onDelete(todo.id);
    }

    function toggleDone() {
        onToggle(todo.id);
    }

    function saveTodo() {
        editing = false;
        onEdit(todo.id, originalText);
    }

    function cancelEdit() {
        editing = false;
        originalText = todo.text;
    }
</script>

<li class='todo-item bg-gray-800 p-2 rounded-lg shadow-lg flex justify-between items-center my-2 cursor-pointer'>
    {#if !editing}
        <button onclick={toggleDone} class='cursor-pointer'><span class={`${todo.done ? 'line-through' : ''}`}>{todo.text}</span></button>
        <div>
            <Button name='Edit' buttonClass='bg-blue-500 text-white p-2 rounded-lg cursor-pointer hover:bg-blue-600' onclick={editTodo}/>
            <Button name='Delete' buttonClass='bg-red-500 text-white p-2 rounded-lg cursor-pointer hover:bg-red-600' onclick={deleteTodo}/>
        </div>
    {:else}
        <input type='text' bind:value={originalText} class='p-2 border border-gray-300 rounded-lg'/>
        <div>
            <Button name='Save' buttonClass='bg-green-500 text-white p-2 rounded-lg cursor-pointer hover:bg-green-600' onclick={saveTodo}/>
            <Button name='Cancel' buttonClass='bg-red-500 text-white p-2 rounded-lg cursor-pointer hover:bg-red-600' onclick={cancelEdit}/>
        </div>
    {/if}
</li>
