<script>
    import { goto } from "$app/navigation";
    import { auth } from "../stores/auth";
    // let principal = "";
    // $auth.whoamiActor?.whoami().then((p) => {
    //   principal = p.toString();
    //   principal = principal.substring(0,30) + '.......';
    // });
</script>

<div id='transition' style:--widget="loginout"  class="container">
  <a href='/home' class="icon">
    <i class="fi fi-rr-down-left-and-up-right-to-center"></i>
  </a>
    <h1>Internet Identity Client</h1>
    <div class='authenticated-row'>
      <h2>You are authenticated</h2>
      <i class="fi fi-sr-shield-check"></i>
    </div>
    <button id="continue" on:click={() => goto('/home')}>Continue</button>
    <button id="logout" on:click={$auth.logout}>Log out</button>
</div>

<style>
  .authenticated-row {
    display: flex;
    align-items: baseline;
    gap: 15px;
  }
  .icon {
    display: flex;
    align-self: flex-end;
    margin: -20px 0px 20px 0px;
    text-decoration:none; 
    color:inherit;
    width: 20px;
  }

  #transition {
    view-transition-name: var(--widget);
  }
  
</style>
