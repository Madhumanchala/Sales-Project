<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
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
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/datatables.bootstrap5.css" />
<link rel="stylesheet" href="css/style.css" />

</head>

<body>
	<%@include file="header.jsp"%>
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">

			<div class="layout-page">
				<%-- 				<%@include file="navbar.jsp"%> --%>

				<div class="content-wrapper">
					<div class="container-xxll flex-grow-1 container-p-y rightprofile">
						<div class="row">

							<div class="col-xxl">
								<div class="card mb-4 pb-3">
									<div
										class="card-header d-flex align-items-center justify-content-between mb-0">
										<h5 class="mb-0">Project List</h5>
										<!-- <div class="right-nav ">
											<ul>
												<li><a class="btn btn-secondary add-new btn-primary"
													href="createLeads"> <i class="bx bx-plus me-1"></i> Add
														Zone
												</a></li>
											</ul>
										</div> -->

										<div class="col-lg-6 col-md-6 col-sm-6">

											<span class="addClient" data-bs-toggle="modal"
												data-bs-target="#addClientManagermodal"> <a href="#">
													<i class="bx bx-plus"></i> Add Project Type(Deal Type)
											</a>
											</span>
										</div>

									</div>

									<div class="table-responsive1">
										<div id="no-more-tables">
											<table id="leadList" class="table tablelist leadList"
												style="width: 100%;">
												<thead>
													<tr>
														<th>Available Project List</th>	
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${projectList}" var="projectList">
														<tr style="cursor: pointer;">
															<td data-title="project Name">${projectList.projecttype}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>

									</div>
								</div>

							</div>

						</div>
					</div>


					<!-- Modal addClientManagermodal -->
					<div class="modal fade" id="addClientManagermodal"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="addClientManagermodalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<form id="projectDetailsForm">
									<div class="modal-header">
										<h1 class="modal-title fs-3" id="addClientManagermodalLabel">Add
											New Project Type</h1>
										<button type="button" id="closeAddClientManagermodal"
											class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="row">


											<div class="col-lg-12 col-md-12 col-sm-12">
												<div class="form-group">
													<label class="form-label" for="name">Project Type Name </label> <input
														type="text" class="form-control" id="projecttype"
														name="projecttype" placeholder="Project Name" />
													<div id="projecttypeError" class="text-danger mt-2"></div>
												</div>
											</div>

										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary "
											onclick="saveProjectDetails()">Submit</button>
									</div>
								</form>
							</div>
						</div>
					</div>

						<%@include file="footer.jsp"%>
					<div class="content-backdrop fade"></div>
				</div>
			</div>
		</div>
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	
	
<!-- Notification Modal -->
<div class="modal fade" id="notificationModal" tabindex="-6" aria-labelledby="notificationModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width:320px;">
        <div class="modal-content text-center">
            <div class="modal-header justify-content-center">
                <h5 class="modal-title" id="notificationModalLabel">Notification</h5>
              
            </div>
            <div class="modal-body">
                <p id="notificationMessage"></p>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-primary" onClick="window.location.reload();">OK</button>
            </div>
        </div>
    </div>
</div>



	<script>
		$(document).ready(function() {
			$(".active").removeClass("active");
			$("#leadsNavid").addClass("active");
		});
	</script>
	
	
		<script>
		function saveProjectDetails() {
			var formData = $("#projectDetailsForm").serializeArray();
			if (!validateprojectDetailsForm()) {
				return;
			}

			var loginFormObjectt = {};
			$.each(formData, function(i, v) {
				loginFormObjectt[v.name] = v.value;
			});

			console.log(loginFormObjectt);
			$.ajax({
				url : "save-project",
				type : "POST",
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(loginFormObjectt),
				success : function(result) {
		        	 $('#addClientManagermodal').modal('hide');
		            showNotificationModal('Project Details Saved!');
				},
				error : function(err) {
		            showNotificationModal('Fail to Save!');
				}
			});
		}
		</script>
		
		<script>
		function validateprojectDetailsForm() {
			var projecttype = $("#projecttype").val();
			var isValid = true;

			$("#projecttypeError").text("");
			if (projecttype == null || projecttype.trim() == "") {
				$("#projecttypeError").text("Project Name is required.");
				isValid = false;
			} 
			return isValid;
		}
		
		function showNotificationModal(message) {
		    $('#notificationMessage').text(message);
		    $('#notificationModal').modal('show');
		}
	</script>
	

</body>
</html>
