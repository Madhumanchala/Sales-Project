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
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/style.css" />


</head>

<body>
	<%@include file="header.jsp"%>
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
										<h5 class="mb-0">Edit Lead</h5>
										<div class="right-nav ">
											<ul>
												<li><a class="btn btn-secondary add-new btn-primary"
													href="leadList"><i class="bx bx-arrow-back me-1"></i>
														Back </a></li>
											</ul>
										</div>
									</div>
									<div class="card-body mt-4">
										<form action="edit-Lead"
											onSubmit="return validateLeadDetails()" method="post">
											<div class="row">

												 <div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
													<label
															class="form-label" for="client">Client </label> 
															<input
															type="text" value="${LeadDetails.clientName}"
															class="form-control" id="budget" name="clientid"
															 disabled="disabled" />
													</div>
												</div> 

												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<input type="hidden" id="id" name="id"
															value="${LeadDetails.id}"> <label
															class="form-label" for="budget">Budget </label> 
															<input
															type="text" value="${LeadDetails.budget}"
															class="form-control" id="budget" name="budget"
															placeholder="Enter Budget" disabled="disabled" />
													</div>
												</div>

												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="client">Project-Type </label> 
														 <select
															class="form-control form-select select2 clientDropDown"
															id="projectType" name="projectType" disabled="disabled">
															<option disabled selected>Select</option>

															<c:forEach items="${projectList}" var="p">
																<option value='${p.id}' ${p.id eq LeadDetails.projectType? "selected":""}>${p.projecttype }</option>
															</c:forEach>
														</select>
													</div>
												</div>

												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="form-group">
														<label class="form-label" for="description">Description
														</label>
														<textarea id="description" name="description"
															maxlength="50" class="form-control" disabled="disabled"> ${LeadDetails.description}</textarea>
													</div>
												</div>

												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="status">Status </label> <select
															class="form-control form-select select2" id="status"
															name="leadtracker.status">

															<option disabled>Select</option>
															<c:forEach var="option" items="${leadstatusList}">
																<option value="${option.id}"
																	${option.id == LeadDetails.status ? 'selected' : ''}>${option.statusName}</option>
															</c:forEach>
														</select>

													</div>
												</div>

												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="leadRemark">Lead
															Remark </label> <input type="text"
															value="${LeadDetails.leadRemark}" class="form-control"
															id="leadRemark" name="leadtracker.leadRemark"
															maxlength="50" placeholder="Enter lead Remark" />

													</div>
												</div>

												<hr>

												<div class="col-lg-12 col-md-12 col-sm-12">
													<h4>Reminder</h4>
												</div>

												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="form-group form-check">
														<input type="checkbox" class="form-check-input"
															id="remainderCheckbox" onchange="toggleRemainderFields()">
														<label class="form-check-label" for="remainderCheckbox">Add
															Reminder</label>
													</div>
												</div>

												<div id="remainderFields" style="display: none;">
													<%-- <div class="col-lg-6 col-md-6 col-sm-6">
														<div class="form-group">
															<label class="form-label" for="remainderDate1">Reminder
																Date Time </label> <input type="text"
																<c:choose>
                     <c:when test="${LeadDetails.reminder.reminderStatus == 1}">
                    value="${LeadDetails.reminder.remainderDate}"
                     </c:when>
                     <c:otherwise>
                        value=""
                     </c:otherwise>
                   </c:choose>"
																class="form-control"
																id="remainderDate1" name="reminder.remainderDate"
																placeholder="Enter Reminder" />
														</div>
													</div> --%>
													
													<div class="col-lg-6 col-md-6 col-sm-6">
														<div class="form-group">
															<label class="form-label" for="remainderDate1">Reminder
																Date Time </label> <input type="text"
																value="${LeadDetails.reminder.remainderDate}"
																class="form-control"
																id="remainderDate1" name="reminder.remainderDate"
																placeholder="Enter Reminder" />
														</div>
													</div>
													
													<%-- <div class="col-lg-6 col-md-6 col-sm-6">
														<div class="form-group">
															<label class="form-label" for="Remark">Remark </label> <input
																type="text"
																<c:choose>
                     <c:when test="${LeadDetails.reminder.reminderStatus == 1}">
                       value="${LeadDetails.reminder.remark}"
                     </c:when>
                     <c:otherwise>
                        value=""
                     </c:otherwise>
                   </c:choose>
																class="form-control" id="Remark" name="reminder.remark"
																maxlength="50" placeholder="Enter Remark" />
														</div>
													</div> --%>
													
													<%-- <div class="col-lg-6 col-md-6 col-sm-6">
														<div class="form-group">
															<label class="form-label" for="Remark">Remark </label> <input
																type="text"
																    value="${LeadDetails.reminder.remark}"
																class="form-control" id="Remark" name="reminder.remark"
																maxlength="50" placeholder="Enter Remark" />
														</div>
													</div> --%>

													<div class="col-lg-6 col-md-6 col-sm-6">
														<div class="form-group">
															<label class="form-label" for="Remark">Remark</label>
															<textarea id="Remark" name="reminder.remark"
																maxlength="200" class="form-control">${LeadDetails.reminder.remark}</textarea>
														</div>
													</div>


												</div>
											</div>
											<!-- <div class="text-end"> -->
											<button type="submit" class="btn btn-primary">Update</button>

											<hr>

											<div class="col-lg-12 col-md-12 col-sm-12">
												<h5>Lead Tracker</h5>
											</div>

											<div class="table-responsive1">
												<table class="table " id="leadList">
													<thead>
														<tr>
															<th>Date Time</th>
															<th>Status</th>
															<th>Remark</th>

														</tr>
													</thead>
													<tbody>
														<c:forEach items="${leadTrackHistory}" var="lead">
															<tr onclick="editLead(${lead.id})">
																<td>${lead.leadupdatedts}</td>
																<td>${lead.status}</td>
																<td>${lead.leadRemark}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</form>
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


	<!-- Core JS 
	<script src="js/jquery.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/helpers.js"></script>
	<script src="js/perfect-scrollbar.js"></script>
	<script src="js/menu.js"></script>
	<script src="js/select2.js"></script>
	<script src="js/moment.min.js"></script>
	<script src="js/bootstrap-datetimepicker.min.js"></script> -->

	<script src="js/main.js"></script>


	<script>
		function toggleRemainderFields() {
			var remainderFields = document.getElementById("remainderFields");
			var checkbox = document.getElementById("remainderCheckbox");
			remainderFields.style.display = checkbox.checked ? "block" : "none";
		}
	</script>

	<script type="text/javascript">
		$(function() {
			$('#remainderDate1').datetimepicker({
				defaultDate : new Date(),
				format : 'DD/MM/YYYY HH:mm',
				minDate: new Date() 
			});
		});
	</script>
	<script type="text/javascript">
		$(function() {
			$('#timeline').datetimepicker({
				defaultDate : new Date(),
				format : 'DD/MM/YYYY',
				minDate: new Date() 
			});
		});
	</script>

<script type="text/javascript">
$('document').ready(function(){
// 	console.log(":::",${LeadDetails});
	
});

</script>

</body>

</html>