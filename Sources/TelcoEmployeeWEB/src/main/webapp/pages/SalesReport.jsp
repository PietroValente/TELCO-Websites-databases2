<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TELCO | report</title>
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
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
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
          <li><a class="nav-link" href="<%= request.getContextPath() %>/ViewPackage.do">View Package</a>
          </li>
          <li><a class="nav-link active" href="<%= request.getContextPath() %>/SalesReport.do">Sales Report</a></li>
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
	<h1 style="text-align: center;">Sales Report</h1><br>
	<h3 style="text-align: center;">Number of total purchases per package</h3><br>
	<div id="purchasesPackage"></div><br><br>
	<h3 style="text-align: center;">Number of total purchases per package and validity period</h3><br>
	<div id="purchasesPackageValidityPeriod"></div><br><br>
	<h3 style="text-align: center;">Total value of sales per package with and without the optional product</h3><br>
	<div id="purchasesWithOptionalProduct"></div><br><br>
	<h3 style="text-align: center;">Average number of optional products sold together with each service package</h3><br>
	<div id="average"></div><br><br>
	<h3 style="text-align: center;">List of insolvent users</h3><br>
	<div id="insolventUsers"></div><br><br>
	<h3 style="text-align: center;">List of suspended orders</h3><br>
	<div id="suspendedOrders"></div><br><br>
	<h3 style="text-align: center;">List of alerts</h3><br>
	<div id="listAlerts"></div><br><br>
	<h3 style="text-align: center;">Best seller optional product</h3><br>
	<div id="bestSeller">
		<table class="center" style="width:50%;margin-left: auto;margin-right: auto;">
   	  		<tr>
   				<th>Optional product</th>
   				<th>Amount sold</th>
   			</tr>
       		<tr>
               	<td><%out.print(request.getParameter("BestSeller"));%></td>
               	<td><%out.print(request.getParameter("AmountSold"));%></td>
           </tr>
    	</table>
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
container = document.getElementById('purchasesPackage');
var command = '<table class="center" style="width:50%;margin-left: auto;margin-right: auto;">'
	  +'<tr>'
