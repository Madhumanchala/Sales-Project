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
										<h5 class="mb-0">My Profile </h5>
									<!-- 	<div class="right-nav ">
											<ul>
												<li><a class="btn btn-secondary add-new btn-primary"
													href="clientList"><i class="bx bx-arrow-back me-1"></i>
														Back </a></li>
											</ul>
										</div> -->
									</div>
									<div class="card-body mt-4">
										<form action="saveClient" 
											onSubmit="return validateClientDetailsForm()" method="post">
											
										
											<div class="row">
												<div class="col-lg-4 col-md-4 col-sm-4">
													<div class="form-group">
														<label class="form-label" for="firstName">First Name : </label> 
														<input type="text" value="${userDetails.firstName}" class="form-control"
															id="firstName" name="firstName" readonly />
															
													</div>
												</div>
												<div class="col-lg-4 col-md-4 col-sm-4">
													<div class="form-group">
														<label class="form-label" for="LastName">Last Name: </label> <input type="text" 
														value="${userDetails.lastName}" class="form-control"
															id="LastName" name="LastName" readonly/>
															
													</div>
												</div>
												<div class="col-lg-4 col-md-4 col-sm-4">
													<div class="form-group">
														<label class="form-label" for="mobileNo">Mobile No </label> 
														<input type="text" class="form-control" value="${userDetails.mobileNo}"
															id="mobileNo" name="mobileNo"  readonly />
													</div>
												</div>
												<div class="col-lg-4 col-md-4 col-sm-4">
													<div class="form-group">
														<label class="form-label" for="emailId">Email id
															 </label> <input type="text" class="form-control" value="${userDetails.emailId}"
															id="emailId" name="emailId"  readonly />
															
													</div>
												</div>
												
												 <div class="col-lg-4 col-md-4 col-sm-4">
													<div class="form-group">
														<label class="form-label" for="emailId">Role
															 </label> <input type="text" class="form-control" value="${userDetails.role}"
															id="emailId" name="emailId"  readonly />
															
													</div>
												</div> 

												<hr>

												 <div class="col-lg-12 col-md-12 col-sm-12">
													<h4>Hierarchy </h4>
												</div>

													<div class="col-lg-4 col-md-4 col-sm-4">
													<div class="form-group">
														<label class="form-label" for="firstName">First Name </label> 
														<input type="text" value="${userDetails.firstName}" class="form-control"
															id="firstName" name="firstName" readonly />
															
													</div>	
												</div>
													<div class="col-lg-4 col-md-4 col-sm-4">
													<div class="form-group">
														<label class="form-label" for="emailId">Manager Name
															 </label> <input type="text" class="form-control" value="${userDetails.zonalHeadName}"
															id="emailId" name="emailId"  readonly />
															
													</div>
												</div>
												
												<div class="col-lg-4 col-md-4 col-sm-4">
													<div class="form-group">
														<label class="form-label" for="emailId">Manager Name
															 </label> <input type="text" class="form-control" value="${userDetails.countryHeadName}"
															id="emailId" name="emailId"  readonly />
															
													</div>
												</div>
												
												
											</div> 
										<!-- 	<button type="submit" class="btn btn-primary">Submit</button> -->

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

	<script src="js/main.js"></script> -->

	
</body>

</html>