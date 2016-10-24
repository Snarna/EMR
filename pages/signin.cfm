<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="EMR User Home Page">
    <meta name="author" content="Snarna">

    <title>Client Home Page</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap-cerulean.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/dashboard.css" rel="stylesheet">

    <!-- Sign In Page CSS -->
    <link href="../css/signin.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript -->
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>

</head>

<cfif isDefined("form.submitLogin")>
	<cfif refind('[A-Z]', form.password)
	AND refind('[a-z], form.password)
	AND refind('[0-9]', form.password)
	AND refind('[!@##$&*]', form.password))>
		<h1 class="text-center">Password does not meet RegEx criteria.  Please try again.</h1>	
	<cfelse>
		<cfset loggedIn = application.loginService.doLogin(form.username,form.password) />
		<cfif structKeyExists(session,'stLoggedInUser')>
			<cflocation url="surveys.cfm">
		</cfif>
	</cfif>
</cfif>

<body>

    <nav class="navbar navbar-default navbar-fixed-top mytransparent">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">EMR Home</a>
            </div>
        </div>
    </nav>

    <!-- main container -->
    <div class="container-fluid">
        <div class="modal-dialog">
            <div class="modal-content mytransparent">
                <div class="modal-header">
                    <h1 class="text-center">Welcome EMR System</h1>
                </div>
                <div class="modal-body">
                  <form id="signinform" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="username" name="username" />
                    </div>

                    <div class="form-group">
                        <input type="password" class="form-control input-lg" name="password" placeholder="password" />
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="checkbox">
                                <label><input type="checkbox" value="rememberme"/>Remember Me</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <input type="submit" class="btn btn-block btn-lg btn-primary" name="submitLogin" id="submitLogin" />
                    </div>
                    <span><a href="#">Forgot Password</a></span><span class="pull-right"><a href="../pages/signup.html">Sign Up</a></span>
                  </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
