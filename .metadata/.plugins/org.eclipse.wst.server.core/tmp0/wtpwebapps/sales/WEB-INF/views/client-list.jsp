
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>`
<!DOCTYPE html>

<html lang="en" >

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
 <div id="loader" style="display: none;" ><img src="img/loading.gif"> </div> 
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
										<h5 class="mb-0">Client List</h5>

										<div class="right-nav ">
											<ul>
												<li><a class="btn btn-secondary add-new btn-primary"
													href="createClient"><i class="bx bx-plus me-1"></i> Add
														Client </a></li>
											</ul>

										</div>

									</div>
									<div class="table-responsive1">
										<div id="no-more-tables">
											<table id="clientList" class="table tablelist leadList" style="width: 100%;" >
												
											<thead>
												<tr>
													<th>Client Name</th>
													<th>Client Nation</th>
													<th>Client Location</th>
													<th>Client Address</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${clients}" var="client">
												
													<tr>
														<td data-title="Client Name">${client.clientName}</td>
														<td data-title="Client Nation">${client.clientNation}</td>
														<td data-title="Client Location">${client.clientLocation}</td>
														<td data-title="Client Address">${client.clientAddress}</td>
														<td data-title="Action">
																<span class="edit" data-bs-toggle="modal" data-bs-target="#editmodal" data-id="${client.id}">
																	<a href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"> <i class="bx bx-edit-alt me-1"></i> </a>
																</span>
															
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
	<script src="js/moment.min.js"></script>
	<script src="js/bootstrap-datetimepicker.min.js"></script>
	<script src="js/menu.js"></script>
	<script src="js/main.js"></script> -->

</body>
<script type="text/javascript">
		
	
	$(document).ready(function () {
		$('#clientList').dataTable();
	});
	
	$(document).on('click', '.edit', function (e) {
		e.stopPropagation(); // Prevent the row click event
		var clientId = $(this).data('id');
		editLead(clientId);
	});

	function editLead(id) {
		window.location.href = 'editClient?id=' + id;
	}
	

</script>
<script>
   $(document).ready(function(){
       $(".active").removeClass("active");
       $("#clientListNavid").addClass("active");
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