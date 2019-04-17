<template>
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
      </tr>
      <tr v-for="m in members" :key="m.id">
        <td><router-link :to="{ name: 'MemberDetailPage', params: { id: m.id } }">{{ m.id }}</router-link></td>
        <td>{{ m.name }}</td>
        <td>{{ m.department }}</td>
				<td>{{ m.grade }}</td>
        <td>{{ m.gender }}</td>
        <td>{{ m.joined_date }}</td>
      </tr>
    </tbody>
  </table>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      members: []
    }
  },
  mounted () {
    axios
      .get(`/api/v1/members.json`)
      .then(response => (this.members = response.data))
  }
}
</script>