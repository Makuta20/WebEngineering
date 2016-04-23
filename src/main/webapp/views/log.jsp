<%--
  Created by IntelliJ IDEA.
  User: Rares
  Date: 23-Apr-16
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*"%>
<%
    String user = request.getParameter("email");
    System.out.print(user);
    response.sendRedirect("overview.jsp");
%>
