<template>
  <div>
    <div class="sp-container">
      <sp-sign-in />
      <sp-bank-balances />
      <sp-token-send />
      <poll-form />
      <poll-list />
      <!-- this line is used by starport scaffolding # 4 -->
      <sp-type-form type="vote" :fields="['pollID', 'value', ]" />
    </div>
  </div>
</template>

<script>
import * as sp from "@tendermint/vue";
import PollForm from '../components/PollForm';
import PollList from '../components/PollList';

export default {
  components: { ...sp, PollForm, PollList },
};
</script>
