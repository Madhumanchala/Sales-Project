<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reminder Notifications</title>
    <link rel="stylesheet" href="fonts/boxicons.css" />
    <!-- Core CSS -->
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css" />
    
     <!-- Core JS -->
    <script src="js/jquery.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/chart.js"></script>
    <script src="js/filter-multi-select-bundle.min.js"></script>
    <script src="js/helpers.js"></script>
    <script src="js/perfect-scrollbar.js"></script>
    <script src="js/dataTables.js"></script>
    <script src="js/dataTables.bootstrap5.js"></script>
    <script src="js/moment.min.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>
      <script src="js/menu.js"></script>
  
</head>
<body>
<header id="header" class="header fixed-top">
    <div class="container-fluid d-flex align-items-center justify-content-between">
    <div class="d-flex align-items-center justify-content-between">
     <i class="bx bx-menu mobile-nav-toggle"> </i>
     <sec:authentication var="user" property="principal" />

       <sec:authorize access="hasRole('ADMIN') ">
      <a href="userList" class="logo d-flex align-items-center">
        <img src="img/logo.svg" alt="">
      </a>
       </sec:authorize>
        <sec:authorize access="hasRole('CH') ">
      <a href="dashboard" class="logo d-flex align-items-center">
        <img src="img/logo.svg" alt="">
      </a>
       </sec:authorize>
        <sec:authorize access="not(hasAnyRole('ADMIN', 'CH'))">
      <a href="leadList" class="logo d-flex align-items-center">
        <img src="img/logo.svg" alt="">
      </a>
       </sec:authorize>
       </div>
       
      <nav id="navbar" class="navbar ">
        <ul>
        <sec:authorize access="not(hasAnyRole('BDE', 'ZH'))">

         <li>
         <!-- <a href="userList">Users</a> -->
         <div class="dropdown">
			  <a class="dropdown-toggle hide-arrow" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
			    Operations
			  </a>			
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			    <li>
			    <a class="dropdown-item" href="userList">
                            <span class="align-middle">Users List</span>
                        </a>
                        
			   
			   <a class="dropdown-item" href="zonelist">
                          
                            <span class="align-middle">Zone List</span>
                        </a>
                        
                         <a class="dropdown-item" href="projectlist">
                          
                            <span class="align-middle">Project List</span>
                        </a>
                        
			   </li>
			  </ul>
			</div>
         </li>
        </sec:authorize>
        
        <sec:authorize access="hasRole('CH') ">
         <li  id="targetnavid" class="nav-item " ><a class="nav-link "
           href="set-target">Target <span class="sr-only"></span> </a></li>
           


               </sec:authorize>
        <sec:authorize access="!hasRole('ADMIN') ">

<!--           <li><a href="#">Dashboard</a></li> -->

   <li  id="dashboardNavid" class="nav-item " ><a class="nav-link "
           href="dashboard">Dashboard <span class="sr-only"></span> </a></li>
           
          <li  id="leadsNavid" class="nav-item " ><a class="nav-link "
           href="leadList">Leads <span class="sr-only"></span> </a></li>

            <li  id="clientListNavid" class="nav-item " ><a class="nav-link "
           href="clientList">Client <span class="sr-only"></span> </a></li>

                    <li id="reminderListNavid" class="nav-item "><a
                        class="nav-link " href="reminderList">Reminder  <span
                            class="position-absolute1 ms-1 top-0 start-100 translate-middle1 badge rounded-pill bg-primary">
                                ${todayCount} <span class="visually-hidden">unread
                                    messages</span> <span class="sr-only"></span></a></li>

                    <!--  <li><a href="clientList">Client</a></li>
          <li><a href="reminderList">Reminder</a></li>
 -->
  </sec:authorize>
        </ul>

      </nav><!-- .navbar -->
       					
                        
       <ul class="navbar-nav flex-row align-items-center ">
              <!-- User -->
              
              <li class="nav-item navbar-dropdown dropdown-user dropdown">
                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                
                    <div class="d-flex align-items-center">
                        <div class="flex-shrink-0 me-2">
                            <div class="avatar avatar-online">
                                <img src="img/profile.png" alt class="w-px-40 h-auto rounded-circle" />
                            </div>
                        </div>
                     <div class="flex-grow-1">
    <span class="fw-semibold d-block">
        <sec:authentication var="user" property="principal" />
        <sec:authorize access="isAuthenticated()">
            ${user.firstName} ${user.lastName }
        </sec:authorize>
    </span>
    <c:forEach var="authority" items="${user.authorities}">
        <c:if test="${fn:contains(authority, 'ROLE_CH')}">
            <span class="fw-semibold d-block" style="font-size: x-small;">(Country Head)</span>
        </c:if>
        <c:if test="${fn:contains(authority, 'ROLE_ZH')}">
            <span class="fw-semibold d-block" style="font-size: x-small;">(Zonal Head)</span>
        </c:if>
        <c:if test="${fn:contains(authority, 'ROLE_BDE')}">
            <span class="fw-semibold d-block" style="font-size: x-small;">(BDE)</span>
        </c:if>
         <c:if test="${fn:contains(authority, 'ROLE_ADMIN')}">
            <span class="fw-semibold d-block" style="font-size: x-small;">(Admin)</span>
        </c:if>
    </c:forEach>
