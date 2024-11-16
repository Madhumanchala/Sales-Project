<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
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
<link rel="stylesheet" href="css/style.css" />
</head>

<body>
<div id="loader" style="display: none;" ><img src="img/loading.gif"> </div> 
	<!-- Content -->

	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<div class="authentication-inner">
				<!-- Register -->
				<div class="card">
					<div class="card-body">
						<!-- Logo -->
						
						<!--  <div class="right-nav float-end">
							    <ul>
							        <li>
							            <a class="btn btn-secondary add-new btn-primary" href="login">
							                <i class="bx back me-1"></i> Back
							            </a>
							        </li>
							    </ul>
							</div>  -->
							
						<!-- <div class="app-brand justify-content-left">
							<a href="index.html" class="app-brand-link gap-2"> <span
								class="app-brand-logo demo"> <img src="img/1	.png">
							</span> <span class="app-brand-text demo text-body fw-bolder"> </span>
							</a>
						</div> -->
						   <div class="app-brand justify-content-center">
						 <span class="brand-logo demo"> <img src="img/logo.svg">
							</span>
							  
							</div>
							  
						<!-- /Logo -->
						<!--             <h4 class="mb-2">Ÿ‘‹</h4> -->
						<!--   <p class="mb-4">Please sign-in to your account</p> -->
						<h5 class="mb-4">Forgot Password </h5>

						<form name="myForm" class="mb-3" id="forgotPasswordForm" >
							<div class="mb-3">
							<input type="hidden" id="otpId" name="otpId"
															value="${otpId}">

								<label for="email" class="form-label">Email</label> <input
									type="text" class="form-control" id="emailId" name="emailId"
									onchange="return isSpclCharEmail(this)" onkeyup="removewaring()"
									placeholder="Enter your email" />
									<span id="email-id-span"></span>
							</div>
							<div class="d-flex ">

							<button
								class="btn btn-primary br20 mb-2 m-t-25 waves-effect btn-sm font-12 m-r-10"
								type="button" onclick="getOTP()">Request OTP</button>
								</div>

							<div class="mb-3">
								<label 
								for="otp" class="form-label">OTP</label> <input
									type="text" class="form-control" id="otp" name="otp" onkeyup="removewaring()"
									placeholder="Enter your otp" />
									<span id="otp-span"></span>
								<c:choose>
									<c:when test="${not empty otpErrorMessage}">
										<div class="text-danger">${otpErrorMessage}</div>
									</c:when>
									<c:when test="${not empty otpExErrorMessage}">
										<div class="text-danger">${otpExErrorMessage}</div>
									</c:when>
								</c:choose>
							</div>
							<div class="mb-3 form-password-toggle">
								<div class="d-flex justify-content-between">
									<label for="password" class="form-label">New Password</label> <span
										id="message" toggle="#password"
										class="fa fa-fw fa-eye field-icon toggle-password2"></span>
								</div>
								<div class="input-group input-group-merge">
									<input type="password" id="password" name="password" onchange="validatePass();" 
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
									<span class="input-group-text cursor-pointer"> 
									<i class="bx bx-hide"></i>
									</span>
								</div>
								<input type="hidden" id="otpId"> <span
									id="password-span"></span>
							</div>

							<div class="mb-3 form-password-toggle">
								<div class="d-flex justify-content-between">
									<label for="confirmPassword" class="form-label">Confirm
										Password</label> <span id="message" toggle="#confirmPassword"
										class="fa fa-fw fa-eye field-icon toggle-password2"></span>
								</div>
								<div class="input-group input-group-merge">
									<input type="password" id="confirmPassword"
										name="confirmPassword" class="form-control"
										placeholder="············" onkeyup="removewaring()"> <span
										class="input-group-text cursor-pointer"
										>
										<i class="bx bx-hide"></i>
									</span>
								</div>
								<span id="confirmPassword-span"></span>
							</div>

							<div class="mb-3">
								<button class="btn btn-primary d-grid w-100" type="button" onclick="updatePassword()">Update Password</button>
							</div>
						</form>
						 
            
                 <div class="text-center"> 
                    <a href="login" tabindex="-1"> <small> <i class="bx bx-chevron-left scaleX-n1-rtl bx-xs"></i>Back to Login</small>
				</a></div>

					</div>
				</div>
				<!-- /Register -->
			</div>
		</div>
	</div>

	<!-- Core JS -->
	<script src="js/jquery.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/helpers.js"></script>
	<script src="js/perfect-scrollbar.js"></script>
	<script src="js/menu.js"></script>
	<script src="js/main.js"></script>



	<script type="text/javascript">
	var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
	var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
	  return new bootstrap.Popover(popoverTriggerEl)
	})
	
	$(document).on({
	    ajaxStart: function(){
// 	        $("body").addClass("loading"); 
	    	$("#loader").show();  
	    },
	    ajaxStop: function(){ 
	    	$("#loader").hide();  
// 	        $("body").removeClass("loading"); 
	    }    
	});
		function getOTP() {
			// Ensure the email ID field is not empty
			 if (document.getElementById('emailId').value == "") {
                document.getElementById("email-id-span").innerHTML = "Please Enter Email ID";
                document.getElementById("email-id-span").style.color = "Red";
                return false;
            }
			
			/* if (document.getElementById("emailId").value == "") {
				alert("Enter the Email Id");
				return false;
			} */

			// Capture the email ID value
			var emailId = $("#emailId").val();

			// Send the email ID through an AJAX request
			$.ajax({
				url : "forgotpassword",
				type : "POST",
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify({"emailId": emailId}),
				success : function(result) {
			console.log("AJAX call successful. Response:", result); // Log the entire response
            if (result.errors && result.errors.errorCode == "0000") {
						 $("#otpId").val(result.data.otpId);
						 document.getElementById("email-id-span").innerHTML = "OTP sent to your email!";
				            document.getElementById("email-id-span").style.color = "green";
            } else if (result.errors && result.errors.errorCode == "1000") {
					        console.log("Error code 1000 detected");
						document.getElementById("email-id-span").innerHTML = result.errors.errorMessage;
			            document.getElementById("email-id-span").style.color = "Red";
					}else{
						 alert("Please Try Again Later!");
					}
				},
				 error: function(error) {
			            console.log("AJAX call failed Error:", error); // Log error
				}
			});
		}
		
		
		function  updatePassword (){
			
			var formData = $("#forgotPasswordForm").serializeArray();

			if (!validateupdatePassword()) {
				return;
			}

			var formDataJson = {};
			$.each(formData, function(i, v) {
				formDataJson[v.name] = v.value;
			});

			console.log(formDataJson);
			
			$.ajax({
				url : "resetPassword",
				type : "POST",
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(formDataJson),
				success : function(result) {
		            console.log("AJAX call successful. Response:", result); // Log the entire response
	            if (result.errors && result.errors.errorCode == "0000") {
			            alert("Password Changed Successfully !");
			            window.location.href = "sales/login";
	            } else if (result.errors && result.errors.errorCode == "1000") {
			            $("#otp-span").text(result.errors.errorMessage);
			            $("#otp-span").css("color", "red");
			        }
	            else if (result.errors && result.errors.errorCode == "2000") {
		            $("#otp-span").text(result.errors.errorMessage);
		            $("#otp-span").css("color", "red");
		        }
				},
				 error: function(error) {
			            console.log("AJAX call failed. Status:", error); // Log status
				}
			});
			
		}
		
		function validateupdatePassword() {
            var emailId = document.getElementById("emailId").value;
            var otp = document.getElementById('otp').value;
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            
        /*  var password = document.forms["myForm"]["password"].value;
         */
         var confirmPassword = document.forms["myForm"]["confirmPassword"].value;
         
            //var UserCaptchaCode = document.getElementById('UserCaptchaCode').value;
            if (document.getElementById('emailId').value == "") {
                document.getElementById("email-id-span").innerHTML = "Please Enter Email ID";
                document.getElementById("email-id-span").style.color = "Red";
                return false;
            }
            if (document.getElementById('otp').value == "") {
                document.getElementById("otp-span").innerHTML = "Please Enter otp";
                document.getElementById("otp-span").style.color = "Red";
                return false;
            }
            if (document.getElementById('password').value == "") {
                document.getElementById("password-span").innerHTML = "Please Enter password";
                document.getElementById("password-span").style.color = "Red";
                return false;
            }
            if (document.getElementById('confirmPassword').value == "") {
                document.getElementById("confirmPassword-span").innerHTML = "Please Enter confirmPassword";
                document.getElementById("confirmPassword-span").style.color = "Red";
                return false;
            }
            if(password!=confirmPassword) {
            	 document.getElementById("confirmPassword-span").innerHTML = "Password and confirm password Doesn't match";
            	 document.getElementById("confirmPassword-span").style.color = "Red";
    	    	// alert("Password and confirm password Doesn't match");
    	    	 $('#confirmPassword').val("");
    		     return false;
    	    }
            
            return true;
        	
		}	
		 
		function removewaring() {
            document.getElementById("email-id-span").innerHTML = "";
            document.getElementById("otp-span").innerHTML = "";
            document.getElementById("password-span").innerHTML = "";
            document.getElementById("confirmPassword-span").innerHTML = "";
        }
		
		
		function isSpclCharEmail(obj) {
            var x = obj.value;
            var atpos = x.indexOf("@");
            var dotpos = x.lastIndexOf(".");
            if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
                document.getElementById("email-id-span").innerHTML = "Please Enter valid email ID";
                document.getElementById("email-id-span").style.color = "Red";
                obj.focus();
                return false;
            }
        }
		
// 		$("#password").popover({ html : true,content:$('#passerrmsg').html()});
		
		
		 function validatePass()
	     {
	    	 var passwords = $("#password").val();
	    	 if(passwords.match(/^(?=[^A-Z\n]*[A-Z])(?=[^a-z\n]*[a-z])(?=[^0-9\n]*[0-9])(?=[^#?!@$%^&*\n-]*[#?!@$%^&*-]).{6,}$/)) 
	    	 { 
	    	      return true;
	    	 }
	    	 else
	    	 { 
	    		 document.getElementById("password-span").innerHTML = "Your new Password doesnt match with the Password Policy. Kindly follow the mentioned.!";
	                document.getElementById("password-span").style.color = "Red";	 
	    	// alert("Your new Password doesnt match with the Password Policy. Kindly follow the mentioned.!")
	    	 $('#password').val("");

	    	 return false;
	    	 }  
	     }

	</script>
	
	
	
</body>

</html>