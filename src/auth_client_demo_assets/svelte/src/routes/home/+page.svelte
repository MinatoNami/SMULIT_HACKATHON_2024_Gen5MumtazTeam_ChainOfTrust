<script>
	import { fly } from 'svelte/transition';
	import Header from '$lib/header/Header.svelte';
</script>

<Header/>
<div style:--widget="loginout" class="icon-container">
  <a href='/' class="icon">
    <i class="fi fi-ss-sign-out-alt"></i>
  </a>
</div>

<section class="text-3xl sm:text-5xl md:text-6xl lg:text-7xl xl:text-7xl 2xl:text-7xl">
  <div>
    <div in:fly="{{ x:-125, duration: 1250, delay: 350}}" class="padded">
      <span class="moon-font text-xl md:text-5xl">
        SMU LIT Hackathon 2024
      </span>
    </div>
    <div in:fly="{{ x:125, duration: 1250, delay: 750}}" class="padded">
      <span class="moon-font text-3xl md:text-7xl">
        Project Gen AI
      </span>
    </div>
    <div style="padding-top:20px;">
      <hr class="h-0.5">
    </div>
  </div>
</section>


<style>
	section {
    width: 50%;

    & div {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      flex: 1;
      width: 100%;
    }
	}
  
	@keyframes mymove {
		from {width:0%;}
		to {width:75%;}
	}

	hr {
		margin: auto;
		animation: mymove 2s;
		animation-delay: 1.1s;
		animation-fill-mode: both;
		border-top: 2px solid #8c8b8b;
    /* max-width: 700px; */
	}

	.padded {
		padding-bottom: 1rem;
	}

.icon-container {
  position: absolute;
  top: 0;
  right: 0;
  border: 0px;
  
  padding: 3.5rem 2.5rem 0rem 0rem;
  /* max-width: 365px; */
  /* min-width: 300px; */
  flex: 0 0 auto;
  display: flex;
  flex-direction: column;

  view-transition-name: var(--widget);
}

.icon {
    display: flex;
    align-self: flex-end;
    margin: -10px 0px 10px 0px;
    text-decoration:none; 
    color:inherit;
    width: 20px;
  }
	a {
		margin: 25px 20px;
		width: 10%;
		min-width:55px;
	}
</style>
