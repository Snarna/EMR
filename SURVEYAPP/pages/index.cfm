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
	<link href="../css/signin.css" rel="stylesheet">
	<link href="../css/animate.css" rel="stylesheet">
	  
    <!-- Bootstrap core JavaScript -->
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
	<script src="../js/checkbox-x.js"></script>

  </head>

  <body>
	<nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="adminLogin.cfm">Admin Login</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
	  <div class="container">
		<legend><h1 class="animated fadeIn" style="color:white;">Welcome!</h1></legend>
		<div class="container-fluid">
			<form id="survForm" name="survForm" method="post" action="surveyPage.cfm">
				<div class="modal-dialog animated fadeInDown">
					<div class="modal-content mytransparent">
						<div class="modal-header">
							<h3 class="text-center">Please verify survey code:</h3>
						</div>
						<div class="modal-body">
								<div class="form-group smalltext">
									<div class="row">
										<div class="form-group"> 
											<input class="form-control" name="surveyCode" id="surveyCode" placeholder="Survey Code" type="text">
										</div>
									</div>
									<div class="row">
										<div class="form-group" id="start-survey">
											<input type="submit" name="submit" id="submit" value="Start Survey" class="btn btn-danger"/>
										</div>
									</div>
								</div>
						</div>
					</div>
				</div>	
			</form>	
		</div>
	  </div><br/><br/><br/><br/>
	<nav class="navbar navbar-default navbar-fixed-bottom progbar">
	</nav>
  </body>
</html>
