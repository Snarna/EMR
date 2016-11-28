
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
    <link href="../css/bootstrap-cerulean.min.css" rel="stylesheet">
    <link href="../css/dashboard.css" rel="stylesheet">
	<link href="../css/checkbox-x.css" rel="stylesheet">
	  

    <!-- Bootstrap core JavaScript -->
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
	<script src="../js/checkbox-x.js"></script> 
  </head>

  <body>
	<nav class="navbar navbar-default navbar-fixed-top progbar">
	</nav>
	  
	<div class="container-fluid surv-quest">
		<h1 class="text-center">Create New Survey Code</h1>
		<form method="post" action="/SURVEYAPP/classes/admin/survCodeDisp.cfc?method=createSurvCode">

				<div class="form-group row">
					<div class="col-xs-12">
						<label for="survCode">How many: </label>
						<input class="form-control" name="numGen" id="numGen" type="text">
					</div>
				</div>

			
			<p class="text-center" style="padding-top:5%;">
				<input type="submit" name="submit" id="submit" value="Create" class="btn btn-primary" style="width:40%;"/><br/>
				<input type="button" name="cancel" id="cancel" value="Cancel" class="btn btn-secondary" style="width:40%;margin-top:1%;" onclick="history.back();"/>
			</p>
		</form>
	</div>
		
	<nav class="navbar navbar-default navbar-fixed-bottom progbar">
		
	</nav>
  </body>
</html>
