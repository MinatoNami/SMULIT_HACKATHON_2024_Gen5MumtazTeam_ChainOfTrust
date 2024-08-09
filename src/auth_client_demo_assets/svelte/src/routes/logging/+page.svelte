<script>
    import { createActor, canisterId } from "../../../../../declarations/counter";

    let data = []
    let actor = createActor(canisterId);
    let waiting = false;

    const read_array = async () => {
        try {
            waiting = true;
            data = await actor.read_array();
            waiting = false;
        } catch (err) {
            console.error(err)
        }
    }

    const append = async (val) => {
        try {
            waiting = true;
            await actor.append(val);
            read_array();
        } catch (err) {
            console.error(err)
        }
    }

    const clear = async () => {
        try {
            waiting = true;
            await actor.clear();
            read_array();
        } catch (err){
            console.error(err)
        }
    }

    const timestamp_date = (data) => {
        let data_array = data.split('_')
        let d = new Date(parseInt(data_array[0]));
        let timestamp = d.toISOString();
        return timestamp.split('T')[0]
    }
    const timestamp_time = (data) => {
        let data_array = data.split('_')
        let d = new Date(parseInt(data_array[0]));
        let timestamp = d.toTimeString();
        return timestamp.split(' ')[0]
    }
    const message = (data) => {
        return data.split('_')[1]
    }
    const id = (data) => {
        return data.split('_')[2]
    }
    read_array()

</script>

<!-- <button on:click={() => append((Date.now()).toString() + '_' + 'Logging message' + '_' + 'gpt-4')}>generate</button>

<button on:click={() => clear()}>clear</button> -->

{#if waiting}
<span class="daisy-loading loading loading-infinity loading-lg"></span>
{:else}
<div class="table-margin overflow-x-auto"><i on:click={() => read_array()} class="refresh-button fi fi-rr-refresh"></i>
    <table class="table">
        
        <thead>
        <tr class='tr'>
            <th>Timestamp</th>
            <th style="width: 600px;">Message</th>
            <th>User/Model</th>
        </tr>
        </thead>
        <tbody>
        {#each data as row}
        <tr>
            <td>{timestamp_time(row)}<br>{timestamp_date(row)}</td>
            <td>{message(row)}</td>
            <td>{id(row)}</td>
        </tr>
        {/each}
        </tbody>
    </table>
</div>
{/if}

<style>
    .table-margin {
        margin-top: 100px;
    }
    .daisy-loading {
        width: 8vw;
    }
    .refresh-button {
        cursor: pointer;
        margin-left: 20px;
    }
</style>
  