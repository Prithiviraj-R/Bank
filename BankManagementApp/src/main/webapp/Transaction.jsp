<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="Details.AccountDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction</title>
<style>
select
{
width:100px;
}
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
<body><h1 style="color:green">Welcome.</h1>
<jsp:include page="usersidebar.jsp" />
<div>
<form class="new">
<fieldset>
<legend align="center">Transfer</legend>
<label for="AccNum">From:</label><br><br>
<input type="number" name="AccNum" id="AccNum" value=<%=request.getParameter("fromAccNum")%> readonly="readonly">
<br><br>
<input type="hidden" id="Customer" name="Customer" value="Customer">
<label for="ToAccNum">to:</label><br><br>
<select name="AccNo" id="cars">
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
<label for="Amount">Amount:</label><br><br>
<input type="text" placeholder="Amount" name="Amount" id="Amount">
<br>
<br>
<button type="submit" formaction="TransactionServlet" formmethod="post">Send</button>
</fieldset>
</form>
</div>
</body>
</html>