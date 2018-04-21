package asgp2.springmvc.model;

public class Booking {
	private int id;
	private int roomID;
	private String userID;
	private String roomType;
	private String location;
	private String fromDate;
	private String toDate;
	private int isCancel;
	private int isPaid;
	
	public void setId(int id){
		this.id=id;
	}
	
	public int getId(){
		return this.id;
	}
	
	public void setRoomID(int roomID){
		this.roomID=roomID;
	}
	
	public int getRoomID(){
		return this.roomID;
	}
	
	public void setUserID(String userID){
		this.userID=userID;
	}
	
	public String getUserID(){
		return this.userID;
	}
	
	public void setRoomType(String roomType){
		this.roomType=roomType;
	}
	
	public String getRoomType(){
		return this.roomType;
	}
	
	public void setLocation(String location){
		this.location=location;
	}
	
	public String getLocation(){
		return this.location;
	}
	
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
	
	public void setIsCancel(int isCancel){
		this.isCancel=isCancel;
	}
	
	public int getIsCancel(){
		return this.isCancel;
	}
	
	public void setIsPaid(int isPaid){
		this.isPaid=isPaid;
	}
	
	public int getIsPaid(){
		return this.isPaid;
	}
}
