package at.ac.tuwien.big.we16.ue2.Model;

import at.ac.tuwien.big.we16.ue2.productdata.JSONDataLoader;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicInteger;

public class Item {

    private static final AtomicInteger globalID = new AtomicInteger(0);
    private final int id;


    User highestBidder = null;
	float highestBid = (float)0.0;
	String name = null;
	String type = null;
	String author = null;
    int year = 0;
    String img = null;
	
	public Item(){
		id = globalID.incrementAndGet();
	}

    public Item(JSONDataLoader.Music music){
        id = globalID.incrementAndGet();
        this.type = "Music Album";
        this.name = music.getAlbum_name();
        this.author = music.getArtist();
        this.year = Integer.parseInt(music.getYear());
        this.img = music.getImg();
    }

    public Item(JSONDataLoader.Movie movie){
        id = globalID.incrementAndGet();
        this.type = "Film";
        this.name = movie.getTitle();
        this.author = movie.getDirector();
        this.year = Integer.parseInt(movie.getYear());
        this.img = movie.getImg();
    }

    public Item(JSONDataLoader.Book book){
        id = globalID.incrementAndGet();
        this.type = "Book";
        this.name = book.getTitle();
        this.author = book.getAuthor();
        this.year = Integer.parseInt(book.getYear());
        this.img = book.getImg();
    }

    public int getId() {
        return id;
    }

    public User getHighestBidder() {
        return highestBidder;
    }

    public void setHighestBidder(User highestBidder) {
        this.highestBidder = highestBidder;
    }

    public float getHighestBid() {
        return highestBid;
    }

    public void setHighestBid(float highestBid) {
        this.highestBid = highestBid;
    }

    public String getFormatedCurrency(){
        NumberFormat numberFormat = NumberFormat.getInstance(Locale.GERMANY);
        if (numberFormat instanceof DecimalFormat) {
            ((DecimalFormat) numberFormat).applyPattern("###,##0.00 €");
        }
        return numberFormat.format(highestBid);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
