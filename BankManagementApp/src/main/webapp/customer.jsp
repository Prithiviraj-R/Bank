<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Options</title>
<style>
body {
	background-color: LavenderBlush;
}

table, th, td
{
  margin-top:25px;
  border: 1px solid;
  width:1025px;
  padding:3px;
}
form.new
{
border:2px solid black;
width:1000px;
}
button.button
{
border:1px solid black;
width:200px;
padding:5px;
}
button.button:hover
{
background-color:LavenderBlush;
}
div
{
float:right;
}
div.a
{
float:right;
}
form.inactive
{
border:2px solid black;
width:1000px;
margin-top:25px;
}
</style>
<script>
	function confirmAction() {
		let confirmAction = confirm("Click ok to deactivate/activate customer..");

		return confirmAction;
	}
</script>
</head>
<body>
<h1 style=color:green><b>Customer</b></h1>
<jsp:include page="sidebar.jsp" />
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
	<div>
		<form class="new" method="post">
		<button name=class="button" type="submit" formaction="AddCustomer.jsp">AddCustomer</button><br><br>
		<label for="active" style=text-align:center>Active Customer</label>
			<table>
				<tr>
					<th>Customer Id</th>
					<th>Customer Name</th>
					<th>Date of birth</th>
					<th>Address</th>
					<th>Phone Number</th>
					<th>status</th>
					<th>Update</th>
				</tr>
				<c:forEach items="${temp}" var="map1">
					<tr>
						<td><button type="submit" name="status1" value="customer"
								formaction="CustomerStatus?customerId=<c:out value="${map1.key}" />"
								onclick="return confirmAction()">
								<c:out value="${map1.key}" />
							</button></td>
						<td><c:out value="${map1.value.getName()}" /></td>
						<td><c:out value="${map1.value.getDob()}" /></td>
						<td><c:out value="${map1.value.getAddress()}" /></td>
						<td><c:out value="${map1.value.getPhoneNumber()}" /></td>
						<td><c:out value="${map1.value.isStatus()}" /></td>
						<td><button type="submit"
								formaction="Profile?customerId=<c:out value="${map1.key}"/>" formmethod="post">Edit</button></td>
					    <input type="hidden" name="update" value="active">
					</tr>
				</c:forEach>
			</table>
			<br><br>
			</form>
		<form class="inactive" method="post">
		<label for="inactive" style=text-align:center>InActive Customer</label>	
		<table>
				<tr>
					<th>Customer Id</th>
					<th>Customer Name</th>
					<th>Date of birth</th>
					<th>Address</th>
					<th>Phone Number</th>
					<th>status</th>
					
				</tr>
				<c:forEach items="${inactive}" var="map1">
					<tr>
						<td><button type="submit" name="status1" value="customer"
								formaction="CustomerStatus?customerId=<c:out value="${map1.key}" />"
								onclick="return confirmAction()">
								<c:out value="${map1.key}" />
							</button></td>
						<td><c:out value="${map1.value.getName()}" /></td>
						<td><c:out value="${map1.value.getDob()}" /></td>
						<td><c:out value="${map1.value.getAddress()}" /></td>
						<td><c:out value="${map1.value.getPhoneNumber()}" /></td>
						<td><c:out value="${map1.value.isStatus()}" /></td>
					    <input type="hidden" name="update" value="inactive">
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</body>
</html>