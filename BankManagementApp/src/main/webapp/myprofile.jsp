<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Details.Customer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer details</title>
<link href="commonstyle.css" type="text/css" rel="stylesheet">
<link href="label.css" type="text/css" rel="stylesheet">
<link href="button.css" type="text/css" rel="stylesheet">
</head>
<body>
<h1>Customer details</h1>
<jsp:include page="usersidebar.jsp" />
<div>
<%Customer obj=(Customer) session.getAttribute("Customer");%>
<fieldset>
<legend align="center">Customer Details</legend>
<dl>
<dt><b>Name:</b></dt>
<dd><%out.println(obj.getName());%></dd>
<br>
<dt><b>Date Of Birth:</b></dt>
<dd><%out.println(obj.getDob());%></dd>
<br>
<dt><b>Address:</b></dt>
<dd><%out.println(obj.getAddress());%></dd>
<br>
<dt><b>Phone:</b></dt>
<dd><%out.println(obj.getPhoneNumber());%></dd>
<br>
<dt><b>Status:</b></dt>
<dd><%out.println(obj.isStatus());%></dd>
</dl>
<center><button onclick="history.back()">Go Back</button></center>
</fieldset></div>

</body>
</html>