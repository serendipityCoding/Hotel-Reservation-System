package asgp2.springmvc.model;

public class StaffLogin {
	private String username;
	private String password;
	private int role;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getRole(){
		return this.role;
	}
	
	public void setRole(int role){
		this.role=role;
	}
}
