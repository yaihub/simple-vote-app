<template>
  <div>
    <h2>Create Poll</h2>
    <sp-input placeholder="Title" v-model="title" />
    <div >
      <sp-input v-for="option in options" placeholder="Option" v-model="option.title" />
    </div>
    <sp-button @click="add">Add option</sp-button>
    <sp-button @click="submit">Create poll</sp-button>
  </div>
</template>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;531;600;700;800&display=swap");

.button {
  display: inline-block;
}
</style>

<script>
import * as sp from "@tendermint/vue";

export default {
  components: { ...sp },
  data() {
    return {
      title: "",
      options: []
    };
  },
  methods: {
    add() {
      this.options = [...this.options, { title: "" }];
    },
    async submit() {
      const payload = {
        type: "poll",
        body: {
          title: this.title,
          options: this.options.map(o => o.title)
        }
      };
      await this.$store.dispatch("cosmos/entitySubmit", payload);
      await this.$store.dispatch("cosmos/entityFetch", payload);
      this.title = "";
      this.options = [];
			// await this.$store.dispatch("cosmos/accountUpdate");
    }
  }
};
</script>
