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

    <!-- Bootstrap core JavaScript -->
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>

    <!-- My Script -->
    <script src="../js/miscScript.js"></script>
    <script>
        function getPatientInfo() {
            var tempPatientId = getUrlParameter('patientId');
            if (tempPatientId != "") {
                $("#patientId").val(tempPatientId);
            }
        }

        $(document).ready(function() {
            //Call Get Patient Info
            getPatientInfo();
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
                <a class="navbar-brand" href="#">EMR Home</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Profile</a></li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Welcome, XXXX <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="icon-envelope"></i>Support</a></li>
                            <li class="divider"></li>
                            <li><a href="#"><i class="icon-off"></i>Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="col-sm-3 col-md-2 sidebar collapse in" id="sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="../pages/surveys.cfm">All Surveys<span class="sr-only">(current)</span></a></li>
                <li><a href="../pages/surveydetail.cfm">Survey Deatil</a></li>
                <li><a href="../pages/patientdetail.cfm">Patient Detail</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="../pages/createprofile.cfm">Create New Profile</a></li>
                <li class="active"><a href="../pages/entercd4.cfm">Enter CD4</a></li>
                <li><a href="../pages/enterviralload.cfm">Enter Viral Load</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">Enter Viral Load Information:</h1>
            <div class="row">
                <form id="vlform">
                  <div class="form-group">
                      <label for="patientId">Patient ID*:</label>
                      <input type="text" class="form-control" id="patientId" required>
                  </div>
                    <div class="form-group">
                        <label for="notes">Viral Load Information*:</label>
                        <textarea class="form-control" id="notes" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Submit</button>
                </form>
            </div>
        </div>
    </div>
</body>

</html>
