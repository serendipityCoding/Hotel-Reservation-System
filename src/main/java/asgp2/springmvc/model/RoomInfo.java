package asgp2.springmvc.model;

public class RoomInfo {
	private int id;
	private int roomID;
	private int floorNo;
	private String roomType;
	private String location;
	private int isActive;
	
	public int getId(){
		return this.id;
	}
	
	public void setId(int id){
		this.id=id;
	}
	
	public int getRoomID(){
		return this.roomID;
	}
	
	public void setRoomID(int roomID){
		this.roomID=roomID;
	}
	
	public int getFloorNo(){
		return this.floorNo;
	}
	
	public void setFloorNo(int floorNo){
		this.floorNo=floorNo;
	}
	
	public String getRoomType(){
		return this.roomType;
	}
	
	public void setRoomType(String roomType){
		this.roomType=roomType;
	}
	
	public String getLocation(){
		return this.location;
	}
	
	public void setLocation(String location){
		this.location=location;
	}
	
	public int getIsActive(){
		return this.isActive;
	}
	
	public void setIsActive(int isActive){
		this.isActive=isActive;
	}
}
