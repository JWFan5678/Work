<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<link type="text/css" href="css/font-awesome.min.css" rel="stylesheet"/>
	<link type="text/css" href="css/metro.css" rel="stylesheet"/>
	<link href="css/buttons.css" rel="stylesheet"/>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript">
        $(function () {
            $('#userViewModal').on('show.bs.modal', function (e) {
                var view = $(e.relatedTarget).data('view');
                $("#user_id").text(view.userId);
                $("#user_name").text(view.userName);
                $("#profile_limit").text(view.userProfileLimit);
                $("#explorerdata_limit").text(view.userExplorerDataLimit);
                $("#downloaddata_limit").text(view.downloadDataLimit);
            });

            $('#userEditModal').on('show.bs.modal', function (e) {
                var view = $(e.relatedTarget).data('view');
                $("#editUserID").text(view.userId);
                $("#editUserName").text(view.userName);
                $("#editProfile").val(view.userProfileLimit);
                $("#editExplorerdataLimit").val(view.userExplorerDataLimit);
                $("#editDownloaddataLimit").val(view.downloadDataLimit);
            });
        });

        function searchUsers(page) {
            $('#currentPage').val(page);
            $('#userListInfo').submit();
        }

        function editUserSetting() {
            var updateData = {
                "userId": $("#editUserID").text(),
                "userName": $("#editUserName").text(),
                "userProfileLimit": $("#editProfile").val(),
                "userExplorerDataLimit": $("#editExplorerdataLimit").val(),
                "downloadDataLimit": $("#editDownloaddataLimit").val()
            };

            $.ajax({
                type: "POST",
                url: "/editUserSetting",
                data: updateData,
                success: function (success) {
                    if (success == 'Success') {
                        $("button[data-user='" + $("#editName").text() + "']").each(function (i) {
                            $(this).data("view", updateData);
                        });
                    }
                }, error: function (xhr, status) {
                    console.log(status);
                }
            });
        }
	</script>


</head>


<body>
	<h2>List of Nurses</h2>

	<table>
		<tr>
			<td>ID</td><td>Name</td><td>Locations</td><td></td>
		</tr>
		<c:forEach items="${employees}" var="employee">
			<tr>
				<td>${employee.ssn}</td>
				<td>${employee.name}</td>
				<td>${employee.salary}</td>
			<td><a href="<c:url value='/edit-${employee.ssn}-employee' />">view</a></td>
			<td><a href="<c:url value='/delete-${employee.ssn}-employee' />">delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<a href="<c:url value='/new' />">Add New Employee</a>

</body>
</html>