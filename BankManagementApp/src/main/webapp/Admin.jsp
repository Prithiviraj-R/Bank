<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Options</title>
<style>
form
{
background-color:rgb(255, 255, 240);
width:200px;
margin-top:auto;
margin-left:auto;
margin-right:auto;
padding:50px;
text-align:center;
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
fieldset
{
border:2px solid black;
width:300px;
background-color:ivory;
text-align:center;
}
div.new
{
margin-top:25px;
margin-right:400px;
float:right;
}
</style>
</head>
<body>
<h1 style="color:green">Welcome Admin</h1>
<jsp:include page="sidebar.jsp" />
<div class="new">
<fieldset>
<br>
<legend style=text-align:center><b>DETAILS</b></legend>
<label><b>CUSTOMER COUNT</b></label>
<br>
<br>
<%out.println(session.getAttribute("lastId"));%>
<br>
<br>
<label><b>ACCOUNT COUNT</b></label>
<br>
<br>
<%out.println(session.getAttribute("lastAcc")); %>
<br>
</fieldset>
</div>
</body>
</html>