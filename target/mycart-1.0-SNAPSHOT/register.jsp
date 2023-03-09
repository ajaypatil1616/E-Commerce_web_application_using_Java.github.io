

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>

        <%@include file =  "components/common_css_js.jsp" %>

        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <%@include file =  "components/navbar.jsp"%>
        <div class="container-fluid">
             <div class="row mt-5">
            <div class="col-md-4 offset-md-4">


                <div class="card">
                    <%@include file = "components/message.jsp" %>
                    
                    
                    <div class="card-body px-5 bg-gradient" style="background: aqua">
                        <h3 class="text-center">Sign Up here !!</h3>
                        <form action="RegisterServlet" method="post">

                            <div class="form-group">
                                <label for="name">User Name</label>
                                <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Your Name">

                            </div>

                            <div class="form-group">
                                <label for="email">User Email</label>
                                <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Your Email">

                            </div>

                            <div class="form-group">
                                <label for="Password">User Password</label>
                                <input name="user_password" type="Password" class="form-control" id="Password" aria-describedby="emailHelp" placeholder="Enter Your Password">

                            </div>

                            <div class="form-group">
                                <label for="Phone">User Phone</label>
                                <input name="user_phone" type="number" class="form-control" id="Phone" aria-describedby="emailHelp" placeholder="Enter Your Phone">

                            </div>

                            <div class="form-group">
                                <label for="Address">User Address</label>
                                <textarea name="user_address" class="form-control" style="height:100px" placeholder="Enter your address">
                            
                                </textarea>

                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Register</button>
                                <button type="reset" class="btn btn-outline-warning">Reset</button>


                            </div>
                        </form>
                    </div>
                </div>

            </div>

        </div>
        </div>
    </body>
</html>
