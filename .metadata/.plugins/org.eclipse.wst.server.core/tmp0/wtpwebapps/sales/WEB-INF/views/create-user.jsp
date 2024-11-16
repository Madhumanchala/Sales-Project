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
										<form action="saveUser" onSubmit="return validateUserDetailsForm()"
											 method="post">
											<div class="row">


												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label required" for="name">First Name
														</label> <input type="text" class="form-control" id="firstName"
															name="firstName" onkeyup="removewaring()"
															placeholder="Enter First Name" />
															<span id="firstName-span"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label required"  for="name">Last Name
														</label> <input type="text" class="form-control" id="lastName"
															name="lastName" onkeyup="removewaring()"
															placeholder="Enter Last Name" />
															<span id="lastName-span"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label required" for="mobile">Mobile No</label> <input
															type="text" maxlength="10" class="form-control" id="mobileno"
															name="mobileNo" onkeyup="removewaring()"
															placeholder="Enter Mobile" />
															<span id="mobileno-span"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label required" for="emailId" >Email id </label>
														<input type="text" class="form-control" id="emailId"
															name="emailId" onchange="return isSpclCharEmail(this)" onkeyup="removewaring()"
															placeholder="Enter Email id" />
															<span id="emailId-span"></span>
													</div>
												</div>
												<!-- <div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label required" for="emailId">Password </label>
														<input type="password" class="form-control" id="password" onkeyup="removewaring()"
															name="password"  	placeholder="Enter Password" />
															<span id="password-span"></span>
													</div>
												</div> -->
												
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label required"  for="Country">Country
															</label> <select class="form-control form-select select2"
															id="country"  onkeyup="removewaring()"
															name="country">
															<option>Select </option>
															<c:forEach items="${countryList}" var="d">
																<option value='${d.id}'>${d.countryName}</option>
	
															</c:forEach>
														</select>
														<span id="country-span"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="Zone">Zone
															</label> <select class="form-control form-select select2"
															id="zone"
															name="zone">
															<option disabled selected>Select Zone</option>
															<c:forEach items="${zoneList}" var="d">
																<option value='${d.id}'>${d.zoneName}</option>

															</c:forEach>
														</select>

													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label required" for="Role">Role
															</label> <select class="form-control form-select select2"
															id="role"  onkeyup="removewaring()"
															name="role">
															<option>Select</option>
															<c:forEach items="${roleList}" var="d">
																<option value='${d.roleId}'>${d.roleName}</option>

															</c:forEach>
														</select>
																<span id="role-span"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="Role">Manager
															</label> <select class="form-control form-select select2"
															id="managerId"
															name="managerId">
															<option disabled selected>Select Manager</option>
															<c:forEach items="${managerList}" var="d">
																<option value='${d.id}'>${d.managerName}</option>

															</c:forEach>
														</select>

													</div>
												</div>
											</div>
											<div class="text-end">
											<button  type="submit" class="btn btn-primary">Submit</button>
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

	<script type="text/javascript">
		function validateUserDetailsForm() {
            var country = document.getElementById("country").value;

			var firstName = $("#firstName").val();
			var lastName = $("#lastName").val();
			var mobileno = $("#mobileno").val();
			var emailId = $("#emailId").val();
			var password = $("#password").val();
			//var country = $("#country").val();
			var role = $("#role").val();
	
			if (document.getElementById('firstName').value == "") {
                document.getElementById("firstName-span").innerHTML = "Please Enter FirstName";
                document.getElementById("firstName-span").style.color = "Red";
                return false;
            }
            if (document.getElementById('lastName').value == "") {
                document.getElementById("lastName-span").innerHTML = "Please Enter LastName";
                document.getElementById("lastName-span").style.color = "Red";
                return false;
            }
            
            if (document.getElementById('mobileno').value == "") {
                document.getElementById("mobileno-span").innerHTML = "Please Enter Mobileno";
                document.getElementById("mobileno-span").style.color = "Red";
                return false;
            }
            if (document.getElementById('emailId').value == "") {
                document.getElementById("emailId-span").innerHTML = "Please Enter EmailId";
                document.getElementById("emailId-span").style.color = "Red";
                return false;
            }
            if (document.getElementById('password').value == "") {
                document.getElementById("password-span").innerHTML = "Please Enter Password";
                document.getElementById("password-span").style.color = "Red";
                return false;
            }
            if (document.getElementById('country').value === "Select") {
                document.getElementById("country-span").innerHTML = "Please Select country";
                document.getElementById("country-span").style.color = "Red";
                return false;
            }
            if (document.getElementById('role').value === "Select") {
                document.getElementById("role-span").innerHTML = "Please Select role";
                document.getElementById("role-span").style.color = "Red";
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
		 
		 function removewaring() {
	            document.getElementById("firstName-span").innerHTML = "";
	            document.getElementById("lastName-span").innerHTML = "";
	            document.getElementById("mobileno-span").innerHTML = "";
	            document.getElementById("emailId-span").innerHTML = "";
	            document.getElementById("password-span").innerHTML = "";
	            document.getElementById("country-span").innerHTML = "";
	            document.getElementById("role-span").innerHTML = "";
	        }

	</script>
</body>

</html>