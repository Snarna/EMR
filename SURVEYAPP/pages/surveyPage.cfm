
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
	<link href="../css/jquery-ui.min.css" rel="stylesheet">
	<link href="../css/signin.css" rel="stylesheet">
	<link href="../css/animate.css" rel="stylesheet">
	  

    <!-- Bootstrap core JavaScript -->
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
	  <script src="../js/jquery.validate.js"></script>
	<script src="../js/checkbox-x.js"></script>
	  <script src="../js/multipage.js"></script>
	  <script src="../js/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(window).ready(function() {
   
		   $( function() {
			$( "#dob" ).datepicker({
				//format: mm/dd/yyyy,
				changeMonth: true,
				changeYear: true,
				maxDate: '@maxDate',
				yearRange: '1916:2016'
			});

		      });
		});
	  </script>
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
                            <a href="index.cfm">Exit Survey</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
	  
	<cfquery datasource="surveyApp" name="survCode">
		SELECT surveyCode FROM surveyTracker
		WHERE surveyCode = '#form.surveyCode#' AND codeAvail > 0
	</cfquery>
	  
	<div class="container">
		<cfif len(survCode.surveyCode)>		
			<div id="extraControls" class="hidden">	
			<form class="form" method="post" action="/SURVEYAPP/classes/api/surveyApp.cfc?method=sendSurveyData">
					<input name="surveyCode" id="surveyCode" type="hidden" value=<cfoutput>#form.surveyCode#</cfoutput>>
				
				
				
					<div class="step" id="page_one">
						<div class="modal-dialog animated fadeInDown">
							<div class="modal-content mytransparent">
								<div class="modal-header">
									<h1 class="text-center">Tell us about yourself.</h1>
								</div>
								<div class="modal-body">
										<div class="form-group smalltext">
											<div class="row">
												<div class="form-group"> 
													<input class="form-control" name="fname" id="fname" placeholder="First Name" type="text">
												</div>
											</div>
											<div class="row">
												<div class="form-group">
													<input class="form-control" name="lname" id="lname" placeholder="Last Name" type="text">
												</div>
											</div>
											<div class="row">
												<div class="form-group">
													<input class="form-control" name="dob" id="dob" placeholder="Date of Birth (YYYY-MM-DD)" type="text">
												</div>	
											</div>
										</div>
								</div>
							</div>
						</div>
					</div>


					<div class="step" id="page_two">
						<div class="form-group smalltext">
							<div class="modal-dialog animated">
								<div class="modal-content mytransparent">
									<div class="modal-header">
										<h3 class="text-center">In the last two weeks, how many doses of HIV medications have you missed?</h3>
									</div>
									<div class="modal-body">
										<div class="form-group smalltext">
											<div class="row">
												<div class="form-group">
													<label for="doses">Missed Doses: </label>
												</div>
												<div class="form-group"> 
													<select class="form-control" name="q1"  id="q1">
														<option>0</option>
														<option>1</option>
														<option>2</option>
														<option>3</option>
														<option>4</option>
														<option>5</option>
														<option>6</option>
														<option>7</option>
														<option>8</option>
														<option>9</option>
														<option>10</option>	
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="step" id="page_three">
						<div class="form-group smalltext">
							<div class="modal-dialog animated">
								<div class="modal-content mytransparent">
									<div class="modal-header">
										<h3 class="text-center">In the last two weeks, how many days did you miss at least one dose of an HIV medication?</h3>
									</div>
									<div class="modal-body">
										<div class="form-group smalltext">
											<div class="row">
												<div class="form-group">
													<label for="doses">Missed Days: </label>
												</div>
												<div class="form-group"> 
													<select class="form-control" name="q2" id="q2">
														<option>0</option>
														<option>1</option>
														<option>2</option>
														<option>3</option>
														<option>4</option>
														<option>5</option>
														<option>6</option>
														<option>7</option>
														<option>8</option>
														<option>9</option>
														<option>10</option>	
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="step" id="page_four">
						<div class="form-group smalltext">
							<div class="modal-dialog animated">
								<div class="modal-content mytransparent">
									<div class="modal-header">
										<h3 class="text-center">Please list any side-effects that occurred in the last two weeks.</h3>
									</div>
									<div class="modal-body">
										<div class="form-group smalltext">
											<div class="row">
												<div class="form-group">
													<label for="doses">Side effects: </label>
												</div>
												<div class="form-group"> 
													<textarea class="form-control" name="q3" id="q3" placeholder="" type="text" rows="3"></textarea>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="surv-btn">
							<button type="button" class="btn btn-secondary action back">Back</button>
							<button type="button" class="btn btn-primary action next">Next</button>
							<button type="submit" class="btn btn-primary action submit">Submit</button>
					</div>	
					</form> 
				</div>			
			
			<cfelse><cfoutput><h2>Survey Code doesn't exist or already used. <a href="index.cfm">Go back.</a></h2></cfoutput>
			</cfif>
	</div><br/><br/><br/><br/>
		
	<nav class="navbar navbar-default navbar-fixed-bottom progbar">
		<div class="container-fluid">
			<br/>
		<div class="progress">
		  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
		</div>
		</div>
	</nav>
		
		
	
	 
  </body>
</html>
