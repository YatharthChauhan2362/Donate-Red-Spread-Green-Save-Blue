(function(){
	jQuery('#join-us-form-button').on('click', function(e) {
		e.preventDefault();
		console.log("join us message...");
		var flag = false;
		var err = ""
		if(jQuery(".fname")[0].value == "")
		{
			err += "First Name is Required.\n";
			flag = true;
		}	
		if(jQuery(".lname")[0].value == "")
		{
			err += "Last Name is Required.\n";
			flag = true;
		}
		if(jQuery(".email")[0].value == "")
		{
			err += "Email is Required.\n";
			flag = true;
		}
		if(jQuery(".contact")[0].value == "")
		{
			err += "Contact is Required.\n";
			flag = true;
		}
		if(!flag) {
			alert("Join Successfully...");
		} else {
			alert(err);
		}
	})
	
	jQuery('#contact-us-form-button').on('click', function(e) {
		e.preventDefault();
		console.log("contact us button");
		var flag = false;
		var err = ""
		if(jQuery(".name")[0].value == "")
		{
			err += "Name is Required.\n";
			flag = true;
		}	
		if(jQuery(".email")[0].value == "")
		{
			err += "Email is Required.\n";
			flag = true;
		}
		if(jQuery(".comment")[0].value == "")
		{
			err += "Comment is Required.\n";
			flag = true;
		}
		if(!flag) {
			alert("Message sent Successfully...");
		} else {
			alert(err);
		}
	})
	
	jQuery('#leave-msg-form-button').on('click', function(e) {
		e.preventDefault();
		console.log("leave message...");
		var flag = false;
		var err = ""
		if(jQuery(".lm-name")[0].value == "")
		{
			err += "Name is Required.\n";
			flag = true;
		}	
		if(jQuery(".lm-email")[0].value == "")
		{
			err += "Email is Required.\n";
			flag = true;
		}
		if(jQuery(".lm-msg")[0].value == "")
		{
			err += "Message is Required.\n";
			flag = true;
		}
		if(!flag) {
			alert("Message sent Successfully...");
		} else {
			alert(err);
		}
	})
})();
