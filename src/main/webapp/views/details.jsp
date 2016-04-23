<%@ page import="at.ac.tuwien.big.we16.ue2.Model.Item" %>
<%@ page import="at.ac.tuwien.big.we16.ue2.Model.ProductList" %>
<%@ page import="at.ac.tuwien.big.we16.ue2.Model.User" %><%--
  Created by IntelliJ IDEA.
  User: Rares
  Date: 22-Apr-16
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="de">
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
%> <script> alert("Invalid ID!") </script> <%
    response.sendRedirect("overview.jsp");
}else{
%>
<head>
    <meta charset="utf-8">
    <title>BIG Bid - <%=displayItem.getName()+" ("+displayItem.getType()+")"%></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../styles/style.css">
</head>
<body data-decimal-separator="," data-grouping-separator=".">

<a href="#productsheadline" class="accessibility">Zum Inhalt
    springen</a>

<header aria-labelledby="bannerheadline">
    <img class="title-image" src="../images/big-logo-small.png"
         alt="BIG Bid logo">

    <h1 class="header-title" id="bannerheadline">BIG Bid</h1>
    <nav aria-labelledby="navigationheadline">
        <h2 class="accessibility" id="navigationheadline">Navigation</h2>
        <ul class="navigation-list">
            <li><a href="logout.jsp" class="button" accesskey="l">Abmelden</a></li>
        </ul>
    </nav>
</header>
<div class="main-container">
    <aside class="sidebar" aria-labelledby="userinfoheadline">
        <%
            User tempUser = ((User)session.getAttribute("user"));
        %>
        <div class="user-info-container">
            <h2 class="accessibility" id="userinfoheadline">Benutzerdaten</h2>
            <dl class="user-data properties">
                <dt class="accessibility">Name:</dt>
                <dd class="user-name"><a style="text-decoration: none; color: #333;" href="editinfo.jsp"><% if(tempUser.getFirstName()!=null) { %> <%=tempUser.getFullName()%> <% }else{ %> <%=tempUser.getEmail()%> <%} %></a></dd>
                <dt>Kontostand:</dt>
                <dd>
                    <span class="balance"><%=tempUser.getFormatedCurrency() %></span>
                </dd>
                <dt>Laufend:</dt>
                <dd>
                    <span class="running-auctions-count"><%=tempUser.getCurrentBids()  %></span> <span
                        class="auction-label" data-plural="Auktionen"
                        data-singular="Auktion">Auktionen</span>
                </dd>
                <dt>Gewonnen:</dt>
                <dd>
                    <span class="won-auctions-count"><%=tempUser.getWonBids()  %></span> <span
                        class="auction-label" data-plural="Auktionen"
                        data-singular="Auktion">Auktionen</span>
                </dd>
                <dt>Verloren:</dt>
                <dd>
                    <span class="lost-auctions-count"><%=tempUser.getLostBids()  %></span> <span
                        class="auction-label" data-plural="Auktionen"
                        data-singular="Auktion">Auktionen</span>
                </dd>
            </dl>
        </div>
        <div class="recently-viewed-container">
            <h3 class="recently-viewed-headline">Zuletzt angesehen</h3>
            <ul class="recently-viewed-list"></ul>
        </div>
    </aside>
    <main aria-labelledby="productheadline" class="details-container">
        <div class="details-image-container">
            <img class="details-image" src="../images/<%=displayItem.getImg()%>" alt="">
        </div>
        <div data-product-id="<%=displayItem.getId()%>" class="details-data">
            <h2 class="main-headline" id="productheadline"><%=displayItem.getName()+" ("+displayItem.getType()+")"%></h2>

            <div class="auction-expired-text" style="display: none">
                <p>
                    Diese Auktion ist bereits abgelaufen. Das Produkt wurde um <span
                        class="highest-bid"><%=displayItem.getFormatedCurrency()%></span> an <span
                        class="highest-bidder"><% if(displayItem.getHighestBidder()!=null) displayItem.getHighestBidder().getEmail(); else {%> No Bidder <%}%></span> verkauft.
                </p>
            </div>
            <p class="detail-time">
                Restzeit: <span data-end-time="2016,03,14,15,05,19,796"
                                class="detail-rest-time js-time-left"></span>
            </p>
            <form class="bid-form" method="post" action="bidfor.jsp?id=<%=displayItem.getId()%>">
                <label class="bid-form-field" id="highest-price"> <span
                        class="highest-bid"><%=displayItem.getFormatedCurrency()%></span> <span class="highest-bidder"><% if(displayItem.getHighestBidder()!=null) { if(tempUser.getFirstName()!=null) { %> <%=tempUser.getFullName()%> <% }else{ %> <%=tempUser.getEmail()%> <%} }else { %> No Bidder <% } %></span>
                </label> <label class="accessibility" for="new-price"></label> <input
                    type="number" step="0.01" min="0" id="new-price"
                    class="bid-form-field form-input" name="new-price" required>
                <p class="bid-error">Es gibt bereits ein höheres Gebot oder der
                    Kontostand ist zu niedrig.</p>
                <input type="submit" id="submit-price" class="bid-form-field button"
                       name="submit-price" value="Bieten">
            </form>
        </div>
        <%
            }
        %>
    </main>
</div>
<footer> © 2016 BIG Bid </footer>
<script src="/scripts/jquery.js"></script>
<script src="/scripts/framework.js"></script>
</body>
</html>
