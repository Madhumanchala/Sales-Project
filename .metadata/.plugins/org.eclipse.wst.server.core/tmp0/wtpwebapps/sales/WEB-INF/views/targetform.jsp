<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>

<html lang="en" class="light-style ">

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
	<div id="loader">
		<img src="img/loading.gif">
	</div>
	<!--======= Header ======= -->
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
					<div class="container-xxl flex-grow-1 container-p-y target">
						<div class="row">
							<!-- Basic Layout -->
							<form id="targetDetailsForm" name="targetDetailsForm"
											method="post">
							<div class="col-xxl-12">
								<div class="card mb-4">
									<div
										class="card-header d-flex align-items-center justify-content-between mb-0">
										<h5 class="mb-0">Annual Country Target</h5>

									</div>
									<div class="card-body mt-4">
										
											<div class="row">
												<div class="col-lg-3 col-md-6 col-sm-6">
													<div class="form-group">
														<label class="form-label" for="financialYear">Financial Year </label> 
														<select class="form-control form-select select2"
															name="financialYear" id="financialYear">
															<option selected>Select</option>
															<option>2024-25</option>
															<option>2025-26</option>
														</select>
													</div>
												</div>
												<div class="col-lg-3 col-md-6 col-sm-6">
													<div class="form-group">
														<%--  <input type="hidden" id="otpId" name="totalTargetId"
															value="${userId}"> --%>
														<label class="form-label" for="totaltarget">Total
															Target </label>
														<div class="input-group">
															<span class="input-group-text"><i
																class="fa fa-rupee"></i></span> <input type="number"
																class="form-control" id="totaltarget"
																name="totalTargetValue" placeholder="Amount"
																oninput="displayValueInWords(this)" />
														</div>
														<div id="valueInWords" class="valueWords"></div>
														<!--  <span id="remainingTotalTarget">Remaining Total Target: 0</span> -->

													</div>

												</div>

												<div class="col-lg-3 col-md-6 col-sm-6">
													<button type="button" id="setTargetButton"
														class="btn btn-primary mt-4">Set</button>

												</div>

											</div>

										
									</div>
								</div>
							</div>


							<div class="col-xxl-12">
								 
									<div class="card mb-4" id="zoneTargets" style="display: none;">
										<div
											class="card-header d-flex align-items-center justify-content-between mb-0">
											<h5 class="mb-0">
												Total Target: <span class="bg-target" id="totalTargetValue">0</span>
											</h5>
											<div class="d-flex totalAssigned">
												<h5 class="mb-0">
													Assigned Target <span class="bg-target"
														id="assignedTargetValue"><i class="fa fa-rupee"></i>
														0</span>
												</h5>
												<h5 class="mb-0">
													Unassigned Target <span class="bg-target"
														id="unassignedTargetValue"><i class="fa fa-rupee"></i>
														0</span>
												</h5>
											</div>

										</div>
										<div class="card-body mt-4">

											<div class="zoneTargets1">
												<div class="row">

													<div class="col-md-3 col-sm-4">
														<div class="form-group">
															<input type="hidden" id="otpId" name="countryHeadId"
																value="${userId}"> <label class="form-label"
																for="countryHead">My Target </label>
															<div class="input-group">
																<span class="input-group-text"><i
																	class="fa fa-rupee"></i></span> <input type="number"
																	class="form-control" id="countryHeadValue"
																	name="countryHeadValue" placeholder="Amount"
																	oninput="displayValueInWords(this)" />
															</div>
															<div id="valueInWords1" class="valueWords"></div>

															<!--  <span id="remainingCountryHeadTarget">Remaining My Target: 0</span>  -->

														</div>
													</div>

													<c:forEach var="zoneList" items="${zoneList}">
														<input type="hidden" id="zonesId" name="ZoneTargetId"
															value="${zoneList.id}">
														<c:set var="zhExists" value="false" />
														<c:forEach var="item" items="${countryHead}">
															<c:if
																test="${item.zone == zoneList.id && item.role == 'ZH'}">
																<c:set var="zhExists" value="true" />
															</c:if>
														</c:forEach>
														<c:set var="bdeExists" value="false" />
														<c:forEach var="item" items="${countryHead}">
															<c:if
																test="${item.zone == zoneList.id && item.role == 'BDE'}">
																<c:set var="bdeExists" value="true" />
															</c:if>
														</c:forEach>
														<div class="col-md-3 col-sm-6">
															<div class="form-group">
																<label class="form-label" for="${item.zone}ZoneTarget">${zoneList.zoneName}
																</label>
																<div class="input-group">
																		<span class="input-group-text"><i
																		class="fa fa-rupee"></i></span> <input type="number"
																		class="form-control"
																		id="ZoneTargetValue_${zoneList.id}"
																		name="ZoneTargetValue" placeholder="Amount"
																		oninput="displayValueInWords(this)"
																		onchange="checkForZHAndBDE('${zone.id}', '${zoneList.zoneName}','${zhExists}','${ bdeExists}')"
																		onclick="checkForZHAndBDE('${zone.id}', '${zoneList.zoneName}','${zhExists}','${ bdeExists}')" 
																		/>

																</div>
																<div id="valueInWords2_${zoneList.id}"
																	class="valueWords"></div>
																


															</div>

														</div>
													</c:forEach>

													<div class="col-sm-12 d-flex justify-content-center">
														<button type="button" id="setIndividualTargetButton"
															class="btn btn-primary mt-4">Set Individual
															Target</button>

													</div>
												</div>
											</div>

										</div>
									</div>


									<div class="row">
										<div class="col-md-12 col-sm-12 p-2 ">

											<%-- <p>${countryHead}</p>
 --%>
											<div id="zoneHeadTargets" style="display: none;">
												<div class="accordion" id="accordionExample">
													<c:forEach var="zone" items="${zoneList}">

														<div class="card accordion-item">
															<h2 class="accordion-header" id="heading_${zone.id}">
																<button id="" class="accordion-button collapsed"
																	type="button" data-bs-toggle="collapse"
																	data-bs-target="#collapse_${zone.id}"
																	aria-expanded="false"
																	aria-controls="collapse_${zone.id}"
																	<c:if test="${!zhExists && !bdeExists}"></c:if>>

																	${zone.zoneName} <span class="bg-target"
																		id="remainingTarget${zone.id}"><i
																		class="fa fa-rupee"></i> 0</span>
																</button>
															</h2>
															<div id="collapse_${zone.id}"
																class="accordion-collapse collapse"
																aria-labelledby="heading_${zone.id}"
																data-bs-parent="#accordionExample">
																<div class="accordion-body">
																	<div class="row">
																		<!-- Zonal Head Section -->
																		<c:set var="zhExists" value="false" />
																		<c:forEach var="item" items="${countryHead}">
																			<c:if
																				test="${item.zone == zone.id && item.role == 'ZH'}">
																				<c:set var="zhExists" value="true" />
																				<input type="hidden" id="zonesId"
																					name="zonalHeadId_${zone.id}" value="${item.id}">
																				<label class="form-label" for="zonalHead">${item.firstName}
																					<small>(Zonal Head)</small>
																				</label>
																			</c:if>
																		</c:forEach>
																		<c:if test="${zhExists}">
																			<div class="col-md-3 col-sm-4">
																				<div class="form-group">
																					<div class="input-group">
																						<span class="input-group-text"><i
																							class="fa fa-rupee"></i></span> <input type="number"
																							class="form-control"
																							id="zonalHeadValue_${zone.id}"
																							name="zonalHeadValue_${zone.id}"
																							placeholder="Amount"
																							oninput="displayValueInWords(this)" />
																					</div>
																					<div id="valueInWordsZonalHead_${zone.id}"
																						class="valueWords"></div>
																					<!-- Add this -->

																				</div>
																			</div>
																		</c:if>
																	</div>

																	<div class="row">
																		<!-- BDE Section -->
																		<c:set var="bdeExists" value="false" />
																		<c:forEach var="item" items="${countryHead}">
																			<c:if
																				test="${item.zone == zone.id && item.role == 'BDE'}">
																				<c:set var="bdeExists" value="true" />
																			</c:if>
																		</c:forEach>

																		<c:if test="${bdeExists}">
																			<c:forEach var="item" items="${countryHead}">
																				<c:if
																					test="${item.zone == zone.id && item.role == 'BDE'}">
																					<div class="col-md-3 col-sm-4">
																						<div class="form-group">
																							<input type="hidden" id="zonesId_${zone.id}"
																								name="bdeId_${zone.id}" value="${item.id}">
																							<label class="form-label"
																								for="bdeName_${zone.id}_${item.id}">${item.firstName}
																								<small> (BDE)</small>
																							</label>
																							<div class="input-group">
																								<span class="input-group-text"><i
																									class="fa fa-rupee"></i></span> <input type="number"
																									class="form-control"
																									id="bdeValue_${zone.id}_${item.id}"
																									name="bdeValue_${zone.id}_${item.id}"
																									placeholder="Amount"
																									oninput="displayValueInWords(this)" />
																							</div>
																							<div id="valueInWordsBDE_${zone.id}_${item.id}"
																								style="margin-top: 10px;"></div>
																							<!-- Add this -->

																						</div>
																					</div>
																				</c:if>
																			</c:forEach>
																		</c:if>
																		<%-- <!-- Alert if no ZH and BDE -->
																		<c:if test="${!zhExists && !bdeExists}">
																			<script>
																			console.log("shahhaahhah  ",${zhExists});
																			console.log("shahhaahhah bde  ",${bdeExists});
            alert("For zone '${zone.zoneName}', no Zonal Head and BDE found.");
        </script>
																		</c:if> --%>
																	</div>
																</div>

															</div>
														</div>
													</c:forEach>
												</div>
												<div class="zoneTargets">
													<div class="row">
														<div class="text-center">
															<button type="button" onclick="saveTargetDetails()"
																class="btn btn-primary">Submit</button>

														</div>
														<!-- 												<button type="button" onclick="saveTargetDetails()" class="btn btn-primary float-end">Submit</button>
 -->
													</div>
												</div>

											</div>
										</div>
									</div>
								
							</div>
							</form>






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
		
		<!-- Notification Modal -->
	<div class="modal fade" id="notificationModal" tabindex="-6"
		aria-labelledby="notificationModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="max-width: 320px;">
			<div class="modal-content text-center">
				<div class="modal-header justify-content-center">
					<h5 class="modal-title" id="notificationModalLabel">Notification</h5>

				</div>
				<div class="modal-body">
					<p id="notificationMessage"></p>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-primary"
						onClick="window.location.reload();">OK</button>
				</div>
			</div>
		</div>
	</div>

		<script type="text/javascript">
		$(document).ready(function() {
			$('.select2').select2();
		});
	</script>

		<script>
    function checkForZHAndBDE(zoneId, zoneName,zhExists,bdeExists) {
    	var zh=zhExists;
    	var bde=bdeExists
        if (zhExists == "false" && bdeExists == "false") {
            alert("For zone '" + zoneName + "', no Zonal Head and BDE found.");
        }
    }
