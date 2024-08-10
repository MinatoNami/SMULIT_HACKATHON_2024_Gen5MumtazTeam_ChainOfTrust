<script lang="ts">
  export let message:any;
</script>

<style>
  .message {
    max-width: 75%;
    padding: 12px 16px;
    border-radius: 16px;
    line-height: 1.5;
    font-size: 14px;
    word-wrap: break-word;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    margin-bottom: 10px;
    position: relative;
    display: inline-block;
    text-align: left;
  }

  .bot {
    background: linear-gradient(135deg, #f0f0f0, #d9d9d9);
    align-self: flex-start;
    border-bottom-left-radius: 0;

  }

  .bot::after {
    left: 15px;
    border-width: 6px 6px 0 0;
    border-color: #d9d9d9 transparent transparent transparent;
  }

  .user {
    background: linear-gradient(135deg, #007bff, #0056b3);
    color: white;
    align-self: flex-end;
    border-bottom-right-radius: 0;
  }

  .user::after {
    right: 15px;
    border-width: 6px 0 0 6px;
    border-color: #0056b3 transparent transparent transparent;
  }
</style>

<div class="message {message.role}">
  {message.content}
</div>