</div>

                    </div>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                     <a class="dropdown-item" href="profile">
                            <i class="bx bx-user me-2"></i>
                            <span class="align-middle">Profile </span>
                        </a>
                        
                        <a class="dropdown-item" href="changepassword">
                            <i class="bx bx-lock me-2"></i>
                            <span class="align-middle">Change Password</span>
                        </a>
                        <a class="dropdown-item" href="logout">
                            <i class="bx bx-power-off me-2"></i>
                            <span class="align-middle">Log Out</span>
                        </a>
                        
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</header>

<div id="loader" style="display: none;"><img src="img/loading.gif"></div>

<!-- Modal addClient -->
<div class="modal fade" id="reminderModal" data-bs-backdrop="static"
     data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="addClientmodalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reminderModalLabel">Reminder</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="reminderEditForm">
                    <div class="mb-3">
                        <label for="remainderDate" class="form-label">Reminder Date Time</label>
                        <input type="text" class="form-control" id="remainderDate" name="remainderDate" placeholder="Enter Reminder Date Time" />
                    </div>
                    <div class="mb-3">
                        <label for="remark" class="form-label">Remark</label>
                        	<textarea id="remark" name="remark" maxlength="200" class="form-control"></textarea>
                        <!-- <input type="text" class="form-control" id="remark" name="remark" placeholder="Enter Remark" /> -->
                    </div>
                    <input type="hidden" id="id" name="id" />
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="rescheduleReminder()">Reschedule Reminder</button>
                <button type="button" class="btn btn-warning" onclick="removeReminder()">Close Reminder</button>
            </div>
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
	

 
  
    <script src="js/main.js"></script>