</script>



		<script type="text/javascript">
    function saveTargetDetails() {
        // Serialize the form data
        var formData = $("#targetDetailsForm").serializeArray();
        
        if (!validateSaveTargetForm()) {
            return;
        }

         var formObject = {};

        formData.forEach(function (field) {
            if (formObject[field.name]) {
                if (!Array.isArray(formObject[field.name])) {
                    formObject[field.name] = [formObject[field.name]];
                }
                formObject[field.name].push(field.value);
            } else {
                formObject[field.name] = field.value;
            }
        }); 
     
        $.ajax({
            url: "saveTarget",
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(formObject),
            success: function (result) {
  	        showNotificationModal('Details Saved');
            },
            error: function (error) {
            showNotificationModal('Details Saved');
            }
        });
    }

    $(document).ready(function () {
        $("#targetDetailsForm").on("submit", function (event) {
            event.preventDefault();
            saveTargetDetails();
        });
    });
</script>


		<script>
    $(document).ready(function () {
        // Show zone targets and set individual target button on clicking "Set Target" button
                var isTargetSet = false;
        $("#setTargetButton").click(function () {
            if ($('#financialYear').val() === 'Select' || $('#totaltarget').val() === '') {
                alert('Please select a financial year and enter the total target.');
            } else {
                if (!isTargetSet) {
                    $("#zoneTargets").show();
                    $("#setIndividualTargetButton").show();
                    $("#financialYear").prop('readonly', true);
                    $("#totaltarget").prop('readonly', true);
                    $("#setTargetButton").text('Edit'); // Change button text to 'Edit Target'
                    isTargetSet = true;
                } else {
                    // Clear and hide the zoneTargets and zoneHeadTargets sections
                    $("#zoneTargets").hide();
                    $("#zoneHeadTargets").hide();
                    $('input[id^="ZoneTargetValue_"]').val('');
                    $('input[id^="countryHeadValue"]').val('');
                    $('input[id^="eastZonalHeadValue"]').val('');
                    $('input[id^="westZonalHeadValue"]').val('');
                    $('input[id^="northZonalHeadValue"]').val('');
                    $('input[id^="southZonalHeadValue"]').val('');
                    $('input[id^="east_bdeValue_"]').val('');
                    $('input[id^="west_bdeValue_"]').val('');
                    $('input[id^="north_bdeValue_"]').val('');
                    $('input[id^="south_bdeValue_"]').val('');
                    $("#financialYear").prop('readonly', false);
                    $("#totaltarget").prop('readonly', false);
                    $("#setTargetButton").text('Set'); // Change button text back to 'Set Target'
                    isTargetSet = false;
                }
            }
        });
        
        var isZoneHeadTargetsShown = false;
        $("#setIndividualTargetButton").click(function () {
           /*  if ($('#countryHeadValue').val() === null || $('#countryHeadValue').val() === '') {
                alert("Please Enter countryHead Target");
                return false;
            } */
            	 // Check remaining total target
                var remainingTotalTarget = parseFloat($('#remainingTotalTarget').text().replace(/[^\d.-]/g, ''));
               
                    if (!isZoneHeadTargetsShown) {
                        $("#zoneHeadTargets").show();
                        isZoneHeadTargetsShown = true;
                        $("#setIndividualTargetButton").text('Edit Individual Target'); // Change button text to indicate the action
                    } else {
                        // Second click logic: Clear and hide zoneHeadTargets
                        $("#zoneHeadTargets").hide();
                        $('input[id^="eastZonalHeadValue"]').val('');
                        $('input[id^="westZonalHeadValue"]').val('');
                        $('input[id^="northZonalHeadValue"]').val('');
                        $('input[id^="southZonalHeadValue"]').val('');
                        $('input[id^="east_bdeValue_"]').val('');
                        $('input[id^="west_bdeValue_"]').val('');
                        $('input[id^="north_bdeValue_"]').val('');
                        $('input[id^="south_bdeValue_"]').val('');
                        isZoneHeadTargetsShown = false;
                        $("#setIndividualTargetButton").text('Set Individual Target'); // Change button text back to original
                    }
                return true; 
            
        });
    });
