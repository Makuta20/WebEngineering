package at.ac.tuwien.big.we16.ue2.Model;

import java.util.*;

public class User {
	
	String email = null;
	String password = null;
	float credit = (float)0.0;
    HashMap<Item, Float> bidItems = new HashMap<>();
	
	public User(){
		
	}

	public void addItem(Item item, float bid){
        if(credit > bid) {
            credit -= bid;
            bidItems.put(item, bid);
        }else
            return;
	}

	public void removeItem(Item item){
        if(bidItems.containsKey(item)) {
            credit += bidItems.get(item);
            bidItems.remove(item);
        }else
            return;
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

    public float getCredit() {
        return credit;
    }

    public void setCredit(float credit) {
        this.credit = credit;
    }

    public HashMap<Item, Float> getBidItems() {
        return bidItems;
    }

    public void setBidItems(HashMap<Item, Float> bidItems) {
        this.bidItems = bidItems;
    }
}
