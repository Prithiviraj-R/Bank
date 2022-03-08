<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bank Login</title>
<style>
h1.heading
{
 text-align:center;
 colour:green;
 text-style:bold;
 text-decoration:Underline;
}
label
{
color:green;
}
input[type="text"],input[type="password"]
{
border:none;
border-bottom:2px solid black;
outline:none;
background:none;
}
form
{
background-color:rgb(255, 255, 240);
}
body
{
background-color:LavenderBlush;
}
</style>
<script>
let text =document.getElementById("uname");
let result = text.replace(/^\s+|\s+$/gm,'');

document.getElementById("myForm").innerHTML = result;
</script>
</head>
<body>
<div style="margin-left:34%;margin-top:5%;">
<form style="border:2px solid black;height:50; width:47%;text-align:center;" action="LoginServlet" method="post" id="myForm">
    <h1 style="color:Green">User Login</h1><br>
    <label for="uname"><b>Username:<br><br></b></label>
    <input type="text" placeholder="Enter Username" id="uname" name="uname" required><br><br>
    <label for="psw"><b>Password:<br><br></b></label>
    <input type="password" placeholder="Enter Password" id="psw" name="psw" required><br><br>
    <button type="submit">SignIn</button><br><br>
    <button type="submit">Reset</button><br><br>
 </form>
<h4><b><%
if(request.getAttribute("text")==null)
{}
else
{
out.println("*"+(String)request.getAttribute("text"));
}
%></b></h4>
 </div>
</body>
</html>