
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
	  <script src="../js/jquery.multipage.js"></script>
	  <script type="text/javascript">
		$(window).ready(function() {
            $('#multipage').multipage({transitionFunction:transition,stateFunction: textpages});
		});
		
		function transition(from,to) {
			$(from).fadeOut('fast',function(){$(to).fadeIn('fast');});
		
		}
		function textpages(obj,page,pages) { 
			$(obj).html(page + ' of ' + pages);
		}

	</script>
	<script src="../js/checkbox-x.js"></script>
	
  </head>

  <body>
	<nav class="navbar navbar-default navbar-fixed-top progbar">
		<div class="container-fluid">
			<h1>SURVEY TABLET APP</h1>
		</div>
	</nav>
	  
	<cfquery datasource="surveyApp" name="survCode">
		SELECT surveyCode FROM adminData
		WHERE surveyCode = '#form.surveyCode#'
	</cfquery>
	  
	<div class="container-fluid surv-quest">
		
		<cfif len(survCode.surveyCode)>
			<form id="multipage" method="post" action="/SURVEYAPP/classes/api/surveyApp.cfc?method=sendSurveyData">
				<fieldset id="page_one">
					<legend>
						<cfoutput>
							<h1>What is your First Name?</h1>
						</cfoutput>
					</legend>
					<p class="input">
						<label for="fname">First Name</label>
                		<input type="text" name="fname" id="fname">
					</p>		
					<div class="surv-btn">
					<input type="button" class="btn btn-primary" onclick="return $('#multipage').nextpage();" name="next" value="Next">
					</div>
				</fieldset>
				<fieldset id="page_two">
					<legend>
						<cfoutput>
							<h1>What is your Last Name?</h1>
						</cfoutput>
					</legend>
					<p class="input">
						<label for="lname">Last Name</label>
                		<input type="text" name="lname" id="lname">
					</p>		
					
					<div class="surv-btn">
					<input type="button" class="btn btn-secondary" onclick="return $('#multipage').prevpage();" name="next" value="Back">
					<input type="button" class="btn btn-primary" onclick="return $('#multipage').nextpage();" name="next" value="Next">
					</div>
				</fieldset>
				<fieldset id="page_three">
					<legend>
						<cfoutput>
							<h1>What is your DOB?</h1>
						</cfoutput>
					</legend>
					<p class="input">
						<label for="dob">DOB</label>
                		<input type="text" name="dob" id="dob">
					</p>	
					<div class="surv-btn">
					<input type="button" class="btn btn-secondary" onclick="return $('#multipage').prevpage();" name="next" value="Back">
					<input type="button" class="btn btn-primary" onclick="return $('#multipage').nextpage();" name="next" value="Next">
					</div>
				</fieldset>
				<fieldset id="page_four">
					<legend>
						<cfoutput>
							<h1>Question 4?</h1>
						</cfoutput>
					</legend>
					<p class="input">
						<label for="q4">Q4</label>
                		<input type="text" name="q4" id="q4">
					</p>	
					<div class="surv-btn">
					<input type="button" class="btn btn-secondary" onclick="return $('#multipage').prevpage();" name="next" value="Back">
					<input type="submit" class="btn btn-primary" name="submit" id="submit" value="Submit">
					</div>
				</fieldset>
			</form>
			<cfelse><cfoutput><h2>Survey Code doesn't exist. <a href="index.cfm">Go back.</a></h2></cfoutput>
			</cfif>
	</div>
		
	<nav class="navbar navbar-default navbar-fixed-bottom progbar">
		<div class="container-fluid">
			<div>
				<h5></h5>
			</div>
			<div id="outerProg">
				<div id="innerProg"></div>
			</div>
		</div>
	</nav>
  </body>
</html>
