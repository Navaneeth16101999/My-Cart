
<%@page import="com.learn.myproject.helper.Helper"%>
<%@page import="com.learn.myproject.entities.Category"%>
<%@page import="com.learn.myproject.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.myproject.entities.Product"%>
<%@page import="com.learn.myproject.dao.ProductDao"%>
<%@page import="com.learn.myproject.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Navaneeth project</title>
    <%@include file="components/common_css_js.jsp"%>
</head>

<body>

    <%@include file="components/navbar.jsp"%>
    <div class="container-fluid">
        <div class="row mt-3 mx-2">


            <%  String cat = request.getParameter("category");
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = null;

                if (cat == null || cat.trim().equals("all")) {
                    list = dao.getAllProducts();
                } else {
                    int cid = Integer.parseInt(cat.trim());
                    list = dao.getAllProductsById(cid);
                }

                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getcategories();

            %>

            <!--show categories-->
            <div class="col-md-2">
                <div class="list-group mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All Products
                    </a>
                    <%for (Category c : clist) {
                    %>
                    <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                    <%  }
                    %>
                </div>
            </div>


            <!-- show products-->
            <div class="col-md-10">

                <!--row-->
                <div class="row mt-4">
                    <!--COL:12-->
                    <div class="col-md-12">

                        <div class="card-columns">
                            <!-- traversing products-->
                            <%
                                for (Product p : list) {
                            %>
                            <!--product card-->
                            <div class="card product-card">
                                <img src="img/products/<%= p.getpPhoto()%>" class="card-img-top" alt="...">

                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getpName()%></h5>
                                    <p class="card-text">
                                        <%= Helper.get10Words(p.getpDesc())%>
                                    </p>

                                </div>
                                <div class="card-footer text-center">
                                    <button class="btn custom-bg text-white" onclick="add_to_cart('<%= p.getPiId()%>', '<%= p.getpName()%>', '<%= p.priceAfterApplyDiscount()%>')">Add to cart</button>
                                    <button class="btn btn-outline-success"> &#8377;<%= p.priceAfterApplyDiscount()%>/-<span class="text-secondary discount-label"> &#8377; <%= p.getpPrice()%> <%= p.getpDiscount()%>%off</span></button>
                                </div>




                            </div>

                            <% }
                                if (list.size() == 0) {
                                    out.println("<h3>No items in this category</h3>");
                                }

                            %>
                        </div>

                    </div>
                </div>


            </div>
        </div>
    </div>
    <!--ensures that it's loaded after the main content of the page.-->
    <%@include file="components/common_modals.jsp"%>
</body>

