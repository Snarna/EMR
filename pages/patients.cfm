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

        <!-- Animate CSS -->
        <link href="../css/animate.css" rel="stylesheet">

        <!-- Bootstrap core JavaScript -->
        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>

        <!-- My Script -->
        <script>
            function countPatients() {
                $.ajax({
                    url: "../classes/patient/getPatients.cfc",
                    data: {
                        method: "countPatients"
                    },
                    success: function (data) {
                        $("#patientcount").html(data);
                    },
                    error: function (error) {
                        console.log("Error!:" + error);
                    }
                });
            }

            function getPatients() {
                $.ajax({
                    url: "../classes/patient/getPatients.cfc",
                    data: {
                        method: "getPatients"
                    },
                    success: function (data) {
                        $("#patientstablebody").html(data);
                        $("#patientstable tbody tr").click(conf)
                    },
                    error: function (error) {
                        console.log("Error!" + error);
                    }
                });
            }

            function callModal($patientId, $patientId) {
                //Call Not Exist Modal
                if ($patientId == "") {
                    //Change Modal Data
                    $("#confModalId").html($patientId);

                    //Show Modal
                    $("#confModal").modal('show');
                } else {
                    //Change Modal Data
                    $("#existModalId").html($patientId);
                    $("#existCD4Button").attr("onclick", "location.href='../pages/entercd4.cfm?patientId=" + $patientId + "'");
                    $("#existViralButton").attr("onclick", "location.href='../pages/enterviralload.cfm?patientId=" + $patientId + "'");
                    //Show Modal
                    $("#existModal").modal('show');
                }
            }

            function conf() {
                var pid = $($(this).children().get(0)).html();
                var fname = $($(this).children().get(1)).html();
                var lname = $($(this).children().get(2)).html();
                var dob = $($(this).children().get(3)).html();
                $("#confModalPid").html(pid);
                $("#confModalName").html(fname + " " + lname);
                $("#confModalDob").html(dob);
                $("#confModalDetailButton").click(function(){
                  window.location.href = "../pages/patientdetail.cfm?method=getPatientDetail&pid="+pid;
                });
                $("#confModal").modal('show');
            }

            $(document).ready(function () {
                countPatients();
                getPatients();
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
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li>
                            <a href="#">Profile</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Welcome,
                                <cfoutput>#Session.userFname#</cfoutput>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">
                                        <i class="icon-envelope"></i>Support</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="signin.cfm?logout">
                                        <i class="icon-off"></i>Logout</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="col-sm-3 col-md-2 sidebar collapse in" id="sidebar">
                <ul class="nav nav-sidebar">
                    <li class="active">
                        <a href="../pages/patients.cfm">All Patients<span class="sr-only">(current)</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">Patients</h1>
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
                        <table class="table table-striped" id="patientstable">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>DOB</th>
                                    <th>Registered Date</th>
                                </tr>
                            </thead>
                            <tbody id="patientstablebody"></tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-5">
                        Showing 1 to 10 of
                        <span id="patientcount"></span>
                        patient entries
                    </div>
                    <div class="col-sm-7">
                        <ul class="pagination">
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="active">
                                <a href="#">1</a>
                            </li>
                            <li>
                                <a href="#">2</a>
                            </li>
                            <li>
                                <a href="#">3</a>
                            </li>
                            <li>
                                <a href="#">4</a>
                            </li>
                            <li>
                                <a href="#">5</a>
                            </li>
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

    <div id="confModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2 class="modal-title" id="modal-title">Patient ID:
                        <span id="confModalPid"></span>
                    </h2>
                </div>
                <div class="modal-body" id="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <h3>Patient Name: <span id="confModalName"></span></h3>
                        </div>
                        <div class="row">
                            <h3><small>Date of Birth:<span id="confModalDob"></span></small></h3>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    Click Button To View Patient Details And More &nbsp;
                    <button type="button" class="btn btn-primary" id="confModalDetailButton">Details</button>
                </div>
            </div>

        </div>
    </div>

</html>
