package at.ac.tuwien.big.we16.ue2.Model;

public class Item {
	
	User highestBidder = null;
	double highestBid = 0.0;
	String name = null;
	
	public Item(){
		
	}
	
	public void setBidder(User u){
		this.highestBidder = u;
	}
	public void setBid(double b){
		this.highestBid = b;
	}
	public void setName(String n){
		this.name = n;
	}
	
	public User getUser(){
		return highestBidder;
	}
	public double getBid(){
		return highestBid;
	}
	public String getName(){
		return name;
	}
}
