package asgp2.springmvc.model;

public class Booking {
	private int id;
	private int roomID;
	private int userID;
	private String fromDate;
	private String toDate;
	
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
	
	public void setUserID(int userID){
		this.userID=userID;
	}
	
	public int getUserID(){
		return this.userID;
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
}
