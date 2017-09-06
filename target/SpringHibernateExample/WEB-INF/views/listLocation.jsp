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
	<h2>List of Location</h2>

	<table class="table-list">
		<thead>
		<tr>
			<th>Location</th>
			<th>LastDate</th>
			<th>Nurse</th>
			<th></th>
		</tr>
		</thead>
		<tbody>
		<c:forEach  items="${locations}" var="location" varStatus="i">
			<tr${(i.index % 2) eq 0 ? '' : ' class="odd"'}>

				<td>${location.name}</td>
				<td>${location.lastDate}</td>
				<td>${location.nurse}</td>

				<td>
					<div class="btn-group btn-group-sm">
						<td><a href="<c:url value='/view-${location.id}-location' />">Veiw</a></td>
						</button>
					</div>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>


	<br/>
	<a href="<c:url value='/' />">Home Page</a>

</body>
</html>