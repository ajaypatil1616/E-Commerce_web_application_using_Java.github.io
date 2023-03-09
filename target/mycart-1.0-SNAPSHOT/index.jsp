<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>

        <%@include file =  "components/common_css_js.jsp" %>
	<link href="./css/style.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="./js/script.js" type="text/javascript"></script>
    </head>
    <body>

	<%@include file =  "components/navbar.jsp"%>
	<div class="container-fluid">
	    <div class="row mt-3 mx-2">

		<%	String cat = request.getParameter("category");

			ProductDao dao = new ProductDao(FactoryProvider.getFactory());
			List<Product> list = null;
			if (cat == null || cat.trim().equals("all")) {
				list = dao.getAllProducts();
			} else {
				int cid = Integer.parseInt(cat.trim());
				list = dao.getAllProductsById(cid);
			}

			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategories();

		%>    

		<!--     //For Categories -->

		<div class="col-md-2 mt-4">
		    <div class="list-group">


<a href="index.jsp?category=all" class="list-group-item list-group-item-action active custom-bg">
			    All Products
			</a>
		    </div>
		    <%			for (Category c : clist) {

		    %>
		    <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action">
			<%= c.getCategoryTitle()%></a>

		    <%
			    }


		    %>

		</div>


		<!--     //For Products -->
		<div class="col-md-10">


		    <Div class="row mt-4">
			<div class="col-md-12">


			    <div class="card-columns">



				<!--<!-- Travesing products -->
				<%					for (Product p : list) {
				%>
				<div class="card product-card">

				    <div class="container text-center">
					<img src="img/products/<%= p.getpPhoto()%>" style="max-height:200px;max-width: 100%;width: auto" class="card-img-top m-2" alt="..">
				    </div>
				    <div class="card-body">
					<h5 class="card-title"><%= p.getpName()%></h5>
					<p class="card-text"><%= Helper.get10Words(p.getpDesc())%></p>
				    </div>
				    <div class="card-footer text-center">
					
					<button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getProductId()%> ,'<%= p.getpName()%>', <%= p.getPriceAfterApplyingDiscount()%>)">Add to Card</button>
		
		
		
		
					<button class="btn btn-outline-success ">&#8377 
					    <%= p.getPriceAfterApplyingDiscount()%>/-  
	 <span class="text-secondary discount-label" style=" font-size: 12px;
    font-style: italic!important;text-decoration: line-through">&#8377;
						<%= p.getpPrice()%>
						<%= p.getpDiscount()%>% off
	 </span>
					</button>
				    </div>
				</div>

				<% }

					if (list.size() == 0) {
						out.println("<h3>" + "no items in this category" + "</h3>");
					}
				%>
			    </div>
			</div>
		    </Div>

		</div>
	    </div>




	</div>
	<%@include file = "components/common_modals.jsp" %>			    
	    
    </body>
</html>
