 <head>
<meta charset="UTF-8">
<title>Login Register Panel</title>
<script type="text/javascript">
	function loginValidation() {
		var email = document.getElementById("email").value;
		var password = document.getElementById("login-password").value;
		var emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
		var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,12}$/;

		if (email === '') {
			alert("Please enter your email");
			document.getElementById("email").focus();
			return false;
		}
		if (!emailRegex.test(email)) {
			alert("Please enter a valid email");
			document.getElementById("email").focus();
			return false;
		}
		if (password === '') {
			alert("Please enter your password");
			document.getElementById("login-password").focus();
			return false;
		}
		if (!passwordRegex.test(password)) {
			alert("Password should contain at least 1 uppercase letter, 1 lowercase letter, 1 special character, and be 8-12 characters long");
			document.getElementById("login-password").focus();
			return false;
		}
		return true;
	}
	function registerValidation() {
	    var email = document.getElementById("register-email").value;
	    var phone = document.getElementById("register-phone").value;
	    var password = document.getElementById("register-password").value;
	    var confirmpassword = document.getElementById("confirmpassword").value;

	    var emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
	    var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,12}$/;
	    var phoneRegex = /^[6-9]\d{9}$/;

	    if (email === '') {
	        alert("Please enter your email");
	        document.getElementById("register-email").focus();
	        return false;
	    }
	    if (!emailRegex.test(email)) {
	        alert("Please enter a valid email");
	        document.getElementById("register-email").focus();
	        return false;
	    }

	    if (phone === '') {
	        alert("Please enter your phone number");
	        document.getElementById("register-phone").focus();
	        return false;
	    }
	    if (!phoneRegex.test(phone)) {
	        alert("Please enter a valid 10-digit Indian phone number starting with 6, 7, 8, or 9");
	        document.getElementById("register-phone").focus();
	        return false;
	    }

	    if (password === '') {
	        alert("Please enter your password");
	        document.getElementById("register-password").focus();
	        return false;
	    }
	    if (!passwordRegex.test(password)) {
	        alert("Password should contain at least 1 uppercase letter, 1 lowercase letter, 1 special character, and be 8-12 characters long");
	        document.getElementById("register-password").focus();
	        return false;
	    }
	    if (confirmpassword === '') {
	        alert("Please re-enter your password");
	        document.getElementById("confirmpassword").focus();
	        return false;
	    }
	    if (confirmpassword !== password) {
	        alert("Passwords do not match");
	        document.getElementById("confirmpassword").focus();
	        return false;
	    }
	    return true;
	}


	function togglePassword(id) {
		const passwordField = document.getElementById(id);
		const icon = document.getElementById(id + '-toggle');

		if (passwordField.type === "password") {
			passwordField.type = "text";
			icon.classList.remove("fa-eye");
			icon.classList.add("fa-eye-slash");
		} else {
			passwordField.type = "password";
			icon.classList.remove("fa-eye-slash");
			icon.classList.add("fa-eye");
		}
	}
</script>
<!-- CSS and Libraries -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Mukta"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">

<style>
/* Import font */
@import url('https://fonts.googleapis.com/css?family=Mukta');

/* Body Styling */
body {
	font-family: 'Mukta', sans-serif;
	height: 100vh;
	min-height: 550px;
	background-image:
		url(http://www.planwallpaper.com/static/images/Free-Wallpaper-Nature-Scenes.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	position: relative;
	overflow-y: hidden;
}

/* Link Styling */
a {
	text-decoration: none;
	color: #444444;
}

/* Login/Register Panel Styling */
.login-reg-panel {
	position: relative;
	top: 50%;
	transform: translateY(-50%);
	text-align: center;
	width: 70%;
	right: 0;
	left: 0;
	margin: auto;
	height: 400px;
	background-color: rgba(236, 48, 20, 0.9);
}

.white-panel {
	background-color: rgba(255, 255, 255, 1);
	height: 500px;
	position: absolute;
	top: -50px;
	width: 50%;
	right: calc(50% - 50px);
	transition: .3s ease-in-out;
	z-index: 0;
	box-shadow: 0 0 15px 9px #00000096;
}

.login-reg-panel input[type="radio"] {
	position: relative;
	display: none;
}

.login-reg-panel {
	color: #B8B8B8;
}

.login-reg-panel #label-login, .login-reg-panel #label-register {
	border: 1px solid #9E9E9E;
	padding: 5px 5px;
	width: 150px;
	display: block;
	text-align: center;
	border-radius: 10px;
	cursor: pointer;
	font-weight: 600;
	font-size: 18px;
}

