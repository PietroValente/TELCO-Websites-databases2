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
          <li><a class="nav-link active" href="<%= request.getContextPath() %>/ViewPackage.do">View Package</a>
          </li>
          <li><a class="nav-link" href="<%= request.getContextPath() %>/SalesReport.do">Sales Report</a></li>
          <li style="display:inline;padding:50px;margin-right: -70px;"><b><%out.print(request.getParameter("username"));%></b></li>
          <li><a href="<%= request.getContextPath() %>/Logout.do" onclick=""><img
                src="<%= request.getContextPath() %>/pages/assets/img/logout.png" alt="image alt" title="logout"
                height="20px"></a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->

  <!-- Main -->
  <main style="padding:50px" id="main">
    <div class="d-flex justify-content-center">
      <form method="GET" action="<%= request.getContextPath() %>/ViewPackage.do">
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
                <input type="radio" class="btn-check" name="validityperiod" id="12" autocomplete="off" value="12" checked disabled>
                <label class="btn btn-outline-primary" for="12"><b><%out.print(request.getParameter("periodFee1"));%></b>$/month for 12 months</label>
              </div>
              <div class="col">
                <input type="radio" class="btn-check" name="validityperiod" id="24" autocomplete="off" value="24" checked disabled>
                <label class="btn btn-outline-primary" for="24"><b><%out.print(request.getParameter("periodFee2"));%></b>$/month for 24 months</label>
              </div>
              <div class="col">
                <input type="radio" class="btn-check" name="validityperiod" id="36" autocomplete="off" value="36" checked disabled>
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
       								+'<input type="checkbox" id="<%out.print(request.getParameter("productName" + i));%>" value="" name="<%out.print(request.getParameter("productName" + i));%>" checked disabled/>'
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