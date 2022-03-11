<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Details.Customer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Account</title>
<link href="commonstyle.css" type="text/css" rel="stylesheet">
<link href="label.css" type="text/css" rel="stylesheet">
<link href="button.css" type="text/css" rel="stylesheet">
<style>
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
</head>
<body>
<%if(request.getParameter("class").equals("add"))
{
%>
<h1><b>ADD CUSTOMER</b></h1>
<jsp:include page="sidebar.jsp" />
<div>
<form class="new" style="text-align:center" action="Add" method="post" onsubmit="return negativeNeglect(id)" name="myForm" id="myForm">
<input type="hidden" name="action" value="Customer"> 
<fieldset>
<legend align="center">Add Customer</legend>
<label for="name">Name: </label><br><br>
<input type="text" placeholder="name" onchange="myFunction(id)"name="name" id="name" required><br><br>
<label for="Dob">Date Of Birth: </label><br><br>
<input type="date" placeholder="DOB" name="dob" id="dob" required><br><br>
<label for="Address">Address: </label><br><br>
<input type="text" placeholder="Address" name="address" id="address" onchange="addressValidate(id)"required><br><br> 
<label for="phNo">PhoneNumber: </label><br><br>
<input type="number" placeholder="PhoneNumber" onchange="negativeNeglect(id)" name="phone" id="phone" min="1" maxlength="10" required><br><br> 
<button type="submit">Add</button><br><br>
</fieldset>
</form>
</div>
<%
}
else
{
%>
<h1><b>UPDATE CUSTOMER</b></h1>
<jsp:include page="sidebar.jsp" />
<div>
<form class="new" onsubmit="return negativeNeglect(id)" name="myForm" id="myForm">
<%
Customer obj=(Customer) session.getAttribute("Customer");
%>
<fieldset>
<legend align="center"><b>UPDATE</b></legend>
<label for="customerId">Customer ID</label>
<br>
<Input type="text" onchange="myFunction(id)" name="customerId" id="customerId" value="<%=request.getParameter("customerId")%>" readonly="readonly">
<br>
<label for=name>Name:</label>
<br>
<input type="text" name="name" id="name" onchange="myFunction(id)" value="<%=obj.getName()%>" required>
<br>
<label for="dob">Date of Birth:</label>
<br>
<input type="date" name="dob" id="dob" value="<%=obj.getDob()%>" required>
<br>
<label for="address">Address:</label>
<br>
<input type="text" name="address" id="address" onchange="addressValidate(id)" value="<%=obj.getAddress()%>" required>
<br>
<label for="phone">Phone number:</label>
<br>
<input type="number" name="phone" id="phone" value="<%=obj.getPhoneNumber()%>" min="1" maxlength="10" required>
<br>
<br>
<input type="hidden" name="customer" value="customer">
<button type="submit" formaction="UpdateCustomer" formmethod="post">Update</button>
<br>
<br>
</fieldset>
</form>
</div>
<%
}
%>
<h4 class=warning><marquee><%String message=(String) request.getAttribute("message");
if(message==null)
{}
else
{
	out.println(message);
}
%></marquee>
</h4>
<script>
function myFunction(id)
{
	  var x = document.getElementById(id);
	  x.value = x.value.replaceAll(/[^ a-zA-Z.]/g,"");
	  x.value = x.value.trim();
}
function addressValidate(id)
{
	  var x = document.getElementById(id);
	  x.value = x.value.replaceAll(/[^ /a-zA-Z.]/g,"");
	  x.value = x.value.trim();
}
function negativeNeglect(id)
{
	  var x = document.myForm.phone;
	  if(Math.sign(x.value)==(-1))
	  {
		  alert("You are tried to enter the negative value");
		  return false;
	  }
	  if(x.value.length>10)
	  {
		  alert("Phone number should be 10 digits");
		  return false;
	  }
}
</script>
</body>
</html>