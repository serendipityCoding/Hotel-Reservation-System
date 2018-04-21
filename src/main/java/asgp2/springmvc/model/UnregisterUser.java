package asgp2.springmvc.model;

public class UnregisterUser {
	private String id;
	private String name;
	private String email;
	private String phone;
	private String createDate;
	
	public void setId(String id){
		this.id=id;
	}
	
	public String getId(){
		return this.id;
	}
	
	public void setName(String name){
		this.name=name;
	}
	
	public String getName(){
		return this.name;
	}
	
	public void setEmail(String email){
		this.email=email;
	}
	
	public String getEmail(){
		return this.email;
	}
	
	public void setPhone(String phone){
		this.phone=phone;
	}
	
	public String getPhone(){
		return this.phone;
	}
	
	public void setCreateDate(String createDate){
		this.createDate=createDate;
	}
	
	public String getCreateDate(){
		return this.createDate;
	}
}
