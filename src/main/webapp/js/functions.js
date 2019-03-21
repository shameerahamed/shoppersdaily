function validate(frm) {	
	var username = frm.username.value;
	var password = frm.password.value;
	var msg = "";	
	if(username == "")
		msg = "Username.\n";
	if(password == "")
		msg += "Password.\n";
	if(msg!="") {
		str = "Please enter the following information:\n";
		str += "----------------------------------------\n";
		str += msg;
		alert(str);
		return false;
	} else {				
		return true;		
	}			
}