</script>


		<script>
		function validateSaveTargetForm() {
			
			$("#countryHeadValue").on("input", function() {
				var budget = $(this).val();
				if (!/^\d*$/.test(budget)) {
					$(this).val(budget.replace(/[^\d]/g, '')); // Remove non-numeric characters
				}
			});
		
			
			return true;
			
		}
	
	</script>

		<script>
	 $(document).ready(function() {
		    function updateTargetValues() {
		        var totalTarget = parseFloat($('#totaltarget').val()) || 0;
		        var countryHeadTarget = parseFloat($('#countryHeadValue').val()) || 0;
		        var zoneTargetsTotal = 0;
		        
		        // Sum up all zone targets
		        $('input[name="ZoneTargetValue"]').each(function() {
		            var zoneTargetValue = parseFloat($(this).val()) || 0;
		            zoneTargetsTotal += zoneTargetValue;
		        });

		        // Calculate assigned and unassigned targets
		        var assignedTarget = countryHeadTarget + zoneTargetsTotal;
		        var unassignedTarget = totalTarget - assignedTarget;

		        // Update the display
		        $('#totalTargetValue').text(totalTarget.toFixed(2));
		        $('#assignedTargetValue').text(assignedTarget.toFixed(2));
		        $('#unassignedTargetValue').text(unassignedTarget.toFixed(2));

		        // Update colors based on the remaining targets
		        $('#remainingTotalTarget').text(unassignedTarget.toFixed(2)).css('color', unassignedTarget <= 0 ? 'green' : 'red');
		    }

		    // Event listeners for inputs
		    $('#totaltarget').on('input', updateTargetValues);
		    $('#countryHeadValue').on('input', updateTargetValues);
		    $(document).on('input', 'input[name="ZoneTargetValue"]', updateTargetValues);

		    // Initial update on page load
		    updateTargetValues();
		});


    </script>

		<script>