+'<th>Package</th>'
+'<th>Purchases</th>'
+'</tr>';
 <%for (int j = 0; j < Integer.parseInt(request.getParameter("PackSize")); j += 1) {%>
	<% String i = ("" + j).trim();%>
    	command += ''
    	+'<tr>'
            +'<td>'+"<%out.print(request.getParameter("Pack" + i));%>"+'</td>'
            +'<td>'+"<%out.print(request.getParameter("PackN" + i));%>"+'</td>'
        +'</tr>'
 <%}%>
 command += '</table>';
 container.innerHTML += command;
 
 container = document.getElementById('purchasesPackageValidityPeriod');
 var command = '<table class="center" style="width:50%;margin-left: auto;margin-right: auto;">'
 	  +'<tr>'
 +'<th>Package</th>'
 +'<th>Validity period</th>'
 +'<th>Purchases</th>'
 +'</tr>';
  <%for (int j = 0; j < Integer.parseInt(request.getParameter("PackSize")); j += 1) {%>
 	<% String i = ("" + j).trim();%>
     	command += ''
     	+'<tr>'
             +'<td>'+"<%out.print(request.getParameter("Pack" + i));%>"+'</td>'
             +'<td>12</td>'
             +'<td>'+"<%out.print(request.getParameter(i+"Pack12"));%>"+'</td>'
         +'</tr>'
         +'<tr>'
	         +'<td>'+"<%out.print(request.getParameter("Pack" + i));%>"+'</td>'
	         +'<td>24</td>'
	         +'<td>'+"<%out.print(request.getParameter(i+"Pack24"));%>"+'</td>'
	     +'</tr>'
	     +'<tr>'
	         +'<td>'+"<%out.print(request.getParameter("Pack" + i));%>"+'</td>'
	         +'<td>36</td>'
	         +'<td>'+"<%out.print(request.getParameter(i+"Pack36"));%>"+'</td>'
	     +'</tr>'
	     +'<tr height = 20px></tr>'
  <%}%>
  command += '</table>';
  container.innerHTML += command;
  
  container = document.getElementById('average');
  var command = '<table class="center" style="width:50%;margin-left: auto;margin-right: auto;">'
  	  +'<tr>'
  +'<th>Package</th>'
  +'<th>Average optional products</th>'
  +'</tr>';
   <%for (int j = 0; j < Integer.parseInt(request.getParameter("PackSize")); j += 1) {%>
  	<% String i = ("" + j).trim();%>
      	command += ''
      	+'<tr>'
              +'<td>'+"<%out.print(request.getParameter("Pack" + i));%>"+'</td>'
              +'<td>'+"<%out.print(request.getParameter("Average" + i));%>"+'</td>'
          +'</tr>'
   <%}%>
   command += '</table>';
   container.innerHTML += command;
   
   container = document.getElementById('insolventUsers');
   var command = '<table class="center" style="width:10%;margin-left: auto;margin-right: auto;">'
   	  +'<tr>'
   +'<th>Username</th>'
   +'</tr>';
    <%for (int j = 0; j < Integer.parseInt(request.getParameter("InsolventUserSize")); j += 1) {%>
   	<% String i = ("" + j).trim();%>
       	command += ''
       	+'<tr>'
               +'<td>'+"<%out.print(request.getParameter("InsolventUser" + i));%>"+'</td>'
           +'</tr>'
    <%}%>
    command += '</table>';
    container.innerHTML += command;
    
    container = document.getElementById('listAlerts');
    var command = '<table class="center" style="width:30%;margin-left: auto;margin-right: auto;">'
    	  +'<tr>'
    +'<th>Username</th>'
    +'<th>Timestamp</th>'
    +'<th>Email</th>'
    +'<th>Amount</th>'
    +'</tr>';
     <%for (int j = 0; j < Integer.parseInt(request.getParameter("alertsSize")); j += 1) {%>
    	<% String i = ("" + j).trim();%>
        	command += ''
        	+'<tr>'
                +'<td>'+"<%out.print(request.getParameter("AlertU" + i));%>"+'</td>'
                +'<td>'+"<%out.print(request.getParameter("AlertT" + i));%>"+'</td>'
                +'<td>'+"<%out.print(request.getParameter("AlertE" + i));%>"+'</td>'
                +'<td>'+"<%out.print(request.getParameter("AlertA" + i));%>"+'</td>'
            +'</tr>'
     <%}%>
     command += '</table>';
     container.innerHTML += command;
     
     container = document.getElementById('purchasesWithOptionalProduct');
     var command = '<table class="center" style="width:50%;margin-left: auto;margin-right: auto;">'
     	  +'<tr>'
     +'<th>Package</th>'
     +'<th>With optional product</th>'
     +'<th>Without optional product</th>'
     +'</tr>';
      <%for (int j = 0; j < Integer.parseInt(request.getParameter("PackSize")); j += 1) {%>
     	<% String i = ("" + j).trim();%>
         	command += ''
         	+'<tr>'
                 +'<td>'+"<%out.print(request.getParameter("Pack" + i));%>"+'</td>'
                 +'<td>'+"<%out.print(request.getParameter("PackNop"+i));%>"+'</td>'
                 +'<td>'+"<%out.print(request.getParameter("PackNnoop"+i));%>"+'</td>'
             +'</tr>'
      <%}%>
      command += '</table>';
      container.innerHTML += command;
      
      container = document.getElementById('suspendedOrders');
      var command = '<table class="center" style="width:30%;margin-left: auto;margin-right: auto;">'
      	  +'<tr>'
      +'<th>Suspended order</th>'
      +'<th>Username</th>'
      +'</tr>';
       <%for (int j = 0; j < Integer.parseInt(request.getParameter("suspendedOrderSize")); j += 1) {%>
      	<% String i = ("" + j).trim();%>
          	command += ''
          	+'<tr>'
                  +'<td>'+"<%out.print(request.getParameter("suspendedOrder" + i));%>"+'</td>'
                  +'<td>'+"<%out.print(request.getParameter("suspendedOrderU" + i));%>"+'</td>'
              +'</tr>'
       <%}%>
       command += '</table>';
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