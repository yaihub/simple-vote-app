<template>
  <div>
    <div v-for="vote in votes">
      <h2 type="h2">Vote {{ vote.id }}</h2>
      <!-- <h4 type="subtitle">Results: {{ results(poll.id) }}</h4> -->
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selected: ""
    };
  },
  computed: {
    votes() {
      return this.$store.state.cosmos.data.vote || [];
    }
  },
  methods: {
    // results(id) {
    //   const results = this.votes.filter(v => v.pollID === id);
    //   return 0;
    //   // return this.$lodash.countBy(results, "value");
    // },
    // async submit(pollID, value) {
    //   const type = { type: "vote" };
    //   const body = { pollID, value };
    //   await this.$store.dispatch("cosmos/entitySubmit", { ...type, body });
    //   await this.$store.dispatch("cosmos/entityFetch", type);
    // }
  }
};
</script>
