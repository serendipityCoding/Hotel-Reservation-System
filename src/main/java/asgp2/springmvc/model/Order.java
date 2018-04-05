package asgp2.springmvc.model;

public class Order {
	private String fromDate;
	private String toDate;
	private String location;
	private String roomType;
	private int roomCount;
	private double price;
	
	public void setFromDate(String fromDate){
		this.fromDate=fromDate;
	}
	
	public String getFromDate(){
		return this.fromDate;
	}
	
	public void setToDate(String toDate){
		this.toDate=toDate;
	}

	public String getToDate(){
		return this.toDate;
	}
	
	public void setLocation(String location){
		this.location=location;
	}
	
	public String getLocation(){
		return this.location;
	}
	
	public void setRoomType(String roomType){
		this.roomType=roomType;
	}

	public String getRoomType(){
		return this.roomType;
	}
	
	public void setRoomCount(int roomCount){
		this.roomCount=roomCount;
	}
	
	public int getRoomCount(){
		return this.roomCount;
	}
	
	public void setPrice(double price){
		this.price=price;
	}
	
	public double getPrice(){
		return this.price;
	}
}
