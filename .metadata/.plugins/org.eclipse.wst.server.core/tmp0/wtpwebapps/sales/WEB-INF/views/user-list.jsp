
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

<html lang="en" class="light-style   ">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=0">
<title>Sales Management</title>
<meta name="description" content="" />
<link rel="icon" type="image/x-icon" href="img/favicon.ico" />
<!-- Icons.  icon fonts -->
<link rel="stylesheet" href="fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="css/datatables.bootstrap5.css" />
<link rel="stylesheet" href="css/style.css" />

</head>

<body>
	<%@include file="header.jsp"%>
<!-- <div id="loader" ><img src="img/loading.gif"> </div> -->
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
<%-- 			<%@include file="aside.jsp"%> --%>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->
<%-- 				<%@include file="navbar.jsp"%> --%>
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->
					<div class="container-xxll flex-grow-1 container-p-y rightprofile">
						<div class="row">
							<!-- Basic Layout -->
							<div class="col-xxl">
								<div class="card mb-4">
									<div
										class="card-header d-flex align-items-center justify-content-between mb-0">
										<h5 class="mb-0">User List</h5>

										<div class="right-nav ">
											<ul>
												<li><a class="btn btn-secondary add-new btn-primary"
													href="createUser"><i class="bx bx-plus me-1"></i> Add
														User </a></li>
											</ul>

										</div>

									</div>
									<div class="table-responsive1">
										<table class="table " id="leadList">
											<thead>
												<tr>
													<th> Name</th>
													<th>Zone</th>
													<th>Role</th>
													<th>Manager Name</th>
													<th>Email Id</th>
													<th>Mobile No</th>
													<th>Action</th>
													
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${users}" var="user">
													<%-- <tr onclick="editLead(${client.id})"> --%>
													<tr>
													<td data-title="Name">${user.firstName} ${user.lastName}</td>
														<td data-title="Zone">${user.zone}</td>
														<td data-title="Role">${user.role}</td>
															<td data-title="Manager Name">${user.managerName}</td>
													<td data-title="Email Id">${user.emailId}</td>
													<td data-title="Mobile Number">${user.mobileNo}</td>
														
													<td data-title="Action">
														<div class="d-flex">
														<span class="edit" data-bs-toggle="modal" data-bs-target="#editmodal" data-id="1">
																	<a href="editUserDetails?id=${user.id}" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"> <i class="bx bx-edit-alt me-1"></i> </a>
																</span>
														 <div class="form-check form-switch ms-2">
						      <input class="form-check-input user-status-toggle" data-user-id="${user.id}" type="checkbox" role="switch"  ${user.status eq 1? 'checked':''}  > 
						   </div></div>
						   </td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- Basic with Icons -->
						</div>
					</div>
					<!-- / Content -->

					<!-- Footer -->
					<%@include file="footer.jsp"%>
					<!-- / Footer -->
					<div class="content-backdrop fade"></div>
				</div>
				<!-- Content wrapper -->
			</div>
			<!-- / Layout page -->
		</div>
		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->

	<!-- Core JS -->
	<!-- <script src="js/jquery.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/helpers.js"></script>
	<script src="js/perfect-scrollbar.js"></script>
	<script src="js/dataTables.js"></script>
	<script src="js/dataTables.bootstrap5.js"></script>
	<script src="js/menu.js"></script>
	<script src="js/main.js"></script> -->

</body>
<script type="text/javascript">
	function editLead(id) {

		window.location.href = 'editleads?id=' + id
	}
</script>

<script type="text/javascript">
		
	
	$(document).ready(function () {
		$('#leadList').dataTable();
	});
	
	
	 $('.user-status-toggle').change(function() {
		 console.log($(this).attr('data-user-id'));
		 
		 var status=$(this).is(':checked')?1:2;
	        if ($(this).is(':checked')) {
	            // Checkbox is checked, perform action here
	            console.log($(this).val() + ' is checked');
	        } else {
	            // Checkbox is unchecked, perform action here if needed
	            console.log($(this).val() + ' is unchecked');
	        }
	        var loginFormObject = {};
	        
	        
	        loginFormObject['status'] = status;
	        loginFormObject['id'] = $(this).attr('data-user-id');
	        
	        
			$.ajax({
						url : "changeUserStatus",
						type : "POST",
						dataType : "json",
						contentType : "application/json; charset=utf-8",
						data : JSON.stringify(loginFormObject),
						success : function(result) {
							// when call is sucessfull
							console.log(result);


							
						},
						error : function(err) {
							// check the err for error details
						}
					});
	    });
	
</script>

<!-- <script>
        $(document).ready(function() { 
            setTimeout(function() { 
                //$("#loader").show();  
                $("#loader").hide();
            }, 3000);
        });
    </script>
 -->
</html>