.login-info-box, .register-info-box {
	width: 30%;
	padding: 0 50px;
	top: 20%;
	position: absolute;
	text-align: left;
}

.login-info-box {
	left: 0;
}

.register-info-box {
	right: 0;
}

.right-log {
	right: 50px !important;
}

.login-show, .register-show {
	z-index: 1;
	display: none;
	opacity: 0;
	transition: 0.3s ease-in-out;
	color: #242424;
	text-align: left;
	padding: 50px;
}

.show-log-panel {
	display: block;
	opacity: 0.9;
}

.login-show input[type="text"], .login-show input[type="password"],
	.register-show input[type="text"], .register-show input[type="password"]
	{
	width: 100%;
	display: block;
	margin: 20px 0;
	padding: 15px;
	border: 1px solid #b5b5b5;
	outline: none;
}

.login-show input[type="button"], .register-show input[type="button"] {
	max-width: 150px;
	width: 100%;
	background: #444444;
	color: #f9f9f9;
	border: none;
	padding: 10px;
	text-transform: uppercase;
	border-radius: 2px;
	float: right;
	cursor: pointer;
}

.login-show a {
	display: inline-block;
	padding: 10px 0;
}

/* Footer Credit */
.credit {
	position: absolute;
	bottom: 10px;
	left: 10px;
	color: #3B3B25;
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	text-transform: uppercase;
	font-size: 12px;
	font-weight: bold;
	letter-spacing: 1px;
	z-index: 99;
}

a {
	text-decoration: none;
	color: #2c7715;
}

.password-container {
	position: relative;
	width: 100%;
}

.password-toggle {
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
	color: #444444;
}
</style>
</head>
<body>
	<div class="login-reg-panel">
		<div class="login-info-box">
			<h2>Have an account?</h2>
			<p>Welcome back! Log in to continue.</p>
			<label id="label-register" for="log-reg-show">Login</label> <input
				type="radio" name="active-log-panel" id="log-reg-show"
				checked="checked">
		</div>

		<div class="register-info-box">
			<h2>Don't have an account?</h2>
			<p>Create an account to get started.</p>
			<label id="label-login" for="log-login-show">Register</label> <input
				type="radio" name="active-log-panel" id="log-login-show">
		</div>

		<div class="white-panel">
			<!-- Login Form -->
			<form onsubmit="return loginValidation()" action="loginAction.jsp">
				<div class="login-show">
					<h2>LOGIN</h2>
					<input type="text" id="email" name="email" placeholder="Email">
					<div class="password-container">
						<input type="password" id="login-password" name="login-password"
							placeholder="Password"> <i id="login-password-toggle"
							class="fas fa-eye password-toggle"
							onclick="togglePassword('login-password')"></i>
					</div>
					<input type="submit" value="Login"> <a
						href="forgotpassword.jsp">Forgot password?</a>
				</div>
			</form>

			<!-- Register Form -->
			<form action="regiesterAction.jsp" onsubmit="return registerValidation()">
				<div class="register-show">
					<h2>REGISTER</h2>
					<input type="text" id="register-email" name="register-email"
						placeholder="Email"> 
						<input type="text"
						id="register-phone" name="register-phone"
						placeholder="Phone Number">

					<div class="password-container">
						<input type="password" id="register-password" name="register-password"
							placeholder="Password"> <i id="register-password-toggle"
							class="fas fa-eye password-toggle"
							onclick="togglePassword('register-password')"></i>
					</div>
					<div class="password-container">
						<input type="password" id="confirmpassword" name="confirmpassword"
							placeholder="Confirm Password"> <i
							id="confirmpassword-toggle" class="fas fa-eye password-toggle"
							onclick="togglePassword('confirmpassword')"></i>
					</div>
					<input type="submit" value="Register">
				</div>
			</form>
		</div>
	</div>

	<!-- jQuery for toggling panels -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.login-info-box').fadeOut();
			$('.login-show').addClass('show-log-panel');
		});

		$('.login-reg-panel input[type="radio"]').on('change', function() {
			if ($('#log-login-show').is(':checked')) {
				$('.register-info-box').fadeOut();
				$('.login-info-box').fadeIn();
				$('.white-panel').addClass('right-log');
				$('.register-show').addClass('show-log-panel');
				$('.login-show').removeClass('show-log-panel');
			} else if ($('#log-reg-show').is(':checked')) {
				$('.register-info-box').fadeIn();
				$('.login-info-box').fadeOut();
				$('.white-panel').removeClass('right-log');
				$('.login-show').addClass('show-log-panel');
				$('.register-show').removeClass('show-log-panel');
			}
		});
	</script>
</body>
</html>
