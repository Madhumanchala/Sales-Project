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
										<h5 class="mb-0">Create User</h5>
										<div class="right-nav ">
											<ul>
												<li><a class="btn btn-secondary add-new btn-primary"
													href="userList"><i class="bx bx-arrow-back me-1"></i>
														Back </a></li>
											</ul>
										</div>
									</div>
									<div class="card-body mt-4">
										<form action="updateUser" 
											 method="post" >
											<div class="row">


												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="name">First Name
														</label> 
														<input type="hidden" name="id" value="${userDetails.id }" />
														<input type="text" class="form-control" id="managername"
															name="firstName"
															placeholder="Enter First Name" value="${userDetails.firstName }" />
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="name">Last Name
														</label> <input type="text" class="form-control" id="managername"
															name="lastName"
															placeholder="Enter Last Name" value="${userDetails.lastName }" />
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="mobile">Mobile No</label> <input
															type="text" maxlength="10" class="form-control" id="mobileno"
															name="mobileNo"
															placeholder="Enter Mobile" value="${userDetails.mobileNo }"/>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="emailId">Email id </label>
														<input type="text" class="form-control" id="emailId"
															name="emailId" onchange="return isSpclCharEmail(this)" onkeyup="removewaring()"
															placeholder="Enter Email id" value="${userDetails.emailId }"/>
															 <span id="client1"></span>
													</div>
												</div>
												
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="Country">Country
															</label> <select class="form-control form-select select2"
															id="departmentid"
															name="country">
															<option disabled selected>Select</option>
															<c:forEach items="${countryList}" var="d">
																<option value='${d.id}' ${userDetails.country eq d.id? 'selected':'' } >${d.countryName}</option>

															</c:forEach>
														</select>

													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="Zone">Zone
															</label> <select class="form-control form-select select2"
															id="zone"
															name="zone">
															<option disabled selected>Select</option>
															<c:forEach items="${zoneList}" var="d">
																<option value='${d.id}' ${userDetails.zone eq d.id? 'selected':'' }>${d.zoneName}</option>

															</c:forEach>
														</select>

													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="Role">Role
															</label> <select class="form-control form-select select2"
															id="role"
															name="role">
															<option disabled selected>Select</option>
															<c:forEach items="${roleList}" var="d">
																<option value='${d.roleId}' ${userDetails.role eq d.roleId? 'selected':'' }>${d.roleName}</option>

															</c:forEach>
														</select>

													</div>
												</div>
													<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="Role">Manager
															</label> <select class="form-control form-select select2"
															id="managerId"
															name="managerId">
															<option disabled selected>Select Manager</option>
															<c:forEach items="${managerList}" var="d">managerId
																<option value='${d.id}' ${userDetails.managerId eq d.id? 'selected':'' }>${d.managerName}</option>

															</c:forEach>
														</select>

													</div>
												</div>
											</div>
											<button type="submit" class="btn btn-primary">Submit</button>

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

	<script type="text/javascript">
		function validateClientDetailsForm1() {
			var clientName = $("#clientName").val();
			var clientNation = $("#clientNation").val();
			var clientLocation = $("#clientLocation").val();
			var clientAddress = $("#clientAddress").val();
			var managername = $("#managername").val();
			var mobileno = $("#mobileno").val();
			var emailId = $("#emailId").val();
			var designation = $("#designation").val();
			var departmentid = $("#departmentid").val();

			if (clientName == null || clientName == "") {
				alert("Inavlid Client Name");
				return false;
			} else if (clientName.length > 50) {
				alert("Max length for Client Name is 50");
				return false;
			} else if (clientNation == null || clientNation == "") {
				alert("Invalid client Nation")
				return false;
			} else if (clientNation.length > 50) {
				alert("Max length for client Nation is 50");
				return false;
			} else if (clientLocation == null || clientLocation == "") {
				alert("Invalid Client Location")
				return false;
			} else if (clientLocation.length > 50) {
				alert("Max length for Client Location is 50");
				return false;
			} else if (clientAddress == null || clientAddress == "") {
				alert("Invalid client Address")
				return false;
			} else if (clientAddress.length > 50) {
				alert("Max length for client Address is 50");
				return false;
			} else if (managername == null || managername == "") {
				alert("Invalid Manager Name")
				return false;
			} else if (managername.length > 50) {
				alert("Max length for Manager Name is 50");
				return false;
			} else if (mobileno == null || mobileno == "") {
				alert("Invalid Mobile No")
				return false;
			} else if (mobileno.length > 10) {
				alert("Max length for MobileNo is 10");
				return false;
			} else if (emailId == null || emailId == "") {
				alert("Invalid EmailId")
				return false;
			} else if (emailId.length > 50) {
				alert("Max length for EmailId is 50");
				return false;

			} else if (designation == null || designation == "") {
				alert("Invalid Designation")
				return false;
			} else if (designation.length > 50) {
				alert("Max length for Designation is 50");
				return false;
			} else if (departmentid == null || departmentid == "") {
				alert("Invalid Department")
				return false;
			}
			return true;
		}
		
		$("#mobileno").on("input", function() {
			var budget = $(this).val();
			if (!/^\d*$/.test(budget)) {
				$(this).val(budget.replace(/[^\d]/g, '')); // Remove non-numeric characters
			}
		});
		
		 function isSpclCharEmail(obj) {
	            var x = obj.value;
	            var atpos = x.indexOf("@");
	            var dotpos = x.lastIndexOf(".");
	            if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
	                document.getElementById("client1").innerHTML = "Please Enter valid email ID";
	                document.getElementById("client1").style.color = "Red";
	                obj.focus();
	                return false;
	            }
	        }
		 
		  /* function removewaring() {
	            document.getElementById("client1").innerHTML = "";
	          //  document.getElementById("client2").innerHTML = "";
	           // document.getElementById("client3").innerHTML = "";
	        } */

	</script>
</body>

</html>