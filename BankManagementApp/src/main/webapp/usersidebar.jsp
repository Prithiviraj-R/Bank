<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SideBar</title>
<style>
div
{
float:left;
}
form
{
background-color:rgb(255, 255, 240);
width:200px;
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
<div>
<form style="border:2px solid black;">
<br>
<input type="hidden" name="update" value="profile">
<button type="submit" formaction="Profile?cusId=<%=request.getParameter("uname") %>" formmethod="post">My Profile</button>
<br><br>
<button type="submit" formaction="LogOutServlet" name="moneyexchange" value="logout" formmethod="post">LogOut</button>
<br>
</form>
</div>
</body>
</html>