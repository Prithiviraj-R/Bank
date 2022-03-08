<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sidebar</title>
<style>
div
{
float:left;
}
form
{
background-color:rgb(255, 255, 240);
width:200px;
margin-top:25px;
margin-left:10px;
padding:50px;
text-align:center;
}
body
{
background-color:LavenderBlush;
}
a
{
border:none;
colour:blue;
}
</style>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<div>
<form style="border:2px solid black;">
<br>
<button type="submit" formaction="CustomerServlet" formmethod="post">Customer</button>
<br><br>
<button type="submit" formaction="AccountServlet" formmethod="post">Account</button>
<br><br>
<input type="hidden" name="action" value="Customer">
<button name="moneyexchange" value="deposit" type="submit" formaction="CustomerCount?moneyexchange=deposit" formmethod="post">Deposit</button>
<br><br>
<button name="moneyexchange" value="withdraw" type="submit" formaction="CustomerCount?moneyexchange=withdraw" formmethod="post">Withdraw</button>
<br><br>
<button name="moneyexchange" value="transaction" type="submit" formaction="CustomerCount?transaction=transaction" formmethod="post">Transfer to Other Account</button>
<br><br>
<button name="moneyexchange" value="logout" type="submit" formaction="LogOutServlet?moneyexchange=logout" formmethod="post">LogOut</button>
<br>
</form>
</div>
</body>
</html>