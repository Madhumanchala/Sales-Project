<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en" class="light-style">

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
    <!-- ======= Header ======= -->
    <%@include file="header.jsp"%>
    <!-- End Header -->

    <!-- Layout wrapper -->
    <div class="layout-wrapper">
        <div class="layout-container">
            <!-- Layout container -->
            <div class="layout-page">
                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->
                    <div class="container-xxll flex-grow-1 container-p-y dashboard ">
                        <div class="col-xxl dashboard-header">
                            <div class="card mb-4">
                                <div
                                    class="card-header d-flex align-items-center justify-content-between mb-0">
                                    <h5 class="mb-0">Dashboard</h5>
                                </div>
                                <div class="card-body mt-2">
                                    <div class="row">

                                        <div class="col-lg-3 col-md-6">
                                            <div class="form-group mb-0">
                                                <label class="form-label" for="financialFilter">Financial
                                                    Year</label> <select multiple name="financialFilter"
                                                    id="financialFilter" class="form-control form-select  select2-multiple "
                                                    onchange="getSelectedOptions(this,'financialFilter')">
                                                    	<c:forEach items="${managerList}" var="d">
															<option data-id="${d.financialyear}" value="${d.financialyear}"
                  										   <c:if test="${d.financialyear == currentYear}">
                      									selected
                  										 </c:if> 
               											 >
              									      ${d.financialyear}
														</option>
																</c:forEach>
                                                   <!--   <option value="2023-24">2023-24</option> -->
                                                </select> <input type="hidden" id="financialFilterAppend">
                                            </div>
                                        </div>
                                        
                                          <div class="col-lg-3 col-md-6">
                                            <div class="form-group mb-0">
                                                <label class="form-label" for="financialFilter1">Country</label> 
                                                <select multiple name="financialFilter1"
                                                    id="financialFilter1" class="form-control form-select  select2-multiple " >
                                                     <option value="INDIA" selected>India</option> 
           														 <option value="USA">USA</option> 
                                                </select> <input type="hidden" id="financialFilterAppend1">
                                            </div>
                                        </div> 
                                        
                                        <div class="col-lg-3 col-md-6">
                                            <div class="form-group mb-0">
                                                <label class="form-label" for="zoneFilter">Zone</label>
                                                <select
                                                    id="zoneFilter" class="form-select form-control select2-multiple " multiple name="zoneFilter"
                                                    onchange="getSelectedOptions(this,'zoneFilter')">
																<c:forEach items="${managerList}" var="manager">
														<c:choose>
															<c:when
																test="${(manager.role == 'ZH' || manager.role == 'BDE')}">
																<c:if test="${manager.id == userlogid}">
																	<c:forEach items="${zoneList}" var="d">
																		<c:set var="isSelected" value="false" />
																		<c:if test="${manager.zone == d.id}">
																			<option data-id='${d.id}' value='${d.zoneName}'>${d.zoneName}</option>
																		</c:if>
																	</c:forEach>
																</c:if>
															</c:when>
															
															<c:when
																test="${(manager.role == 'CH')}">
																<c:if test="${manager.id == userlogid}">
																	<c:forEach items="${zoneList}" var="d">
																		<c:set var="isSelected" value="false" />
																		
																			<option data-id='${d.id}' value='${d.zoneName}'>${d.zoneName} </option>
																	
																	</c:forEach>
																</c:if>
															</c:when>
															
															<c:otherwise>
																<script> console.log(other wise condition);</script>
																<option data-id='${d.id}' value='${d.zoneName}'>${d.zoneName}</option>
															</c:otherwise>
														</c:choose>

													</c:forEach>
                                                </select> <input type="hidden" id="zoneFilterAppend">
                                            </div>
                                        </div>

                                        <div class="col-lg-3 col-md-6">
                                            <div class="form-group mb-0">
                                                <label class="form-label" for="bdeFilter">BDE</label> <select
                                                    multiple name="bdeFilter" class="form-select form-control select2-multiple" id="bdeFilter"
                                                    onchange="getSelectedOptions(this,'bdeFilter')">
                                                  <option disabled >Select</option>
                                                </select> <input type="hidden" id="bdeFilterAppend">
                                            </div>
                                        </div>
                                        
                                        
                                        
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row row-cols-1 row-cols-lg-5 row-cols-md-3 g-4 mb-4">
                            <div class="col">
                                <div class="card h-100">
                                    <a href="#">
                                        <div class="card-body d-flex">
                                            <div class="icon leadCaptured">
                                                <img src="img/leadCaptured.svg">
                                            </div>
                                            <div class="">
                                                <span class="fw-semibold d-block text-muted mb-1">Lead
                                                    Captured</span>
                                                <h4 class="card-title fw-bold mb-0" id="lead-captured-card">
                                                    <c:forEach var="user" items="${users}">
                                                        <c:if test="${user.status == 1}">
                                                                  ${user.budget} 
                                                            </c:if>
                                                    </c:forEach>
                                                </h4>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card h-100">
                                    <a href="#">
                                        <div class="card-body d-flex">
                                            <div class="icon inProgress">
                                                <img src="img/in-progress.svg">
                                            </div>
                                            <div class="">
                                                <span class="fw-semibold d-block text-muted mb-1">In
                                                    Progress</span>
                                                <h4 class="card-title fw-bold mb-0" id="in-progress-card">
                                                    <c:forEach var="user" items="${users}">
                                                        <c:if test="${user.status == 2}">
                            ${user.budget} 
                        </c:if>
                                                    </c:forEach>
                                                </h4>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card h-100">
                                    <a href="#">
                                        <div class="card-body d-flex">
                                            <div class="icon proposalSubmitted">
                                                <img src="img/proposal.svg">
                                            </div>
                                            <div class="">
                                                <span class="fw-semibold d-block text-muted mb-1">Proposal Submitted</span>
                                                <h4 class="card-title fw-bold mb-0"
                                                    id="proposal-submitted-card">
                                                    <c:forEach var="user" items="${users}">
                                                        <c:if test="${user.status == 3}">
                                                          ${user.budget} 
                                                          </c:if>
                                                    </c:forEach>
                                                </h4>
                                            </div>
                                        </div>
                                    </a>
                                </div>

                            </div>


                            <div class="col">
                                <div class="card h-100">
                                    <a href="#">
                                        <div class="card-body d-flex">
                                            <div class="icon won">
                                                <img src="img/won.svg">
                                            </div>
                                            <div class="">
                                                <span class="fw-semibold d-block text-muted mb-1">Won</span>
                                                <h4 class="card-title fw-bold mb-0" id="won-card">
                                                    <c:forEach var="user" items="${users}">
                                                        <c:if test="${user.status == 4}">
                            							${user.budget} 
                       								 </c:if>
                                                    </c:forEach>
                                                </h4>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card h-100">
                                    <a href="#">
                                        <div class="card-body d-flex">
                                            <div class="icon lost">
                                                <img src="img/lost.svg">
                                            </div>
                                            <div class="">
                                                <span class="fw-semibold d-block text-muted mb-1">Lost</span>
                                                <h4 class="card-title fw-bold mb-0" id="lost-card">
                                                    <c:forEach var="user" items="${users}">
                                                        <c:if test="${user.status == 5}">
                            ${user.budget} 
                        </c:if>
                                                    </c:forEach>
                                                </h4>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-9 col-lg-12 col-md-12 mb-4">
                                <div class="card h-100">
                                    <div
                                        class="card-header d-flex align-items-center justify-content-between pb-0">
                                        <div class="card-title mb-0">
                                            <h5 class="mb-3">Statistics</h5>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chartBar1 mb-3">
                                            <canvas id="barChart"  style="width: 100%;"></canvas>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- / Content -->

                    <!-- Footer -->
                   	<%@include file="footer.jsp"%>
                    <!-- / Footer -->
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>
    </div>
    <!-- / Layout wrapper -->

