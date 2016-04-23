package at.ac.tuwien.big.we16.ue2.Model;

import at.ac.tuwien.big.we16.ue2.productdata.JSONDataLoader;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by RaduV on 23-Apr-16.
 */
public class ProductList {

    static List<Item> itemList = new LinkedList<>();

    static ProductList productList = null;

    public static Item getItem(int id){
        for(Item i : itemList){
            if(i.getId() == id)
                return i;
        }
        return null;
    }

    public static List<Item> getItemList(){
        if(productList == null){
            productList = new ProductList();
        }
        return itemList;
    }

    private ProductList(){
        for(JSONDataLoader.Book b : JSONDataLoader.getBooks()){
            itemList.add(new Item(b));
        }
        for(JSONDataLoader.Movie m : JSONDataLoader.getFilms()){
            itemList.add(new Item(m));
        }
        for(JSONDataLoader.Music m : JSONDataLoader.getMusic()){
            itemList.add(new Item(m));
        }
    }

}
