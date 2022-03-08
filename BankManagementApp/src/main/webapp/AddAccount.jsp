<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Account</title>
<style>
h1
{
color:green;
}
fieldset
{
width:1000px;
background-color:ivory;
margin-left:2px;
}
body
{
background-color:LavenderBlush;
}
form.new
{
border:2px solid black;
width:1000px;
margin-top:25px;
}
div
{
float:right;
}
select
{
width:100px;
}
</style>
</head>
<body>
<h1><b>ADD ACCOUNT</b></h1>
<jsp:include page="sidebar.jsp" />
<div>
<form class="new" style="text-align:center" action="Add" method="post">
<input type="hidden" name="action" value="Account">
<fieldset>
<legend align="center">Add Account</legend>
<label for="CustomerId">Customer Id: </label><br><br>
<select name="cars" id="cars">
<option value="select">select</option>
<%List<Integer> obj=(List<Integer>) request.getAttribute("AllId"); 
  for(Integer i:obj)
  {
	  
%>
<option name="cusId" value="<%=i%>"><%=i%></option>
<%
}
%>
</select>
<br>
<br>
<label for="Branch">Branch: </label><br><br>
<input type="text" placeholder="Branch" name="Branch" id="Branch" required><br><br>
<label for="Balance">Balance: </label><br><br>
<input type="number" placeholder="Balance" name="Balance" id="Balance" required><br><br> 
<button type="submit">Add</button><br><br>
</fieldset>
</form>
</div>
</body>
</html>