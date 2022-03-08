<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Map" %>
    <%@page import="Details.AccountDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction</title>
<style>
fieldset
{
width:800px;
background-color:ivory;
margin:auto;
padding:41px;
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
h1
{
color:green;
}
select
{
width:100px;
}
</style>
</head>
<body>
<h1><b>TRANSFER</b></h1>
<jsp:include page="sidebar.jsp" />
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<div>
<form class="new">
<fieldset>
<legend align="center">Transfer</legend>
<label for="AccNum">From:</label><br><br>
<select name="AccNo" id="cars">
<option value="select">select</option>
<%Map<Integer,Map<Long,AccountDetails>> obj1=(Map<Integer,Map<Long,AccountDetails>>) request.getAttribute("AccountMap"); 
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
%>
</select>
<br><br>
<label for="ToAccNum">to:</label><br><br>
<select name="AccNo" id="cars">
<option value="select">select</option>
<%Map<Integer,Map<Long,AccountDetails>> obj2=(Map<Integer,Map<Long,AccountDetails>>) request.getAttribute("AccountMap"); 
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
%>
</select>
<br><br>
<input type="hidden" id="Customer" name="Customer" value="admin">
<label for="Amount">Amount:</label><br><br>
<input type="number" placeholder="Amount" name="Amount" id="Amount" required>
<br>
<br>
<button type="submit" formaction="TransactionServlet" formmethod="post">Send</button>
</fieldset>
</form>
</div>
</body>
</html>