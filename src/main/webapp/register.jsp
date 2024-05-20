
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp"%>
        <script>
            function resetForm() {
                document.getElementById("name").value = ""; // Reset user name field
                document.getElementById("email").value = ""; // Reset email field
                document.getElementById("password").value = ""; // Reset password field
                document.getElementById("phone").value = ""; // Reset phone number field
                document.getElementById("address").value = ""; // Reset address field
            }
        </script>

    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-4 offset-md-4">

                    <div class="card">
                        <div class="container">
                            <img style="max-width: 50px" class="img-fluid rounded-circle" src="img/add-friend.png" alt="user_icon">
                        </div>

                        <%@include file="components/message.jsp" %>

                        <div class="card-body px-5">

                            <h3 class="text-center my-3">Sign Up Here</h3>

                            <form action="RegistrationServelet" method="post">

                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter here" aria-describedby="emailHelp">
                                </div>


                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <%-- name is given for fetching the data using name in the servelet--%>
                                    <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter here" aria-describedby="emailHelp">
                                </div>


                                <div class="form-group">
                                    <label for="password">User password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter here" aria-describedby="emailHelp">
                                </div>


                                <div class="form-group">
                                    <label for="phone">Phone Number</label>
                                    <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter here" aria-describedby="emailHelp">
                                </div>


                                <div class="form-group">
                                    <label for="address">User Address</label>
                                    <textarea name="user_address"style="height: 200px;"class="form-control" placeholder="Enter your address"></textarea>
                                </div>


                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-success">Register</button>
                                    <button type="button" class="btn btn-outline-warning" onclick="resetForm()">Reset</button>
                                </div>

                            </form>


                        </div>
                    </div>
                </div>


            </div>
        </div>

    </body>
</html>
