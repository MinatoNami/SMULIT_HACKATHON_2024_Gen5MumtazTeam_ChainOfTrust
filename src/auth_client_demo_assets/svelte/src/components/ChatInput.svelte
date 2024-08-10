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
    background-color: #f8f9fa;
    padding: 10px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  }

  input {
    flex: 1;
    padding: 12px;
    border: 1px solid #ced4da;
    border-radius: 8px;
    font-size: 16px;
    background-color: #ffffff;
    color: #495057;
    transition: border-color 0.3s ease;
  }

  input:focus {
    border-color: #80bdff;
    outline: none;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
  }

  input::placeholder {
    color: #adb5bd;
  }

  button {
    padding: 12px 24px;
    background-color: #28a745;
    color: white;
    width:100px;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
  }

  button:hover {
    background-color: #218838;
    transform: translateY(-2px);
  }

  button:disabled {
    background-color: #6c757d;
    cursor: not-allowed;
  }

  button:disabled:hover {
    transform: none;
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
