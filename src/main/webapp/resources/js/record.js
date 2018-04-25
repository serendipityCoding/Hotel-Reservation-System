$(function() {
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
				window.location.href="search";
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
function showModal(data) {
	$("#myModal").modal();
	var fromDate = data.fromDate;
	$("#bookingID").val(data.id);
	$("#startDate").val(fromDate);
	$("#endDate").val(data.toDate);
	$('select option[value=NewYork]').attr("selected", true);
};
function cancelBooking(id){
	var oldBooking={
			bookingID:id
	}
	$.ajax({
		type : "POST",
		url : "cancelBooking",
		contentType : "application/json",
		data : JSON.stringify(oldBooking),
		success : function(data) {
			alert("Reservation cancelled");
			window.location.reload();
		},
		error : function(xhr, textStatus, errorThrown) {
			console.log(xhr.statusText);
			console.log(textStatus);
			console.log(errorThrown);
		}
	});
}
function changeBooking(id, data) {
	var oldBooking = {
		bookingID : id
	};
	var order = {
		fromDate : $("#startDate").val(),
		toDate : $("#endDate").val(),
		location : $("#location").val(),
		roomType : data.type,
		price : data.price,
		roomCount : 1
	};
	var orders = [];
	orders.push(order);
	$.ajax({
		type : "POST",
		url : "cancelBooking",
		contentType : "application/json",
		data : JSON.stringify(oldBooking),
		success : function(data) {
			$.ajax({
				type : "POST",
				url : "checkout",
				contentType : "application/json",
				data : JSON.stringify(orders),
				success : function(data) {
					alert("Make reservation successfully!");
					window.location.reload();
				},
				error : function(xhr, textStatus, errorThrown) {
					console.log(xhr.statusText);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		},
		error : function(xhr, textStatus, errorThrown) {
			console.log(xhr.statusText);
			console.log(textStatus);
			console.log(errorThrown);
		}
	});

};
function modifySearch() {
	var fromDate = $("#startDate").val();
	var toDate = $("#endDate").val();
	var location = $("#location").val();
	var data1 = {
		startDate : $("#startDate").val(),
		endDate : $("#endDate").val(),
		location : $("#location").val()
	};
	console.log($("#bookingID").val());
	$
			.ajax({
				type : $("#roomSearch").attr("method"),
				url : $("#roomSearch").attr("action"),
				contentType : "application/json",
				dataType : 'JSON',
				data : JSON.stringify(data1),
				success : function(data) {
					var bookingID = $("#bookingID").val();
					if (data.length == 0) {
						$("#result").html("<p>No room available!</p>");
					} else {
						var content = "<div class='panel-body'><table class='table table-condensed' style='border-collapse:collapse;'>";
						content += "<thead><tr><th></th><th>Room Type</th><th>Price</th><th></th></tr></thead>"
						for (i = 0; i < data.length; i++) {
							var r = "<tr><td data-toggle='collapse' data-target='#room"
									+ data[i].id
									+ "' class='accordion-toggle'><button class='btn btn-default btn-xs'><span class='glyphicon glyphicon-eye-open'></span></button></td><td>"
									+ data[i].type
									+ "</td><td>"
									+ data[i].price
									+ "</td><td><button type='button' class='btn btn-default'"
									+ "onclick='changeBooking("
									+ bookingID
									+ ","
									+ JSON.stringify(data[i])
									+ ")'>Change</button></td></tr>";
							content += r;
							var hidden = "<tr><td colspan='12' class='hiddenRow'><div class='accordian-body collapse' id='room"
									+ data[i].id
									+ "'><table class='table table-striped'><tbody>"
									+ "<tr><th>Size</th><td>"
									+ data[i].type
									+ "</td></tr><tr><th>Size</th><td>"
									+ data[i].size
									+ "</td></tr>"
									+ "<tr><th>Single Bed No</th><td>"
									+ data[i].singleBedNo
									+ "</td></tr><tr><th>Double Bed No</th><td>"
									+ data[i].doubleBedNo
									+ "</td></tr>"
									+ "<tr><th>Guest No</th><td>"
									+ data[i].guestNo
									+ "</td></tr><tr><th>Refrigerator</th><td>"
									+ data[i].hasRefrigerator
									+ "</td></tr>"
									+ "<tr><th>Living Room</th><td>"
									+ data[i].hasLivingRoom
									+ "</td></tr><tr><th>WIFI</th><td>"
									+ data[i].hasWIFI
									+ "</td></tr>"
									+ "<tr><th>Parking Lot</th><td>"
									+ data[i].hasParkingLot
									+ "</td></tr><tr><th>Price</th><td>"
									+ data[i].price
									+ "</td></tr>"
									+ "</tbody></table></div></td></tr>";
							content += hidden;
						}
						content += "</table></div>";
						console.log(content);
						$("#result").html($(content));
					}
				},
				error : function(xhr, textStatus, errorThrown) {
					alert(textStatus);
					console.log(errorThrown);
				}
			});
}
