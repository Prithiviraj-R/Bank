<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Options</title>
<style>
div
{
float:right;
}
form.b
{
border:2px solid black;
width:1000px;
background-color:Ivory;
}
table, th, td
{
margin-top:25px;
  border: 1px solid;
  width:1025px;
  margin-left:0px;
  padding:3px;
}
body
{
background-color:LavenderBlush;
}
a
{
border:none;
colour:blue;
}
</style>
</head>
<body>
<h1 style="color:green">Welcome.</h1>
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