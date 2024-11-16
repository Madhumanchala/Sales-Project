
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
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
										<h5 class="mb-0">Reminders</h5>

										 <div class="right-nav ">
											<ul>
												<li><a data-bs-toggle="modal"
															data-bs-target="#addClientManagermodal" class="btn btn-secondary add-new btn-primary"
													href="createreminder"><i class="bx bx-plus me-1"></i> Add Personal
														Reminder </a></li>
											</ul>

										</div>  
										
										

									</div>
									 
									<div class="table-responsive1">
									<div id="no-more-tables">
								<table id="reminderList" class="table tablelist leadList" style="width: 100%;" >
											<thead>
												<tr>
													<th>Source </th>
													<th> Lead Name </th>
													<th>Remark </th>
													<th>Reminder Date time</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${reminderList}" var="r">
												<%-- 	<tr onclick="editLead(${r.sourceId})" style="cursor: pointer;"> --%>
														<td data-title="Source">${r.source}</td>
														<td data-title="Lead Name">${r.leadName}</td>
														<td data-title="Remark">${r.remark}</td>
														<td data-title="Reminder Date time">${r.remainderDate}</td>
														<td data-title="Action"><span class="edit"
															data-bs-toggle="modal" data-bs-target="#editRemindermodalLabel"
															data-id="${r.id}"> <a href="#"
																data-bs-toggle="tooltip" data-bs-placement="top"
																title="Edit"> <i class="bx bx-edit-alt me-1"></i>
															</a>
														</span>
														<span class="close"
																data-id="${r.id}"> <a href="#"
																	data-bs-toggle="tooltip" data-bs-placement="top"
																	title="Completed"> <i class="bx bx-check-circle me-1"></i>
																</a>
															</span> 
															<span class="add-one" data-id="${r.id}"
															data-reminder-date="${r.remainderDate}"> <a
																href="#" data-bs-toggle="tooltip"
																data-bs-placement="top" title="Add One Day"> <i
																	class="bx bx-calendar-plus me-1"></i>
															</a>
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
	
	<!-- Modal addClientManagermodal -->
	<div class="modal fade" id="addClientManagermodal"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="addRemindermodalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="reminderDetailsForm">
					<div class="modal-header">
						<h1 class="modal-title fs-3" id="addRemindermodalLabel">Add Personal Reminder</h1>
						<button type="button" id="closeAddClientManagermodal"
							class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="row">


								<div class="col-lg-12 col-md-12 col-sm-12">
									<div class="form-group">
										<label class="form-label" for="remainderDate">Reminder
											Date Time </label> <input type="text" class="form-control"
											id="remainderDate" name="remainderDate"
											placeholder="Enter Remainder" />
									</div>
									<div id="remainderDateError" class="text-danger mt-2"></div>
								</div>

								<div class="col-lg-12 col-md-12 col-sm-12">
									<div class="form-group">
										<label class="form-label" for="Remark">Remark </label> 
											<textarea id="Remark" name="remark"
															maxlength="200" class="form-control"></textarea>
															<div id="RemarkError" class="text-danger mt-2">
									</div>
									
								</div>
								
								<div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label class="form-label" for="beforeReminder">Remind Before </label> <select
                                            class="form-control form-select select2" id="beforeReminder"
                                            name="beforeReminder">
                                            <option selected>Select</option>
                                            <option>5</option>
                                            <option>10</option>
                                            <option>15</option>
                                            <option>30</option>
                                        </select>
                                         <div id="beforeReminderError" class="text-danger mt-2"></div>
                                    </div>
                                   
                                </div>
								

							</div>
					</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary " 
							onclick="saveReminderDetails()">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<!-- Modal editRemindermodalLabel -->
