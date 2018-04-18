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
function searchRoom(){
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
			for(var i=0;i<data.length;i++){
				$("#roomList tbody").append('<tr><td>'+(i+1)+'</td><td>'+data[i].type+'</td><td>'+data[i].price+'</td><td><a href="roomDetail?typeID='+data[i].id+'" class="btn btn-default">Details</a></td></tr>');
			}
		},
		error:function(xhr, textStatus, errorThrown) {
			console.log(xhr.statusText);
			console.log(textStatus);
		}
	});
}