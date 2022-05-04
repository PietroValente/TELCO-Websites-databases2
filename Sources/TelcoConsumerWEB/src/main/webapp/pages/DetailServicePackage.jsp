<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TELCO | detail</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="<%= request.getContextPath() %>/pages/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link rel="icon" href="<%= request.getContextPath() %>/pages/assets/img/apple-touch-icon.png">

  <!-- Google Fonts -->
  <link
    href="https:/fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i"
    rel="stylesheet">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
    integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
    crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
    integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
    crossorigin="anonymous"></script>

  <!-- Vendor CSS Files -->
  <link href="<%= request.getContextPath() %>/pages/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/pages/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/pages/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/pages/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/pages/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/pages/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="<%= request.getContextPath() %>/pages/assets/css/style.css" rel="stylesheet">

  <style>
    .round {
      position: relative;
    }

    .round label {
      background-color: #fff;
      border: 1px solid #ccc;
      border-radius: 50%;
      cursor: pointer;
      height: 28px;
      left: 0;
      position: absolute;
      top: 0;
      width: 28px;
    }

    .round label:after {
      border: 2px solid #fff;
      border-top: none;
      border-right: none;
      content: "";
      height: 6px;
      left: 7px;
      opacity: 0;
      position: absolute;
      top: 8px;
      transform: rotate(-45deg);
      width: 12px;
    }

    .round input[type="checkbox"] {
      visibility: hidden;
    }

    .round input[type="checkbox"]:checked+label {
      background-color: #66bb6a;
      border-color: #66bb6a;
    }

    .round input[type="checkbox"]:checked+label:after {
      opacity: 1;
    }

    .card[data-clickable=true] {
      cursor: pointer;
    }
  </style>
</head>

<script type="text/javascript">
  function username() {
	  <%if (request.getParameter("username").compareTo("MyTELCO") != 0) {%>
	  	document.getElementById('mytelco').style.display = 'none';
	  	document.getElementById('usr1').style.display = 'block';
	  	document.getElementById('usr2').style.display = 'block';
	  	document.getElementById('purchased').style.display = 'block';
	  <%}else{%>
	  	document.getElementById('mytelco').style.display = 'block';
	  	document.getElementById('usr1').style.display = 'none';
	  	document.getElementById('usr2').style.display = 'none';
	  	document.getElementById('purchased').style.display = 'none';
	  <%}%>
  }
  window.onload = username;