<div class="modal fade" id="editRemindermodalLabel" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="editRemindermodalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="editReminderDetailsForm">
                <div class="modal-header">
                    <h1 class="modal-title fs-3" id="editRemindermodalLabel">Edit Reminder</h1>
                    <button type="button" id="closeEditRemindermodal" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="form-group">
                                <input type="hidden" id="id" name="id">
                                <label class="form-label" for="remainderDate">Reminder Date Time</label>
                                <input type="text" class="form-control" id="remainderDate" name="remainderDate" placeholder="Enter Reminder">
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="form-group">
                                <label class="form-label" for="Remark">Remark</label>
                                	<textarea id="Remark" name="remark"
															maxlength="200" class="form-control"></textarea>
                              <!--   <input type="text" class="form-control" id="Remark" name="remark" maxlength="50" placeholder="Enter Remark"> -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="editReminderDetails()">Submit</button>
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


<script type="text/javascript">

function closeReminders(id) {
    $.ajax({
        url: "/sales/closeReminder", // Adjust the URL to match your controller mapping
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({ "id": id }), // Assuming id is the parameter you want to pass
        success: function(result) {
            showNotificationModal('Closed the reminder');

           // alert('Closed the reminder');
            // location.reload(); // Reload the page to reflect the changes
        },
        error: function(error) {
            console.log(error);
            showNotificationModal('Failed to close the reminder');
        }
    });
}

$(document).on("click", ".close", function(e) {
    e.preventDefault(); // Prevent the default action
    e.stopPropagation(); // Prevent the row click event
    var id = $(this).data("id");
    closeReminders(id);
});



/*  function editLead(id) {
	window.location.href = 'editleads?id=' + id}  */


$(document).ready(function () {
	$('#reminderList').dataTable();
});

 $(document).on("click", ".add-one", function(e) {
	    e.preventDefault(); // Prevent the default action
	    e.stopPropagation(); // Prevent the row click event
	    var id = $(this).data("id");
	    var reminderDate = $(this).data("reminder-date"); // Get the reminder date

	    addOneDay(id, reminderDate);
	});

	function addOneDay(id, reminderDate) {
	    $.ajax({
	        url: "/sales/addOneDay", // Endpoint for adding one day to the reminder
	        type: "POST",
	        contentType: "application/json",
	        data: JSON.stringify({ "id": id, "remainderDate": reminderDate }), // Send reminder ID and date in JSON format
	        success: function(result) {
	              showNotificationModal('Added one day to the reminder');
	           // alert('Added one day to the reminder');
	          //  location.reload(); // Reload the page to reflect the changes
	        },
	        error: function(error) {
	            console.log(error);
	              showNotificationModal('Failed to add one day to the reminder');
	        }
	    });
	}

</script>

<script type="text/javascript">
$(function() {
	$('#remainderDate').datetimepicker({
		defaultDate : new Date(),
		format : 'DD/MM/YYYY HH:mm',
			minDate: new Date() 
	});
});

$(function() {
    // Initialize datetime picker for the add modal
    $('#addClientManagermodal #remainderDate').datetimepicker({
        defaultDate: new Date(),
       format: 'DD/MM/YYYY HH:mm',
       //  format:  'DD/MM/YYYY hh:mm A', 
        minDate: new Date()
    });

    // Reinitialize datetime picker for the edit modal each time it is shown
    $('#editRemindermodalLabel').on('shown.bs.modal', function() {
        $('#editRemindermodalLabel #remainderDate').datetimepicker({
            format: 'DD/MM/YYYY HH:mm',
            minDate: new Date()
        });
    });
});

