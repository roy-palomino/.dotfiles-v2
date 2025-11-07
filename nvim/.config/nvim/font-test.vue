<template>
  <div class="container">
    <h1>{{ message }}</h1>
    <p>Testing font variants</p>
  </div>
</template>

<script setup lang="ts">
// Keywords should be italic: const, import, export, function, if, else
const message = 'Font Test' // constant should be bold
let counter = 0 // variable should be normal

// Functions should be bold
function incrementCounter(): void {
  counter++
  console.log('Counter:', counter) // string should be normal color
}

// Type annotations should be italic
interface TestInterface {
  name: string
  count: number
}

// Conditional keywords should be italic
if (counter > 0) {
  console.log('Counter is positive')
} else {
  console.log('Counter is zero or negative')
}

// Parameters should be italic
function greetUser(userName: string, age: number): string {
  return `Hello ${userName}, you are ${age} years old`
}
</script>

<style scoped>
/* CSS properties and values */
.container {
  display: flex;
  flex-direction: column;
  background-color: #ffffff;
  font-family: 'Inter', sans-serif;
}

h1 {
  font-weight: bold;
  color: #333333;
  margin-bottom: 1rem;
}

p {
  font-style: italic;
  color: #666666;
}
</style>