<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: LightGray"; style ="color:Black";  >
			<div>
			<a href="https://github.com/harsh-kumbhar/User_Management_System.git" class="navbar-brand" style= "color: Black;"> User
					Management App </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link"  style= "color: Black;">Users</a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Users</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					New User</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Entry No.</th>
						<th>Name</th>
						<th>Email</th>
						<th>Gender</th>
						<th>Country</th>
						<th>State</th>
						<th>City</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="user" items="${listuser}"> 
    <tr>
        <td><c:out value="${user.sr_no}" /></td>
        <td><c:out value="${user.name}" /></td>
        <td><c:out value="${user.email}" /></td>
        <td><c:out value="${user.gender}" /></td>
        <td><c:out value="${user.country}" /></td>
        <td><c:out value="${user.state}" /></td>
        <td><c:out value="${user.city}" /></td>
		        
		       <td>
		    <!-- Edit Button -->
		    <form action="edit" method="get" style="display:inline;">
		        <input type="hidden" name="sr_no" value="${user.sr_no}" />
		        <button type="submit" style="background-color: DodgerBlue; color: white; border: none; padding: 5px 10px; cursor: pointer; border-radius: 5px;">
		            Edit
		        </button>
		    </form>
		    &nbsp;&nbsp;
		    <!-- Delete Button -->
		    <form action="delete" method="get" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this user?');">
		        <input type="hidden" name="sr_no" value="${user.sr_no}" />
		        <button type="submit" style="background-color: red; color: white; border: none; padding: 5px 10px; cursor: pointer; border-radius: 5px;">
		            Delete
		        </button>
		    </form>
		</td>
       
</c:forEach>
					
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>
</body>
</html>