<script lang="ts">
import Header from '$lib/header/Header.svelte';
import ChatMessage from '../../components/ChatMessage.svelte';
import ChatInput from '../../components/ChatInput.svelte';
import OpenAI from 'openai';

let prompt = '';
let response = '';
let messages:any= [
  { role: "assistant" , content: "Hello! How can I assist you today?"}
];

let apiKey = ""


async function sendMessage(input:any) {
  const openai = new OpenAI(
  {
    apiKey: apiKey,
    dangerouslyAllowBrowser: true 
  });
  if (!apiKey) return
  prompt = input.detail;
  if (prompt.trim() === '') return;
  messages = [...messages, { role: "user" , content: prompt }];
  try {
    const completion = await openai.chat.completions.create({
      model: "gpt-4", // or "gpt-3.5-turbo"
      messages: [{ role: "system", content: "You are a helpful assistant." }, ...messages],
    });
    response = completion.choices[0].message.content || 'No response';
  } catch (error:any) {
    console.log("error", error);
    response = 'An error occurred: ' + error.message;
  }
  // Log prompt and response
  logPromptResponse(prompt, response);
  messages = [...messages, { role: "assistant", content: response}];
}

function logPromptResponse(prompt:any, response:any) {
  // INSERT FUNCTION TO LOG PROMPT AND RESPONSE
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
    height: 80vh;
    width: 80vw;
    /* padding: 0px 32px 0px 32px; */
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
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
  }
</style>

<div class="chat-container">
  <div class="chat-history">
    {#each messages as message, index (index)}
      <ChatMessage {message} />
    {/each}
  </div>
  <div class="chat-input-container">
    <ChatInput on:sendMessage={sendMessage} />
  </div>
  <div style="padding:10px;">
    <input bind:value={apiKey} type="text" placeholder="Key in OpenAPI API key" style="width:80%">
  </div>
  
</div>