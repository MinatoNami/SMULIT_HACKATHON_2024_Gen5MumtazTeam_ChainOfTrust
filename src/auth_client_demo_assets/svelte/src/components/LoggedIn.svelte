<script>
    import { goto } from "$app/navigation";
  import { auth } from "../stores/auth";
  let principal = "";
  $auth.whoamiActor?.whoami().then((p) => {
    principal = p.toString();
    principal = principal.substring(0, 30) + '......';
  });
</script>

<div style:--widget="loginout"  class="container">
    <a href='/home' class="icon">
      <i class="fi fi-rr-down-left-and-up-right-to-center"></i>
    </a>
  <h1>Internet Identity Client</h1>
  <h2>You are authenticated!</h2>
  <p>Welcome back,</p>
  <p class='wordbreak'>{principal}</p>
  <button id="continue" on:click={() => goto('/home')}>Continue</button>
  <button id="logout" on:click={$auth.logout}>Log out</button>
</div>

<style>

  .icon {
    display: flex;
    align-self: flex-end;
    margin: -20px 0px 20px 0px;
    text-decoration:none; 
    color:inherit;
    width: 20px;
  }

  .wordbreak {
    word-break: break-all;
  }

  div {
    view-transition-name: var(--widget);
  }
  
</style>
