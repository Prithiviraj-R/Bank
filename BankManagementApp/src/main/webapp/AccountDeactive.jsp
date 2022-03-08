<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account settings</title>
<style>
body
{
background-color:LavenderBlush;
}
fieldset
{
border:1px solid black;
background-color:Ivory;
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
label
{
text-align:center;
}
input
{
text-align:center;
}
h1
{
color:green;
}
</style>
</head>
<body>
<h1><b>ACCOUNT DEACTIVE/ACTIVE</b></h1>
<jsp:include page="sidebar.jsp" />
<div>
<form class="new">
<fieldset>
<legend Style="text-align:center">Status Setting</legend>
<Label for="cusId">CustomerId:</Label>
<input type="text" name="cusId" value="<%=request.getParameter("cusId")%>">
<br>
<br>
<Label for="accId">AccountId:</Label>
<input type="text" name="accId" value="<%=request.getParameter("accId")%>">
<br>
<br>
<label for="status">Status:</label>
<input type="text" name="status" placeholder="Status">
<br>
<br>
<input type="hidden" name="status1" value="account">
<button type="submit" formaction="CustomerStatus?status1=account" formmethod="post">Submit</button>
</fieldset>
</form>
</div>
</body>
</html>