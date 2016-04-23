<%--
  Created by IntelliJ IDEA.
  User: Rares
  Date: 23-Apr-16
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*"%>
<%
    if(session.isNew()){
        System.out.print("login");
        response.sendRedirect("login.jsp");
    }else{
        System.out.print("overview");
        response.sendRedirect("overview.jsp");
    }
%>

