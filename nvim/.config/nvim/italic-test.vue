<template>
  <div class="hero-section">
    <!-- Comments should be italic -->
    <h1 :class="titleClass">{{ pageTitle }}</h1>
    <button @click="handleClick" :disabled="isLoading">
      {{ buttonText }}
    </button>
    <input v-model="userInput" placeholder="Type something..." />
  </div>
</template>

<script setup lang="ts">
// All these keywords should be ITALIC: import, const, let, function, if, else, for, while, return, export, interface, type
import { ref, computed, onMounted } from 'vue'
import type { Ref } from 'vue'

// Interface and type definitions should be ITALIC
interface User {
  id: number
  name: string
  email: string
}

type Status = 'loading' | 'success' | 'error'

// Constants should be BOLD and const keyword ITALIC
const API_URL = 'https://api.example.com'
const MAX_RETRIES = 3

// Variables (let keyword should be ITALIC, variable names normal)
let counter = 0
let isAuthenticated = false

// Reactive refs (const ITALIC, variable names normal)
const userInput: Ref<string> = ref('')
const isLoading = ref(false)
const users = ref<User[]>([])
const currentStatus = ref<Status>('loading')

// Computed (const ITALIC, function name BOLD)
const pageTitle = computed(() => {
  // if/else keywords should be ITALIC
  if (isLoading.value) {
    return 'Loading...'
  } else if (users.value.length > 0) {
    return `Found ${users.value.length} users`
  } else {
    return 'No users found'
  }
})

const titleClass = computed(() => {
  // return keyword should be ITALIC
  return isLoading.value ? 'loading-title' : 'normal-title'
})

const buttonText = computed(() => {
  return isLoading.value ? 'Loading...' : 'Click me!'
})

// Function names should be BOLD, async/function keywords ITALIC
async function fetchUsers(): Promise<User[]> {
  // try/catch keywords should be ITALIC
  try {
    isLoading.value = true
    // const keyword ITALIC
    const response = await fetch(`${API_URL}/users`)
    
    // if keyword ITALIC
    if (!response.ok) {
      // throw keyword should be ITALIC
      throw new Error('Failed to fetch users')
    }
    
    const data = await response.json()
    return data
  } catch (error) {
    console.error('Error fetching users:', error)
    // return keyword ITALIC
    return []
  } finally {
    // finally keyword ITALIC
    isLoading.value = false
  }
}

// Function name BOLD, function keyword ITALIC
function handleClick(): void {
  // if keyword ITALIC
  if (isLoading.value) {
    return
  }
  
  counter++
  console.log(`Button clicked ${counter} times`)
  
  // for keyword ITALIC
  for (let i = 0; i < 3; i++) {
    console.log(`Loop iteration: ${i}`)
  }
  
  // while keyword ITALIC
  while (counter > 10) {
    counter--
  }
}

// Lifecycle hooks (function name BOLD)
onMounted(async () => {
  // const keyword ITALIC
  const fetchedUsers = await fetchUsers()
  users.value = fetchedUsers
})

// Export keyword should be ITALIC
export { fetchUsers, handleClick }
</script>

<style scoped>
/* CSS keywords and properties should have their own styling */
.hero-section {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 2rem;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  min-height: 100vh;
}

.loading-title {
  color: #fbbf24;
  font-weight: bold;
  animation: pulse 2s infinite;
}

.normal-title {
  color: #1f2937;
  font-weight: 600;
}

/* Pseudo-selectors and media queries */
button:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

button:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

@media (max-width: 768px) {
  .hero-section {
    padding: 1rem;
  }
}

@keyframes pulse {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: 0.5;
  }
}
</style>