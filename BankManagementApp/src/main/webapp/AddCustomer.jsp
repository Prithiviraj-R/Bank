<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Account</title>
<style>
fieldset
{
width:1000px;
background-color:ivory;
margin:auto;
}
body
{
background-color:LavenderBlush;
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
</style>
<script>
function whiteSpace(evt)
{
	var charcode=evt.which ? evt.which:evt.keyCode;
	if(charcode==32)
		{
		   alert('space & numbers is not allowed');
		   return false;
		}
	return true;
}
</script>
</head>
<body>
<h1><b>ADD CUSTOMER</b></h1>
<jsp:include page="sidebar.jsp" />
<div>
<form class="new" style="text-align:center" action="Add" method="post">
<input type="hidden" name="action" value="Customer"> 
<fieldset>
<legend align="center">Add Customer</legend>
<label for="name">Name: </label><br><br>
<input type="text" placeholder="name" name="name" id="name" onkeypress='return whiteSpace(event);' required><br><br>
<label for="Dob">Date Of Birth: </label><br><br>
<input type="date" placeholder="DOB" name="Dob" id="Dob" required><br><br>
<label for="Address">Address: </label><br><br>
<input type="text" placeholder="Address" name="Address" id="Address" onkeypress='return whiteSpace(event);' required><br><br> 
<label for="phNo">PhoneNumber: </label><br><br>
<input type="number" placeholder="PhoneNumber" name="phNo" id="phNo" maxlength="10" required><br><br> 
<button type="submit">Add</button><br><br>
</fieldset>
<h4><%String message=(String) request.getAttribute("Message");
if(message==null)
{}
else
{
	out.println(message);
}
%>
</h4>
</form>
</div>
</body>
</html>