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
										<h5 class="mb-0">Create Lead</h5>
										<div class="right-nav ">
											<ul>
												<li><a class="btn btn-secondary add-new btn-primary"
													href="leadList"><i class="bx bx-arrow-back me-1"></i>
														Back </a></li>
											</ul>
										</div>
									</div>
									<div class="card-body mt-4">
										<form action="saveLead"
											onSubmit="return validateLeadDetails()" method="post">
											<div class="row">
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="client">Client </label> <span
															class="addClient" data-bs-toggle="modal"
															> <a href="createClient">
																<i class="bx bx-plus"></i> Client
														</a>
														</span> <select
															class="form-control form-select select2 clientDropDown"
															id="client" name="clientId"  onchange="removewaring()" > 
															<option disabled selected>Select</option>

															<c:forEach items="${ clientList}" var="c">
																<option data-assigned-id='${c.assignedId}'  value='${c.id}'>${c.clientName }</option>
															</c:forEach>
														</select>
														<span id="clientName-span"></span>
													</div>
												</div>
												
												
												
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="clientManager">Client
															Manager </label> <span class="addClient" data-bs-toggle="modal"
															data-bs-target="#addClientManagermodal"> <a
															href="#"> <i class="bx bx-plus"></i> Client Manager
														</a>
														</span> <select class="form-control form-select select2"
															id="clientManager" name="clientManagerId" onchange="removewaring()">
															<option disabled selected>Select</option>
														</select>
														<span id="clientManager-span"></span>
													</div>
												</div>
												
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="leadName">Lead
															Name </label> <input type="text" class="form-control"
															id="leadName" name="leadName" onkeyup="removewaring()"
															placeholder="Enter lead Name" />
															<span id="leadName-span"></span>
													</div>
												</div>
												
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="budget">Budget </label> <input
															type="text" class="form-control" id="budget" onkeyup="removewaring()"
															name="budget" placeholder="Enter Budget" />
															<span id="budget-span"></span>
															
													</div>
												</div>
												
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="client">Project-Type </label> 
														 <select
															class="form-control form-select select2 clientDropDown"
															id="projectType" name="projectType" onchange="removewaring()">
															<option disabled selected>Select</option>

															<c:forEach items="${ projectList}" var="p">
																<option value='${p.id}'>${p.projecttype }</option>
															</c:forEach>
														</select>
														<span id="projectType-span"></span>
														
													</div>
												</div>
												
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="budget">Timeline </label> <input
															type="text" class="form-control" id="timeline" onkeyup="removewaring()"
															name="timeline" placeholder="Enter timeline" />
															<span id="timeline-span"></span>
													</div>
												</div>
												
												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="form-group">
														<label class="form-label" for="description" onkeyup="removewaring()" >Description 
														</label>
														<textarea id="description" name="description"
															maxlength="500" class="form-control"></textarea>
															<span id="description-span"></span>
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
														<label class="form-check-label" for="remainderCheckbox">Set
															Reminder</label>
													</div>
												</div>
												
												

												<div id="remainderFields" style="display: none;">
													<div class="col-lg-6 col-md-6 col-sm-6">
														<div class="form-group">
															<label class="form-label" for="remainderDate">Reminder
																Date Time </label> <input type="text" class="form-control" onkeyup="removewaring()"
																id="remainderDate1" name="reminder.remainderDate"
																placeholder="Enter Remainder" />
																<span id="remainderDate1-span"></span>
														</div>
													</div>
													<div class="col-lg-6 col-md-6 col-sm-6">
														<div class="form-group">
															<label class="form-label" for="Remark">Remark </label>
															<textarea id="Remark" name="reminder.remark" onkeyup="removewaring()"
															maxlength="200" class="form-control"></textarea>
															<span id="Remark-span"></span>
														</div>
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


	<!-- <!-- Modal addClient-->
	<div class="modal fade" id="addClientmodal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="addClientmodalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="clientDetailsForm">
					<div class="modal-header">
						<h1 class="modal-title fs-3" id="addClientmodalLabel">Create
							Client</h1>
						<button type="button" id="closeAddClientmodal" class="btn-close"
							data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="form-label" for="clientName">Client Name
									</label> <input type="text" class="form-control" id="clientName"
										name="clientName" placeholder="Enter Client Name" />
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="form-label" for="clientNation">Client
										Nation </label> <input type="text" class="form-control"
										id="clientNation" name="clientNation"
										placeholder="Enter Client Nation" />
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="form-label" for="Client Location">Client
										Location </label> <input type="text" class="form-control"
										id="clientLocation" name="clientLocation"
										placeholder="Enter Client Location" />
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="form-label" for="clientAddress">Client
										Address </label> <input type="text" class="form-control"
										id="clientAddress" name="clientAddress"
										placeholder="Enter Client Address" />
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary "
							onclick="saveClientDetails()">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div> 


	<!-- Modal addClientManagermodal -->
	<div class="modal fade" id="addClientManagermodal"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="addClientManagermodalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="clientManagerDetailsForm">
					<div class="modal-header">
						<h1 class="modal-title fs-3" id="addClientManagermodalLabel">Create
							Client Manager</h1>
						<button type="button" id="closeAddClientManagermodal"
							class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="row">

							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="form-label" for="Client">Client</label> <select
										class="form-control form-select select2 clientDropDown"
										name="clientid" id="clientManagerClient">
										<option disabled selected>Select</option>
										<c:forEach items="${ clientList}" var="c">
											<option value='${c.id}'>${c.clientName }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="form-label" for="name">Manager Name </label> <input
										type="text" class="form-control" id="managername"
										name="managername" placeholder="Enter Name" />
								</div>
							</div>

							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="form-label" for="mobile">Mobile No</label> <input
										type="text" class="form-control" id="mobileno" name="mobileno" maxlength="10"
										placeholder="Enter Mobile" />
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="form-label" for="emailId">Email id </label> <input
										type="text" class="form-control" id="emailId" name="emailId"
										placeholder="Enter Email id" />
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="form-label" for="designation">Designation
									</label> <input type="text" class="form-control" id="designation"
										name="designation" placeholder="Enter Designation" />
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="form-label" for="department">Department
										ID</label> <select class="form-control form-select select2"
										id="departmentid" name="departmentid">
										<option disabled selected>Select</option>
										<c:forEach items="${ departmentList}" var="d">
											<option value='${d.id}'>${d.departmentName}</option>
										</c:forEach>
									</select>

								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary "
							onclick="saveClienManagertDetails()">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>



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
	<script>
		function toggleRemainderFields() {
			var remainderFields = document.getElementById("remainderFields");
			var checkbox = document.getElementById("remainderCheckbox");
			remainderFields.style.display = checkbox.checked ? "block" : "none";
		}
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('.select2').select2();
		});

		$(document).ready(function() {
			$("#departmentid").select2({
				dropdownParent : $("#addClientManagermodal")
			});
			$("#clientManagerClient").select2({
				dropdownParent : $("#addClientManagermodal")
			});
		});

		$(document).ready(function() {
			$("#status").select2({

			});

		});

		//	
		
								$("#remainderCheckboxs").change(function() {
								if (this.checked) {
								$(this).val($('option:selected', $('#client')).attr('data-assigned-id'));
									//Do stuff
									} else {
										$(this).val("");
									}
									alert($(this).val());
									});
		
		
										$('#client').on('change',
										function() {
										$('#remainderCheckboxs').prop('checked', false);
										$('#remainderCheckboxs').val("");
							// 							alert("changed!!"+$('option:selected', $('#client')).attr('data-assigned-id'));
										$.ajax({
										url : "getClientManger",
										type : "POST",
										dataType : "json",
										contentType : "application/json; charset=utf-8",
										data : JSON.stringify({
											clientid : this.value
										}),
										success : function(result) {
											// when call is sucessfull
											console.log(result);

											$("#clientManager").empty();
											$("#clientManager").append(" <option disabled selected> Select </option>");
											var $dropdown = $("#clientManager");
											$.each(result,function(key, val) {
											console.log(key,val.id,val.managername);
											$dropdown.append($("<option />")
											.val(val.id)
											.text(val.managername));
																// 	           alert(key + val);
											});

											if ($(result).length == 0) {
												alert("Please add Client Manager for this Client!");
											}
										},
										error : function(err) {
											// check the err for error details
										}
									});
						});

		$("#budget").on("input", function() {
			var budget = $(this).val();
			if (!/^\d*$/.test(budget)) {
				$(this).val(budget.replace(/[^\d]/g, '')); // Remove non-numeric characters
			}
		});
	</script>
		
		<script>
		function validateLeadDetails() {
			var client = $("#client").val();
			var clientManager = $("#clientManager").val();
			var budget = $("#budget").val();
			var projectType = $("#projectType").val();
			var leadName = $("#leadName").val();
			var description = $("#description").val();
			var remainderDate1 = $("#remainderDate1").val();
			var leadRemark = $("#leadRemark").val();
			var timeline = $("#timeline").val();
			var Remark = $("#Remark").val(); 

			var isReminderSet = $("#remainderCheckbox").is(":checked");

			if (client == null || client == "") {
				  document.getElementById("clientName-span").innerHTML = "Please Select Client ";
	                document.getElementById("clientName-span").style.color = "Red";
				return false;
			} else if (clientManager == null || clientManager == "") {
				  document.getElementById("clientManager-span").innerHTML = "Please Select Client Manager ";
	                document.getElementById("clientManager-span").style.color = "Red";
				return false;
			}
			else if (leadName == null || leadName == "") {
				  document.getElementById("leadName-span").innerHTML = "Please Enter Lead Name";
	                document.getElementById("leadName-span").style.color = "Red";
				return false;
			}else if (budget == null || budget == "") {
				  document.getElementById("budget-span").innerHTML = "Please Enter Budget";
	                document.getElementById("budget-span").style.color = "Red";
				return false;
			} else if (!/^\d+$/.test(budget)) {
				  document.getElementById("budget-span").innerHTML = "Please Enter Budget";
	                document.getElementById("budget-span").style.color = "Red";
				return false;
			} else if (projectType == null || projectType == "") {
				  document.getElementById("projectType-span").innerHTML = "Please Select project type";
	                document.getElementById("projectType-span").style.color = "Red";
				return false;
			} 
			else if (timeline == null || timeline == "") {
				  document.getElementById("timeline-span").innerHTML = "Please Select Timeline";
	                document.getElementById("timeline-span").style.color = "Red";
				return false;
			}
			else if (description == null || description == "") {
				  document.getElementById("description-span").innerHTML = "Please Enter Description";
	                document.getElementById("description-span").style.color = "Red";
				return false;
			} else if (description.length > 500) {
				  document.getElementById("description-span").innerHTML = "Please Enter Description less than 500";
	                document.getElementById("description-span").style.color = "Red";
				return false;
			} else if (isReminderSet && (Remark == null || Remark == "")) {
				  document.getElementById("Remark-span").innerHTML = "Please Enter Remark";
	                document.getElementById("Remark-span").style.color = "Red";
		        return false;
		    } else if (isReminderSet && Remark.length > 200) {
		    	  document.getElementById("Remark-span").innerHTML = "Please Enter Remark less than 200";
	                document.getElementById("Remark-span").style.color = "Red";
		        return false;
		    } 
			return true;
		}

		</script>
		<script>
		function saveClienManagertDetails() {

			var formData = $("#clientManagerDetailsForm").serializeArray();

			if (!validateClientManagerDetailsForm()) {
				return;
			}

			var loginFormObjectt = {};
			$.each(formData, function(i, v) {
				loginFormObjectt[v.name] = v.value;
			});

			console.log(loginFormObjectt);
			$.ajax({
				url : "save-ClientManger",
				type : "POST",
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(loginFormObjectt),
				success : function(result) {
					// when call is sucessfull
					alert("Client Manager Saved!")
					$("#closeAddClientManagermodal").click();
					$("#client").select2().val($("#clientManagerClient").val())
							.trigger("change");
					$("form#clientManagerDetailsForm").trigger("reset");
					$("#clientManagerDetailsForm select").trigger("change");

					// 					  $("#clientManager").append($("<option />").val(result.id).text(result.managername));
					//    	 		       $dropdown.append($("<option />").val(val.id).text(val.managername));
				},
				error : function(err) {
					// check the err for error details
				}
			});
		}

		function saveClientDetails() {

			var formData = $("#clientDetailsForm").serializeArray();

			if (!validateClientDetailsForm()) {
				return;
			}

			var loginFormObject = {};
			$.each(formData, function(i, v) {
				loginFormObject[v.name] = v.value;
			});

			console.log(loginFormObject);
			$.ajax({
				url : "saveClient",
				type : "POST",
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(loginFormObject),
				success : function(result) {
					// when call is sucessfull
					alert("Client Saved!")
					$("#closeAddClientmodal").click();

					$(".clientDropDown").append(
							$("<option />").val(result.id).text(
									result.clientName));

					$("form#clientDetailsForm").trigger("reset");
					// 					$("#clientManagerDetailsForm select").trigger("change");
					// 		       $dropdown.append($("<option />").val(val.id).text(val.managername));
				},
				error : function(err) {
					// check the err for error details
				}
			});
		}
	</script>
	
	<script>
		function validateClientManagerDetailsForm() {
			var clientManagerClient = $("#clientManagerClient").val();
			var managername = $("#managername").val();
			var mobileno = $("#mobileno").val();
			var emailId = $("#emailId").val();
			var designation = $("#designation").val();
			var departmentid = $("#departmentid").val();

			if (clientManagerClient == null || clientManagerClient == "") {
				alert("Inavlid Client");
				return false;
			} else if (clientName.length > 50) {
				alert("Max length for Client Name is 50");
				return false;
			}  else if (managername == null || managername == "") {
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
	
		
		  function removewaring() {
	            document.getElementById("clientName-span").innerHTML = "";
	            document.getElementById("clientManager-span").innerHTML = "";
	            document.getElementById("leadName-span").innerHTML = "";
	            document.getElementById("budget-span").innerHTML = "";
	            document.getElementById("projectType-span").innerHTML = "";
	            document.getElementById("timeline-span").innerHTML = "";
	            document.getElementById("description-span").innerHTML = "";
	            document.getElementById("remainderDate1-span").innerHTML = "";
	            document.getElementById("Remark-span").innerHTML = "";
	        }

	</script>
	
</body>

</html>