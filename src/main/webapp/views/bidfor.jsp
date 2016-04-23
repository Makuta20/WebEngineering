<%@ page import="at.ac.tuwien.big.we16.ue2.Model.Item" %>
<%@ page import="at.ac.tuwien.big.we16.ue2.Model.ProductList" %>
<%@ page import="at.ac.tuwien.big.we16.ue2.Model.User" %><%--
  Created by IntelliJ IDEA.
  User: RaduV
  Date: 23-Apr-16
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Item displayItem = null;
    try {
        displayItem = ProductList.getItem(Integer.parseInt(request.getParameter("id")));
    }catch (Exception e){
%>
<script> alert("Invalid ID!") </script>
<%
    }

    if(displayItem == null){
%>
<script> alert("Invalid ID!") </script>
<%
    response.sendRedirect("overview.jsp");
    }else {
        User user = ((User)session.getAttribute("user"));
        float tempBid=(float) 0.0;
        try {
            tempBid = Float.parseFloat(request.getParameter("new-price"));
        }catch (Exception e){
%>
<script> alert("Invalid ID!") </script>
<%      }
        if(user.getCredit() >= tempBid && displayItem.getHighestBid() < tempBid){
            user.addItem(displayItem, tempBid);
            displayItem.setHighestBidder(user);
            displayItem.setHighestBid(tempBid);
        }else if(user.getCredit() < tempBid){
%>
<script> alert("You don't have enough credit!") </script>
<%
        }else if(displayItem.getHighestBid() > tempBid){
%>
<script> alert("Your bid is lower than the current bid!") </script>
<%
        }
        response.sendRedirect("details.jsp?id=" + displayItem.getId());
    }
%>