</script>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <h1 class="text-light"><a href="<%= request.getContextPath() %>/Homepage.do"><span>Telco</span></a></h1>
      </div>

      <!-- Navbar -->
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link" href="<%= request.getContextPath() %>/Homepage.do">Home</a></li>
          <li class="dropdown"><a><span>Service Type</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="<%= request.getContextPath() %>/ServiceType.do?name=fixedphone">Fixed Phone</a></li>
              <li><a href="<%= request.getContextPath() %>/ServiceType.do?name=mobilephone">Mobile Phone</a></li>
              <li><a href="<%= request.getContextPath() %>/ServiceType.do?name=fixedinternet">Fixed Internet</a></li>
              <li><a href="<%= request.getContextPath() %>/ServiceType.do?name=mobileinternet">Mobile Internet</a></li>
            </ul>
          </li>
          <li><a class="nav-link active" href="<%= request.getContextPath() %>/BuyService.do">Buy Service</a></li>
          <li id="purchased"><a class="nav-link" href="<%= request.getContextPath() %>/PurchasedOrders.do">Purchased Orders</a></li>
          <li id="mytelco"><button style="border:none;" type="button" class="getstarted scrollto" data-toggle="modal"
              data-target="#exampleModalLive">MyTELCO</button></li>
          <li id="usr1" style="display:inline;padding:50px;margin-right: -70px;"><b><%out.print(request.getParameter("username"));%></b></li>
          <li id="usr2" ><a href="javascript:;" onclick="document.getElementById('form1').submit();"><img
                src="<%= request.getContextPath() %>/pages/assets/img/logout.png" alt="image alt" title="logout"
                height="20px"></a></li>
				<form id="form1" action="<%= request.getContextPath() %>/Logout.do" method="post"></form>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <!-- MyTELCO -->
  <div id="exampleModalLive" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel"
    aria-hidden="true" style="display: none;">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h1 style="padding-left:80px;">Welcome back!</h1>
          <button style="padding-right:50px;" type="button" class="btn-close" data-dismiss="modal"
            aria-label="Close"></button>
        </div>
        <ul style="margin:auto;width:40%;padding: 10px;" class="nav nav-pills mb-3 red" id="pills-tab" role="tablist">
          <li class="nav-item" role="presentation"><a class="nav-link active" id="pills-log-in-tab" data-toggle="pill"
              href="#pills-log-in" role="tab" aria-controls="pills-log-in" aria-selected="true">Log in</a></li>
          <li class="nav-item" role="presentation"><a class="nav-link" id="pills-sign-in-tab" data-toggle="pill"
              href="#pills-sign-in" role="tab" aria-controls="pills-sign-in" aria-selected="false">Sign-in</a>
          </li>
        </ul>
        <div class="tab-content border-0" id="pills-tabContent">
          <div class="tab-pane active" id="pills-log-in" role="tabpanel" aria-labelledby="pills-log-in-tab">
            <div class="modal-body">
              <div class="text-center">
                <img src="https://gazenergie.ch/fileadmin/_processed_/b/e/csm_Login_c148e8b0a7.png"
                  class="rounded-circle" width="150" alt="User" />
                <form method="POST" action="loginUser.do">
                  <br>
                  <div style="margin:auto;width:40%;padding: 10px;width: 230px;" class="form-group">
                    <input type="text" class="form-control" id="username" name="username" required
                      data-validation-required-message="Please enter your username." autocomplete="off"
                      placeholder="Username">
                  </div>
                  <div style="margin:auto;width:40%;padding: 10px;width: 230px;" class="form-group">
                    <input type="password" class="form-control" id="password" name="password" required
                      data-validation-required-message="Please enter your password." autocomplete="off"
                      placeholder="Password">
                  </div>
              </div>
            </div>
            <div class="modal-footer">
          <button class="btn btn-primary" type="submit" formmethod="post">Enter</button>
              </form>
            </div>
          </div>
          <div class="tab-pane fade" id="pills-sign-in" role="tabpanel" aria-labelledby="pills-sign-in-tab">
            <div class="modal-body">
              <div id="login-form">
                <div class="text-center">
                  <form method="POST" action="signupUser.do">
                    <div style="margin-top: -20px;">
                      <b>Please fill all fields</b>
                    </div>
                    <br>
                    <div class="row">
                      <div class="col-xs-12 col-sm-6">
                        <div style="width: 230px;" class="form-group">
                          <label>First Name<span class="req">*</span> </label>
                          <input type="text" class="form-control" id="first_name" name="first_name" required
                            data-validation-required-message="Please enter your name." autocomplete="off">
                          <p class="help-block text-danger"></p>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div style="width: 230px;" class="form-group">
                          <label> Last Name<span class="req">*</span> </label>
                          <input type="text" class="form-control" id="last_name" name = "last_name" required
                            data-validation-required-message="Please enter your name." autocomplete="off">
                          <p class="help-block text-danger"></p>
                        </div>
                      </div>
                    </div>
                    <div style="margin:auto;width:40%;width: 320px;" class="form-group">
                      <label> Your Username<span class="req">*</span> </label>
                      <input type="text" class="form-control" id="username" name="username" required
                        data-validation-required-message="Please enter your username." autocomplete="off">
                      <p class="help-block text-danger"></p>
                    </div>
                    <div style="margin:auto;width:40%;width: 320px;" class="form-group">
                      <label> Your Email<span class="req">*</span> </label>
                      <input type="email" class="form-control" id="email" name ="email" required
                        data-validation-required-message="Please enter your email address." autocomplete="off">
                      <p class="help-block text-danger"></p>
                    </div>
                    <div style="margin:auto;width:40%;width: 320px;" class="form-group">
                      <label> Password<span class="req">*</span> </label>
                      <input type="password" class="form-control" id="password" name ="password" required
                        data-validation-required-message="Please enter your password" autocomplete="off">
                      <p class="help-block text-danger"></p>
                    </div>
                    <br>
                </div>
              </div>
              <div class="modal-footer">
             <button class="btn btn-primary" type="submit" formmethod="post">Register</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div><!-- End MyTELCO -->

  <!-- Main -->
  <main style="padding:50px" id="main">
    <div class="d-flex justify-content-center">
      <form method="GET" action="<%= request.getContextPath() %>/BuyService.do">
        <button class="btn btn-outline-secondary" type="submit" formmethod="get">Back</button>
      </form>
    </div><br>
    <div class="row row-cols-1 row-cols-md-1 g-4">
      <div class="col">
        <div class="card">
          <div class="card-header">
            <small class="text-muted"><b>ID: <%out.print(request.getParameter("PackageID"));%></b></small>
          </div>
          <div class="card-body">
           <form method="GET" action="<%= request.getContextPath() %>/Confirmation.do">
            <h5 style="color:#eb5d1e;text-transform: uppercase;text-align: center;" class="card-title"><b><%out.print(request.getParameter("PackageName"));%></b></h5><br>
            <p class="card-text">
            <p style="margin-top: -20px;padding:5px;text-align: center;">Includes the services:</p>


            <!-- Services -->
            
             <div id="services" class="row row-cols-1 row-cols-md-4 g-4"></div> <br> <br>        
             
            <!-- End Services -->

            <!-- Period -->
            <p style="padding:10px;text-align: center;">Select a duration period:</p>
            <div class="row row-cols-1 row-cols-md-5 g-4">
              <div class="col"></div>
              <div class="col">
                <input type="radio" class="btn-check" name="validityperiod" id="12" autocomplete="off" value="12" checked>
                <label class="btn btn-outline-primary" for="12"><b><%out.print(request.getParameter("periodFee1"));%></b>$/month for 12 months</label>
              </div>
              <div class="col">
                <input type="radio" class="btn-check" name="validityperiod" id="24" autocomplete="off" value="24" >
                <label class="btn btn-outline-primary" for="24"><b><%out.print(request.getParameter("periodFee2"));%></b>$/month for 24 months</label>
              </div>
              <div class="col">
                <input type="radio" class="btn-check" name="validityperiod" id="36" autocomplete="off" value="36" >
                <label class="btn btn-outline-primary" for="36"><b><%out.print(request.getParameter("periodFee3"));%></b>$/month for 36 months</label>
              </div>
              <div class="col"></div>
   			</div><br>
            <!-- End Period -->

