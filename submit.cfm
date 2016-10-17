
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Survey Tablet">
    <meta name="author" content="">

    <title>Survey Home Page</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/custom.css" rel="stylesheet">
	<link href="../css/checkbox-x.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript -->
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
	<script src="../js/checkbox-x.js"></script>

  </head>

  <body>
	<nav class="navbar navbar-inverse navbar-fixed-top progbar">
		<div class="container-fluid">
			<h1>SURVEY TABLET APP</h1>
		</div>
	</nav>
	<cfquery datasource="emr" name="survTest">
			INSERT INTO surveyData (fname,lname,dob)
			VALUES ('#form.fname#','#form.lname#','#form.dob#')     
    </cfquery>
	<div class="container-fluid surv-quest">
		<h1>
            Data Submitted: <a href="index.cfm">Return Home</a>
        </h1><hr/>

	</div>
		
	<nav class="navbar navbar-inverse navbar-fixed-bottom progbar">
		<div class="container-fluid">
			<div class="progbar">
				<h5>Progress (1/4)</h5>
			</div>
			<div id="myProgress">
				<div id="myBar1"></div>
			</div>
		</div>
	</nav>
  </body>
</html>
