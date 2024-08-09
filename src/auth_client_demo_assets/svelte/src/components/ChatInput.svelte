<script>
  import { createEventDispatcher } from 'svelte';

  let input = '';
  const dispatch = createEventDispatcher();

  function sendMessage() {
    if (input.trim()) {
      dispatch('sendMessage', input);
      input = '';
    }
  }
</script>

<style>
  .input-container {
    display: flex;
    align-items: center;
    gap: 10px;
  }

  input {
    flex: 1;
    padding: 10px;
    border: 1px solid #e0e0e0;
    border-radius: 5px;
    font-size: 14px;
  }

  button {
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  button:disabled {
    background-color: #ccc;
  }
</style>

<div class="input-container">
  <input
    type="text"
    bind:value={input}
    on:keydown={(e) => e.key === 'Enter' && sendMessage()}
    placeholder="Type a message..."
  />
  <button on:click={sendMessage} disabled={!input.trim()}>Send</button>
</div>
