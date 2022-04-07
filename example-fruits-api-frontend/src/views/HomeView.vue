<script>
import axios from "axios";
export default {
  data: function () {
    return {
      message: "Welcome to Fruits!",
      fruits: [],
      newFruitParams: {}
    };
  },
  created: function () {
    this.indexFruits()
  },
  methods: {
    indexFruits: function () {
      axios.get(`/fruits`).then(response => {
        console.log("index fruits", response)
        this.fruits = response.data
      })
    },
    createFruit: function () {
      axios.post(`/fruits`, this.newFruitParams).then(response => {
        console.log('creating fruit', response)
        this.fruits.push(response.data)
      })
    }
  },
};
</script>

<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <p>Create New Fruit</p>
    <p>
      Name:
      <input type="text" v-model="newFruitParams.name" />
    </p>
    <p>
      Image:
      <input type="text" v-model="newFruitParams.image" />
    </p>
    <p>
      Quality:
      <input type="text" v-model="newFruitParams.quality" />
    </p>
    <button v-on:click="createFruit">Create!</button>
    <div v-for="fruit in fruits" v-bind:key="fruit.id">
      <p>{{ fruit.name }}</p>
    </div>
  </div>
</template>

<style></style>