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
<link rel="stylesheet" href="css/datatables.bootstrap5.css" />

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
										<h5 class="mb-0">Edit Client</h5>
										<div class="right-nav ">
											<ul>
												<li><a class="btn btn-secondary add-new btn-primary"
													href="clientList"><i class="bx bx-arrow-back me-1"></i>
														Back </a></li>
											</ul>
										</div>
									</div>
									<div class="card-body mt-4">
										<form action="update-Client" 
											 method="post">
											<div class="row">
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
													 <span class="addClient" data-bs-toggle="modal"
															data-bs-target="#addClientManagermodal"> <a
															href="#"> <i class="bx bx-plus"></i> Add Client Manager
														</a>
														</span> 
													<input type="hidden" id="id" name="id"
															value="${clientDetails.id}">
														<label class="form-label" for="clientName">Client
															Name </label> <input type="text" 
															value="${clientDetails.clientName}" class="form-control"
															id="clientName" name="clientName"
															placeholder="Enter Client Name" />
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="clientNation">Client
															Nation </label> <input type="text" 
															value="${clientDetails.clientNation}"class="form-control"
															id="clientNation" name="clientNation"
															placeholder="Enter Client Nation" />
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="Client Location">Client
															Location </label> <input type="text" 
															value="${clientDetails.clientLocation}"class="form-control"
															id="clientLocation" name="clientLocation"
															placeholder="Enter Client Location" />
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="clientAddress">Client
															Address </label> <input type="text"
															value="${clientDetails.clientAddress}"
															class="form-control" id="clientAddress"
															name="clientAddress" placeholder="Enter Client Address" />
													</div>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-primary ">Update
														Client</button>
												</div>


												<hr>

												<!-- Manager Details Table -->
                                                <div class="col-lg-12 col-md-12 col-sm-12 mt-4">
													<h4>Client Managers</h4>
													<div class="table-responsive">
														<div id="no-more-tables">
															<table id="clientList" class="table tablelist leadList"
																style="width: 100%;">
																<thead>
																	<tr>
																		<th>Manager Name</th>
																		<th>Mobile No</th>
																		<th>Email</th>
																		<th>Designation</th>
																		<th>Action</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${managerDetails}" var="manager">
																		<tr>
																			<td data-title="Client Name">${manager.managername}</td>
																			<td data-title="Client Name">${manager.mobileno}</td>
																			<td data-title="Client Name">${manager.emailId}</td>
																			<td data-title="Client Name">${manager.designation}</td>
																			<td data-title="Action">
																<span class="edit" data-bs-toggle="modal" data-bs-target="#editClientManagerModal" data-id="${manager.id}">
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

							<%-- <div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="form-label" for="Client">Client</label> <select
										class="form-control form-select select2 clientDropDown"
										name="clientid" id="clientManagerClient">
										<option disabled selected>Select</option>
										
										<c:forEach items="${ clientList}" var="c">
											<option value='${c.id}'>${c.clientName }</option>
										</c:forEach>
									</select>
									 <input
										type="text" class="form-control" id="clientManagerClient"
										value="${clientDetails.id}"
										name="clientid"  />
								</div>
							</div> --%>
							
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
								<input type="hidden" id="clientid" name="clientid"
															value="${clientDetails.id}">
									<label class="form-label" for="name">Client</label> <input
										type="text" class="form-control" id="managername"
										name="clientid" 
											value="${clientDetails.clientName}"placeholder="Enter Name"  disabled="disabled"/>
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
	
	<!-- Modal editClientManager -->
