<%@ page import="at.ac.tuwien.big.we16.ue2.Model.User" %>
<%@ page import="at.ac.tuwien.big.we16.ue2.Model.Item" %>
<%@ page import="at.ac.tuwien.big.we16.ue2.Model.ProductList" %>
<%--
  Created by IntelliJ IDEA.
  User: Rares
  Date: 22-Apr-16
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>BIG Bid - Produkte</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../styles/style.css">
</head>
<body data-decimal-separator="," data-grouping-separator=".">

<a href="#productsheadline" class="accessibility">Zum Inhalt springen</a>

<header aria-labelledby="bannerheadline">
    <img class="title-image" src="../images/big-logo-small.png" alt="BIG Bid logo">

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
    <main aria-labelledby="productsheadline">
        <h2 class="main-headline" id="productsheadline">Produkte</h2>
        <div class="products">
            <% for(Item i : ProductList.getItemList()){ %>
            <div class="product-outer"
                 data-product-id="<%=i.getId()%>">
                <a href="details.jsp?id=<%=i.getId()%>" class="product expired "
                   title="Mehr Informationen zu <%=i.getName()%>"> <img
                        class="product-image" src="../images/<%=i.getImg()%>" alt="">
                    <dl class="product-properties properties">
                        <dt>Bezeichnung</dt>
                        <dd class="product-name"><%=i.getName()%></dd>
                        <dt>Preis</dt>
                        <dd class="product-price"><%=i.getHighestBid()%></dd>
                        <dt>Verbleibende Zeit</dt>
                        <dd data-end-time="2016,03,14,14,30,23,288"
                            data-end-text="abgelaufen" class="product-time js-time-left"></dd>
                        <dt>Höchstbietende/r</dt>
                        <dd class="product-highest"><% if(i.getHighestBidder()!=null) { if(tempUser.getFirstName()!=null) { %> <%=tempUser.getFullName()%> <% }else{ %> <%=tempUser.getEmail()%> <%} }else { %> No Bidder <% } %></dd>
                    </dl>
                </a>
            </div>
            <% } %>
        </div>
    </main>
</div>
<footer> © 2016 BIG Bid </footer>
<script src="/scripts/jquery.js"></script>
<script src="/scripts/framework.js"></script>
</body>
</html>
