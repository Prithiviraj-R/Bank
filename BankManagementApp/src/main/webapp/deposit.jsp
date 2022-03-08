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
select
{
width:100px;
text-align:center;
}
</style>
<script>
document.getElementById("myAnchor").addEventListener("click", function(event){
	  event.stopPropagation()
	});
</script>
<body>
<h1><b>DEPOSIT/WITHDRAW</b></h1>
<jsp:include page="sidebar.jsp" />
<div>
<form class="new" method="post" id="myform">
<label for="cusId"><b>CustomerID:</b></label>
<br>
<select name="cars" id="cars">
<option value="select">select</option>
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
<label for="AccNo"><b>AccountNumber:</b></label>
<br>
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
<br>
<br>
<label for="Amount"><b>Amount:</b></label>
<br>
<input type="number" id="Amount" name="Amount" min="1" max="50000" required>
<br>
<br>
<button type="submit" formaction="Deposit?moneyexchange=<%=(String)request.getAttribute("moneyexchange")%>" formmethod="post">Submit</button>
<br>
</form>
</div>
</body>
</html>