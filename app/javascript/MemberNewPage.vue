<template>
  <form @submit.prevent="createMember">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div>
      <label>Name</label>
      <input v-model="member.name" type="text">
    </div>
    <div>
      <label>Age</label>
      <input v-model="member.age" type="number">
    </div>
    <div>
      <label>Department</label>
      <input v-model="member.department" type="text">
    </div>
    <div>
      <label>Grade</label>
      <input v-model="member.grade" type="text">
    </div>
    <div>
      <label>Gender</label>
      <select v-model="member.gender">
        <option>other</option>
        <option>male</option>
        <option>female</option>
      </select>
    </div>
    <div>
      <label>Joined Date</label>
      <input v-model="member.joined_date" type="date">
    </div>
    <div>
      <label>Address</label>
      <input v-model="member.address" type="text">
    </div>
    <div>
      <label>Tel</label>
      <input v-model="member.tel" type="text">
    </div>
    <div>
      <label>Birth</label>
      <input v-model="member.birth" type="date">
    </div>
    <button type="submit">Commit</button>
  </form>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      member: {
        name: '',
        department: '',
        grade: '',
        gender: '',
        joined_date: ''
      },
      errors: ''
    }
  },
  methods: {
    createMember: function() {
      axios
        .post('/api/v1/members', this.member)
        .then(response => {
          let m = response.data;
          this.$router.push({ name: 'MemberDetailPage', params: { id: m.id } });
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  }
}
</script>

<style scoped>
</style>