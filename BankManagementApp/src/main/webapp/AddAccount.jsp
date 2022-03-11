<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Details.AccountDetails"%>
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
select
{
width:100px;
}
</style>
</head>
<body>
<%
if(request.getParameter("moneyexchange").equals("addAccount"))
{
%>
<h1><b>ADD ACCOUNT</b></h1>
<jsp:include page="sidebar.jsp" />
<div>
<form class="new" style="text-align:center" action="Add" method="post" onsubmit="return negativeNeglect(id);" name="myform" id="myform">
<input type="hidden" name="action" value="Account">
<fieldset>
<legend align="center">Add Account</legend>
<label for="CustomerId">Customer Id: </label><br><br>
<select name="cars" id="cars">
<option value="0">select</option>
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
<label for="branch">Branch: </label><br><br>
<select name="branch" id="branch">
<option value="0">select</option>
<%List<String> obj1=(List<String>) request.getAttribute("Branch"); 
  for(String branch:obj1)
  {
	  
%>
<option value="<%=branch%>"><%=branch%></option>
<%
}
%>
</select>
<br>
<br>
<label for="Balance">Balance: </label><br><br>
<input type="number" placeholder="Balance" name="Balance" id="Balance" required><br><br> 
<button type="submit">Add</button><br><br>
</fieldset>
</form>
</div>
<%
}
else if(request.getParameter("moneyexchange").equals("update"))
{
%>
<h1><b>UPDATE ACCOUNT</b></h1>
<jsp:include page="sidebar.jsp" />
<div>
<form class="new" name="myform" id="myform">
<%AccountDetails obj=(AccountDetails) session.getAttribute("Account"); %>
<fieldset>
<legend align="center"><b>UPDATE</b></legend>
<label for="customerId">Customer ID</label>
<br>
<br>
<Input type="text" name="customerId" id="customerId" value="<%=request.getParameter("acc")%>" readonly="readonly">
<br>
<br>
<label for="accId">AccountId</label>
<br>
<br>
<Input type="text" name="accId" id="accId" value="<%=request.getParameter("accNo")%>" readonly="readonly">
<br>
<br>
<label for="branch">branch</label>
<br>
<br>
<select name="branch" id="branch" value="<%=obj.getBranch()%>">
<option value="<%=obj.getBranch()%>"><%=obj.getBranch()%></option>
<%List<String> obj1=(List<String>) request.getAttribute("Branch"); 
  for(String branch:obj1)
  {
%>
<option value="<%=branch%>"><%=branch%></option>
<%
}
%>
</select>
<br>
<br>
<input type="hidden" name="customer" value="account">
<button type="submit" formaction="UpdateCustomer" formmethod="post">Update</button>
<br>
<br>
</fieldset>
</form>
</div>
<%
}
else if(request.getParameter("moneyexchange").equals("status"))
{
%>
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
<select name="status" id="status">
<option value="0">Deactivate</option>
<option value="1">Activate</option>
</select>
<br>
<br>
<input type="hidden" name="status1" value="account">
<button type="submit" formaction="CustomerStatus?status1=account" formmethod="post">Submit</button>
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
function negativeNeglect(id)
{
	  var x = document.myform.Balance;
	  if(Math.sign(x.value)==(-1))
	  {
		  alert("Amount should not be negative");
		  return false;
	  }
	   var x=document.myform.cars.value;
	    var y=document.myform.branch.value;
		if(x==0)
			{
			   alert("Select valid Customer Id");
			   return false;
			}
		else if(y==0)
			{
			   alert("Select the branch");
			   return false;
			}
		else
			{
			return true;
			}
}
</script>
</body>
</html>