<template>
  <div>
    <div class="sp-container">
      <sp-sign-in />
      <sp-bank-balances />
      <poll-form />
      <poll-list />
      <vote-list />
      <!-- this line is used by starport scaffolding # 4 -->
      <!-- <sp-type-form type="vote" :fields="['pollID', 'value', ]" /> -->
    </div>
  </div>
</template>

<script>
import * as sp from "@tendermint/vue";
import PollForm from '../components/PollForm';
import PollList from '../components/PollList';
import VoteList from '../components/VoteList'

export default {
  components: { ...sp, PollForm, PollList, VoteList },
};
</script>
