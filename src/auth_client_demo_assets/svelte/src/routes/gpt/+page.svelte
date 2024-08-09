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
    max-width: 1200px;
    margin: auto;
    border: 1px solid #dee2e6;
    border-radius: 8px;
    background-color: #ffffff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-top: 70px;
  }

  .chat-history {
    flex: 1;
    padding: 20px;
    overflow-y: auto;
    display: flex;
    flex-direction: column;
    gap: 15px;
    background-color: #f8f9fa;
    border-bottom: 1px solid #dee2e6;
    border-radius: 8px 8px 0 0;
  }

  .chat-history::-webkit-scrollbar {
    width: 8px;
  }

  .chat-history::-webkit-scrollbar-thumb {
    background-color: #ced4da;
    border-radius: 4px;
  }

  .chat-history::-webkit-scrollbar-thumb:hover {
    background-color: #adb5bd;
  }

  .chat-input-container {
    padding: 15px;
    border-top: 1px solid #dee2e6;
    background-color: #ffffff;
    border-radius: 0 0 8px 8px;
    box-shadow: 0 -2px 6px rgba(0, 0, 0, 0.05);
  }
</style>

<div class="chat-container rounded-xl">
  <div class="chat-history">
    {#each messages as message, index (index)}
      <ChatMessage {message} />
    {/each}
  </div>
  <div class="chat-input-container rounded-b-xl">
    <ChatInput on:sendMessage={sendMessage} />
    <div class="flex p-3 align-middle">
      <input bind:value={apiKey} class="align-middle" type="text" placeholder="Key in your OpenAPI API key" style="width:80%">
    </div>
  </div>
  
</div>