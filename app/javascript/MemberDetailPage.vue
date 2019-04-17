<template>
	<dl>
    <dt>ID</dt>
    <dd>{{ member.id }}</dd>
    <dt>Name</dt>
    <dd>{{ member.name }}</dd>
    <dt>Department</dt>
    <dd>{{ member.department }}</dd>
    <dt>Grade</dt>
    <dd>{{ member.grade }}</dd>
    <dt>Gender</dt>
    <dd>{{ member.gender }}</dd>
    <dt>Joined Date</dt>
    <dd>{{ member.joined_date }}</dd>
    <dt>Address</dt>
    <dd>{{ member.address }}</dd>
    <dt>Tel</dt>
    <dd>{{ member.tel }}</dd>
    <dd><router-link to="/">メンバー一覧へ</router-link></dd>
  </dl>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      member: []
    }
  },
  mounted () {
    axios
      .get(`/api/v1/members/${this.$route.params.id}.json`)//''で囲うとデータを取れない
      .then(response => (this.member = response.data))
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>