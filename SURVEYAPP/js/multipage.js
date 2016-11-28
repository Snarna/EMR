$(document).ready(function(){
		var current = 1;
		
		widget      = $(".step");
		btnnext     = $(".next");
		btnback     = $(".back"); 
		btnsubmit   = $(".submit");

		// Init buttons and UI
		widget.hide();
		hideButtons(current);
		setProgress(current);
		transition("#" + widget[current-1].id,"#" + widget[current-1].id);
		$("div#extraControls").removeClass("hidden");
	
		// Next button click action
		btnnext.click(function(){
			if(current < widget.length){
				// Check validation
				if($(".form").valid()){
					$("#" + widget[current-1].id).find('.animated').removeClass('fadeInLeft');
					$("#" + widget[current-1].id).find('.animated').addClass('fadeOutLeft');
					$("#" + widget[current].id).find('.animated').removeClass('fadeOutRight');
					$("#" + widget[current].id).find('.animated').addClass('fadeInRight');
					transition("#" + widget[current-1].id,"#" + widget[current].id); 
					current++;
					setProgress(current);
				}
			}
			hideButtons(current);
		})

		// Back button click action
		btnback.click(function(){
			if(current > 1){
				current = current - 2;
				if(current < widget.length){
					$("#" + widget[current+1].id).find('.animated').removeClass('fadeInRight');
					$("#" + widget[current+1].id).find('.animated').addClass('fadeOutRight');
					$("#" + widget[current].id).find('.animated').removeClass('fadeOutLeft fadeInRight');
					$("#" + widget[current].id).find('.animated').addClass('fadeInLeft');
					transition("#" + widget[current+1].id,"#" + widget[current].id);
					current++;
					setProgress(current);
				}
			}
			hideButtons(current);
		})

	    $('.form').validate({ // initialize plugin
			ignore:":not(:visible)",			
			rules: {
				fname	: "required",
				lname	: "required",
				dob		: "required",
			},
			messages: {
            	fname: "Please enter your first name",
            	lname: "Please enter your last name",
				dob: "Please enter your date of birth",
    		},
			
			highlight: function(element) {
            	$(element).closest('.form-group').addClass('has-error');
        	},
			unhighlight: function(element) {
				$(element).closest('.form-group').removeClass('has-error');
			},
			errorElement: 'span',
			errorClass: 'help-block',
			errorPlacement: function(error, element) {
				if(element.parent('.input-group').length) {
					error.insertAfter(element.parent());
				} else {
					error.insertAfter(element);
				}
			}
	    });

	});

	// Change progress bar action
	setProgress = function(currstep){
		var percent = parseFloat(100 / widget.length) * currstep;
		percent = percent.toFixed();
		$(".progress-bar").css("width",percent+"%").html(percent+"%");		
	}

	// Hide buttons according to the current step
	hideButtons = function(current){
		var limit = parseInt(widget.length); 

		$(".action").hide();
		
		if(current < limit) btnnext.show();
		if(current > 1) btnback.show();
		if (current == limit) { 
			// Show entered values
			$(".display label:not(.control-label)").each(function(){
				console.log($(this).find("label:not(.control-label)").html($("#"+$(this).data("id")).val()));	
			});
			btnnext.hide(); 
			btnsubmit.show();
		}
	}
	
	function transition(from,to) {
			$(from).fadeOut('fast',function(){$(to).fadeIn('fast');});
		
		}
