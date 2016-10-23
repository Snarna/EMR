<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta HTMLCodeFormat(string [, version ])p-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="EMR User Home Page">
        <meta name="author" content="Snarna">

        <title>Client Home Page</title>

        <!-- Bootstrap core CSS -->
        <link href="../css/bootstrap-cerulean.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../css/dashboard.css" rel="stylesheet">

        <!-- Sign In Page CSS -->
        <link href="../css/signin.css" rel="stylesheet">

        <!-- Animate CSS -->
        <link href="../css/animate.css" rel="stylesheet">

        <!-- Bootstrap core JavaScript -->
        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>

        <!-- My Script -->
        <script>
            $(document).ready(function () {
                //Hide Msg Div
                $("#loginresponsediv").hide();

                //On Form Submit
                $("form").submit(function (event) {
                    //Hide Msg Div
                    $("#loginresponsediv").hide();
                    //Prevent Submit
                    event.preventDefault();
                    //Get Information From Form
                    var email = $("#inputemail").val();
                    var password = $("#inputpassword").val();
                    if (email && password) {
                        $.ajax({
                            url: "../classes/auth/loginService.cfc",
                            type: "POST",
                            data: {
                                method: "doLogin",
                                email: email,
                                password: password
                            },
                            success: function (data) {
                                if (data) {
                                    //Success
                                    window.location.href = "../pages/patients.cfm";
                                } else {
                                    $("#loginresponsediv").html(data);
                                    $("#loginresponsediv").show();
                                    $("#loginresponsediv").addClass("animated shake");
                                    $("#loginresponsediv").one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", function () {
                                        $("#loginresponsediv").removeClass("animated shake");
                                    });
                                }
                            },
                            error: function (err) {
                                $("#loginresponsediv").html(data);
                                $("#loginresponsediv").show();
                                $("#loginresponsediv").addClass("animated shake");
                                $("#loginresponsediv").one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", function () {
                                    $("#loginresponsediv").removeClass("animated shake");
                                });
                            }
                        });
                    }
                });
            });
        </script>
    </head>

    <body>
        <nav class="navbar navbar-default navbar-fixed-top mytransparent">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">EMR Home</a>
                </div>
            </div>
        </nav>

        <!-- main container -->
        <div class="container-fluid">
            <div class="modal-dialog animated fadeIn">
                <div class="modal-content mytransparent">
                    <div class="modal-header">
                        <h1 class="text-center">Welcome EMR System</h1>
                    </div>
                    <div class="modal-body">
                        <form id="signinform">
                            <div class="alert alert-danger" id="loginresponsediv" style="display:none;"></div>
                            <div class="form-group">
                                <input type="text" class="form-control input-lg" name="username" id="username" placeholder="Username"/>
                            </div>

                            <div class="form-group">
                                <input type="password" class="form-control input-lg" name="password" id="password" placeholder="Password"/>
                            </div>

                            <div class="form-group">
                                <button type="submit">Login</button>
                            </div>
                            <span>
                                <a href="#">Forgot Password</a>
                            </span>
                            <span class="pull-right">
                                <a href="../pages/signup.cfm">Sign Up</a>
                            </span>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
