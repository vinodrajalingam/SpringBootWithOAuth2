angular.module("app", []).controller("home", function($http) {
	 
		var self = this;
		
		$http.get("/user").success(function(data) {
			
				if (data.name){
					self.user = data.name;
					self.email = data.email;
					self.authenticated = true;
					$('#userPic img').attr("src",data.picture);
				}
				
				if(Object.keys(data.userAuthentication.details).length == 31) {				
					self.user = data.userAuthentication.details.name;
					self.email = data.userAuthentication.details.company;
					self.authenticated = true;
					$('#userPic img').attr("src",data.userAuthentication.details.avatar_url);	
					
				} else if (Object.keys(data.userAuthentication.details).length == 10) {
					
					self.user = data.userAuthentication.details.name;
					self.email = data.userAuthentication.details.email;
					self.authenticated = true;
					$('#userPic img').attr("src",data.userAuthentication.details.picture);
					
				}else if (Object.keys(data.userAuthentication.details).length == 2) {
					
					self.user = data.userAuthentication.details.name;
					self.email = data.userAuthentication.details.email;
					self.authenticated = true;
					$('#userPic img').attr("src","https://graph.facebook.com/"+data.userAuthentication.details.id+"?fields=picture.type(small)");
					
				}
			
		}).error(function(data) {
			//alert('error '+JSON.stringify(data));
			self.user = "N/A";
			self.authenticated = false;
		});

		/*self.logout = function() {
        	
        	$('#userLogout').attr("href","https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8080/");
        	var delete_cookie = function(name) {
			    document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
			};
			delete_cookie('BootV2Cookie');
			console.log("Cookie deleted  !!!!!!!!!!!!!!!!!!!!")
			self.authenticated = false;
		};*/
	});