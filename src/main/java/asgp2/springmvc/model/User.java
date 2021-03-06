package asgp2.springmvc.model;

public class User {
	
	private String id;
	private String username;
	private String password;
	private String email;
	private String firstname;
	private String lastname;
	private String phone;
	private String address;
	private String createDate;
	private String lastAccessDate;
	
	public String getId(){
		return this.id;
	}
	
	public void setId(String id){
		this.id=id;
	}
	
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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
}
