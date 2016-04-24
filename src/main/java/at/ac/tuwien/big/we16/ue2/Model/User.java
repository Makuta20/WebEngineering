package at.ac.tuwien.big.we16.ue2.Model;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.*;

public class User {
	
	String firstName = null;
    String lastName = null;

    String email = null;
	String password = null;
	float credit = (float)0.0;
    int lostBids = 0;
    int wonBids = 0;
    HashMap<Item, Float> bidItems = new HashMap<>();
	
	public User(){
        this.credit += 1500;
    }

    public User(String email, String password){
        this.email = email;
        this.password = password;
        this.credit += 1500;
    }

    @Override
    public String toString() {
        return "User{" +
                "email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", credit=" + credit +
                ", bidItems=" + bidItems +
                '}';
    }

    public void wonBid(Item item){
        wonBids++;
        bidItems.remove(item);
    }

    public int getCurrentBids(){
        return bidItems.size();
    }

    public void addItem(Item item, float bid){
        if(credit > bid) {
            if((item.getHighestBidder() != null) && item.getHighestBidder().equals(this)){
                credit = credit - (bid - item.getHighestBid());
                bidItems.put(item,bid);
            }else{
                credit -= bid;
                bidItems.put(item, bid);
            }

        }else
            return;
	}

	public void removeItem(Item item){
        if(bidItems.containsKey(item)) {
            credit += bidItems.get(item);
            bidItems.remove(item);
            lostBids++;
        }else
            return;
	}

    public String getFormatedCurrency(){
        NumberFormat numberFormat = NumberFormat.getInstance(Locale.GERMANY);
        if (numberFormat instanceof DecimalFormat) {
            ((DecimalFormat) numberFormat).applyPattern("###,##0.00 €");
        }
        return numberFormat.format(credit);
    }

    public String getFullName(){
        return firstName + " " + lastName;
    }

    public int getLostBids() {
        return lostBids;
    }

    public void setLostBids(int lostBids) {
        this.lostBids = lostBids;
    }

    public int getWonBids() {
        return wonBids;
    }

    public void setWonBids(int wonBids) {
        this.wonBids = wonBids;
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

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (Float.compare(user.credit, credit) != 0) return false;
        if (lostBids != user.lostBids) return false;
        if (wonBids != user.wonBids) return false;
        if (!firstName.equals(user.firstName)) return false;
        if (!lastName.equals(user.lastName)) return false;
        if (!email.equals(user.email)) return false;
        if (!password.equals(user.password)) return false;
        return bidItems.equals(user.bidItems);

    }

}
