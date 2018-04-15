package asgp2.springmvc.model;

import java.io.Serializable;

public class Staff implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String username;
	private String email;
	private String password;
	private int role;
	private String createDate;
	private String lastAccessDate;
	private int isActive;
	private int createById;
	private String createByName;
	
	public int getId(){
		return this.id;
	}
	
	public void setId(int id){
		this.id=id;
	}
	
	public String getName(){
		return this.name;
	}
	
	public void setName(String name){
		this.name=name;
	}
	
	public String getUsername(){
		return this.username;
	}
	
	public void setUsername(String username){
		this.username=username;
	}
	
	public String getEmail(){
		return this.email;
	}
	
	public void setEmail(String email){
		this.email=email;
	}
	
	public String getPassword(){
		return this.password;
	}
	
	public void setPassword(String password){
		this.password=password;
	}
	
	public int getRole(){
		return this.role;
	}
	
	public void setRole(int role){
		this.role=role;
	}
	
	public String getCreateDate(){
		return this.createDate;
	}
	
	public void setCreateDate(String createDate){
		this.createDate=createDate;
	}
	
	public String getLastAccessDate(){
		return this.lastAccessDate;
	}
	
	public void setLastAccessDate(String lastAccessDate){
		this.lastAccessDate=lastAccessDate;
	}
	
	public int getIsActive(){
		return this.isActive;
	}
	
	public void setIsActive(int isActive){
		this.isActive=isActive;
	}
	
	public int getCreateById(){
		return this.createById;
	}
	
	public void setCreateById(int createById){
		this.createById=createById;
	}
	
	public String getCreateByName(){
		return this.createByName;
	}
	
	public void setCreateByName(String createByName){
		this.createByName=createByName;
	}
}
