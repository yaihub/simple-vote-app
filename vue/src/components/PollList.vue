<template>
  <div>
    <div v-for="poll in polls">
      <h2 type="h2">Poll {{ poll.title }}</h2>
      <div v-for="option in poll.options">
        <input
          type="radio"
          @click="submit(poll.id, option)"
          :name="poll.id"
          :value="option"
        />
        <label>{{option}}</label>
      </div>
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
    polls() {
      return this.$store.state.cosmos.data.poll || [];
    },
    votes() {
      return this.$store.state.cosmos.data.vote || [];
    }
  },
  created() {
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
