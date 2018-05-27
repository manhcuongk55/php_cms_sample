require('../bootstrap.js');

new Vue({
	el: '#import',
	data: {
		file: null
	},
	mounted(){

	},
	methods: {
		upload(e){
			var $this = this;

			var frm = new FormData();
			frm.append('file', this.$refs.file.files[0]);

			axios.post(app.baseURL + '/manager/upload', frm, {
			    headers: {
			        'Content-Type': 'multipart/form-data'
			    }
			 })
			.then(function(response){
				e.target.value = '';
			})
			.catch(function(error){
				console.error(error);
				e.target.value = '';
			})
		}
	}
})