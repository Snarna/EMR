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
    <link href="../css/signup.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript -->
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>

</head>
<body>

<!--- If we submitted something to the form... --->
<cfif isDefined("form.newUserSubmit")>
<!--- Add new user to the database --->
	<cfquery datasource="capstone">
		INSERT INTO Providers
		(providerId, proEmail, proUsername, proFname, proLname, proPassword)
		VALUES
		(0, '#form.email#', '#form.providername#', '#form.secquestion1ans#', '#form.secquestion2ans#', '#form.password#')
	</cfquery>
	<cfset userIsInserted = true />
</cfif>


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
		<cfif isDefined('userIsInserted')>
			<h2>User submitted</h2>
		<cfelse>
                  <form id="signinform" method="post">
                    <h2 class="form-signup-heading">Sign Up Form</h2><span>Notice: Fields marked with (<span class="requiredstar">*</span>) are required </span>
                    <div class="form-group">
                        <label for="email" class="col-form-label">Email <span class="requiredstar">*</span> </label>
                        <input type="email" class="form-control" name="email" id="email" required>
                    </div>
                    <div class="form-group">
                        <label for="providername" class="col-form-label">Provider Name <span class="requiredstar">*</span> </label>
                        <input type="text" class="form-control" name="providername" id="providername" required>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-form-label">Password <span class="requiredstar">*</span> </label>
                        <input type="password" class="form-control" name="password" id="password" required>
                    </div>
                    <div class="form-group">
                        <label for="passwordconfirm" class="col-form-label">Confrim Password <span class="requiredstar">*</span> </label>
                        <input type="password" class="form-control" name="passwordconfirm" id="passwordconfirm" required>
                    </div>
                    <div class="form-group">
                        <label for="secquestion1" class="col-form-label">Security Question 1 <span class="requiredstar">*</span> </label>
                        <select class="form-control" name="secquestion1" id="secquestion1">
                          <option value="q_1_1">Open this select menu</option>
                          <option value="q_1_2">One</option>
                          <option value="q_1_3">Two</option>
                        </select>
                        <input type="text" class="form-control" name="secquestion1ans" id="secquestion1ans" required>
                    </div>
                    <div class="form-group">
                        <label for="secquestion2" class="col-form-label">Security Question 2 <span class="requiredstar">*</span> </label>
                        <select class="form-control" id="secquestion2">
                          <option value="q_2_1">Open this select menu</option>
                          <option value="q_2_2">One</option>
                          <option value="q_2_3">Two</option>
                        </select>
                        <input type="text" class="form-control" name="secquestion2ans"  id="secquestion2ans" required>
                    </div>
                    <br>
                    <input class="btn btn-lg btn-primary btn-block" type="submit" name="newUserSubmit" id="newUserSubmit">Sign Up!</button>
                  </form>
		</cfif>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
