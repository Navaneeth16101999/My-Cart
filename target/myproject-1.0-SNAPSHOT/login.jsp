<%--
    Document   : login
    Created on : 09-Apr-2024, 12:23:38 AM
    Author     : navan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card m-3">
                        <div class="card-header  custom-bg text-white">
                            <h3>login here</h3>

                        </div>
                        <div class="card-body">
                            <%@include file="components/message.jsp"%>
                            <form action="LoginServelet" method="post">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <div class="mb-3 form-check">


                                </div>
                                <a href="register.jsp" class="text-center d-block mb-4">If not registered click here</a>
                                <div class="container text-center">


                                    <button type="submit" class="btn btn-primary custom-bg text white">Submit</button>
                                    <button type="reset" class="btn btn-primary custom-bg text white ">Reset</button>

                                </div>

                            </form>


                        </div>

                    </div>


                </div>
            </div>
        </div>
    </body>
</html>
