<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Record</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	$(function() {
		$("#startDate").datepicker({
			minDate : new Date(),
			dateFormat: "yy-mm-dd"
		});
		$("#endDate").datepicker({
			maxDate : new Date().setDate(new Date().getDate() + 90),
			dateFormat: "yy-mm-dd",
			useCurrent : false,
		});
	});
	function showModal(data){
		$("#myModal").modal();
		var fromDate=data.fromDate;
		$("#bookingID").val(data.id);
		$("#startDate").val(fromDate);
		$("#endDate").val(data.toDate);
		$('select option[value=NewYork]').attr("selected",true);
	};
	function changeBooking(id, data){
		var oldBooking={
				bookingID:id
		};
		var order={
				fromDate: $("#startDate").val(),
				toDate: $("#endDate").val(),
				location: $("#location").val(),
				roomType:data.type,
				price:data.price,
				roomCount: 1
		};
		var orders=[];
		orders.push(order);
		$.ajax({
			type:"POST",
			url: "cancelBooking",
			contentType: "application/json",
			data: JSON.stringify(oldBooking),
			success: function(data){
				$.ajax({
					type : "POST",
					url : "checkout",
					contentType: "application/json",
					data : JSON.stringify(orders),
					success : function(data) {
						alert("Make reservation successfully!");
					},
					error : function(xhr, textStatus, errorThrown) {
						console.log(xhr.statusText);
						console.log(textStatus);
						console.log(errorThrown);
					}
				});
			},
			error:function(xhr, textStatus, errorThrown) {
				console.log(xhr.statusText);
				console.log(textStatus);
				console.log(errorThrown);
			}
		});
		

	};
	function modifySearch(){
		var fromDate=$("#startDate").val();
		var toDate=$("#endDate").val();
		var location=$("#location").val();
		var data1={
				startDate: $("#startDate").val(),
				endDate: $("#endDate").val(),
				location: $("#location").val()
		};
		console.log($("#bookingID").val());
		$.ajax({
			type:$("#roomSearch").attr("method"),
			url: $("#roomSearch").attr("action"),
			contentType:"application/json",
			dataType:'JSON',
			data: JSON.stringify(data1),
			success:function(data){
				var bookingID=$("#bookingID").val();
				if(data.length==0){
					$("#result").html("<p>No room available!</p>");
				}
				else{
					var content="<div class='panel-body'><table class='table table-condensed' style='border-collapse:collapse;'>";
					content+="<thead><tr><th></th><th>Room Type</th><th>Price</th><th></th></tr></thead>"
					for(i=0;i<data.length;i++){
						var r="<tr><td data-toggle='collapse' data-target='#room"+data[i].id+
						"' class='accordion-toggle'><button class='btn btn-default btn-xs'><span class='glyphicon glyphicon-eye-open'></span></button></td><td>"+data[i].type+
						"</td><td>"+data[i].price+
						"</td><td><button type='button' class='btn btn-default'"+
						"onclick='changeBooking("+bookingID+","+JSON.stringify(data[i])+")'>Change</button></td></tr>";
						content+=r;
						var hidden="<tr><td colspan='12' class='hiddenRow'><div class='accordian-body collapse' id='room"+data[i].id+"'><table class='table table-striped'><tbody>"+
                        "<tr><th>Size</th><td>"+data[i].type+"</td></tr><tr><th>Size</th><td>"+data[i].size+"</td></tr>"+               
                        "<tr><th>Single Bed No</th><td>"+data[i].singleBedNo+"</td></tr><tr><th>Double Bed No</th><td>"+data[i].doubleBedNo+"</td></tr>"+
                        "<tr><th>Guest No</th><td>"+data[i].guestNo+"</td></tr><tr><th>Refrigerator</th><td>"+data[i].hasRefrigerator+"</td></tr>"+
                        "<tr><th>Living Room</th><td>"+data[i].hasLivingRoom+"</td></tr><tr><th>WIFI</th><td>"+data[i].hasWIFI+"</td></tr>"+
                        "<tr><th>Parking Lot</th><td>"+data[i].hasParkingLot+"</td></tr><tr><th>Price</th><td>"+data[i].price+"</td></tr>"+
                      	"</tbody></table></div></td></tr>";
						content+=hidden;
					}
					content+="</table></div>";
					console.log(content);
					$("#result").html($(content));
				}
			},
			error:function(xhr,textStatus,errorThrown){
				alert(textStatus);
				console.log(errorThrown);
			}
		});		
	}
</script>
</head>
<body>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>ID</th>
				<th>Start Date</th>
				<th>End Date</th>
			</tr>
		</thead>
		<c:forEach items="${futureBookings}" var="item">
			<tr>
				<td>${item.roomID}</td>
				<td>${item.fromDate}</td>
				<td>${item.toDate}</td>
				<td><button type="button" class="btn btn-default"
						onclick="showModal({id:${item.id}, fromDate: '${item.fromDate}', toDate: '${item.toDate}'})">Modify</button></td>
			</tr>
		</c:forEach>
	</table>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>ID</th>
				<th>Start Date</th>
				<th>End Date</th>
			</tr>
		</thead>
		<c:forEach items="${pastBookings}" var="item">
		<tr>
			<td>${item.roomID}</td>
			<td>${item.fromDate}</td>
			<td>${item.toDate}</td>
			</tr>
		</c:forEach>
	</table>
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Order</h4>
					</div>
					<div id="modal-body" class="modal-body">
						<form id="roomSearch" class="form-horizontal" method="POST" action="modifySearch">
							<input type="hidden" id="bookingID" />
							<div cssClass="form-group">
								<label cssClass="control-label col-sm-2">Start Date:</label>
								<div id="datepicker1" cssClass="input-group date" data-date-format="yyyy-mm-dd">
									<input class="form-control" name="startDate" id="startDate"
										required="required" /> <span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
							<div cssClass="form-group">
								<label cssClass="control-label col-sm-2">End Date:</label>
								<div id="datepicker2" cssClass="input-group date" data-date-format="yyyy-mm-dd">
									<input class="form-control" name="endDate" id="endDate"
										required="required" /> <span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
							<div cssClass="form-group">
								<label path="location" cssClass="control-label col-sm-2">Location:</label>
								<div cssClass="col-sm-10">
									<select path="location" class="form-control" name="location" id="location" required="required">
										<option value=""></option>
										<option value="NewYork">New York</option>
										<option value="Shanghai">Shanghai</option>
										<option value="Tokyo">Tokyo</option>
										<option value="London">London</option>
										<option value="Hong Kong">Hong Kong</option>
									</select>
								</div>
							</div>
							<div cssClass="form-group">
								<div cssClass="col-sm-offset-2 col-sm-10">
									<input type="button" id="search" name="search" class="btn btn-default" onclick='modifySearch()' value="Search"/>
								</div>
							</div>
						</form>
						<div id="result">
							
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
</body>
</html>