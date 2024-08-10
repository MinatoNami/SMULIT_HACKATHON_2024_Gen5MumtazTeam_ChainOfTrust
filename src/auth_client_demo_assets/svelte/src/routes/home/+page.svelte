<script>
	import { fly } from 'svelte/transition';
</script>


<section class="text-3xl sm:text-5xl md:text-6xl lg:text-7xl xl:text-7xl 2xl:text-7xl">
  <div>
    <div in:fly="{{ x:-125, duration: 1250, delay: 350}}" class="padded">
      <span class="moon-font text-xl md:text-5xl">
        SMU LIT Hackathon 2024
      </span>
    </div>
    <div in:fly="{{ x:125, duration: 1250, delay: 750}}" class="padded">
      <span class="moon-font text-3xl md:text-7xl">
        ICPHub's Gen AI
      </span>
    </div>
    <div style="padding-top:20px;">
      <hr class="h-0.5">
    </div>
    <div class='authors'>
      <span in:fly="{{ x:125, duration: 1250, delay: 800}}">
        By:
      </span>
      <span in:fly="{{ x:125, duration: 1250, delay: 850}}">
        Chong Cheng Yang Lionel
      </span>
      <span in:fly="{{ x:125, duration: 1250, delay: 900}}">
        Mellisa Eveline Rahardjo
      </span>
      <span in:fly="{{ x:125, duration: 1250, delay: 950}}">
        Mumtaz Binte Abdul Halim
      </span>
      <span in:fly="{{ x:125, duration: 1250, delay: 1000}}">
        Nafees Abdul Kader
      </span>
      <span in:fly="{{ x:125, duration: 1250, delay: 1050}}">
        Ng Yujin Benjamin
      </span>
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
    border-left: 0px;
    /* max-width: 700px; */
	}

	.padded {
		padding-bottom: 1rem;
	}

  .authors {
    float: left;
    margin: 30px;
    display: flex;
    align-items: flex-start;
    gap: 10px;
    width: 550px;
  }

</style>
