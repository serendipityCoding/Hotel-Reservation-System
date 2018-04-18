$(function() {
	$("#fromDate").datepicker({
		minDate : new Date(),
		maxDate : new Date().setDate(new Date().getDate() + 89),
		dateFormat : "yy-mm-dd"
	});
	$("#toDate").datepicker({
		maxDate : new Date().setDate(new Date().getDate() + 90),
		dateFormat : "yy-mm-dd",
		useCurrent : false,
	});
	$('#fromDate').on('dp.change', function(e) {
		$('#toDate').datepicker('option', 'minDate', new Date($("#fromDate").val()+1));
	});
});
function addToCart() {
	var order = {
		"fromDate" : $("#fromDate").val(),
		"toDate" : $("#toDate").val(),
		"location" : $("#location").val(),
		"roomType" : $("#type").val(),
		"roomCount" : parseInt($("#roomCount").val()),
		"price" : parseFloat($("#price").val())
	}
	$.ajax({
		type : $("#booking").attr("method"),
		contentType : "application/json",
		dataType : 'JSON',
		url : $("#booking").attr("action"),
		data : JSON.stringify(order),
		cache : false,
		success : function(response) {
			alert(response.message);
			var url = "search";
			window.location.replace(url);
		},
		error : function(xhr, textStatus, errorThrown) {
			console.log(xhr.statusText);
			console.log(textStatus);

		}
	});
};

