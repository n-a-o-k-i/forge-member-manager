<template>
  <div>
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <table>
      <tbody>
        <tr>
          <router-link to="/members/new">メンバー新規作成</router-link>
        </tr>
        <tr>
          <th>ID</th>
          <th>name</th>
          <th>department</th>
          <th>grade</th>
          <th>gender</th>
          <th>joined_date</th>
          <th>action</th>
        </tr>
        <tr v-for="m in members" :key="m.id">
          <td><router-link :to="{ name: 'MemberDetailPage', params: { id: m.id } }">{{ m.id }}</router-link></td>
          <td>{{ m.name }}</td>
          <td>{{ m.department }}</td>
          <td>{{ m.grade }}</td>
          <td>{{ m.gender }}</td>
          <td>{{ m.joined_date }}</td>
          <td><button @click="deleteTarget = m.id; showModal = true">Delete</button></td>
        </tr>
      </tbody>
    </table>
    <modal v-if="showModal" @cancel="showModal = false" @ok="deleteMember(); showModal = false;">
      <div slot="body">Are you sure?</div>
    </modal>
  </div>
</template>

<script>
import axios from 'axios';

import Modal from 'Modal.vue'

export default {
  components: {
    Modal
  },
  data: function () {
    return {
      members: [],
      showModal: false,
      deleteTarget: -1,
      errors: ''
    }
  },
  mounted () {
    this.updateMembers();
  },
  methods: {
    deleteMember: function() {
      if (this.deleteTarget <= 0) {
        console.warn('deleteTarget should be grater than zero.');
        return;
      }

      axios
        .delete(`/api/v1/members/${this.deleteTarget}`)
        .then(response => {
          this.deleteTarget = -1;
          this.updateMembers();
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    },
    updateMembers: function() {
      axios
        .get('/api/v1/members.json')
        .then(response => (this.members = response.data))
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>