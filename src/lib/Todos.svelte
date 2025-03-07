<script>
    import TodoItem from "./TodoItem.svelte";
    import Input from "./Input.svelte";
    import Button from "./Button.svelte";
    let { todos, deleteTodo, toggleDone, editTodo, addTodo, clearCompleted } = $props();
    let newText = $state('');
    let errorMessage = $state('');

    function handleAddTodo() {
        if (!newText) {
            errorMessage = 'Please enter a todo';
            return;
        }
        addTodo(newText);
        newText = '';
        errorMessage = '';
    }
    
    function keydown(event) {
        if (event.key === 'Enter') {
            handleAddTodo();
        }
    }

    function completedTodos() {
        return todos.filter(todo => todo.done).length;
    }

    function handleClearCompleted() {
        clearCompleted();
    }
</script>

<div class='todo-container bg-gray-900 p-4 rounded-lg shadow-lg max-w-xl mx-auto w-full'>
    <div class='flex items-center justify-center mb-4 max-w-lg w-full space-x-3'>
        <div class='flex flex-col'>
            <Input placeholder='Add a new todo' bind:value={newText} keydown={keydown}/>
            <p class='text-red-500'>{errorMessage}</p>
        </div>
        <Button name='Add' buttonClass='bg-blue-500 text-white p-2 rounded-lg cursor-pointer hover:bg-blue-600' onclick={handleAddTodo}/>
    </div>
    <ul>
        {#each todos as todo (todo.id)}
            <TodoItem onToggle={toggleDone} onDelete={deleteTodo} onEdit={editTodo} {todo} />
        {/each}
    </ul>
    <div class='flex items-center justify-between mt-4'>
        <p>You have {completedTodos()} completed todos.</p>
        <Button name='Clear Completed' buttonClass='bg-red-500 text-white p-2 rounded-lg cursor-pointer hover:bg-red-600' onclick={handleClearCompleted}/>
    </div>
</div>
