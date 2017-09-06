<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Employee Registration Form</title>
	<script type="text/javascript" src="/js/jquery.min.js"></script>
<style>

	.error {
		color: #ff0000;
	}
</style>

	<script type="text/javascript">
		function insertNurse(){
            var colors = [];
            $("input:checkbox[name=locateGroup]:checked").each(function(){
                colors.push($(this).val());
            });

            var f = document.createElement("form");
            f.setAttribute('method',"post");
            f.setAttribute('action',"/new");
            var i = document.createElement("input"); //input element, text
            i.setAttribute('type',"hidden");
            i.setAttribute('name',"ssn");
            i.setAttribute('value',$("#ssn").val());
            var i2 = document.createElement("input"); //input element, text
            i2.setAttribute('type',"hidden");
            i2.setAttribute('name',"name");
            i2.setAttribute('value',$("#name").val());
            var i3 = document.createElement("input"); //input element, text
            i3.setAttribute('type',"hidden");
            i3.setAttribute('name',"locateGroup");
            i3.setAttribute('value',colors);

            f.appendChild(i);
            f.appendChild(i2);
            f.appendChild(i3);
            document.getElementsByTagName('body')[0].appendChild(f).submit();




		}
	</script>


</head>

<body>

	<h2>Add Nurse</h2>

	<form:form method="POST" modelAttribute="employee">
		<form:input type="hidden" path="id" id="id"/>
		<table>
			<tr>
				<td><label for="name">ID: </label> </td>
				<td><form:input path="ssn" id="ssn"/></td>
				<td><form:errors path="ssn" cssClass="error"/></td>
		    </tr>
			<tr>
				<td><label for="salary">Name: </label> </td>
				<td><form:input path="name" id="name"/></td>
				<td><form:errors path="name" cssClass="error"/></td>
		    </tr>

		</table>
	</form:form>
	<label>Location: </label>
	<form:checkboxes name="locateGroup" path="courses" items="${courses}" />
	<br/>
	<input type="submit" value="Add" onclick="insertNurse()"/>
	<br/>
	<br/>
	<a href="<c:url value='/list' />">Go back</a>
</body>
</html>