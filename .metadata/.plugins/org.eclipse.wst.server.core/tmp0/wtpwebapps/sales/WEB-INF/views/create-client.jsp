<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

<html lang="en" class="light-style  ">

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
										<h5 class="mb-0">Create Client</h5>
										<div class="right-nav ">
											<ul>
												<li><a class="btn btn-secondary add-new btn-primary"
													href="clientList"><i class="bx bx-arrow-back me-1"></i>
														Back </a></li>
											</ul>
										</div>
									</div>
									<div class="card-body mt-4">
										<form action="saveClient" 
											onSubmit="return validateClientDetailsForm()" method="post">
											<div class="row">
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="clientName">Client
															Name </label> <input type="text" class="form-control"
															id="clientName" name="clientName" onkeyup="removewaring()"
															placeholder="Enter Client Name" />
															<span id="clientName-span"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="clientNation">Client
															Nation </label> <input type="text" class="form-control"
															id="clientNation" name="clientNation" onkeyup="removewaring()"
															placeholder="Enter Client Nation" />
															<span id="clientNation-span"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="Client Location">Client
															Location </label> <input type="text" class="form-control"
															id="clientLocation" name="clientLocation" onkeyup="removewaring()"
															placeholder="Enter Client Location" />
															<span id="clientLocation-span"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="clientAddress">Client
															Address </label> <input type="text" class="form-control"
															id="clientAddress" name="clientAddress" onkeyup="removewaring()"
															placeholder="Enter Client Address" />
															<span id="clientAddress-span"></span>
													</div>
												</div>

												<hr>

												<div class="col-lg-12 col-md-12 col-sm-12">
													<h4>Client Manager</h4>
												</div>

												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="name">Manager Name
														</label> <input type="text" class="form-control" id="managername"
															name="clientManagerDetails.managername" onkeyup="removewaring()"
															placeholder="Enter Name" />
															<span id="managername-span"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="mobile">Mobile No</label> <input
															type="text" maxlength="10" class="form-control" id="mobileno"
															name="clientManagerDetails.mobileno"  onkeyup="removewaring()"
															placeholder="Enter Mobile" /> 
															<span id="mobileno-span"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="emailId">Email id </label>
														<input type="text" class="form-control" id="emailId"
															name="clientManagerDetails.emailId" onchange="return isSpclCharEmail(this)" onkeyup="removewaring()"
															placeholder="Enter Email id" />
															 <span id="emailId-span"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="designation">Designation
														</label> <input type="text" class="form-control" id="designation"
															name="clientManagerDetails.designation" onkeyup="removewaring()"
															placeholder="Enter Designation" />
															<span id="designation-span"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="department">Department
															</label> <select class="form-control form-select select2"
															id="departmentid" onkeyup="removewaring()"
															name="clientManagerDetails.departmentid">
															<option disabled selected>Select</option>
															<c:forEach items="${departmentList}" var="d">
																<option value='${d.id}'>${d.departmentName}</option>

															</c:forEach>
														</select>
															<span id="department-span"></span>
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
	<script src="js/bootstrap-datetimepicker.min.js"></script>

	<script src="js/main.js"></script>-->

	<script type="text/javascript">
		function validateClientDetailsForm() {
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
	                document.getElementById("clientName-span").innerHTML = "Please Enter Client Name";
	                document.getElementById("clientName-span").style.color = "Red";
	                return false;
	            }
			 if (clientNation == null || clientNation == "") {
	                document.getElementById("clientNation-span").innerHTML = "Please Enter Client Nation";
	                document.getElementById("clientNation-span").style.color = "Red";
	                return false;
	            }
			 if (clientLocation == null || clientLocation == "") {
	                document.getElementById("clientLocation-span").innerHTML = "Please Enter Client Location";
	                document.getElementById("clientLocation-span").style.color = "Red";
	                return false;
	            }
			 if (clientAddress == null || clientAddress == "") {
	                document.getElementById("clientAddress-span").innerHTML = "Please Enter Client Address";
	                document.getElementById("clientAddress-span").style.color = "Red";
	                return false;
	            }
			 if (managername == null || managername == "") {
	                document.getElementById("managername-span").innerHTML = "Please Enter Manager Name";
	                document.getElementById("managername-span").style.color = "Red";
	                return false;
	            }
			 if (mobileno == null || mobileno == "") {
	                document.getElementById("mobileno-span").innerHTML = "Please Enter Mobile no";
	                document.getElementById("mobileno-span").style.color = "Red";
	                return false;
	            }
			 if (emailId == null || emailId == "") {
	                document.getElementById("emailId-span").innerHTML = "Please Enter Email id";
	                document.getElementById("emailId-span").style.color = "Red";
	                return false;
	            }
			 if (designation == null || designation == "") {
	                document.getElementById("designation-span").innerHTML = "Please Enter Designation";
	                document.getElementById("designation-span").style.color = "Red";
	                return false;
	            }
			 if (departmentid == null || departmentid == "") {
	                document.getElementById("department-span").innerHTML = "Please Select Department ";
	                document.getElementById("department-span").style.color = "Red";
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
	                document.getElementById("emailId-span").innerHTML = "Please Enter valid email ID";
	                document.getElementById("emailId-span").style.color = "Red";
	                obj.focus();
	                return false;
	            }
	        }
		 
		   function removewaring() {
	            document.getElementById("clientName-span").innerHTML = "";
	            document.getElementById("clientNation-span").innerHTML = "";
	            document.getElementById("clientLocation-span").innerHTML = "";
	            document.getElementById("clientAddress-span").innerHTML = "";
	            document.getElementById("managername-span").innerHTML = "";
	            document.getElementById("mobileno-span").innerHTML = "";
	            document.getElementById("emailId-span").innerHTML = "";
	            document.getElementById("designation-span").innerHTML = "";
	            document.getElementById("department-span").innerHTML = "";
	        }

	</script>
</body>

</html>