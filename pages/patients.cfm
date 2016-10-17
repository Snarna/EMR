<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="EMR User Home Page">
    <meta name="author" content="Snarna">

    <title>Patient Home Page</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap-cerulean.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/dashboard.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript -->
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>

    <!-- My Script -->
    <script>
        function callModal($surveyId, $patientId){
          //Call Not Exist Modal
          if($patientId == ""){
            //Change Modal Data
            $("#notExistModalId").html($surveyId);

            //Show Modal
            $("#notExistModal").modal('show');
          }
          //Call Exist Modal
          else{
            //Change Modal Data
            $("#existModalId").html($surveyId);
            $("#existCD4Button").attr("onclick", "location.href='../pages/entercd4.cfm?patientId="+$patientId+"'");
            $("#existViralButton").attr("onclick", "location.href='../pages/enterviralload.cfm?patientId="+$patientId+"'");
            //Show Modal
            $("#existModal").modal('show');
          }
        }

        function loalModalPreview() {
            //Get info from data table row
            var $surveyId = $($(this).children().get(0)).html();
            var $patientId = "123456";

            $.ajax({
              url: "../classes/surveys/modalpreview.cfc?method=loadmodalpreview",
              data: {
                surveyId : $surveyId
              },
              success:function(data){
                console.log("I've received:" + data);
                callModal($surveyId, $patientId);
              },
              error:function(error){
                console.log("Error!:" + error);
              }
            });
        }

        $(document).ready(function() {
            $("#surveystable tbody tr").click(loalModalPreview);
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
                <li class="active"><a href="../pages/patients.cfm">All Surveys<span class="sr-only">(current)</span></a></li>
                <li><a href="../pages/surveydetail.cfm">Survey Deatil</a></li>
                <li><a href="../pages/patientdetail.cfm">Patient Detail</a></li>
            </ul>
            <ul class="nav nav-sidebar">

                <li><a href="../pages/entercd4.cfm">Enter CD4</a></li>
                <li><a href="../pages/enterviralload.cfm">Enter Viral Load</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">All Surveys</h1>
            <div class="row">
                <div class="col-sm-12">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="ID / Name">
                        <span class="input-group-btn">
                          <button class="btn btn-default" type="button">Search</button>
                        </span>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="table-responsive">
                    <table class="table table-striped" id="surveystable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Survey Type</th>
                                <th>Date Taken</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1,001</td>
                                <td>Lorem</td>
                                <td>ipsum</td>
                                <td>dolor</td>
                                <td>XXX</td>
                            </tr>
                            <tr>
                                <td>1,002</td>
                                <td>amet</td>
                                <td>consectetur</td>
                                <td>adipiscing</td>
                                <td>XXX</td>
                            </tr>
                            <tr>
                                <td>1,003</td>
                                <td>Integer</td>
                                <td>nec</td>
                                <td>odio</td>
                                <td>XXX</td>
                            </tr>
                            <tr>
                                <td>1,003</td>
                                <td>libero</td>
                                <td>Sed</td>
                                <td>cursus</td>
                                <td>XXX</td>
                            </tr>
                            <tr>
                                <td>1,004</td>
                                <td>dapibus</td>
                                <td>diam</td>
                                <td>Sed</td>
                                <td>XXX</td>
                            </tr>
                            <tr>
                                <td>1,005</td>
                                <td>Nulla</td>
                                <td>quis</td>
                                <td>sem</td>
                                <td>XXX</td>
                            </tr>
                            <tr>
                                <td>1,006</td>
                                <td>nibh</td>
                                <td>elementum</td>
                                <td>imperdiet</td>
                                <td>XXX</td>
                            </tr>
                            <tr>
                                <td>1,007</td>
                                <td>sagittis</td>
                                <td>ipsum</td>
                                <td>Praesent</td>
                                <td>XXX</td>
                            </tr>
                            <tr>
                                <td>1,008</td>
                                <td>Fusce</td>
                                <td>nec</td>
                                <td>tellus</td>
                                <td>XXX</td>
                            </tr>
                            <tr>
                                <td>1,009</td>
                                <td>augue</td>
                                <td>semper</td>
                                <td>porta</td>
                                <td>XXX</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-5">
                    Showing 1 to 10 of XXX survey entries
                </div>
                <div class="col-sm-7">
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>

<!-- Modal For Survey-->
<div id="existModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-di smiss="modal">&times;</button>
                <h4 class="modal-title" id="modal-title">Survey ID: <span id="existModalId"></span></h4>
            </div>
            <div class="modal-body" id="modal-body">
              <div class="container-fluid">
                <div class="row">
                  <h3><a href="#">-Patient Information-</a></h3>
                </div>
                <hr>
                <div class="row">
                  Survey content...
                  <br>
                  ...............................
                  <br>
                  ......................................
                </div>
                <hr>
                <div class="row">
                  <button type="button" class="btn">Survey Details..</button>
                </div>
              </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="existCD4Button" onclick="">Enter CD4 Info</button>
                <button type="button" class="btn btn-primary" id="existViralButton" onclick="">Enter Viral Load Info</button>
            </div>
        </div>

    </div>
</div>

<div id="notExistModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" id="modal-title">Survey ID: <span id="notExistModalId"></span></h4>
            </div>
            <div class="modal-body" id="modal-body">
                <div class="container-fluid">
                  <div class="row">
                    <h3>-Patient Information-</h3>
                  </div>
                  <hr>
                  <div class="row">
                    Survey content...
                    <br>
                    ...............................
                    <br>
                    ......................................
                  </div>
                  <hr>
                  <div class="row">
                    <button type="button" class="btn">Survey Details..</button>
                  </div>
                </div>
            </div>
            <div class="modal-footer">
              This patient doesn't have a profile.
                <button type="button" class="btn btn-primary" id="notExistCreateButton" onclick="">Create New Profile</button>
            </div>
        </div>

    </div>
</div>

</html>