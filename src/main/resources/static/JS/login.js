
 angular.module("app", []).controller("home", function($http) {
	 
		var self = this;
		
		$http.get("/user").success(function(data) {
			//alert(JSON.stringify(data));
			self.user = data.userAuthentication.details.name;
			self.email = data.userAuthentication.details.email;
			self.gender = data.userAuthentication.details.gender;
			self.locale = data.userAuthentication.details.locale;
			self.authenticated = true;
			$('#userPic img').attr("src",data.userAuthentication.details.picture);		
		}).error(function(data) {
			//alert('error '+JSON.stringify(data));
			self.user = "N/A";
			self.authenticated = false;
		});
		
		
		/*self.googleCall = function() {
			
			alert('inside google call');			
			$('#gAuth').attr("href","/gAuth?continue=http://localhost:8080/user");
			alert(JSON.stringify(data));
			
		};*/
		
		
        self.logout = function() {
        	
        	$('#userLogout').attr("href","https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8080/");
        	var delete_cookie = function(name) {
			    document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
			};
			delete_cookie('BootV2Cookie');
			console.log("Cookie deleted  !!!!!!!!!!!!!!!!!!!!")
			self.authenticated = false;
		};
	});