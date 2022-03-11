<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Options</title>
<link href="commonstyle.css" type="text/css" rel="stylesheet">
<link href="label.css" type="text/css" rel="stylesheet">
<link href="button.css" type="text/css" rel="stylesheet">
<style>
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
		let confirmAction = confirm("Are you sure you want to do this action?");

		return confirmAction;
	}
</script>
</head>
<body>
<h1 style=color:green><b>Customer</b></h1>
<a onclick="history.back()">Back</a>
<h4><b><marquee><%if(request.getAttribute("text")!=null)
	{
	     out.println("**"+(String) request.getAttribute("text"));
	}
%></marquee></b></h4>
<jsp:include page="sidebar.jsp" />
	<div>
		<form class="new" method="post">
		<button name=class value="add" type="submit" formaction="AddCustomer.jsp">Add Customer</button><br><br>
		<label>Active Customer</label>
		<br>
		<br>
			<table>
				<tr>
					<th>Customer Id</th>
					<th>Customer Name</th>
					<th>Date of Birth</th>
					<th>Address</th>
					<th>Phone Number</th>
					<th>Status</th>
					<th>Update</th>
				</tr>
				<c:forEach items="${temp}" var="map1">
					<tr>
						<td>
								<c:out value="${map1.key}" />
							</td>
						<td><c:out value="${map1.value.getName()}" /></td>
						<td><c:out value="${map1.value.getDob()}" /></td>
						<td><c:out value="${map1.value.getAddress()}" /></td>
						<td><c:out value="${map1.value.getPhoneNumber()}" /></td>
						<td><c:out value="${map1.value.isStatus()}" /></td>
						<td><button type="submit"
								formaction="Profile?customerId=<c:out value="${map1.key}"/>&class=update" formmethod="post">Edit</button> <button type="submit" name="status1" value="customer"
								formaction="CustomerStatus?customerId=<c:out value="${map1.key}" />"
								onclick="return confirmAction()">
								Deactivate
							</button></td>
					    <input type="hidden" name="update" value="active">
					</tr>
				</c:forEach>
			</table>
			<br><br>
			</form>
		<form class="inactive" method="post">
		<label>InActive Customer</label>
		<br>	
		<br>
		<table>
				<tr>
					<th>Customer Id</th>
					<th>Customer Name</th>
					<th>Date of birth</th>
					<th>Address</th>
					<th>Phone Number</th>
					<th>status</th>
					<th>Activate</th>
					
				</tr>
				<c:forEach items="${inactive}" var="map1">
					<tr>
						<td>
								<c:out value="${map1.key}" />
					   </td>
						<td><c:out value="${map1.value.getName()}" /></td>
						<td><c:out value="${map1.value.getDob()}" /></td>
						<td><c:out value="${map1.value.getAddress()}" /></td>
						<td><c:out value="${map1.value.getPhoneNumber()}" /></td>
						<td><c:out value="${map1.value.isStatus()}" /></td>
						<td><button type="submit" name="status1" value="customer"
								formaction="CustomerStatus?customerId=<c:out value="${map1.key}" />"
								onclick="return confirmAction()">
								Activate
							</button></td>
					    <input type="hidden" name="update" value="inactive">
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</body>
</html>