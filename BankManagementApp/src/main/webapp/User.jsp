<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Options</title>
<link href="commonstyle.css" type="text/css" rel="stylesheet">
<link href="label.css" type="text/css" rel="stylesheet">
<link href="button.css" type="text/css" rel="stylesheet">
<style>
form.b
{
border:2px solid black;
width:1000px;
background-color:Ivory;
}
</style>
</head>
<body>
<h1 style="color:green">Welcome.</h1>
<h4><b><%if(request.getAttribute("text")!=null)
	{
	     out.println("**"+(String) request.getAttribute("text"));
	}
%></b></h4>
<jsp:include page="usersidebar.jsp" />
<div>
<form class="b">
<table>
  <tr>
    <th>Account Id</th>
    <th>Customer Id</th>
    <th>Branch</th>
    <th>Balance</th>
    <th>Transfer</th>
  </tr>
  <c:forEach items="${accountDetails}" var="map1">
  <tr>
  <td><c:out value="${map1.key}" /></td>
  <td><%out.print(session.getAttribute("userId"));%></td>
  <td><c:out value="${map1.value.getBranch()}" /></td>
  <input type="hidden" id="customer" name="customer" value="<%=request.getParameter("uname") %>">
  <td><c:out value="${map1.value.getBalance()}" /></td>
  <td><button name="moneyexchange" value="user" type="submit" formaction="CustomerCount?fromAccNum=<c:out value="${map1.key}" />&cusId=<%=request.getParameter("uname") %>&moneyexchange=user" formmethod="post">Transfer</button></td>
  </tr>
  </c:forEach>
 </table>
</form>
</div>
</body>
</html>