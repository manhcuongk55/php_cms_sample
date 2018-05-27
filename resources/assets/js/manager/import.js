require('../bootstrap.js');
require('jquery-file-download');

new Vue({
	el: '#import',
	data: {
		file: null,
		loading: false
	},
	mounted(){

	},
	methods: {
		upload(e){
			var $this = this;

			var frm = new FormData();
			frm.append('file', this.$refs.file.files[0]);

			$this.loading = true;

			// $.fileDownload(app.baseURL + '/manager/upload', {
			// 	httpMethod: "POST",
   //              frm,
   //              successCallback: function (url) {
   //                  e.target.value = '';
   //                  $this.loading= false;
   //              },
   //              failCallback: function (responseHtml, url) {
   //                  // toastr.error('Có lỗi xảy ra. Vui lòng thử lại sau', 'Thông báo');
   //                  e.target.value = '';
   //                  $this.loading = false;
   //              }	
			// });

			axios.post(app.baseURL + '/manager/upload', frm, {
			    headers: {
			        'Content-Type': 'multipart/form-data'
			    }
			 })
			.then(function(response){
				e.target.value = '';
				$this.loading  = false;

				$.fileDownload(app.baseURL + '/manager/save-file', {
					httpMethod: "GET",
	                data: {
	                	file: response.data
	                },
	                successCallback: function (url) {
	                    e.target.value = '';
	                },
	                failCallback: function (responseHtml, url) {
	                	alert("Có lỗi xảy ra vui lòng thử lại");
	                    e.target.value = '';
	                }	
				});
			})
			.catch(function(error){
				console.log(error);
				alert('Có lỗi xảy ra, vui lòng thử lại');
				e.target.value = '';
				$this.loading = false;
			});
		}
	}
})