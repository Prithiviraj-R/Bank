<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Map" %>
    <%@page import="Details.AccountDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction</title>
<link href="commonstyle.css" type="text/css" rel="stylesheet">
<link href="label.css" type="text/css" rel="stylesheet">
<link href="button.css" type="text/css" rel="stylesheet">
<style>
body
{
background-color:LavenderBlush;
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
<h1><b>TRANSFER</b></h1>
<a onclick="history.back()">Back</a>
<jsp:include page="sidebar.jsp" />
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<div>
<form class="new" onsubmit="return validAccNo();" id="myForm" name="myForm">
<fieldset>
<legend align="center">Transfer</legend>
<label for="AccNum">From:</label><br><br>
<select name="AccNum" id="AccNum" required>
<option value="0">select</option>
<%
if(request.getAttribute("AccountMap")==null)
{
	
}
else
{
	Map<Integer,Map<Long,AccountDetails>> obj1=(Map<Integer,Map<Long,AccountDetails>>) request.getAttribute("AccountMap"); 
  for(Integer i:obj1.keySet())
  {
	  for(Long k:obj1.get(i).keySet())
	  {
	     if(obj1.get(i).get(k).isStatus()==true)
	     {
%>
<option value="<%=k%>"><%=k%></option>
<%
}
	  }
  }
}
%>
</select>
<br><br>
<label for="ToAccNum">to:</label><br><br>
<select name="AccNo" id="AccNo">
<option value="0">select</option>
<%
if(request.getAttribute("AccountMap")==null){}
else{
Map<Integer,Map<Long,AccountDetails>> obj2=(Map<Integer,Map<Long,AccountDetails>>) request.getAttribute("AccountMap"); 
  for(Integer i:obj2.keySet())
  {
	  for(Long k:obj2.get(i).keySet())
	  {
	     if(obj2.get(i).get(k).isStatus()==true)
	     {
%>
<option value="<%=k%>"><%=k%></option>
<%
}
	  }
  }
}
%>
</select>
<br><br>
<input type="hidden" id="Customer" name="Customer" value="admin">
<label for="Amount">Amount:</label><br><br>
<input type="number" placeholder="Amount" name="Amount" id="Amount" max="50000" required>
<br>
<br>
<button type="submit" name="Customer" value="admin" formaction="TransactionServlet" formmethod="post">Send</button>
</fieldset>
<h4 class=warning><%
if(request.getAttribute("text")!=null)
{
out.print("**"+request.getAttribute("text"));
}
%></h4>
</form>
</div>
<script>
function validAccNo()
{
	     var x = document.myForm.Amount;
	     if(Math.sign(x.value)==(-1))
	     {
		  alert("You are tried to enter the negative value");
		  return false;
	     }
		var x=document.myForm.AccNum.value;
	    var y=document.myForm.AccNo.value;
		if(x==0 || y==0)
			{
			   alert("Enter valid Account Number");
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