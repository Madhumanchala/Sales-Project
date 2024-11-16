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
<div id="loader" style="display: none;" ><img src="img/loading.gif"> </div> 
	<!-- Content -->

	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<div class="authentication-inner">
				<!-- Register -->
				<div class="card">
					<div class="card-body">
					
							<!--  <div class="right-nav float-end">
							    <ul>
							        <li>
							            <a class="btn btn-secondary add-new btn-primary" href="leadList">
							                <i class="bx back me-1"></i> Back
							            </a>
							        </li>
							    </ul>
							</div>  -->

						<!-- Logo -->
						<div class="mb-3">
							<h5>Change Password</h5>	</div>
		

						<form name="myForm" class="mb-3" id="changePasswordForm">
										

							<div class="mb-3">
								<label 
								for="otp" class="form-label">Current Password</label> <input
									type="text" class="form-control" id="currentPassword" name="currentPassword" onkeyup="removewaring()"
									placeholder="Enter your Current Password" />
									<span id="currentPassword-span"></span>
							
							</div>
							<div class="mb-3 form-password-toggle1">
								<div class="d-flex justify-content-between">
									<label for="password" class="form-label">New Password</label> <span
										id="message" toggle="#password"
										class=" toggle-password2"></span>
								</div>
								<div class="form-group passwordtoggle">
									<input type="password" id="newPassword" onchange="validatePass();" name="newPassword"
										class="form-control" placeholder="············"
										onkeyup="removewaring()" data-bs-toggle="popover"
										title="Your Password must have" data-bs-trigger="focus"
										data-bs-html="true"
										data-bs-content="<ul>
                   <li>one Uppercase</li>
                   <li>one Lowercase</li>
                   <li>one Numeric character</li>
                   <li>one Special character</li>
                    <li>minimum length of 6 character</li> 
               </ul>">
									<i class="toggle-password bx bx-hide"></i>
								</div>
								<input type="hidden" id="otpId"> <span
									id="newPassword-span"></span>
							</div>

							<div class="mb-3 form-password-toggle2">
								<div class="d-flex justify-content-between">
									<label for="confirmPassword" class="form-label">Confirm
										Password</label> 
								</div>
								<div class="form-group passwordtoggle">
									<input type="password" id="confirmPassword"
										name="confirmPassword" class="form-control"
										placeholder="············" onkeyup="removewaring()"> 
										
									<i class="toggle-password bx bx-hide"></i>
									
								</div>
								<span id="confirmPassword-span"></span>
							</div>

							<div class="mb-3">
								<button class="btn btn-primary d-grid w-100" type="button" onclick="changePassword()" >Change Password</button>
							</div>
						</form>

					</div>
				</div>
				<!-- /Register -->
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
	<script src="js/main.js"></script>

 -->

	<script type="text/javascript">
	var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
	var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
	  return new bootstrap.Popover(popoverTriggerEl)
	})
	
	
	function  changePassword(){
			
			var formData = $("#changePasswordForm").serializeArray();

			if (!validatechangePassword()) {
				return;
			}

			var formDataJson = {};
			$.each(formData, function(i, v) {
				formDataJson[v.name] = v.value;
			});

			console.log(formDataJson);
			
			$.ajax({
				url : "setPassword",
				type : "POST",
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(formDataJson),
				success : function(result) {
		            console.log("AJAX call successful. Response:", result); // Log the entire response
	            if (result.errors && result.errors.errorCode == "0000") {
			            alert("Password Changed Successfully !");
			            window.location.href = "leadList";
	            } else if (result.errors && result.errors.errorCode == "2222") {
			            $("#currentPassword-span").text(result.errors.errorMessage);
			            $("#currentPassword-span").css("color", "red");
			        }
	            else if (result.errors && result.errors.errorCode == "0011") {
		            $("#currentPassword-span").text(result.errors.errorMessage);
		            $("#currentPassword-span").css("color", "red");
		        }
				},
				 error: function(error) {
			            console.log("AJAX call failed. Status:", error); // Log status
				}
			});
			
		}
		
	
		function validatechangePassword() {
            var currentPassword = document.getElementById("currentPassword").value;
            var newPassword = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            
        /*  var password = document.forms["myForm"]["password"].value;
         */ var confirmPassword = document.forms["myForm"]["confirmPassword"].value;
         
            //var UserCaptchaCode = document.getElementById('UserCaptchaCode').value;
            if (document.getElementById('currentPassword').value == "") {
                document.getElementById("currentPassword-span").innerHTML = "Please Enter currentPassword";
                document.getElementById("currentPassword-span").style.color = "Red";
                return false;
            }
            if (document.getElementById('newPassword').value == "") {
                document.getElementById("newPassword-span").innerHTML = "Please Enter newPassword";
                document.getElementById("newPassword-span").style.color = "Red";
                return false;
            }
            if (document.getElementById('confirmPassword').value == "") {
                document.getElementById("confirmPassword-span").innerHTML = "Please Enter confirmPassword";
                document.getElementById("confirmPassword-span").style.color = "Red";
                return false;
            }
            if(newPassword!=confirmPassword) {
            	 document.getElementById("confirmPassword-span").innerHTML = "Password and confirm password Doesn't match";
            	 document.getElementById("confirmPassword-span").style.color = "Red";
    	    	// alert("Password and confirm password Doesn't match");
    	    	 $('#confirmPassword').val("");
    		     return false;
    	    }
            
            return true;
		}	
		 
		function removewaring() {
            document.getElementById("currentPassword-span").innerHTML = "";
            document.getElementById("newPassword-span").innerHTML = "";
            document.getElementById("confirmPassword-span").innerHTML = "";
        }

		function validatePass()
	     {
			console.log("Inside the Validatepass method");
	    	 var newPassword = $("#newPassword").val();
	    	 if(newPassword.match(/^(?=[^A-Z\n]*[A-Z])(?=[^a-z\n]*[a-z])(?=[^0-9\n]*[0-9])(?=[^#?!@$%^&*\n-]*[#?!@$%^&*-]).{6,}$/)) 
	    	 { 
	    	      return true;
	    	 }
	    	 else
	    	 { 
	    		  document.getElementById("newPassword-span").innerHTML = "Your new Password doesnt match with the Password Policy. Kindly follow the mentioned.!";
	                document.getElementById("newPassword-span").style.color = "Red";
	    	// alert("Your new Password doesnt match with the Password Policy. Kindly follow the mentioned.!")
	    	 $('#newPassword').val("");

	    	 return false;
	    	 }  
	     }
		
		

		$(".toggle-password").click(function() {
		    $(this).toggleClass("bx-show");
		    input = $(this).parent().find("input");
		    if (input.attr("type") == "password") {
		        input.attr("type", "text");
		    } else {
		        input.attr("type", "password");
		    }
		});
	</script>
	
	
	
</body>

</html>