<!-- Core JS -->

<!-- 
<script src="js/jquery.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/helpers.js"></script>
<script src="js/perfect-scrollbar.js"></script>
<script src="js/menu.js"></script> -->
<script src="js/chart.js"></script>
<!-- <script src="js/filter-multi-select-bundle.min.js"></script> -->
<script src="js/select2.js"></script>
<script src="js/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript">
        $(document).ready(function() {
            $('.select2-multiple').select2({
                placeholder: "Please select"
            });
        });
    </script>
    <script>
    var year = [];
    var zone = [];
    var bde = [];
    var barChart = null;

    function updateChartAndCards() {
        // Fetch chart data
        $.ajax({
            url: 'getChartData',
            type: 'GET',
            dataType: 'json',
            data: {
                "year": year,
                "zone": zone,
                "bde": bde
            },
            success: function(data) {
                console.log('Received chart data:', data);

                // Initialize the chart
                var ctx = document.getElementById('barChart').getContext('2d');

                // Destroy existing chart instance if it exists
                if (barChart !== null) {
                    barChart.destroy();
                }

                barChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: data.labels,
                        datasets: [{
                            label: 'Won',
                            data: data.wonData,  // Data for Won
                            backgroundColor: 'rgba(255, 205, 86, 0.8)',
                            borderColor: 'rgba(255, 205, 86, 1)',
                            borderWidth: 0.5
                        }, {
                            label: 'Target',
                            data: data.targetData,  // Data for Target
                            backgroundColor: 'rgba(75, 192, 192, 0.8)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 0.5
                        }, {
                            label: 'Lost',
                            data: data.lostData,  // Data for Lost
                            backgroundColor: 'rgba(255, 99, 132, 0.8)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 0.5
                        }]
                    },
                    options: {
                        maintainAspectRatio: false,
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    callback: function(value, index, values) {
                                        // Custom labels
                                        return value + '  ';
                                    }
                                }
                            }
                        }
                    }
                });

                // Update dashboard cards
                $.each(data.dashboardStatusBudget, function(i, item) {
                    switch (item.status) {
                        case "1":
                            $('#lead-captured-card').text(item.budget  + ' ');
                            break;
                        case "2":
                            $('#in-progress-card').text(item.budget + ' ');
                            break;
                        case "3":
                            $('#proposal-submitted-card').text(item.budget + ' ');
                            break;
                        case "4":
                            $('#won-card').text(item.budget + ' ');
                            break;
                        case "5":
                            $('#lost-card').text(item.budget + ' ');
                            break;
                        default:
                            break;
                    }
                });
            },
            error: function(xhr, status, error) {
                console.error('Error fetching chart data:', error);
            }
        });

        // Fetch and update other relevant data
        $.ajax({
            type: 'GET',
            url: '/sales/yearBudgets',
            dataType: 'json',
            data: {
                "year": year,
                "zone": zone,
                "bde": bde
            },
            success: function(data) {
                console.log('Received budget data:', data);

                $('#lead-captured-card').text('0 ');
                $('#in-progress-card').text('0 ');
                $('#proposal-submitted-card').text('0 ');
                $('#won-card').text('0 ');
                $('#lost-card').text('0 ');

                $.each(data, function(i, item) {
                    switch (item.status) {
                        case "1":
                            $('#lead-captured-card').text(item.budget + ' ');
                            break;
                        case "2":
                            $('#in-progress-card').text(item.budget + ' ');
                            break;
                        case "3":
                            $('#proposal-submitted-card').text(item.budget + ' ');
                            break;
                        case "4":
                            $('#won-card').text(item.budget + ' ');
                            break;
                        case "5":
                            $('#lost-card').text(item.budget + ' ');
                            break;
                        default:
                            break;
                    }
                });
            },
            error: function(xhr, status, error) {
            //    console.error('Error fetching budget data:', error);
            }
        });
    }

    function getSelectedOptions(select, flag) {
        var values = $(select).val();

        if (flag === "financialFilter") {
            year = values;
            $("#financialFilterAppend").val(values);
        } else if (flag === "zoneFilter") {
            zone = values;
            $("#zoneFilterAppend").val(values);
        } else if (flag === "bdeFilter") {
            bde = values;
            $("#bdeFilterAppend").val(values);
        }

        // Update the chart and cards
        updateChartAndCards();
    }

    // Run on page load
    $(window).on('load', function() {
        // Initialize chart and cards with default values or initial filters
        updateChartAndCards();
    });
    
    
    $('#zoneFilter').change(function () {
    	  var selectedOptions = $(this).find(':selected');
    	    var selectedZones = selectedOptions.map(function() {
    	        return $(this).data('id');
    	    }).get(); // Get an array of selected zone IDs

    	    // Log selected zones for debugging
    	    console.log('Selected Zones:', selectedZones);
            var userlogid =  ${userlogid}


        $.ajax({
            type: 'POST',
            url: 'getAllbyzone', // Adjust URL as per your application setup
            contentType: 'application/json',
            data: JSON.stringify({ zones: selectedZones }), // Send zones array
            success: function (response) {
                // Assuming response contains BDEs in JSON format
                var bdeFilter = $('#bdeFilter');
                bdeFilter.empty();

                console.log('userlogid ss :', userlogid);

             // Flag to check if user BDE is appended
                var userBDEAppended = false;
             
                // Iterate through each BDE object in the response
                $.each(response, function (index, bde) {
                    if (bde.role === "BDE" && bde.id === userlogid) {
                        bdeFilter.append('<option value="' + bde.firstName + '">' + bde.firstName + ' ' + bde.lastName + '</option>');
                        userBDEAppended = true; // Mark that the user's BDE has been appended
                    }
                });
                
                if (!userBDEAppended) {
                    $.each(response, function (index, bde) {
                        bdeFilter.append('<option value="' + bde.firstName + '">' + bde.firstName + ' ' + bde.lastName + '</option>');
                    });
                }
                
            },
            error: function (xhr, status, error) {
                console.error('Error fetching BDEs:', error);
                // Handle error
            }
        });
    });
				
    $(document).ready(function() {
        // Trigger the onchange event manually if there are pre-selected options
        var $financialFilter = $('#financialFilter');
        if ($financialFilter.length && $financialFilter.find('option:selected').length > 0) {
            $financialFilter.trigger('change');
        }
    });

</script>

</body>
</html>
