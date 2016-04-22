package at.ac.tuwien.big.we16.ue2.Controller;

import at.ac.tuwien.big.we16.ue2.Model.Item;
import at.ac.tuwien.big.we16.ue2.Model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Rares on 22-Apr-16.
 */
public class DetailsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);

        User tempUser = (User)session.getAttribute("user");

        Item tempItem = (Item)session.getAttribute("item");

        if(tempUser == null || tempItem == null)
            return;

        float newBid = Float.parseFloat(request.getParameter("new-price"));

        if(tempUser.getCredit() > tempItem.getHighestBid() && tempUser.getCredit() >= newBid){
            tempUser.addItem(tempItem, newBid);
            tempItem.setHighestBid(newBid);
            tempItem.setHighestBidder(tempUser);
        }

    }
}
