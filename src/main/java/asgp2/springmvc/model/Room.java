package asgp2.springmvc.model;

public class Room {
	private int id;
	private String roomID;
	private int floorNo;
	private int roomType;
	private int location;
	private boolean isActive;
	private boolean isBooked;
	
	public void setId(int id){
		this.id=id;
	}
	
	public int getId(){
		return this.id;
	}
	
	public void setRoomID(String roomID){
		this.roomID=roomID;
	}
	
	public String getRoomID(){
		return this.roomID;
	}
	
	public void setFloorNo(int floorNo){
		this.floorNo=floorNo;
	}
	
	public int getFloorNo(){
		return this.floorNo;
	}
	
	public void setRoomType(int roomType){
		this.roomType=roomType;
	}
	
	public int getRoomType(){
		return this.roomType;
	}
	
	public void setLocation(int location){
		this.location=location;
	}
	
	public int getLocation(){
		return this.location;
	}
	
	public void setIsActive(boolean isActive){
		this.isActive=isActive;
	}
	
	public boolean getIsActive(){
		return this.isActive;
	}
	
	public void setIsBooked(boolean isBooked){
		this.isBooked=isBooked;
	}
	
	public boolean getIsBooked(){
		return this.isBooked;
	}
}
