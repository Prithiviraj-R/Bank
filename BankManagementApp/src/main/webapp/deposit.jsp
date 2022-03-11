<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@page import="Details.AccountDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deposit</title>
</head>
<link href="commonstyle.css" type="text/css" rel="stylesheet">
<link href="label.css" type="text/css" rel="stylesheet">
<link href="button.css" type="text/css" rel="stylesheet">
<style>
h1
{
color:green;
}
form.new
{
border:2px solid black;
width:1000px;
padding:41px;
}
div.div
{
float:right;
}
</style>
<script>
document.getElementById("myAnchor").addEventListener("click", function(event){
	  event.stopPropagation()
	});
</script>
<body>
<h1><b>DEPOSIT/WITHDRAW</b></h1>
<a onclick="history.back()">Back</a>
<jsp:include page="sidebar.jsp" />
<div>
<form onsubmit="return validSelect();" class="new" method="post" name="myform" id="myform">
<label for="cusId"><b>CustomerID</b></label>
<br>
<br>
<select name="cars" id="cusId">
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
<label for="AccNo"><b>Account Number</b></label>
<br>
<br>
<select name="AccNo" id="AccNum">
<option value="0">select</option>
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
<br>
<br>
<label for="Amount"><b>Amount:</b></label>
<br>
<br>
<input type="number" id="Amount" name="Amount" max="50000" required>
<br>
<br>
<button type="submit" formaction="Deposit?moneyexchange=<%=(String)request.getAttribute("moneyexchange")%>" formmethod="post">Submit</button>
<br>
<h4 class=warning><b><%if(request.getAttribute("text")!=null)
	{
	     out.println("**"+(String) request.getAttribute("text"));
	}
%></b></h4>
</form>
</div>
<script>
function validSelect()
{
	  var x = document.myform.Amount;
	  if(Math.sign(x.value)==(-1))
	  {
		  alert("You are tried to enter the negative value");
		  return false;
	  }
		var x=document.myform.cars.value;
	    var y=document.myform.AccNo.value;
		if(y==0)
			{
			   alert("select valid Account Number");
			   return false;
			}
		else if(x==0)
		{
			   alert("Select valid Customer Id");
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