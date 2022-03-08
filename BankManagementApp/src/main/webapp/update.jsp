<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Details.Customer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<style>
body
{
background-color:LavenderBlush;
}
form.new
{
border:2px solid black;
width:800px;
margin-top:25px;
}
fieldset
{
width:700px;
background-color:ivory;
margin:auto;
}
div
{
float:right;
}
h1
{
color:green;
}
</style>
</head>
<body>
<h1><b>UPDATE CUSTOMER</b></h1>
<jsp:include page="sidebar.jsp" />
<div>
<form class="new">
<%Customer obj=(Customer) session.getAttribute("Customer"); %>
<fieldset>
<legend align="center"><b>UPDATE</b></legend>
<label for="customerId">Customer ID</label>
<br>
<Input type="text" name="customerId" id="customerId" value="<%=request.getParameter("customerId")%>" readonly="readonly">
<br>
<label for=name>Name:</label>
<br>
<input type="text" name="name" id="name" value="<%=obj.getName()%>">
<br>
<label for="dob">Date of Birth:</label>
<br>
<input type="date" name="dob" id="dob" value="<%=obj.getDob()%>">
<br>
<label for="address">Address:</label>
<br>
<input type="text" name="address" id="address" value="<%=obj.getAddress()%>">
<br>
<label for="phone">Phone number:</label>
<br>
<input type="text" name="phone" id="phone" value="<%=obj.getPhoneNumber()%>">
<br>
<br>
<button type="submit" formaction="UpdateCustomer" formmethod="post">Update</button>
<br>
<br>
</fieldset>
</form>
</div>
</body>
</html>