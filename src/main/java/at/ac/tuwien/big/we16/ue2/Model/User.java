package at.ac.tuwien.big.we16.ue2.Model;

import java.util.*;

public class User {
	
	String email = null;
	String password = null;
	double credit = 0.0;
	List<Item> bidItems = new LinkedList<Item>();
	
	public User(){
		
	}

	public void addItem(Item item){
		bidItems.add(item);
	}
	public void removeItem(Item item){
		bidItems.remove(item);
	}

	public void setEmail(String e){
		this.email = e;
	}

	public void setPassword(String p){
		this.password = p;
	}

	public String getEmail(){
		return email;
	}

	public String getPassword() {
		return password;
	}

	public double getCredit() {
		return credit;
	}

	public void setCredit(double credit) {
		this.credit = credit;
	}

	public List<Item> getBidItems() {
		return bidItems;
	}

	public void setBidItems(List<Item> bidItems) {
		this.bidItems = bidItems;
	}
}
