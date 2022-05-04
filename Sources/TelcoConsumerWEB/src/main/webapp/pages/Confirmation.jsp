<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TELCO | confirmation</title>
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
  </style>
  
  <script type="text/javascript">
  function message() {
	    var dangerMessage = document.getElementById('dangerMessage');
	    var confirmMessage = document.getElementById('succcessMessage');
		  <%if (request.getParameter("succcessMessage") != null) {%>
		      document.getElementById('successMessageM').innerHTML = "<%out.print(request.getParameter("succcessMessage"));%>";
		      confirmMessage.style.display = 'block';
		  <%}%>
		  <%if (request.getParameter("dangerMessage") != null) {%>
		      document.getElementById('dangerMessageM').innerHTML = "<%out.print(request.getParameter("dangerMessage"));%>";
		      dangerMessage.style.display = 'block';
		  <%}%>
		  username();
	  }
  function username() {
	  <%if (request.getParameter("username").compareTo("MyTELCO") != 0) {%>
	  	document.getElementById('mytelco').style.display = 'none';
	  	document.getElementById('buy').style.display = 'block';
	  <%}else{%>
	  	document.getElementById('mytelco').style.display = 'block';
	  	document.getElementById('buy').style.display = 'none';
	  <%}%>
  }
  window.onload = message;
