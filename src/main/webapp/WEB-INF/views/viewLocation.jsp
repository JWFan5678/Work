<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Employee Registration Form</title>

<style>

	.error {
		color: #ff0000;
	}
</style>

</head>

<body>

	<h2>Registration Form</h2>
 
	<form:form method="POST" modelAttribute="locations" action="/updateLocation">
		<form:input type="hidden" path="id" id="id"/>
		<table>
			<tr>
				<td><label for="name">Name: </label> </td>
				<td><form:input path="name" id="name"/></td>
				<td><form:errors path="name" cssClass="error"/></td>
		    </tr>

	
			<tr>
				<td colspan="3">
					<input type="submit" value="Update"/>
				</td>
			</tr>
		</table>
	</form:form>

	<table>
		<tr>
			<td>ID</td><td>Name</td><td>Locations</td><td></td>
		</tr>
		<c:forEach items="${employees}" var="employee">
			<tr>
				<td>${employee.ssn}</td>
				<td>${employee.name}</td>
				<td>${employee.salary}</td>

			</tr>
		</c:forEach>
	</table>
	<br/>
	<br/>
	<a href="<c:url value='/list' />">Home Page</a>
</body>
</html>