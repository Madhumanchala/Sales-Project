<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en" class="light-style ">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>Sales Management</title>
    <meta name="description" content="" />
    <link rel="icon" type="image/x-icon" href="img/favicon.ico" />
    <link rel="stylesheet" href="fonts/boxicons.css" />
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<div id="loader" style="display: none;" ><img src="img/loading.gif"> </div> 
    <div class="container-xxl">
        <div class="authentication-wrapper authentication-basic container-p-y">
            <div class="authentication-inner">
                <div class="card">
                    <div class="card-body">
                        <div class="app-brand justify-content-center">
                            
                            <%-- <img src="/HRMS/getImage?reqParam=<c:out value="${logoId}" />"> --%>
                               
                             <%-- <span class="app-brand-logo demo">
    <img src="<c:url value='/getImage?logoId=${logoId}' />" alt="Logo" />
							</span> --%>
							 <span class="brand-logo demo"> <img src="img/logo.svg">
							</span>

							 <span class="app-brand-text demo text-body fw-bolder"> </span>
                           	
                        </div>
                        <c:choose>
                        <c:when test="${not empty errorMessage}">
                        <p class="mb-4" style="color: red;"> ${errorMessage }</p>
                        </c:when>
                        <c:otherwise>
                        <h5 class="mb-4">Please sign-in to your account </h5>
                        </c:otherwise>
                        </c:choose>

                        <form id="formAuthentication" class="mb-3" action="login" method="POST" onsubmit="return checkLogin()">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email </label>
                                <input type="text" class="form-control" id="email" name="username"  tabindex="1" onchange="return isSpclCharEmail(this)" onkeyup="removewaring()" placeholder="Enter your email" />
                                <span id="client1"></span>
                            </div>
                            <div class="mb-3 form-password-toggle">
                                <div class="d-flex justify-content-between">
                                    <label class="form-label" for="password">Password</label>
                                    <span id="message" toggle="#loginpassword" class="fa fa-fw fa-eye field-icon toggle-password2"></span>
                                    <span id="client2"></span>
                                 
                                </div>
                                <div class="input-group input-group-merge">
                                    <input type="password" id="password" class="form-control" tabindex="2" name="password" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" aria-describedby="password" />
                                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="CaptchaWrap">
                                        <div id="CaptchaImageCode" class="CaptchaTxtField">
                                            <canvas id="CapCode" class="capcode"></canvas>
                                        </div>
                                       <button type="button" class="ReloadBtn" onclick='CreateCaptcha();' style="background: none; border: none;">
                                            <img src="img/reload.png" alt="Reload Captcha" style="width: 36px; height: 26px;">
                                        </button>
                                    </div>
                                    <input type="text" id="UserCaptchaCode" class="form-control" tabindex="3" placeholder='Enter Captcha - Case Sensitive' onkeyup="funForHide(); removewaring()">
                                    <span id="WrongCaptchaError" class="error"></span>
                                    <span id="SuccessMessage2" class="success"></span>
                                    <span id="client3"></span>
                                </div>
                            </div>
                              <div class="mb-3">
                <!-- <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="remember-me" />
                  <label class="form-check-label" for="remember-me"> Remember Me </label>
                </div> -->
              </div>
                            <div class="mb-3">
                                <button class="btn btn-primary d-grid w-100" type="submit">Sign in</button>
                            </div>
                            <div class="text-center"> 
                               <a href="password" tabindex="-1"> <small>Forgot Password?</small>
											</a></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="js/jquery.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/helpers.js"></script>
    <script src="js/perfect-scrollbar.js"></script>
    <script src="js/menu.js"></script>
    <script src="js/main.js"></script>
    <script>
    
//     $(document).ready(function() {
//         $('#formAuthentication').submit(function(event) {
// //             event.preventDefault();
            
//             $("#loader").show(); 

//         });
//     });
    
        function checkLogin() {
            var email = document.getElementById("email").value;
            var loginpassword = document.getElementById('password').value;
            //var UserCaptchaCode = document.getElementById('UserCaptchaCode').value;
            if (document.getElementById('email').value == "") {
                document.getElementById("client1").innerHTML = "Please Enter Email ID";
                document.getElementById("client1").style.color = "Red";
                return false;
            }
            if (document.getElementById('password').value == "") {
                document.getElementById("client2").innerHTML = "Please Enter Password";
                document.getElementById("client2").style.color = "Red";
                return false;
            }
            if (document.getElementById('UserCaptchaCode').value == "") {
                document.getElementById("client3").innerHTML = "Please Enter Captcha Code";
                document.getElementById("client3").style.color = "Red";
                return false;
            }
            var result = ValidateCaptcha();
            if ($("#UserCaptchaCode").val() == "" || $("#UserCaptchaCode").val() == null || $("#UserCaptchaCode").val() == "undefined") {
                $('#WrongCaptchaError').text('Please enter code given below in a picture.').show();
                $('#UserCaptchaCode').focus();
                return false;
            } else {
                if (result == false) {
                    $('#WrongCaptchaError').text('Invalid Captcha! Please try again.').show();
                    CreateCaptcha();
                    $('#UserCaptchaCode').focus().select();
                    return false;
                } else {
                    $('#WrongCaptchaError').fadeOut(100);
                    $('#SuccessMessage2').fadeIn(500).css('display', 'block').delay(5000).fadeOut(250);
                    $("#loader").show();
                    return true;
                }
            }
        }

        function funForHide() {
            document.getElementById("WrongCaptchaError").innerHTML = "";
        }

        $(function () {
            CreateCaptcha();
        });

        var cd;
        function CreateCaptcha() {
            var alpha = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9');

            var a = alpha[Math.floor(Math.random() * alpha.length)];
            var b = alpha[Math.floor(Math.random() * alpha.length)];
            var c = alpha[Math.floor(Math.random() * alpha.length)];
            var d = alpha[Math.floor(Math.random() * alpha.length)];

            cd = a + ' ' + b + ' ' + c + ' ' + d;
            $('#CaptchaImageCode').empty().append('<canvas id="CapCode" class="capcode" width="280" height="40"></canvas>');

            var c = document.getElementById("CapCode"),
                ctx = c.getContext("2d"),
                x = c.width / 2,
                img = new Image();

            img.src = "img/captcha-bg.png";
            img.onload = function () {
                var pattern = ctx.createPattern(img, "repeat");
                ctx.fillStyle = pattern;
                ctx.fillRect(0, 0, c.width, c.height);
                ctx.font = "24px Roboto Slab";
                ctx.fillStyle = '#1d2946';
                ctx.textAlign = 'center';
                ctx.fillText(cd, x, 28);
            };
        }

        function ValidateCaptcha() {
            var string1 = removeSpaces(cd);
            var string2 = removeSpaces($('#UserCaptchaCode').val());
            return string1 == string2;
        }

        function removeSpaces(string) {
            return string.split(' ').join('');
        }

        function removewaring() {
            document.getElementById("client1").innerHTML = "";
            document.getElementById("client2").innerHTML = "";
            document.getElementById("client3").innerHTML = "";
        }

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
    </script>
    
  <!--  <script type="text/javascript">
    // Access the 'logoId' value from the server-side model and alert it
    var logoId = '${logoId}';
    alert("Logo ID: " + logoId);
</script> -->
</body>
</html>
