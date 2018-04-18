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
			alert("Make reservation successfully!");
		},
		error : function(xhr, textStatus, errorThrown) {
			alert(xhr.statusText);
			console.log(textStatus);
		}
	});
}