<!-- Optional products -->
            
		  <p style="padding:10px;text-align: center;">Select optional products if you want:</p>
                <div id="OptionalProduct" class="row row-cols-1 row-cols-md-4 g-4"></div>
 			<br><br>
            <!-- End Optional products -->
             
            <!-- Starting date -->
            <p style="padding:10px;text-align: center;">Starting day:</p>
            <div style="max-width: 24%;padding:10px;margin:auto;width:55%;" class="md-form md-outline input-with-post-icon datepicker">
				<input placeholder="Select date" type="date" id="date" name="date"
					class="form-control"
					value="<%out.print(request.getParameter("Day"));%>"
					min="<%out.print(request.getParameter("Day"));%>"> <br>
			</div>
            <!-- End Starting date -->

            <div style="background:#fff" class="card-footer">
              <div class="d-flex justify-content-center">
                <input id ="PackageID" name="PackageID" type = "hidden" value ="<%out.print(request.getParameter("PackageID"));%>">	
             	<button class="btn btn-outline-success" type="submit" formmethod="get">Confirm</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container py-4">
      <div class="copyright">
        &copy; Copyright <strong><span>Telco</span></strong>. All Rights Reserved
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
      class="bi bi-arrow-up-short"></i></a>

<script>
  
	container = document.getElementById('services');
    var command = '';
		<%for (int j = 0; j < Integer.parseInt(request.getParameter("allServiceSize")); j += 1) {%>
		<% String i = ("" + j).trim();%>
        command += '<div class="col">'
            +'<div class="card">'
              +'<div class="card-body">'
                +'<h5 style="text-transform: uppercase;text-align: center;" class="card-title"><b>'+"<%out.print(request.getParameter("serviceName" + i));%>"+'</b></h5><br>'
                  +'<p class="card-text">'
                    +'<ul style="list-style-type: none;margin-top: -15px;">';
         command +=    '<li style="padding:5px;">';              
        <%if(request.getParameter("gigaBytes" + i) != null){%>
    		command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/spunta2.png" alt="image alt" title="image title" height="20px">'+"<%out.print(request.getParameter("gigaBytes" + i));%>"+' giga'+'</li>';
    		command +=    '<li style="padding:5px;">';
    		<%if(request.getParameter("extraGigafee" + i) != null){%>
    			command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/spunta2.png" alt="image alt" title="image title" height="20px">'+"<%out.print(request.getParameter("extraGigafee" + i));%>"+'$ for extra giga'+'</li>';
   			<%}
    		else{%>
    		command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/white.png" alt="image alt" title="image title" height="20px"></li>';
    		<%}%>
   		<%}
        else{%>
        	<%if(request.getParameter("minutes" + i) != null){%>
    			command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/spunta2.png" alt="image alt" title="image title" height="20px">'+"<%out.print(request.getParameter("minutes" + i));%>"+' minutes'+'</li>';
    			command +=    '<li style="padding:5px;">'; 
    				<%if(request.getParameter("extraMinutesfee" + i) != null){%>
    						command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/spunta2.png" alt="image alt" title="image title" height="20px">'+"<%out.print(request.getParameter("extraMinutesfee" + i));%>"+'$ for extra minutes'+'</li>';
   					<%}
    				
    				else{%>
    						command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/white.png" alt="image alt" title="image title" height="20px"></li>';
    				<%}%>
    				command +=    '<li style="padding:5px;">';
    				<%if(request.getParameter("sms" + i) != null){%>
    						command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/spunta2.png" alt="image alt" title="image title" height="20px">'+"<%out.print(request.getParameter("sms" + i));%>"+' sms'+'</li>';
    					command +=    '<li style="padding:5px;">';
    					<%if(request.getParameter("extraSmsfee" + i) != null){%>
    							command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/spunta2.png" alt="image alt" title="image title" height="20px">'+"<%out.print(request.getParameter("extraSmsfee" + i));%>"+'$ for sms extra'+'</li>';
   						<%}
    					else{%>
								command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/white.png" alt="image alt" title="image title" height="20px"></li>';
						<%}%>		
						<%}
    				else{%>
    						command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/white.png" alt="image alt" title="image title" height="20px"></li>';
    				<%}%>
    	
   			<%}
   			else{%>
   				<%if(request.getParameter("sms" + i) != null){%>
   					command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/spunta2.png" alt="image alt" title="image title" height="20px">'+"<%out.print(request.getParameter("sms" + i));%>"+' sms'+'</li>';
   				<%}%>
   				command +=    '<li style="padding:5px;">';
   						<%if(request.getParameter("extraSmsfee" + i) != null){%>
    								command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/spunta2.png" alt="image alt" title="image title" height="20px">'+"<%out.print(request.getParameter("extraSmsfee" + i));%>"+'$ for sms extra'+'</li>';
   						<%}
   						else{%>
    								command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/white.png" alt="image alt" title="image title" height="20px"></li>';
    					<%}%>
    	
   	   			<%}%>
    	<%}%>
    	
    	command +=    '</li>'
    					+'</ul>'
    					+'<p style="text-align:center;">Quantity: <b><%out.print(request.getParameter("quantity"+i));%></b></p>'
    					+'</div>'
                    +'</div>'
                  +'</div>'
                  +'</div>'
                  +'<br>'
              <%}%>
              container.innerHTML += command;
              
              container = document.getElementById('OptionalProduct');
              var command = '';
          		<%for (int j = 0; j < Integer.parseInt(request.getParameter("allProductSize")); j += 1) {%>
          		<% String i = ("" + j).trim();%>
                  command += '<div class="col">'
                      +'<div style="text-align:center;" class="card" id="<%out.print(request.getParameter("productName" + i));%>a">'
                        +'<div class="card-body">'
                          +'<h5 class="card-title"><b>'+"<%out.print(request.getParameter("productName" + i));%>"+'</b></h5><br>'
                            +' <p class="card-text"><b>'+"<%out.print(request.getParameter("productFee" + i));%>"+'</b>$/month</p>'
                              +'<div class="d-flex justify-content-center">'
                                +'<div class="round">'
       								+'<input type="checkbox" id="<%out.print(request.getParameter("productName" + i));%>" value="" name="<%out.print(request.getParameter("productName" + i));%>"/>'
       								+'<label for="<%out.print(request.getParameter("productName" + i));%>"></label>'
       							 +'</div>'
                              +'</div>'
                           +'</div></div></div>';
                      <%}%>
                      container.innerHTML += command;   
           </script>

  <!-- Vendor JS Files -->
  <script src="<%= request.getContextPath() %>/pages/assets/vendor/aos/aos.js"></script>
  <script src="<%= request.getContextPath() %>/pages/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%= request.getContextPath() %>/pages/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="<%= request.getContextPath() %>/pages/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="<%= request.getContextPath() %>/pages/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="<%= request.getContextPath() %>/pages/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="<%= request.getContextPath() %>/pages/assets/js/main.js"></script>
  

</body>

</html>