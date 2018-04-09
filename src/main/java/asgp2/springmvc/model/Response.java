package asgp2.springmvc.model;

public class Response {
	private boolean success;
	private String message;
	
	public void setSuccess(boolean success){
		this.success=success;
	}
	
	public boolean getSuccess(){
		return this.success;
	}
	
	public void setMessage(String message){
		this.message=message;
	}
	
	public String getMessage(){
		return this.message;
	}
}
