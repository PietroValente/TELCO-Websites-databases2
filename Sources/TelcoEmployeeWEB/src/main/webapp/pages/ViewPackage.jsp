<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TELCO | package</title>
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
</head>

<script type="text/javascript">
  function message() {
	    var confirmMessage = document.getElementById('succcessMessage');
	  <%if(request.getParameter("succcessMessage") != null){%>
      document.getElementById('successMessageM').innerHTML = "<%out.print(request.getParameter("succcessMessage"));%>";
      confirmMessage.style.display = 'block';
	  <%}%>
  }
  window.onload = message;
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
    <div style="width: 300px;margin:auto;display:none;" id="succcessMessage"
      class="alert alert-success alert-dismissible fade show" role="alert">
      <p style="margin: 0;padding: 0;" id="successMessageM"></p>
      <button type="button" class="btn-close" data-dismiss="alert" aria-label="Close"></button>
    </div><br>
  	<!-- Section service package -->
    <div id="packages" class="row row-cols-1 row-cols-md-4 g-4"></div>

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

  <!-- Script to fill all service package -->
  <script>
    container = document.getElementById('packages');
    var command = '';
		<%for (int j = 0; j < Integer.parseInt(request.getParameter("allPackageSize")); j += 1) {%>
		<% String i = ("" + j).trim();%>
        command += '<div class="col">'
            +'<div style="height:370px;" class="card">'
              +'<div class="card-body">'
                +'<h5 style="color:#eb5d1e;text-transform: uppercase;text-align: center;" class="card-title"><b>'+"<%out.print(request.getParameter("PackageName" + i));%>"+'</b></h5><br>'
                  +'<p class="card-text">'
                    +'<ul style="list-style-type: none;margin-top: -15px;">'
                      +'<li style="padding:5px;">';
        <%if(request.getParameter("Feature1" + i) != null){%>
        	command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/spunta.png" alt="image alt" title="image title" height="20px">'+"<%out.print(request.getParameter("Feature1" + i));%>"+'</li>';
        <%}else{%>
        	command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/white.png" alt="image alt" title="image title" height="20px"></li>';
        <%}%>
        command +=    '<li style="padding:5px;">';
        <%if(request.getParameter("Feature2" + i) != null){%>
    		command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/spunta.png" alt="image alt" title="image title" height="20px">'+"<%out.print(request.getParameter("Feature2" + i));%>"+'</li>';
    	<%}else{%>
    		command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/white.png" alt="image alt" title="image title" height="20px"></li>';
    	<%}%>
    		command +=    '<li style="padding:5px;">';
        <%if(request.getParameter("Feature3" + i) != null){%>
    		command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/spunta.png" alt="image alt" title="image title" height="20px">'+"<%out.print(request.getParameter("Feature3" + i));%>"+'</li>';
    	<%}else{%>
    		command +=     '<img src="<%= request.getContextPath() %>/pages/assets/img/white.png" alt="image alt" title="image title" height="20px"></li>';
    	<%}%>
    	command +='</ul>'
                    +'<p style="padding:5px;text-align: center;">From <b>'+"<%out.print(request.getParameter("PackageBestPrice" + i));%>"+'$</b> montly</p></p>'
                      +'<div class="d-flex justify-content-center">'
                      + '<form method="POST" action="<%= request.getContextPath() %>/DetailServicePackage.do">'
                      + '<input type="hidden" name="PackageID" value="<%out.print(request.getParameter("PackageID" + i));%>"/>'
                      + '<button class="btn btn-outline-primary" type="submit" formmethod="post">View</button>'
                      + '</form>'
                      +'</div>'
                    +'</div>'
                    +'<div class="card-footer">'
                      +'<small class="text-muted"><b>ID: '+"<%out.print(request.getParameter("PackageID" + i));%>"+'</b></small>'
                    +'</div>'
                  +'</div>'
              +'</div>'
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