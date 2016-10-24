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
		<div class="container-fluid">
			<h1>SURVEY TABLET APP</h1>
		</div>
	</nav>
	<div class="container-fluid" id="surv-cont">
        <form id="survForm" name="survForm" method="post" action="surveyPage.cfm">
            <div id="surv-btn">
                <label for="pid">Survey Code</label>
                <input type="text" name="surveyCode" id="surveyCode">
                <p>
                    <input type="submit" name="submit" id="submit" value="Start Survey" class="btn btn-primary"/>
                </p>
            </div>
        </form>	
	</div>
		
	<nav class="navbar navbar-default navbar-fixed-bottom progbar">
	</nav>
  </body>
</html>
