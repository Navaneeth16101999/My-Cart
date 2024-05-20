
<%@page import="com.learn.myproject.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.myproject.dao.CategoryDao"%>
<%@page import="com.learn.myproject.helper.FactoryProvider"%>
<%@page import="com.learn.myproject.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "you are not logged in!! Log In first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUsertype().equals("normal")) {
            session.setAttribute("message", "you are not admin do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>



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

        <div class="container admin">
            <div class="container-fluid">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row mt-3">

                <!--col 1 -->
                <div class="col-md-4">

                    <!-- this is first box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon">
                            </div>
                            <h1>25687</h1>

                            <h1 class="text-uppercase text-muted">Users</h1>


                        </div>




                    </div>



                </div>


                <!--col 2 -->

                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">
                            </div>
                            <h1>25687</h1>

                            <h1 class="text-uppercase text-muted">Categories</h1>

                        </div>
                    </div>




                </div>
                <!--col 3 -->

                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/delivery-box.png" alt="user_icon">
                            </div>
                            <h1>25687</h1>

                            <h1 class="text-uppercase text-muted">Products  </h1>

                        </div>
                    </div>

                </div>


            </div>
            <!--Second Row-->
            <div class="row mt-3">
                <!--second row first column-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/application.png" alt="user_icon">
                            </div>
                            <p class="mt-2">Click here to add new category</p>

                            <h1 class="text-uppercase text-muted">Add category</h1>

                        </div>
                    </div>
                </div>
                <!--second row second column-->

                <div class="col-md-6">
                    <!-- The data-toggle attribute indicates the action that will trigger the modal, and data-target specifies the modal that should be triggered. In this case, it seems to be targeting a modal with the ID "add-product-modal".-->
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon">
                            </div>
                            <p class="mt-2">Click here to add new products</p>

                            <h1 class="text-uppercase text-muted">Add Products</h1>

                        </div>
                    </div>
                </div>
            </div>



        </div>
        <!--add category modal-->
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServelet" method="post">
                            <input type="hidden" name="operation" value="addcategory">


                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>
                            </div>


                            <div class="form-group">
                                <textarea style="height: 350px" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
                            </div>


                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>







                        </form>





                    </div>

                </div>
            </div>
        </div>
        <!--End category model-->




        <!--        Product modal-->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServelet" method="post" enctype="multipart/form-data">
                            <!-- enctype="multipart/form-data suggest there can be file and image data  -->
                            <input type="hidden" name="operation" value="addproduct">
                            <!--product title-->
                            <div class="form-group">
                                <input type="text" class="form-control"  placeholder="Enter Title Of product" name="pName" required/>
                            </div>
                            <!--product description-->
                            <div class="form-group">
                                <textarea style="height: 150px" class="form-control" placeholder="Enter product Description" name="pDesc"></textarea>
                            </div>
                            <!-- product price-->
                            <div class="form-group">
                                <input type="text" class="form-control"  placeholder="Enter product price" name="pPrice" required/>
                            </div>


                            <div class="form-group">
                                <input type="text" class="form-control"  placeholder="Enter product discount" name="pDiscount" required/>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control"  placeholder="Enter product quantity" name="pQuantity" required/>
                            </div>

                            <% CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cdao.getcategories();
                            %>

                            <div class="form-group">
                                <select name="catId" class="form-control" id="" >
                                    <%for (Category c : list) {
                                    %>
                                    <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                                    <% }%>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="pPic">Upload product photo:</label>
                                <br>
                                <input type="file" name="pPic" id="pPic" required/>
                            </div>
                            <!--submit button-->
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--        End Add Product Modal -->


        <%@include file="components/common_modals.jsp"%>

    </body>
</html>
