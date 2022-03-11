<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sidebar</title>
<link type="text/css" rel="stylesheet" href="sidebar.css">
<link href="label.css" type="text/css" rel="stylesheet">
<link href="button.css" type="text/css" rel="stylesheet">
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
<button name="moneyexchange" value="deposit" type="submit" formaction="CustomerCount" formmethod="post">Deposit</button>
<br><br>
<button name="moneyexchange" value="withdraw" type="submit" formaction="CustomerCount" formmethod="post">Withdraw</button>
<br><br>
<button name="moneyexchange" value="transaction" type="submit" formaction="CustomerCount?moneyexchange=transaction" formmethod="post">Transfer to Other Account</button>
<br><br>
<button name="moneyexchange" value="logout" type="submit" formaction="LogOutServlet?moneyexchange=logout" formmethod="post">Log Out</button>
<br>
</form>
</div>
</body>
</html>