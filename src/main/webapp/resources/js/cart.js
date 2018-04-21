function checkout() {
	var checkOutItems = [];
	$("input.checkout:checked").each(function() {
		checkOutItems.push($.parseJSON($(this).attr('data-value')));
	});
	console.log(checkOutItems);
	$.ajax({
		type : "POST",
		url :"checkout" ,
		contentType : "application/json",
		dataType : 'JSON',
		data : JSON.stringify(checkOutItems),
		success : function(data) {
			if(data.success==true){
				alert("Make reservation successfully!");
				window.location.reload();
			}
			else{
				$("#identityCheck").modal('show');
			}
		},
		error : function(xhr, textStatus, errorThrown) {
			
		}
	});
};
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
function oneOffReserve(){
	var checkOutItems = [];
	$("input.checkout:checked").each(function() {
		checkOutItems.push($.parseJSON($(this).attr('data-value')));
	});
	var json={
			id:'',
			email: $("#oneOffEmail").val(),
			name: $("#oneOffName").val(),
			phone: $("#oneOffPhone").val(),
			createDate:''
	};
	console.log(json);
	console.log(checkOutItems);
	$.ajax({
		type : "POST",
		url : "oneTimeReserve" ,
		contentType : "application/json",
		dataType : 'JSON',
		data : JSON.stringify(json),
		success : function(response) {
			if(response.success==true){
				$.ajax({
					type : "POST",
					url :"checkout" ,
					contentType : "application/json",
					dataType : 'JSON',
					data : JSON.stringify(checkOutItems),
					success : function(data) {
						if(data.success==true){
							alert("Make reservation successfully!");
							window.location.reload();
						}
						else{
							$("#identityCheck").modal('show');
						}
					},
					error : function(xhr, textStatus, errorThrown) {
						
					}
				});
			}
			else{
				alert("You have registered before!");
			}
		},
		error : function(xhr, textStatus, errorThrown) {
			alert(xhr.statusText);
			console.log(textStatus);
			console.log(errorThrown);
		}
	})
}
