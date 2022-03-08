<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AccountOptions</title>
<style>

form.new
{
border:2px solid black;
width:1000px;
}
div
{
float:right;
}
table,tr,td
{
  border: 1px solid;
  width:1025px;
  padding:3px;
}
button.button
{
border:1px solid black;
width:200px;
padding:5px;
}
button.button:hover
{
background-color:LavenderBlush;
}
</style>
</head>
<body>
<h1 style=color:green><b>Account</b></h1>
<jsp:include page="sidebar.jsp" />
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<div>
<form class="new" method="post" id="myform">
<!-- <input type="hidden" name="action" value="addAccount"> -->
<button name="moneyexchange" value="addAccount" class="button" type="submit" formaction="CustomerCount?moneyexchange=addAccount">AddAccount</button><br>
<br>
<table>
  <tr>
    <th>Account Id</th>
    <th>Customer Id</th>
    <th>Branch</th>
    <th>Balance</th>
    <th>Status</th>
  </tr>
  <c:forEach items="${AccountMap}" var="map1">
 <c:forEach items="${map1.value}" var="map2">
  <tr>
  <td><button type="submit" formaction="AccountDeactive.jsp?accId=<c:out value="${map2.key}" />&cusId=<c:out value="${map2.value.getCustomerId()}" />"><c:out value="${map2.key}" /></button></td>
  <td><c:out value="${map2.value.getCustomerId()}" /></td>
  <input type="hidden" name="acc" value="<c:out value="${map2.value.getCustomerId()}" />">
  <td><c:out value="${map2.value.getBranch()}" /></td>
  <td><c:out value="${map2.value.getBalance()}" /></td>
  <td><c:out value="${map2.value.isStatus()}" /></td>
  </tr>
  </c:forEach>
 </c:forEach>
 
</table>
</form>
</div>
</body>
</html>