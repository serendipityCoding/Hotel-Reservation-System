$(document).ready(function() {
	$("#startDate").datepicker({
		minDate : new Date(),
		maxDate : new Date(new Date().setDate(new Date().getDate() + 89)),
		dateFormat : "yy-mm-dd"
	});
	$("#endDate").datepicker({
		minDate : new Date(),
		maxDate : new Date(new Date().setDate(new Date().getDate() + 90)),
		dateFormat : "yy-mm-dd",
		useCurrent : false,
	});
	
});
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
function searchRoom(){
	if($("#startDate").val()==""){
		$("#startDateFB").css("display", "block");
	}
	else if($("#endDate").val()==""){
		$("#endDateFB").css("display", "block");
	}
	else if($("#location").val()==""){
		$("#locationFB").css("display", "block");
	}
	else{
		var json={
				fromDate: $("#startDate").val(),
				toDate: $("#endDate").val(),
				location: $("#location").val()
		};
		console.log(json);
		$.ajax({
			type:"POST",
			url:"searchProcess",
			contentType:"application/json",
			dataType : 'JSON',
			data: JSON.stringify(json),
			success:function(data){
				$("#roomList tbody").empty();
				for(var i=0;i<data.length;i++){
					$("#roomList tbody").append('<tr><td>'+(i+1)+'</td><td>'+data[i].name+'</td><td>'+data[i].type+'</td><td>'+data[i].price+'</td><td><a href="roomDetail?typeID='+data[i].id+'" class="btn btn-default">Details</a></td></tr>');
				}
			},
			error:function(xhr, textStatus, errorThrown) {
				console.log(xhr.statusText);
				console.log(textStatus);
			}
		});
	}
}