</script>
  
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <h1 class="text-light"><a href="<%= request.getContextPath() %>/Homepage.do"><span>Telco</span></a></h1>
      </div>
    </div>
  </header><!-- End Header -->

  <!-- Main -->
  <main style="padding:50px" id="main">
  <div style="width: 500px;margin:auto;display:none;" id="dangerMessage"
      class="alert alert-danger alert-dismissible fade show" role="alert">
      <p style="margin: 0;padding: 0;" id="dangerMessageM"></p>
      <button type="button" class="btn-close" data-dismiss="alert" aria-label="Close"></button>
    </div>
    <div style="width: 300px;margin:auto;display:none;" id="succcessMessage"
      class="alert alert-success alert-dismissible fade show" role="alert">
      <p style="margin: 0;padding: 0;" id="successMessageM"></p>
      <button type="button" class="btn-close" data-dismiss="alert" aria-label="Close"></button>
    </div>
	<br>
    <div class="d-flex justify-content-center">
      <form method="POST" action="<%= request.getContextPath() %>/DetailServicePackage.do">
      	<input id ="PackageID" name="PackageID" type = "hidden" value ="<%out.print(request.getParameter("PackageID"));%>">	
        <button class="btn btn-outline-secondary" type="submit" formmethod="post">Back</button>
      </form>
    </div><br>
    <form method="GET" action="<%= request.getContextPath() %>/OrderPack.do">
    <div class="row row-cols-1 row-cols-md-1 g-4">
      <div class="col">
        <div class="card">
          <div class="card-header">
            <h1 class="text-muted"><b>Confirm your choice</b></h1>
          </div>
          <div style="background-color: #f5f5f5" class="card-body">
         	<input id ="PackageID" name="PackageID" type = "hidden" value ="<%out.print(request.getParameter("PackageID"));%>">
            <input id ="startdate" name="startdate" type = "hidden" value ="<%out.print(request.getParameter("startdate"));%>">	             	
     		<input id ="enddate" name="enddate" type = "hidden" value ="<%out.print(request.getParameter("enddate"));%>">
     		<input id ="total" name="total" type = "hidden" value ="<%out.print(request.getParameter("total"));%>">
     		<h5 style="text-transform: uppercase;text-align: center;" class="text-muted"><b><%out.print(request.getParameter("PackageName"));%></b></h5><br>
            <p class="card-text">


              <!-- Services -->
            <div id="services" class="row row-cols-1 row-cols-md-4 g-4"></div>     
            <!-- End Services -->

            <!-- Period -->
		 <p style="padding:10px;text-align: center;">Duration period:</p>
            <div class="row row-cols-1 row-cols-md-5 g-4">
              <div class="col"></div>
              <div class="col">
              </div>
              <div class="col">
                <input type="radio" class="btn-check" name="options-outlined" id="success-outlined2" autocomplete="off"
                  checked disabled>
                <label class="btn btn-outline-primary" for="success-outlined2"><b><%out.print(request.getParameter("validityFee"));%></b>$/month for <%out.print(request.getParameter("validityMonth"));%> months</label>
              </div>
              <div class="col">
              </div>
              <div class="col"></div>
            </div><br>
            <!-- End Period -->

            <!-- Optional products -->
            <p style="padding:10px;text-align: center;">Optional products:</p>
            <div id="OptionalProduct" class="row row-cols-1 row-cols-md-4 g-4"></div>
 			<br><br>

            <!-- End Optional products -->
            
            <!-- Starting date -->
                      <table style="margin:auto;width:20%;">
                        <tr>
                          <td><b>Starting day: </b></td>
                          <td><%out.print(request.getParameter("startdate"));%></td>
                         </tr>
	                     <tr>
	                       <td><b>End day: </b></td>
	                       <td><%out.print(request.getParameter("enddate"));%></td>
                     	</tr>
                      </table><br>
            <!-- End Starting date -->


            <div style="background-color: #f5f5f5" class="card-footer">
              <div class="row row-cols-1 row-cols-md-6 g-1">
                <div class="col"></div>
                <div class="col"></div>
                <div class="col"></div>
                <div class="col"></div>
                <div style="text-align:right" class="col"><%out.print(request.getParameter("validityFee"));%>$ x <%out.print(request.getParameter("validityMonth"));%> month =</div>
                <div style="text-align:right" class="col"><%out.print(request.getParameter("totalPeriod"));%>$</div>
              </div>
              <div class="row row-cols-2 row-cols-md-6 g-1">
                <div class="col"></div>
                <div class="col"></div>
                <div class="col"></div>
                <div class="col"></div>
                <div style="text-align:right" class="col"><%out.print(request.getParameter("costProduct"));%>$ x <%out.print(request.getParameter("validityMonth"));%> month = </div>
                <div style="text-align:right" class="col"><%out.print(request.getParameter("totalProduct"));%>$</div>
              </div>
              <br>
              <div class="row row-cols-4 row-cols-md-6 g-1">
                <div class="col"></div>
                <div class="col"></div>
                <div class="col"></div>
                <div class="col"></div>
                <div style="text-align:right" class="col"><b>Total:</b></div>
                <div style="text-align:right" class="col"><%out.print(request.getParameter("total"));%>$</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div><br><br>

	<div id="buy">
	  <div class="d-flex justify-content-center">
      <button style="margin-right: 20px;" name ="success" type="submit" class="btn btn-outline-success" formmethod="get">Buy</button>
      <button style="margin-left: 20px;"  name ="unsuccess" type="submit" class="btn btn-outline-danger" formmethod="get">Buy</button>
    </div>
	</div>
    </form>
    
    <div id="mytelco" style="text-align:center;">
    	<p>Please login to proceed with the order:</p>
	    <div class="d-flex justify-content-center">
	    	<button type="button" class="getstarted scrollto btn btn-outline-primary" data-toggle="modal" data-target="#exampleModalLive">MyTELCO</button>
	    </div>
    </div>
    
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
        <ul style="margin:auto;padding: 10px;" class="nav nav-pills mb-3 red" id="pills-tab" role="tablist">
          <li class="nav-item" role="presentation"><a class="nav-link active" id="pills-log-in-tab" data-toggle="pill"
              href="#pills-log-in" role="tab" aria-controls="pills-log-in" aria-selected="true">Log in</a></li>
        </ul>
        <div class="tab-content border-0" id="pills-tabContent">
          <div class="tab-pane active" id="pills-log-in" role="tabpanel" aria-labelledby="pills-log-in-tab">
            <form method="POST" action="Confirmation.do">
            <div class="modal-body">
              <div class="text-center">
                <img src="https://gazenergie.ch/fileadmin/_processed_/b/e/csm_Login_c148e8b0a7.png"
                  class="rounded-circle" width="150" alt="User" />
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
            <div id="op"> </div>
            <div class="modal-footer">
          		<button class="btn btn-primary" type="submit" formmethod="post">Enter</button>
          		<input type="hidden" id="validityperiod" name="validityperiod" value="<%out.print(request.getParameter("validityMonth"));%>">
				<input type="hidden" id="date" name="date" value="<%out.print(request.getParameter("startdate"));%>">   
				<input type="hidden" id="PackageID" name="PackageID" value="<%out.print(request.getParameter("PackageID"));%>">
            </div>
            </form>
          </div>
          </div>
      </div>
    </div>
  </div><!-- End MyTELCO -->
    
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
	container = document.getElementById('OptionalProduct');
	var command = '';
		<%for (int j = 0; j < Integer.parseInt(request.getParameter("allProductSize")); j += 1) {%>
		<% String i = ("" + j).trim();%>
		<%if(request.getParameter("productName" + i) != null){%>
    	command += '<div class="col">'
        	+'<div style="text-align:center ;background:#fbfbfb" class="card" id="<%out.print(request.getParameter("productName" + i));%>a">'
          	+'<div class="card-body">'
          	+'<h5 class="card-title"><b>'+"<%out.print(request.getParameter("productName" + i));%>"+'</b></h5><br>'
              +' <p class="card-text"><b>'+"<%out.print(request.getParameter("productFee" + i));%>"+'</b>$/month</p>'
                +'<div class="d-flex justify-content-center">'
                  +'<div class="round">'
                  			+'<input type="hidden" id="<%out.print(request.getParameter("productName" + i));%>" value="" name="<%out.print(request.getParameter("productName" + i));%>"/>'
                  			+'<input type="checkbox" id="<%out.print(request.getParameter("productName" + i));%>a" value="" name="<%out.print(request.getParameter("productName" + i));%>a" checked disabled/>'
							+'<label for="<%out.print(request.getParameter("productName" + i));%>"></label>'
						 +'</div>'
                +'</div>'
             +'</div></div></div>'
        <%}%>
        <%}%>
        container.innerHTML += command;
        
	container = document.getElementById('op');
	var command = '';
	<%for (int j = 0; j < Integer.parseInt(request.getParameter("allProductSize")); j += 1) {%>
	<% String i = ("" + j).trim();%>
	<%if(request.getParameter("productName" + i) != null){%>
	command += '<input type="hidden" id="<%out.print(request.getParameter("productName" + i));%>" value="" name="<%out.print(request.getParameter("productName" + i));%>"/> ';
	<%}%>
	<%}%>
	container.innerHTML += command;

	container = document.getElementById('services');
	var command = '';
	<%for (int j = 0; j < Integer.parseInt(request.getParameter("allServiceSize")); j += 1) {%>
	<% String i = ("" + j).trim();%>
    command += '<div class="col">'
        +'<div style="background-color: #fbfbfb;" class="card">'
          +'<div class="card-body">'
            +'<h5 style="text-transform: uppercase;text-align: center;" class="card-title"><b>'+"<%out.print(request.getParameter("serviceName" + i));%>"+'</b></h5><br>'
              +'<p class="card-text">'
                +'<ul style="list-style-type: none;margin-top: -15px;">'
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