<script>
$(document).ready(function() {
    function fetchTodayReminders() {
        $.ajax({
            url: "todayReminders",
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({}), 
            success: function(response) {
                $('#reminderListNavid .badge').text(response);
            },
            error: function(xhr, status, error) {
                console.error("Failed to fetch reminders count:", error);
            }
        });
    }

    fetchTodayReminders(); 
});
</script>
	
	<script>
	$(document).ready(function() {
	    // Check for Notification API support and request permission
	    if (!("Notification" in window)) {
	        console.log("This browser does not support desktop notification");
	    } else if (Notification.permission === "granted") {
	        console.log("Notification permission granted");
	    } else if (Notification.permission !== "denied") {
        	console.log("Notification permission denied!!!!!!!!!!");

	        Notification.requestPermission().then(function(permission) {
	            if (permission === "granted") {
	                console.log("Notification permission granted");
	            }
	        });
	    }
	    
	    // Function to fetch today's reminders
	    function fetchTodayReminde() {
	        $.ajax({
	            url: "getDueReminders",
	            type: "POST",
	            dataType: "json",
	            contentType: "application/json; charset=utf-8",
	            data: JSON.stringify({}),
	            success: function(response) {
	                console.log(response);
	                if (Array.isArray(response) && response.length > 0) {
	                    var reminderCount = response.length;
	                    console.log("Reminder Count: " + reminderCount);
	
	                    response.forEach(function(reminder) {
	                        var remainderDate = reminder.remainderDate;
	                        var remark = reminder.remark;
	                        console.log("Reminder Date: " + remainderDate);
	                        console.log("Remark: " + remark);
	
	                        displayReminderPopUp(reminder);
	                    });
	                   /*  sessionStorage.setItem('reminderShown', 'true'); */
	                  //  console.log(sessionStorage.getItem('reminderShown'));
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error("Failed to fetch reminders count:", error);
	            }
	        });
	    }
	   // fetchTodayReminde();
	   /*    function fetchRemindersPeriodically() {
	        fetchTodayReminde(); // Fetch initially
	
	        // Fetch reminders every 1 minute
	        setInterval(function() {
	            fetchTodayReminde();
	            console.log('last');
	        }, 30000); 
	    } */
	
	    /*   function startPeriodicReminderFetching() {
	          console.log('::Interval');
	          fetchTodayReminde();
	          setInterval(fetchTodayReminde, 30000); // 2 minutes
	      } */
	
	   
	 // Check if the reminder has already been shown
	  /*   if (!sessionStorage.getItem('reminderShown')) {
	        console.log("Reminder not shown yet, fetching reminders.");
	        fetchTodayReminde();
	    } else {
	        console.log("Reminder already shown");
	         sessionStorage.setItem('reminderShown', 'true'); 
	    } */
	    
	    // Initial fetch and display of reminders
	 //   fetchTodayReminde();

	    // Periodically fetch reminders every 30 seconds
	    
	 /*    function startPeriodicReminderFetching() {
        // Fetch initially after 1 minute
        setTimeout(function() {
            fetchTodayReminders();
            // Fetch reminders every 2 minutes after the initial fetch
            setInterval(fetchTodayReminders, 120000); // 2 minutes
        }, 60000); // 1 minute
    }
 */
	    
	    
	
	    function displayReminderPopUp(reminder) {
	                console.log("Displaying reminder popup.");
	
	        $('#remainderDate').val(reminder.remainderDate);
	        $('#remark').val(reminder.remark);
	        $('#id').val(reminder.id);
	
	        $('#reminderModal').modal('show');
	
	        if (Notification.permission === "granted") {
	        	console.log("Notification permission!!!!!!!!!!");
	            var notificationTitle = "Reminder";
	            var notificationOptions = {
	            	 tag : reminder.id,
	                body: "Reminder for: " + reminder.remark,
	                icon: "img/1.png" // Path to your notification icon
	            };
	
	            var notification = new Notification(notificationTitle, notificationOptions);
	
	            // Handle notification click event
	            notification.onclick = function(event) {
	            	console.log("notification on click.");
	                event.preventDefault(); // Prevent the browser from focusing the Notification's tab
	                $('#remainderDate').val(reminder.remainderDate);
	                $('#remark').val(reminder.remark);
	                $('#id').val(reminder.id);
	                $('#reminderModal').modal('show');
	            };
	        }
	    }
	    
	   // startPeriodicReminderFetching();
fetchTodayReminde();
	   // setInterval(fetchTodayReminde, 60000); // Adjust interval as needed

	    
	    
   window.rescheduleReminder = function() {
    var formData = $("#reminderEditForm").serializeArray();
    console.log('Form Data:', formData);

    var reminderData = {};
    $.each(formData, function(i, v) {
      reminderData[v.name] = v.value;
    });
    console.log('Reminder Data:', reminderData);

    $.ajax({
      url: "update-reminder",
      type: "POST",
      dataType: "json",
      contentType: "application/json; charset=utf-8",
      data: JSON.stringify(reminderData),
      success: function(result) {
    	  $('#reminderModal').modal('hide');
          showNotificationModal('Reminder updated successfully');
       /*  alert('Reminder updated successfully');
        location.reload(); */ 
      },
      error: function(error) {
        console.log('Update Error:', error);
        showNotificationModal('Failed to update the reminder');
      }
    });
  }

    window.removeReminder = function() {
        var formData = $("#reminderEditForm").serializeArray();
        console.log('Form Data:', formData);

        var reminderData = {};
        $.each(formData, function(i, v) {
          reminderData[v.name] = v.value;
        });
        console.log('Reminder Data:', reminderData);

        $.ajax({
          url: "closeReminder",
          type: "POST",
          dataType: "json",
          contentType: "application/json; charset=utf-8",
          data: JSON.stringify(reminderData),
          success: function(result) {
        	  $('#reminderModal').modal('hide');
              showNotificationModal('Reminder closed successfully');
           // location.reload();
          },
          error: function(error) {
            console.log('Close Error:', error);
            showNotificationModal('Failed to close the reminder');

          }
        });
      }
    // Clear session storage item on logout
   /*  $('a[href="logout"]').on('click', function() {
        sessionStorage.removeItem('reminderShown');
        console.log("Session storage item 'reminderShown' removed.");
    }); */
});

	$(function() {
		$('#remainderDate').datetimepicker({
			defaultDate : new Date(),
			format : 'DD/MM/YYYY HH:mm',
				minDate: new Date() 
		});
	});
	
	$(function() {
	    $('#reminderModal').on('shown.bs.modal', function() {
	        $('#reminderModal #remainderDate').datetimepicker({
	            defaultDate : new Date(),
				format : 'DD/MM/YYYY HH:mm',
				minDate: new Date()
	        });
	    });
	});
	 
	
	function showNotificationModal(message) {
	    $('#notificationMessage').text(message);
	    $('#notificationModal').modal('show');
	}
</script>



</body>
</html>

</body>
</html>