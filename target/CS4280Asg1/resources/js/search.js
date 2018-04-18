$(function() {
	$("#startDate").datepicker({
		minDate : new Date(),
		dateFormat : "yy-mm-dd"
	});
	$("#endDate").datepicker({
		maxDate : new Date().setDate(new Date().getDate() + 90),
		dateFormat : "yy-mm-dd",
		useCurrent : false,
	});
	$('#startDate').on('dp.change', function(e) {
		$('#endDate').data('DatePicker').minDate(e.date);
		$('#endDate').data('DatePicker').maxDate(m);
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
			console.log(data);
			$("#searchRes").html("<p>found</p>");
		},
		error:function(xhr, textStatus, errorThrown) {
			console.log(xhr.statusText);
			console.log(textStatus);
			alert(errorThrown);
			alert("tttt");
		}
	});
}