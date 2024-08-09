<script lang="ts">
	import Header from '$lib/header/Header.svelte';
  import ChatMessage from '../../components/ChatMessage.svelte';
  import ChatInput from '../../components/ChatInput.svelte';

  let messages = [
    { text: "Hello! How can I assist you today?", sender: "bot" }
  ];
  

  function sendMessage(text:any) {
    messages = [...messages, { text: text.detail, sender: "user" }];
    setTimeout(() => {
      messages = [...messages, { text: "Let me think...", sender: "bot" }];
    }, 1000);
  }
</script>

<Header/>
<div style:--widget="loginout" class="icon-container">
  <a href='/' class="icon">
    <i class="fi fi-ss-sign-out-alt"></i>
  </a>
</div>

<style>
  :global(body) {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
  }

  .chat-container {
    display: flex;
    flex-direction: column;
    height: 100vh;
    width: 80vw;
    padding: 0px 32px 0px 32px;
    border: 1px solid #e0e0e0;
    border-radius: 10px;
    background-color: #fff;
  }

  .chat-history {
    flex: 1;
    padding: 20px;
    overflow-y: auto;
    display: flex;
    flex-direction: column;
    gap: 10px;
  }

  .chat-input-container {
    padding: 10px;
    border-top: 1px solid #e0e0e0;
    background-color: #fafafa;
  }
</style>

<div class="chat-container">
  <div class="chat-history">
    {#each messages as message (message.text)}
      <ChatMessage {message} />
    {/each}
  </div>
  <div class="chat-input-container">
    <ChatInput on:sendMessage={sendMessage} />
  </div>
</div>