</script>
 
 
 <script type="text/javascript">
 
 
 function validateReminderDetails() {
		var remainderDate = $("#remainderDate").val();
		var Remark = $("#Remark").val(); 
		var beforeReminder = $("#beforeReminder").val(); 
		var isValid = true;

		$("#remainderDateError").text("");
		$("#RemarkError").text("")
		$("#beforeReminderError").text("")
		if (remainderDate == null || remainderDate == "") {
			$("#remainderDateError").text("Please select Reminder date.");
			isValid = false;
			
		}  else if (Remark == null || Remark == "") {
			$("#RemarkError").text("Please Enter Remark");
			isValid = false;
		} else if (beforeReminder === "Select" || !beforeReminder) {
			$("#beforeReminderError").text("Please select Before option .");
			isValid = false;
		} 
		
		return isValid;
	}
 
	 function saveReminderDetails() {
	    var formData = $("#reminderDetailsForm").serializeArray();

	    if (!validateReminderDetails()) {
	        return;
	    }

	    var loginFormObjectt = {};
	    $.each(formData, function(i, v) {
	        loginFormObjectt[v.name] = v.value;
	    });

	    $.ajax({
	        url: "save-reminder",
	        type: "POST",
	        dataType: "json",
	        contentType: "application/json; charset=utf-8",
	        data: JSON.stringify(loginFormObjectt),
	        success: function(result) {
	        	 $('#addClientManagermodal').modal('hide');
	              showNotificationModal('Reminder Saved successfully');
	            	// alert('Reminder Details Saved');
	 	           // location.reload(); 
	        },
	        error: function(error) {
	            console.log(error);
	            showNotificationModal('Failed to Save the reminder');

	          //  alert('Failed to add one day to the reminder');
	        }
	    });
	}
 
 
 $(document).on('click', '.edit', function (e) {
	    e.preventDefault();
	    e.stopPropagation(); // Prevent the row click event
	    
	    var id = $(this).data('id');
	    fetchReminderDetails(id);
	});

	function fetchReminderDetails(id) {
	    $.ajax({
	        url: "/sales/getReminderById", // Update to your correct endpoint
	        type: "POST",
	        dataType : "json",
	        contentType: "application/json",
	        data: JSON.stringify({ "id": id }),
	        success: function(reminder) {
	            // Populate the modal with fetched dataReminder Details Fe')'Reminder Details Fe'itRemindermodalLabel #id').val(reminder.id);
	           
	            console.log(reminder);
	            console.log(reminder.errors);
	            if(reminder.errors.errorCode=="0000"){
	            	
	            $('#editRemindermodalLabel #id').val(reminder.data.id);
	            $('#editRemindermodalLabel #remainderDate').val(reminder.data.remainderDate);
	            $('#editRemindermodalLabel #Remark').val(reminder.data.remark);
	            
	            // Show the modal
	            $('#editRemindermodalLabel').modal('show');
	            }else {
	            	alert('Failed to fetch reminder details');
	            }
	        },
	        error: function(error) {
	            console.log(error);
	            alert('Failed to fetch reminder details');
	        }
	    });
	}

	
	function editReminderDetails() {
	    var formData = $("#editReminderDetailsForm").serializeArray();

	    var reminderObject = {};
	    $.each(formData, function(i, v) {
	        reminderObject[v.name] = v.value;
	    });

	    $.ajax({
	        url: "update-reminder", // Update this to your correct endpoint
	        type: "POST",
	        dataType: "json",
	        contentType: "application/json; charset=utf-8",
	        data: JSON.stringify(reminderObject),
	        success: function(result) {
	        	
	        	 $('#editRemindermodalLabel').modal('hide');
	              showNotificationModal('Reminder Details Updated successfully');
	              
           	/*  alert('Reminder Details Updated SUccessfully '); location.reload(); 
	         */   
       },
       error: function(error) {
           console.log(error);
           showNotificationModal('Failed to Update the reminder');

          // alert('Failed to Update reminder');
       }
	    });
	}


 </script>
 
  <script>
  
	function showNotificationModal(message) {
	    $('#notificationMessage').text(message);
	    $('#notificationModal').modal('show');
	}
	
  $(document).ready(function(){
       $(".active").removeClass("active");
       $("#reminderListNavid").addClass("active");
    });
  
  
  
  </script>
  
  
  
 </body>

</html>