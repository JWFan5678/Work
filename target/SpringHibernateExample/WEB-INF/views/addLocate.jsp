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

	<h2>Add Locate</h2>
 
	<form:form method="POST" modelAttribute="Newlocate" action="/saveLocate" >

		<table>
			<tr>
				<td><label for="locateName">Name: </label> </td>
				<td><input name="locateName"  type="text"/> </td>

		    </tr>
			<tr>
				<td>
					<input type="submit" value="Add"/>
				</td>
			</tr>
		</table>
	</form:form>
	<br/>
	<br/>
	<a href="<c:url value='/' />">Go back</a>
</body>
</html>