<div class="modal fade" id="editClientManagerModal"
     data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="editClientManagerModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="editClientManagerDetailsForm">
                <div class="modal-header">
                    <h1 class="modal-title fs-3" id="editClientManagerModalLabel">Edit Client Manager</h1>
                    <button type="button" id="closeEditClientManagerModal"
                            class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden" id="editManagerId" name="id" >
                         <input type="hidden" id="editManagerclientid" name="clientid" >
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="form-group">
                                <label class="form-label" for="editManagerName">Manager Name</label>
                                <input type="text" class="form-control" id="editManagerName" name="managername"
                                       placeholder="Enter Name"/>
                            </div>
                        </div>
                         <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="form-group">
                                <label class="form-label" for="editDepartmentId">Department</label>
                                <select class="form-control form-select select2" id="editDepartmentId" name="departmentid">
                                    <option disabled selected>Select</option>
                                    <c:forEach items="${ departmentList}" var="d">
                                        <option value='${d.id}'>${d.departmentName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="form-group">
                                <label class="form-label" for="editMobileNo">Mobile No</label>
                                <input type="text" class="form-control" id="editMobileNo" name="mobileno" maxlength="10"
                                       placeholder="Enter Mobile"/>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="form-group">
                                <label class="form-label" for="editEmailId">Email id</label>
                                <input type="text" class="form-control" id="editEmailId" name="emailId"
                                       placeholder="Enter Email id"/>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="form-group">
                                <label class="form-label" for="editDesignation">Designation</label>
                                <input type="text" class="form-control" id="editDesignation" name="designation"
                                       placeholder="Enter Designation"/>
                            </div>
                        </div>
                       
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="updateClientManagerDetails()">Update</button>
                </div>
            </form>
        </div>
    </div>
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
	
	<!-- Core JS 
	<script src="js/jquery.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/helpers.js"></script>
	<script src="js/perfect-scrollbar.js"></script>
		<script src="js/dataTables.js"></script>
	<script src="js/dataTables.bootstrap5.js"></script>
	<script src="js/menu.js"></script>
	<script src="js/select2.js"></script>
	<script src="js/moment.min.js"></script>
	<script src="js/bootstrap-datetimepicker.min.js"></script> -->

	<script src="js/main.js"></script>

	<script type="text/javascript">
		function validateClientDetailsForm() {
			var clientName = $("#clientName").val();
			var clientNation = $("#clientNation").val();
			var clientLocation = $("#clientLocation").val();
			var clientAddress = $("#clientAddress").val();
		/* 	var managername = $("#managername").val();
			var mobileno = $("#mobileno").val();
			var emailId = $("#emailId").val();
			var designation = $("#designation").val();
			var departmentid = $("#departmentid").val(); */

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
			}/*  else if (managername == null || managername == "") {
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
			} */
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
		 
		 $(document).ready(function () {
				$('#clientList').dataTable();
			});
		 
		 $(document).ready(function() {
				$("#departmentid").select2({
					dropdownParent : $("#addClientManagermodal")
				});
				$("#clientManagerClient").select2({
					dropdownParent : $("#addClientManagermodal")
				});
			});
		 
		 
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
		 	            location.reload(); 


						// 					  $("#clientManager").append($("<option />").val(result.id).text(result.managername));
						//    	 		       $dropdown.append($("<option />").val(val.id).text(val.managername));
					},
					error : function(err) {
						// check the err for error details
					}
				});
			}
		 
			
			function validateClientManagerDetailsForm() {
				//var clientManagerClient = $("#clientManagerClient").val();
				var managername = $("#managername").val();
				var mobileno = $("#mobileno").val();
				var emailId = $("#emailId").val();
				var designation = $("#designation").val();
				var departmentid = $("#departmentid").val();

				/* if (clientManagerClient == null || clientManagerClient == "") {
					alert("Inavlid Client");
					return false;
				} else  */
				/* if (clientName.length > 50) {
					alert("Max length for Client Name is 50");
					return false;
				}  else */
				if (managername == null || managername == "") {
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
			
			
			
			$(document).on('click', '.edit', function () {
			    var managerId = $(this).data('id');
			    fetchManagerDetails(managerId);
			});

			$("#editDepartmentId").select2({
			    dropdownParent: $("#editClientManagerModal")
			});

			// Function to fetch manager details and populate the modal
			function fetchManagerDetails(managerId) {
			    $.ajax({
			        url: "get-ClientManger", // Update to your correct endpoint
			        type: "POST",
			        dataType: "json",
			        contentType: "application/json",
			        data: JSON.stringify({ "id": managerId }),
			        success: function (data) {
			            console.log('AJAX CALL SUCCESS');
			            if (data.errors.errorCode == "0000") {
			                console.log('AJAX CALL SUCCESS', data);  // Add this line
			                var client = data.data;
			                console.log(client);  // Add this line
							// $("#editManagerclientid").val(client.clientid);
				            $('#editClientManagerModal #editManagerclientid').val(client.clientid);
			                $('#editClientManagerModal #editManagerId').val(client.id);
			                $('#editClientManagerModal #editManagerName').val(client.managername);
			                $('#editClientManagerModal #editMobileNo').val(client.mobileno);
			                $('#editClientManagerModal #editEmailId').val(client.emailId);
			                $('#editClientManagerModal #editDesignation').val(client.designation);
			                $('#editClientManagerModal #editDepartmentId').val(client.departmentid).trigger('change');
			                
			                $('#editClientManagerModal').modal('show');
			            } else {
			                alert('Failed to fetch manager details');
			            } 
			        },
			        error: function (err) {
			            console.log('AJAX CALL FAIL');
			            alert('Failed to fetch manager details.');
			        }
			    });
			}

			
			function updateClientManagerDetails() {
			    var formData = $("#editClientManagerDetailsForm").serializeArray();

			    var reminderObject = {};
			    $.each(formData, function(i, v) {
			        reminderObject[v.name] = v.value;
			    });

			    $.ajax({
			        url: "edit-ClientManager", // Update this to your correct endpoint
			        type: "POST",
			        dataType: "json",
			        contentType: "application/json; charset=utf-8",
			        data: JSON.stringify(reminderObject),
			        success: function (data) {

		            if (data.errors.errorCode == "0000") {
			        	//console.log('AJAX SUCCESS',data);
			        	 $('#editClientManagerModal').modal('hide');

			            showNotificationModal('Client Manager Details Updated Successfully ');

		          // 	 alert('Client Manager Details Updated Successfully ');
			       //     location.reload(); 
		            }else {
		                showNotificationModal('Failed to Update Client Manager Details');

				          // alert('Failed to Update Client Manager Details');
		            }
		       },
		       error: function(error) {
		           console.log(error);
		           alert('Failed to Update ');
		       }
			    });
			}
			
			function showNotificationModal(message) {
			    $('#notificationMessage').text(message);
			    $('#notificationModal').modal('show');
			}
	</script>
</body>

</html>