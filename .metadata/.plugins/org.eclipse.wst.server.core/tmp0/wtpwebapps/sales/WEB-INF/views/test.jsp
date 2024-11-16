
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
                                                                  ${user.budget} Lacs
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
                            ${user.budget} Lacs
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
                                                          ${user.budget} Lacs
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
                            ${user.budget} Lacs
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
                            ${user.budget} Lacs
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
                            <div class="col-xl-9 col-lg-6 col-md-12 mb-4">
                                <div class="card h-100">
                                    <div
                                        class="card-header d-flex align-items-center justify-content-between pb-0">
                                        <div class="card-title mb-0">
                                            <h5 class="mb-3">Statistics</h5>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <canvas id="barChart"></canvas>
                                        </div>

                                    </div>
                                </div>
                          
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
                                        return value + ' In Lacs';
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
                            $('#lead-captured-card').text(item.budget  + ' Lacs');
                            break;
                        case "2":
                            $('#in-progress-card').text(item.budget + ' Lacs');
                            break;
                        case "3":
                            $('#proposal-submitted-card').text(item.budget + ' Lacs');
                            break;
                        case "4":
                            $('#won-card').text(item.budget + ' Lacs');
                            break;
                        case "5":
                            $('#lost-card').text(item.budget + ' Lacs');
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

                $('#lead-captured-card').text('0 Lacs');
                $('#in-progress-card').text('0 Lacs');
                $('#proposal-submitted-card').text('0 Lacs');
                $('#won-card').text('0 Lacs');
                $('#lost-card').text('0 Lacs');

                $.each(data, function(i, item) {
                    switch (item.status) {
                        case "1":
                            $('#lead-captured-card').text(item.budget + ' Lacs');
                            break;
                        case "2":
                            $('#in-progress-card').text(item.budget + ' Lacs');
                            break;
                        case "3":
                            $('#proposal-submitted-card').text(item.budget + ' Lacs');
                            break;
                        case "4":
                            $('#won-card').text(item.budget + ' Lacs');
                            break;
                        case "5":
                            $('#lost-card').text(item.budget + ' Lacs');
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
    
</script>

</body>
</html>
