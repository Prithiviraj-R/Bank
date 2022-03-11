<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="Details.AccountDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="commonstyle.css" type="text/css" rel="stylesheet">
<link href="label.css" type="text/css" rel="stylesheet">
<link href="button.css" type="text/css" rel="stylesheet">
<title>Transaction</title>
<style>
div
{
float:right;
}
</style>
</head>
<body><h1 style="color:green">Welcome.</h1>
<jsp:include page="usersidebar.jsp" />
<a onclick="history.back()">Back</a>
<div>
<form class="new" onsubmit="return validAccNo()" name="myForm" id="myForm">
<fieldset>
<legend align="center">Transfer</legend>
<label for="AccNum">From:</label><br><br>
<input type="number" name="AccNum" id="AccNum" value=<%=request.getParameter("fromAccNum")%> readonly="readonly">
<br><br>
<input type="hidden" id="Customer" name="Customer" value="Customer">
<label for="ToAccNum">to:</label><br><br>
<select name="AccNo" id="cars" required>
<option value="0">select</option>
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
<h4 class=warning><b><%if(request.getAttribute("text")!=null)
	{
	     out.println("**"+(String) request.getAttribute("text"));
	}
%></b></h4>
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