document.addEventListener('DOMContentLoaded', function() {
    // Get all input elements dynamically
    var inputs = document.querySelectorAll('input[name="ZoneTargetValue"]');

    // Add event listeners to each input
    inputs.forEach(function(input) {
        input.addEventListener('input', function() {
            // Extract zoneId from the input's ID
            var zoneId = input.id.split('_')[1];
            var currentValue = parseFloat(input.value); // Parse input value as float

            // Call function to update color and span content
            updateRemainingTargetColor(zoneId, currentValue);

            // Update the associated span with the current value
            var spanId = 'remainingTarget' + zoneId; // Assuming span ID format
            var spanElement = document.getElementById(spanId);
            if (spanElement) {
                spanElement.textContent = currentValue.toFixed(2); // Example: Update span content
            }
        });
    });
});

function updateRemainingTargetColor(zoneId, value) {
    // Your function to update color based on value
    // Example:
    var spanId = 'remainingTarget' + zoneId;
    var spanElement = document.getElementById(spanId);
    if (spanElement) {
        // Example logic to update color based on value
        if (value === 0) {
            spanElement.style.color = 'green';
        } else {
            spanElement.style.color = 'green';
        }
    }
}

</script>

		<script>
   $(document).ready(function(){
       $(".active").removeClass("active");
       $("#targetnavid").addClass("active");
    });
   
 
  </script>

		<script>
		function numberToWordsIndianCurrency(number) {
		    const ones = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"];
		    const teens = ["Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"];
		    const tens = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"];
		    const scales = ["", "Thousand", "Lakh", "Crore"]; // Indian scales

		    if (number === 0) return "Zero Rupees";

		    let words = "";

		    function getHundreds(num) {
		        let result = "";
		        if (num > 99) {
		            result += ones[Math.floor(num / 100)] + " Hundred ";
		            num %= 100;
		        }
		        if (num > 19) {
		            result += tens[Math.floor(num / 10)] + " ";
		            num %= 10;
		        } else if (num >= 10) {
		            result += teens[num - 10] + " ";
		            return result;
		        }
		        result += ones[num] + " ";
		        return result;
		    }

		    // Process the number in Indian scales: Crore, Lakh, Thousand, Hundred, etc.
		    if (number >= 10000000000) { // For Lakh Crores
		        let lakhCrorePart = Math.floor(number / 10000000000);
		        words += getHundreds(lakhCrorePart) + "Lakh Crore ";
		        number %= 10000000000;
		    }
		    if (number >= 10000000) { // For Crores
		        let crorePart = Math.floor(number / 10000000);
		        words += getHundreds(crorePart) + "Crore ";
		        number %= 10000000;
		    }
		    if (number >= 100000) { // For Lakhs
		        let lakhPart = Math.floor(number / 100000);
		        words += getHundreds(lakhPart) + "Lakh ";
		        number %= 100000;
		    }
		    if (number >= 1000) { // For Thousands
		        let thousandPart = Math.floor(number / 1000);
		        words += getHundreds(thousandPart) + "Thousand ";
		        number %= 1000;
		    }
		    if (number > 0) { // For Hundreds and below
		        words += getHundreds(number);
		    }

		    return words.trim() + " 	Rupees"; // Append "Rupees" at the end
		}

		// Example usage:
		console.log(numberToWordsIndianCurrency(2000000000000)); // "Two Lakh Crore Rupees"
		console.log(numberToWordsIndianCurrency(200000000000)); // "Twenty Thousand Crore Rupees"
		console.log(numberToWordsIndianCurrency(20000000000)); // "Two Thousand Crore Rupees"
		console.log(numberToWordsIndianCurrency(2000000000));  // "Two Hundred Crore Rupees"
		console.log(numberToWordsIndianCurrency(2000000));     // "Twenty Lakh Rupees"
		console.log(numberToWordsIndianCurrency(123456));      // "One Lakh Twenty Three Thousand Four Hundred Fifty Six Rupees"

  function displayValueInWords(inputElement) {
	    const value = parseInt(inputElement.value);
	    const words = value ? numberToWordsIndianCurrency(value) : '';

	    // Dynamically find the corresponding div element based on the input field's id
	    const targetId = inputElement.id;

	    if (targetId.startsWith('totaltarget')) {
	        document.getElementById('valueInWords').textContent = words + " only" ;
	    } else if (targetId.startsWith('countryHeadValue')) {
	        document.getElementById('valueInWords1').textContent = words+ " only";
	    } else if (targetId.startsWith('ZoneTargetValue')) {
	        // For the zones, assuming the id is of the form ZoneTargetValue_<id>
	        const zoneId = targetId.split('_')[1];
	        document.getElementById('valueInWords2_' + zoneId).textContent = words + " only";
	    } else if (targetId.startsWith('zonalHeadValue')) {
	        // For the zonal head, assuming the id is of the form zonalHeadValue_<zone.id>
	        const zoneId = targetId.split('_')[1];
	        document.getElementById('valueInWordsZonalHead_' + zoneId).textContent = words + " only";
	    } else if (targetId.startsWith('bdeValue')) {
	        // For the BDE, assuming the id is of the form bdeValue_<zone.id>_<item.id>
	        const [zoneId, bdeId] = targetId.split('_').slice(1);
	        document.getElementById('valueInWordsBDE_' + zoneId + '_' + bdeId).textContent = words + " only";
	    }
	}
  
  function showNotificationModal(message) {
	    $('#notificationMessage').text(message);
	    $('#notificationModal').modal('show');
	}
	


</script>
</body>

</html>
