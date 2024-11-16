<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
									<div class="card-header d-flex align-items-center justify-content-between mb-0">
										<h5 class="mb-0">Lead List</h5>
										<div class="right-nav ">
											<ul>
												<li><a class="btn btn-secondary add-new btn-primary"
													href="createLeads"> <i class="bx bx-plus me-1"></i>
														Add Lead
												</a></li>
											</ul>
										</div>
									</div>
									<%-- <p>${leads.}</p> --%>
									<div class="table-responsive1">
										<div id="no-more-tables">
											<table id="leadList" class="table tablelist leadList" style="width: 100%;">
												<thead>
													<tr>
													<th>Lead Name</th>
														<th>Client Name</th>
														<th>Project type</th>
<!-- 														<th>Transaction Type</th> -->
														<th>Budget</th>
														<th>Time Line</th>
														<sec:authorize access="hasAnyRole('ZH','CH') and isAuthenticated()">
														<th>Created By/Mapped To</th>
														</sec:authorize>
<!-- 														<th width="16%">Description</th> -->
														<th width="15%">Status</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${leads}" var="lead">
														<tr style="cursor: pointer;">
														<td data-title="Lead Name">${lead.leadName}</td>
														<td data-title="Client Name">${lead.clientName}</td>
															<td data-title="Project type">${lead.projectType}</td>
															<td data-title="Budget">${lead.budget}</td>
<%-- 															<td data-title="Description">${lead.description}</td> --%>
															<td data-title="timeline">${lead.timeline}</td>
															<sec:authorize access="hasAnyRole('ZH','CH') and isAuthenticated()">
															<td data-title="Assigned To"> ${lead.assignedUserName}/${lead.assignedUserName}</td>
															</sec:authorize>
															<td data-title="Status"><span class="status ${fn:toLowerCase(fn:replace(lead.status,' ', ''))}"> ${lead.status}</span></td>
															<td data-title="Action">
																<span class="edit" data-bs-toggle="modal" data-bs-target="#editmodal" data-id="${lead.id}">
																	<a href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"> <i class="bx bx-edit-alt me-1"></i>  </a>
																</span>
															<%-- 	<span class="add" data-bs-toggle="modal" data-bs-target="#addClientManagermodal" data-id="${lead.id}">
																	<a href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Add-Reminder"> <i class="bx bx-plus-circle"></i> </a>
																</span> --%>
																<span class="edits"
															data-bs-toggle="modal" data-bs-target="#editRemindermodalLabel"
															data-id="${lead.id}"> <a href="#"
																data-bs-toggle="tooltip" data-bs-placement="top"
																title="Edits"> <i class="bx bx-edit me-1"></i> </i>
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
                    <h1 class="modal-title fs-3" id="editRemindermodalLabel"> Reminder</h1>
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
	

	<script>
		$(document).ready(function () {
			$('#leadList').dataTable();
		});

		$(function () {
			$('#remainderDate').datetimepicker();
		});

		// Use event delegation to handle the edit button click
		$(document).on('click', '.edit', function (e) {
			e.stopPropagation(); // Prevent the row click event
			var leadId = $(this).data('id');
			editLead(leadId);
		});

		function editLead(id) {
			window.location.href = 'editleads?id=' + id;
		}
	</script>
	
	 <script>
   $(document).ready(function(){
       $(".active").removeClass("active");
       $("#leadsNavid").addClass("active");
    });
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
});


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
        	 $('#notificationModal').modal('hide');
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


function showNotificationModal(message) {
    $('#notificationMessage').text(message);
    $('#notificationModal').modal('show');
}

$(document).on('click', '.edits', function (e) {
    e.preventDefault();
    e.stopPropagation(); // Prevent the row click event
    
    var id = $(this).data('id');
    fetchReminderDetails(id);
});

function fetchReminderDetails(id) {
    $.ajax({
        url: "/sales/getleadReminderById", // Update to your correct endpoint
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
        url: "/sales/updateleadreminderbyid", // Update this to your correct endpoint
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(reminderObject),
        success: function(result) {
       	 $('#editRemindermodalLabel').modal('hide');
         showNotificationModal('Reminder Details Updated successfully');
       	 //alert('Reminder Details Updated Successfully ');
           // location.reload(); 
   },
   error: function(error) {
       console.log(error);
       showNotificationModal('Failed to Update the reminder');

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
   
    // Reinitialize datetime picker for the edit modal each time it is shown
    $('#editRemindermodalLabel').on('shown.bs.modal', function() {
        $('#editRemindermodalLabel #remainderDate').datetimepicker({
            format: 'DD/MM/YYYY HH:mm',
            minDate: new Date()
        });
    });
});

</script>


</body>
</html>
