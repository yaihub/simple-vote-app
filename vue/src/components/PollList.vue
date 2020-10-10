<template>
  <div>
    <h2>List of Polls</h2>
    <div class="item" v-for="poll in polls">
      <h4>Poll {{ poll.title }}</h4>
      <div v-for="option in poll.options">
        <!-- <input
          type="radio"
          @click="submit(poll.id, option)"
          :name="poll.id"
          :value="option"
        />
        <label>{{option}}</label> -->
        <button @click="submit(poll.id, option)">Vote {{option}}</button>
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
</style>

<script>
export default {
  data() {
    return {
      selected: ""
    };
  },
  computed: {
    polls() {
      return this.$store.state.cosmos.data.poll || [];
    },
    votes() {
      return this.$store.state.cosmos.data.vote || [];
    }
  },
  created() {
    this.$store.dispatch("cosmos/entityFetch", { type: "poll" });
    this.$store.dispatch("cosmos/entityFetch", { type: "vote" });
  },
  methods: {
    results(id) {
      const results = this.votes.filter(v => v.pollID === id);
      return 0;
      // return this.$lodash.countBy(results, "value");
    },
    async submit(pollID, value) {
      const type = { type: "vote" };
      const body = { pollID, value };
      await this.$store.dispatch("cosmos/entitySubmit", { ...type, body });
      await this.$store.dispatch("cosmos/entityFetch", type);
    }
  }
};
</script>
