package asgp2.springmvc.model;

public class Criteria {
	private String startDate;
	private String endDate;
	private String location;
	
	public String getStartDate(){
		return this.startDate;
	}
	
	public void setStartDate(String startDate){
		this.startDate=startDate;
	}
	
	public String getEndDate(){
		return this.endDate;
	}
	
	public void setEndDate(String endDate){
		this.endDate=endDate;
	}
	
	public String getLocation(){
		return this.location;
	}
	
	public void setLocation(String location){
		this.location=location;
	}
}
