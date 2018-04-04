package asgp2.springmvc.model;

public class RoomType {
	private int id;
	private String type;
	private float size;
	private int singleBedNo;
	private int doubleBedNo;
	private int guestNo;
	private boolean hasRefrigerator;
	private boolean hasLivingRoom;
	private boolean hasWIFI;
	private boolean hasParkingLot;
	private String description;
	private float price;
	
	public void setId(int id){
		this.id=id;
	}
	
	public int getId(){
		return this.id;
	}
	
	public void setType(String type){
		this.type=type;
	}
	
	public String getType(){
		return this.type;
	}
	
	public void setSize(float size){
		this.size=size;
	}
	
	public float getSize(){
		return this.size;
	}
	
	public void setSingleBedNo(int singleBedNo){
		this.singleBedNo=singleBedNo;
	}
	
	public int getSingleBedNo(){
		return this.singleBedNo;
	}
	
	public void setDoubleBedNo(int doubleBedNo){
		this.doubleBedNo=doubleBedNo;
	}
	
	public int getDoubleBedNo(){
		return this.doubleBedNo;
	}
	
	public void setGuestNo(int guestNo){
		this.guestNo=guestNo;
	}
	
	public int getGuestNo(){
		return this.guestNo;
	}
	
	public void setHasRefrigerator (boolean hasRefrigerator){
		this.hasRefrigerator=hasRefrigerator;
	}
	
	public boolean getHasRefrigerator(){
		return this.hasRefrigerator;
	}
	
	public void setHasLivingRoom(boolean hasLivingRoom){
		this.hasLivingRoom=hasLivingRoom;
	}
	
	public boolean getHasLivingRoom(){
		return this.hasLivingRoom;
	}
	
	public void setHasWIFI(boolean hasWIFI){
		this.hasWIFI=hasWIFI;
	}
	
	public boolean getHasWIFI(){
		return this.hasWIFI;
	}
	
	public void setHasParkingLot(boolean hasParkingLot){
		this.hasParkingLot=hasParkingLot;
	}
	
	public boolean getHasParkingLot(){
		return this.hasParkingLot;
	}
	
	public void setDescription(String description){
		this.description=description;
	}
	
	public String getDescription(){
		return this.description;
	}
	
	public void setPrice(float price){
		this.price=price;
	}
	
	public float getPrice(){
		return this.price;
	}
}
