/**
 * 
 */

function signUpSubmit() {
	
	alert('inside signUpSubmit');
	return false;
};

function phoneNoEntered() {
	
	var uPhone = document.getElementById('uPhone').value;
	
	if (uPhone) {
		alert('inside upated uphone!!!');
		document.getElementById('otp').style.display = 'block';
	}else {
		alert('inside else uphone');
		document.getElementById('otp').style.display = 'none';
	}
	
	return false;
};