<script>
  import Todos from "./lib/Todos.svelte";
  let todos = $state([
    { id: 1, text: 'Learn Svelte', done: true },
    { id: 2, text: 'Build an app', done: true },
    { id: 3, text: 'Ship it', done: false }
  ]);

  function addTodo(text) {
    if (!text) return;
    const newTodo = {
      id: todos.length + 1,
      text,
      done: false
    };
    todos = [...todos, newTodo];
  }

  function deleteTodo(id) {
    todos = todos.filter(todo => todo.id !== id);
  }

  function toggleDone(id) {
    todos = todos.map(todo => todo.id === id ? { ...todo, done: !todo.done } : todo);
  }

  function editTodo(id, text) {
    todos = todos.map(todo => todo.id === id ? { ...todo, text: text } : todo);
    console.log(todos);

  }

  function clearCompleted() {
        todos = todos.filter(todo => !todo.done);
  }
</script>

<main class='h-screen flex flex-col items-center justify-center'>
  <h1 class='text-4xl font-bold mb-4 text-center'>Svelte Todos</h1>
  <Todos {todos} {deleteTodo} {toggleDone} {editTodo} {addTodo} {clearCompleted}/>
</main>


