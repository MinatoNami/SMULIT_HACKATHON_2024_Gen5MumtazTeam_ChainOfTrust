<script>
  export let message;
</script>

<style>
  .message {
    max-width: 75%;
    padding: 10px;
    border-radius: 10px;
    line-height: 1.5;
    font-size: 14px;
    word-wrap: break-word;
  }

  .bot {
    background-color: #e0e0e0;
    align-self: flex-start;
  }

  .user {
    background-color: #007bff;
    color: white;
    align-self: flex-end;
  }
</style>

<div class="message {message.sender}">
  {message.text}
</div>
