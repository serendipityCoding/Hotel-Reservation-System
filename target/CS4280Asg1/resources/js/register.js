function logout(){
	var json={};
	$.ajax({
		type : "POST",
		url :"logout" ,
		contentType : "application/json",
		dataType : 'JSON',
		data : JSON.stringify(json),
		success : function(response) {
			if(response.success==true){
				alert("You are logged out.");
				window.location.reload();
			}
			else{
				alert("Oops.. something goes wrong");
			}
		},
		error : function(xhr, textStatus, errorThrown) {
			alert(xhr.statusText);
			console.log(textStatus);
		}
	});
}
function login(){
	var json={
			username: $("#loginUsername").val(),
			password: $("#loginPassword").val()
	};
	console.log(json);
	$.ajax({
		type : "POST",
		url :"loginProcess" ,
		contentType : "application/json",
		dataType : 'JSON',
		data : JSON.stringify(json),
		success : function(response) {
			if(response.success==true){
				alert("You are logged in.");
				$("#login").modal('hide');
				window.location.reload();
			}
			else{
				alert("Wrong username or password");
			}
		},
		error : function(xhr, textStatus, errorThrown) {
			alert(xhr.statusText);
			console.log(textStatus);
		}
	})
}
function registerNow(){
	var json={
		username: $("#username").val(),
		password: $("#password").val(),
		email: $("#email").val(),
		firstname: $("#firstname").val(),
		lastname: $("#lastname").val(),
		phone: $("#phone").val(),
		address: $("#address").val(),
		createDate: "",
		lastAccessDate: ""
	}
	$.ajax({
		type : "POST",
		url :"registerMini" ,
		contentType : "application/json",
		dataType : 'JSON',
		data : JSON.stringify(json),
		success : function(response) {
			if(response.success==true){
				alert("Register successfully!");
				window.location.reload();
			}
			else{
				alert("You have registered before!");
			}
		},
		error : function(xhr, textStatus, errorThrown) {
			alert(xhr.statusText);
			console.log(textStatus);
		}
	})
}

