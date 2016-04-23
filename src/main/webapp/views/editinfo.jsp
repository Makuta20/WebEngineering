<%--
  Created by IntelliJ IDEA.
  User: RaduV
  Date: 23-Apr-16
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="de">
<head>
    <meta charset="utf-8">
    <title>BIG Bid - Edit Profil</title>
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
    <main aria-labelledby="formheadline">
        <form class="form" method="post" action="editprofil.jsp">
            <h2 id="formheadline" class="registration-headline">Persönliche Daten</h2>
            <div class="form-row">
                <label class="form-label" for="firstname-input"> Vorname </label> <input
                    type="text" name="firstname" id="firstname-input" required
                    class="form-input"> <span id="firstname-error"
                                              class="error-text"></span>
            </div>
            <div class="form-row">
                <label class="form-label" for="lastname-input"> Nachname </label> <input
                    type="text" name="lastname" id="lastname-input" required
                    class="form-input"> <span
                    id="lastname-error" class="error-text"></span>
            </div>
            <div class="form-row form-row-center">
                <button class="button button-submit">Bearbeiten</button>
            </div>
        </form>
    </main>
</div>



<footer> © 2016 BIG Bid </footer>
<script src="/scripts/jquery.js"></script>
<script src="/scripts/framework.js"></script>
</body>
</html>
