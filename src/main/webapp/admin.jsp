<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged In !! LogIn First");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("Normal")) {
            session.setAttribute("message", "You are not Admin! You cannot access this page");
            response.sendRedirect("login.jsp");
            return;
        }

    }


%>

 <%                                
                  CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cdao.getCategories();
				

//getting count


Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());
                            %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file =  "components/common_css_js.jsp" %>

<link href="./css/style.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="./js/script.js" type="text/javascript"></script>

        <style>
            <%@ include file="css/style.css"%>
        </style>

    </head>
    <body class="admin-body">
        <%@include file =  "components/navbar.jsp"%>


        <div class="container admin">

            <div class="container-fluid mt-3">
                <%@include file = "components/message.jsp" %>

            </div>





            <div class="row mt-3">
                <!-- Column1 -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/team.png" alt="User Image"/>
                            </div>
                        
                            <h2>  <%= m.get("userCount")%></h2>
                            <h1 class="text-uppercase text-muted"> Users</h1>
                        </div>
                    </div>
                </div>
                <!-- Column2 -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid " src="img/list.png" alt="User Image"/>
                            </div>

                            <h2> <%= list.size() %></h2>
                            <h1 class="text-uppercase text-muted"> Categories</h1>
                        </div>
                    </div>
                </div>
                <!-- Column3 -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid " src="img/product.png" alt="User Image"/>
                            </div>

                            <h2> <%= m.get("productCount")%></h2>
                            <h1 class="text-uppercase text-muted"> Products</h1>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row mt-3">

                <!-- 2nd Row Column1 -->
                <div class="col-md-6" data-toggle="modal" data-target="#add-category-modal">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid " src="img/keys.png" alt="User Image"/>
                            </div>

                            <p class="mt-3">Click here to add new Categories </p>
                            <h1 class="text-uppercase text-muted"> add category</h1>
                        </div>
                    </div>
                </div>
                <!-- 2nd Row Column2 -->
                <div class="col-md-6 " data-toggle="modal" data-target="#add-product-modal">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid " src="img/plus.png" alt="User Image"/>
                            </div>

                            <p class="mt-3">Click here to add new Products </p>
                            <h1 class="text-uppercase text-muted"> add Product</h1>
                        </div>
                    </div>
                </div>

            </div>


        </div>




        <!-- Modal for category -->


        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">


                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Name" required="">
                            </div>


                            <div class="form-group">
                                <textarea class="form-control" style="height:200px" name="catDesctiption" placeholder="Enter Category Description" required=""></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success"> Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>


                        </form>
                    </div>

                </div>
            </div>
        </div>








        <!-- Modal for ADD Product -->


        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product details </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct">


                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter Product Title" required="">
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" style="height:100px" name="pDesc" placeholder="Enter Product Description" required=""></textarea>
                            </div>



                            <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required="">
                            </div>

                            <div class="form-group">                                
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required="">
                            </div> 

                            <div class="form-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity " required="">
                            </div>

                            <!-- product Category  -->
                           


                            <div class="form-group">                                
                                <label>Select Product Category</label>
                                <select class="form-control" name="catId">
                                    
                                    <% for(Category c :list){
                                    %>
                                    
                                      
                                    
                                    
                                    <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                                   <% } %>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="pPic">Select Picture of Product</label>
                                <input type="file" id ="pPic"class="form-control" name="pPic" placeholder="Enter Product Photo" required="">
                            </div>


                            <div class="container text-center">
                                <button class="btn btn-outline-success"> Add Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>


                        </form>
                    </div>

                </div>
            </div>
        </div>

<%@include file = "components/common_modals.jsp" %>


    </body>
</html>
