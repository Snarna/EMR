$(document).ready(function(){	
$("#next").click(function(){
		console.log("click");
		var form = $("#myform");
		form.validate({
			rules: {
				username: {
					required: true,
					minlength: 6,
				},

			},
			messages: {
				username: {
					required: "Username required",
				},

			}
		});
		if (form.valid() == true){
			current_fs = $('#account_information');
			next_fs = $('#personal_information');
			next_fs.show(); 
			current_fs.hide();
		}
	});

});