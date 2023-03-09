<%	 User user = (User) session.getAttribute("current-user");
	if (user == null) {
		session.setAttribute("message", "You are not logged In !! LogIn First for accessing checkout");
		response.sendRedirect("login.jsp");
		return;
	}

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
	<%@include file =  "components/common_css_js.jsp" %>
	<link href="./css/style.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="./js/script.js" type="text/javascript"></script>
    </head>
    <body>
	<%@include file =  "components/navbar.jsp"%>

	<div class="container">
	    <div class="row mt-5">
		<!<!-- Card  -->
		<div class="col-md-6">
		    <div class="card">
			<h2 class="text-center mb-5 mt-3">Your selected items</h2>
			<div class="card-body">
			    <div class="cart-body">

			    </div>
			</div>
		    </div>

		</div>




		<!<!-- Form details -->
		<div class="col-md-6">
		    <div class="card">
			<h2 class="text-center mb-5 mt-3">Your details for order</h2>
			<div class="card-body">
			    <form>
				<div class="form-group">
				    <label for="exampleInputEmail1">Email address</label>
				    <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
				    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
				    <div class="form-group">  
					<label for="exampleInputEmail1">Your Name</label>
					<input value="<%= user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
				    </div>
				      <div class="form-group">   
					  <label for="exampleInputEmail1">Mobile Phone</label>
					<input value="<%= user.getUserPhone()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Mobile number">
				    </div>
				    <div class="form-group">
					<label for="exampleInputEmail1">Your shipping address</label>	<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Your address"></textarea></div>
				</div>
				<div class="container text-center">
				    <button class="btn btn-outline-success">Order Now</button>
				    <button class="btn btn-outline-primary" onclick="goTOContinueShopping()">Continue Shopping</button>
				</div>
			</div>
		    </div>
		</div>
	    </div>
	</div>
	<%@include file = "components/common_modals.jsp" %>	
    </body>
</html>
