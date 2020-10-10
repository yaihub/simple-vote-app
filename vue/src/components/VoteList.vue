<template>
  <div>
    <h2>List of Votes</h2>
    <div v-for="vote in votes">
      <div class="item">
        <h4>Vote {{ vote.id }}</h4>
        <div class="item__field">
          <div class="item__field__key">Creator:</div>
          <div class="item__field__value">
            {{ vote.creator }}
          </div>
        </div>
        <div class="item__field">
          <div class="item__field__key">Poll ID:</div>
          <div class="item__field__value">
            {{ vote.pollID }}
          </div>
        </div>
        <div class="item__field">
          <div class="item__field__key">Value:</div>
          <div class="item__field__value">
            {{ vote.value }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.item {
  box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.1);
  margin-bottom: 1rem;
  padding: 1rem;
  border-radius: 0.5rem;
  overflow: hidden;
}
.item {
  box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.1);
  margin-bottom: 1rem;
  padding: 1rem;
  border-radius: 0.5rem;
  overflow: hidden;
}
.item__field {
  display: grid;
  line-height: 1.5;
  grid-template-columns: 15% 1fr;
  grid-template-rows: 1fr;
  word-break: break-all;
}
.item__field__key {
  color: rgba(0, 0, 0, 0.25);
  word-break: keep-all;
  overflow: hidden;
}
</style>

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
