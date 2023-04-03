<template>
  <div>
    <p>
      <textarea v-model="state.commentText"></textarea>
    </p>
    <p>
      <button @click="addComment"></button>
    </p>
  </div>
  <div>
    <ul>
      <li  >
        <p>name</p>
        <p>comment</p>
        <div>
          <p>
            <textarea  ></textarea>
          </p>
        </div>
      </li>
    </ul>
  </div>
</template>

<script setup lang="ts">
import {reactive} from 'vue'

const state=reactive({
  commentText:'',
  commentTree:null
})

const addComment=()=>{

}

</script>

<style scoped></style>