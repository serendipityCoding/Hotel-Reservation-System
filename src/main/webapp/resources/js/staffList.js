/**
 * 
 */

$(function() {
	$(".toggle-event").change(function() {
		var active = 1;
		var id = $(this).val();
		if ($(".toggle-event").prop('checked') == false) {
			active = 0;
		}
		var json = {
			id : $(this).val(),
			active : active
		};
		$.ajax({
			type : "POST",
			url : "changeStatus",
			contentType : "application/json",
			data : JSON.stringify(json),
			success : function(data) {
				
			},
			error : function(xhr, textStatus, errorThrown) {
				console.log(xhr.statusText);
				console.log(textStatus);
				console.log(errorThrown);
			}
		});
	})
})
function addManager() {
	var json = {
		email : $("#email").val(),
		employeeID : $("#employeeID").val(),
		name : $("#name").val()
	};
	$.ajax({
		type : $("#managerRegistration").attr("method"),
		url : $("#managerRegistration").attr("action"),
		contentType : "application/json",
		data : JSON.stringify(json),
		success : function(data) {
			if(data.success==true){
				alert("Add manager successfully. "+data.message+" Invitation Email sent");
				$('#addManager').modal('toggle');
			}
			else{
				alert("Oops...Something goes wrong");
			}			
		},
		error : function(xhr, textStatus, errorThrown) {
			console.log(xhr.statusText);
			console.log(textStatus);
			console.log(errorThrown);
		}
	});
}
