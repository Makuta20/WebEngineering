<%--
  Created by IntelliJ IDEA.
  User: RaduV
  Date: 23-Apr-16
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    response.sendRedirect("welcome.jsp");
%>
