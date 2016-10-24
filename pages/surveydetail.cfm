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

    <!-- Animate CSS -->
    <link href="../css/animate.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript -->
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>

    <!-- My Script -->
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
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Welcome, <cfoutput>#Session.userFname#</cfoutput> <b class="caret"></b></a>
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
      <div class="row">
          <ol class="breadcrumb">
              <li>
                  <a href="patients.cfm">Patients</a>
              </li>
              <li class="active">Details</li>
          </ol>
      </div>
        <div class="main">
          <div class="row">
              <div class="col-sm-12">
                  <h1 class="page-header">Survey Detail</h1>
              </div>
          </div>
            <!--Patient Information Section -->
            <div class="row">
              <h2>Patient Information:</h2>
            </div>
            <div class="row">
              Patient info detail...
              <br>
              ................................
              <br>
              ....................................
            </div>
            <br>
            <!-- Surveys Information Secton -->
            <div class="row">
                <h2>Survey Details:</h2>
            </div>
            <div class="row">

                Survey Details...
                <br>
                ................................
                <br>
                ....................................

            </div>
          </div>
      </div>
</body>

</html>
