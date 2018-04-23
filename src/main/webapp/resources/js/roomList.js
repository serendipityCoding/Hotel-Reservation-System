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
		console.log(json);
		$.ajax({
			type : "POST",
			url : "changeRoomStatus",
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