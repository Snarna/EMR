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
	<script>
		function editSurveyCode(surveyCode, codeAvail){
                window.location.href = "editSurveyCode.cfm?surveyCode=" + surveyCode + "&codeAvail=" + codeAvail;
            }
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
                            <a href="adminLogin.cfm?logout" style="color:white;">Sign Out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
	  
	<div class="container-fluid admin-page">
		<h1>Survey Codes Availibility</h1><hr/>
		<form action="newSurveyCode.cfm" style="padding-top:1%;padding-bottom:1%;text-align:center;">
		<p>
			<input type="submit" name="submit" id="submit" value="Create new survey code" class="btn btn-primary"/>
		</p>
		</form>
                        <div class="table-responsive">
                            <table class="table table-hover" id="patientstable">
								<cfinvoke component="SURVEYAPP.classes.admin.survCodeDisp" method="getSurvCode" returnvariable="returnCodeQuery"></cfinvoke>
                                <thead>
                                    <tr>
                                        <th>Survey Code</th>
                                        <th>Used</th>
                                    </tr>
                                </thead>
                                <tbody>
									<cfoutput query="returnCodeQuery">
										<tr>
											<td>#surveyCode#</td>
											<td>
												<cfif #codeUsed# LT 1>
												<span style="color:skyblue" class="glyphicon glyphicon-remove"></span>
													<cfelse><span style="color:dodgerblue" class="glyphicon glyphicon-ok"></span></i>
												</cfif>
											</td>
										</tr>
									</cfoutput>
								</tbody>
                            </table>
                        </div>
	</div><br/><br/>
		
	<nav class="navbar navbar-default navbar-fixed-bottom progbar">
		
	</nav>
  </body>
</html>
