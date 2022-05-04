<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TELCO | home</title>

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
<style>
  input[type='number'] {
    width: 50px;
  }

  input[type=number]::-webkit-inner-spin-button,
  input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0;
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
          <li><a class="nav-link active" href="<%= request.getContextPath() %>/Homepage.do">Home</a></li>
          <li><a class="nav-link" href="<%= request.getContextPath() %>/ViewPackage.do">View Package</a></li>
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
    <div style="padding-top:20px" class="row row-cols-1 row-cols-md-3 g-4">
      <div class="col">
        <div class="card">
          <div class="card-body">
            <h5 style="color:#eb5d1e;text-transform: uppercase;text-align: center;" class="card-title"><b>Create a
                service</b></h5><br>
            <p style="margin:auto;width:55%;" class="card-text">
            <div style="margin:auto;width:60%;" class="form-floating">
              <select class="form-select" name="ServiceType" onchange="myFunction(event)">
                <option value="none"> </option>
                <option value="MobilePhone">Mobile Phone</option>
                <option value="FixedInternet">Fixed Internet</option>
                <option value="MobileInternet">Mobile Internet</option>
              </select><br><br>
              <label for="ServiceType">Choose a service type</label>
            </div>

            <div style="display:none" id="MobilePhone">
              <form method="POST" action="<%= request.getContextPath() %>/CreateMobilePhone.do">
                <table style="margin:auto;width:40%;">
                  <tr>
                    <td><label for="MobilePhoneName">Name: </label></td>
                    <td style="padding: 10px;"><input type="text" id="MobilePhoneName" name="MobilePhoneName"
                        maxlength="30" size="10" />
                    </td>
                  </tr>
                  <tr>
                    <td><label for="MobilePhoneMinutes">Minutes included: </label></td>
                    <td style="padding: 10px;"><input type="number" id="MobilePhoneMinutes" name="MobilePhoneMinutes"
                        min=1 max=10000 />
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="MobilePhoneMinutesUnlimited"
                          name="MobilePhoneMinutesUnlimited" onclick="MinUnl();">
                        <label class="form-check-label" for="MobilePhoneMinutesUnlimited">
                          Unlimited
                        </label>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td><label for="MobilePhoneSMS">SMSs included: </label></td>
                    <td style="padding: 10px;"><input type="number" id="MobilePhoneSMS" name="MobilePhoneSMS" min=1
                        max=10000 />
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="MobilePhoneSMSUnlimited"
                          name="MobilePhoneSMSUnlimited" onclick="SMSUnl();">
                        <label class="form-check-label" for="MobilePhoneSMSUnlimited">
                          Unlimited
                        </label>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td><label for="MobilePhoneMinutesFee">Extra minutes fee: </label></td>
                    <td style="padding: 10px;"><input type="number" id="MobilePhoneMinutesFee"
                        name="MobilePhoneMinutesFee" min=0.1 max=1000 step=".01" /> $
                    </td>
                  </tr>
                  <tr>
                    <td><label for="MobilePhoneSMSFee">Extra SMSs fee: </label></td>
                    <td style="padding: 10px;"><input type="number" id="MobilePhoneSMSFee" name="MobilePhoneSMSFee"
                        min=0.1 max=1000 step=".01" /> $</td>
                  </tr>
                </table><br>
                <div class="d-flex justify-content-center">
                  <button class="btn btn-outline-primary" type="submit" formmethod="post">Add</button>
              </form>
            </div>
          </div>

          <div style="display:none" id="FixedInternet">
            <form method="POST" action="<%= request.getContextPath() %>/CreateFixedInternet.do">
              <table style="margin:auto;width:40%;">
                <tr>
                  <td><label for="FixedInternetName">Name: </label></td>
                  <td style="padding: 10px;"><input type="text" id="FixedInternetName" name="FixedInternetName"
                      maxlength="30" size="10" />
                  </td>
                </tr>
                <tr>
                  <td><label for="FixedInternetGIGA">GIGA included: </label></td>
                  <td style="padding: 10px;"><input type="number" id="FixedInternetGIGA" name="FixedInternetGIGA" min=1
                      max=10000 />
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="" id="FixedInternetGIGAUnlimited"
                        name="FixedInternetGIGAUnlimited" onclick="FixedGigaUnl();">
                      <label class="form-check-label" for="FixedInternetGIGAUnlimited">
                        Unlimited
                      </label>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td><label for="FixedInternetGIGAFee">Extra GIGA fee: </label></td>
                  <td style="padding: 10px;"><input type="number" id="FixedInternetGIGAFee" name="FixedInternetGIGAFee"
                      min=0.1 max=1000 step=".01" /> $
                  </td>
                </tr>
              </table><br>
              <div class="d-flex justify-content-center">
                <button class="btn btn-outline-primary" type="submit" formmethod="post">Add</button>
            </form>
          </div>
        </div>

        <div style="display:none" id="MobileInternet">
          <form method="POST" action="<%= request.getContextPath() %>/CreateMobileInternet.do">
            <table style="margin:auto;width:40%;">
              <tr>
                <td><label for="MobileInternetName">Name: </label></td>
                <td style="padding: 10px;"><input type="text" id="MobileInternetName" name="MobileInternetName"
                    maxlength="30" size="10" />
                </td>
              </tr>
              <tr>
                <td><label for="MobileInternetGIGA">GIGA included: </label></td>
                <td style="padding: 10px;"><input type="number" id="MobileInternetGIGA" name="MobileInternetGIGA" min=1
                    max=1000 />
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="MobileInternetGIGAUnlimited"
                      name="MobileInternetGIGAUnlimited" onclick="MobileGigaUnl();">
                    <label class="form-check-label" for="MobileInternetGIGAUnlimited">
                      Unlimited
                    </label>
                  </div>
                </td>
              </tr>
              <tr>
                <td><label for="MobileInternetGIGAFee">Extra GIGA fee: </label></td>
                <td style="padding: 10px;"><input type="number" id="MobileInternetGIGAFee" name="MobileInternetGIGAFee"
                    min=0.1 max=1000 step=".01" /> $
                </td>
              </tr>
            </table><br>
            <div class="d-flex justify-content-center">
              <button class="btn btn-outline-primary" type="submit" formmethod="post">Add</button>
          </form>
        </div>
      </div>

      <script>
        function myFunction(e) {
          document.getElementById("MobilePhone").style.display = 'none';
          document.getElementById("FixedInternet").style.display = 'none';
          document.getElementById("MobileInternet").style.display = 'none';
          if (e.target.value === 'MobilePhone') {
            document.getElementById("MobilePhone").style.display = 'block';
          }
          else if (e.target.value === 'FixedInternet') {
            document.getElementById("FixedInternet").style.display = 'block';
          }
          else if (e.target.value === 'MobileInternet') {
            document.getElementById("MobileInternet").style.display = 'block';
          }
        }
        function MinUnl() {
          if (document.getElementById('MobilePhoneMinutesUnlimited').checked) {
            document.getElementById("MobilePhoneMinutes").value = "";
            document.getElementById("MobilePhoneMinutes").disabled = true;
            document.getElementById("MobilePhoneMinutesFee").value = "";
            document.getElementById("MobilePhoneMinutesFee").disabled = true;
          } else {
            document.getElementById("MobilePhoneMinutes").disabled = false;
            document.getElementById("MobilePhoneMinutesFee").disabled = false;
          }
        }
        function SMSUnl() {
          if (document.getElementById('MobilePhoneSMSUnlimited').checked) {
            document.getElementById("MobilePhoneSMS").value = "";
            document.getElementById("MobilePhoneSMS").disabled = true;
            document.getElementById("MobilePhoneSMSFee").value = "";
            document.getElementById("MobilePhoneSMSFee").disabled = true;
          } else {
            document.getElementById("MobilePhoneSMS").disabled = false;
            document.getElementById("MobilePhoneSMSFee").disabled = false;
          }
        }
        function FixedGigaUnl() {
          if (document.getElementById('FixedInternetGIGAUnlimited').checked) {
            document.getElementById("FixedInternetGIGA").value = "";
            document.getElementById("FixedInternetGIGA").disabled = true;
            document.getElementById("FixedInternetGIGAFee").value = "";
            document.getElementById("FixedInternetGIGAFee").disabled = true;
          } else {
            document.getElementById("FixedInternetGIGA").disabled = false;
            document.getElementById("FixedInternetGIGAFee").disabled = false;
          }
        }
        function MobileGigaUnl() {
          if (document.getElementById('MobileInternetGIGAUnlimited').checked) {
            document.getElementById("MobileInternetGIGA").value = "";
            document.getElementById("MobileInternetGIGA").disabled = true;
            document.getElementById("MobileInternetGIGAFee").value = "";
            document.getElementById("MobileInternetGIGAFee").disabled = true;
          } else {
            document.getElementById("MobileInternetGIGA").disabled = false;
            document.getElementById("MobileInternetGIGAFee").disabled = false;
          }
        }
        function OptionalProductGra() {
          if (document.getElementById('OptionalProductGratis').checked) {
            document.getElementById("OptionalProductFee").value = "";
            document.getElementById("OptionalProductFee").disabled = true;
          } else {
            document.getElementById("OptionalProductFee").disabled = false;
          }
        }
      </script>
      </p>
    </div>
    </div>
    </div>

    <div class="col">
      <div class="card">
        <div class="card-body">
          <h5 style="color:#eb5d1e;text-transform: uppercase;text-align: center;" class="card-title"><b>Create a
              package</b></h5><br>
          <form method="POST" action="<%= request.getContextPath() %>/CreatePackage.do">
            <p class="card-text">
            <table style="margin:auto;width:40%;margin-top: -15px;">
              <tr>
                <td><label for="PackageName">Name: </label></td>
                <td style="padding: 5px;"><input type="text" id="PackageName" name="PackageName" maxlength="30"
                    size="10" />
                </td>
              </tr>
              <tr>
                <td><label>Monthly fee: </label></td>
                <td style="padding: 5px;"><input type="number" id="PackageFee12" name="PackageFee12" min=0.1 max=1000 step=".01" /> $
                  x 12m</td>
              </tr>
              <tr>
                <td></td>
                <td style="padding: 5px;"><input type="number" id="PackageFee24" name="PackageFee24" min=0.1 max=1000 step=".01" /> $
                  x 24m</td>
              </tr>
              <tr>
                <td></td>
                <td style="padding: 5px;"><input type="number" id="PackageFee36" name="PackageFee36" min=0.1 max=1000 step=".01" /> $
                  x 36m</td>
              </tr>
            </table><br>
            <p style="padding:5px;text-align: center;"><b>Features:</b></p>
            <table style="margin:auto;width:40%;margin-top: -15px;">
              <tr>
                <td><label for="Feature1">Feature1: </label></td>
                <td style="padding: 5px;"><input type="text" id="PackageFeature1" name="PackageFeature1" maxlength="30"
                    size="10" /></td>
              </tr>
              <tr>
                <td><label for="Feature2">Feature2: </label></td>
                <td style="padding: 5px;"><input type="text" id="PackageFeature2" name="PackageFeature2" maxlength="30"
                    size="10" /></td>
              </tr>
              <tr>
                <td><label for="Feature3">Feature3: </label></td>
                <td style="padding: 5px;"><input type="text" id="PackageFeature3" name="PackageFeature3" maxlength="30"
                    size="10" /></td>
              </tr>
            </table><br>
            <p style="padding:5px;text-align: center;"><b>Fixed phone services:</b></p>
            <table style="margin:auto;width:80%;margin-top: -15px;">
              <tr>
                <td><label style="text-transform: uppercase;" for="TelcoFixedPhone">Fixed phone: </label></td>
                <td style="padding: 5px;"><input type="number" id="FIXED PHONE DEFAULT" name="FIXED PHONE DEFAULT" min=0 max=1000
                    placeholder="0" value="0" /></td>
              </tr>
            </table><br>
            <p style="padding:5px;text-align: center;"><b>Mobile phone services:</b></p>
            <div id="MobilePhoneServices"></div>
            <br>
            <p style="padding:5px;text-align: center;"><b>Fixed internet services:</b></p>
            <div id="FixedInternetServices"></div>
            <br>
            <p style="padding:5px;text-align: center;"><b>Mobile internet services:</b></p>
            <div id="MobileInternetServices"></div>
            <br>
            <p style="padding:5px;text-align: center;"><b>Optional products:</b></p>
            <div id="OptionalProduct"></div>
            <br>
            </p>
            <div class="d-flex justify-content-center">
              <button class="btn btn-outline-primary" type="submit" formmethod="post">Add</button>
          </form>
        </div>
      </div>
    </div>
    </div>

    <script>        
        container = document.getElementById('MobilePhoneServices');
        var command = '<table style="margin:auto;width:80%;margin-top: -15px;">';
   		<%for (int j = 0; j < Integer.parseInt(request.getParameter("allMobilePhoneServiceSize")); j += 1) {%>
   			<% String i = ("" + j).trim();%>
           	command += ''
   	          +'<tr>'
   	            +'<td><label style="text-transform: uppercase;">'+"<%out.print(request.getParameter("MobilePhoneServiceName" + i));%>"+': </label></td>'
   	            +'<td style="padding: 5px;"><input type="number" name="<%out.print(request.getParameter("MobilePhoneServiceName" + i));%>" min=0 max=1000 placeholder="0" value="0" /></td>'
   	          +'</tr>'
         <%}%>
         command += '</table>';
         container.innerHTML += command;
            
         container = document.getElementById('FixedInternetServices');
         var command = '<table style="margin:auto;width:80%;margin-top: -15px;">';
   		 <%for (int j = 0; j < Integer.parseInt(request.getParameter("allFixedInternetServiceSize")); j += 1) {%>
   			<% String i = ("" + j).trim();%>
           	command += ''
   	          +'<tr>'
   	            +'<td><label style="text-transform: uppercase;">'+"<%out.print(request.getParameter("FixedInternetServiceName" + i));%>"+': </label></td>'
   	            +'<td style="padding: 5px;"><input type="number" name="<%out.print(request.getParameter("FixedInternetServiceName" + i));%>" min=0 max=1000 placeholder="0" value="0" /></td>'
   	          +'</tr>'
         <%}%>
         command += '</table>';
         container.innerHTML += command;
                
         container = document.getElementById('MobileInternetServices');
         var command = '<table style="margin:auto;width:80%;margin-top: -15px;">';
     	 <%for (int j = 0; j < Integer.parseInt(request.getParameter("allMobileInternetServiceSize")); j += 1) {%>
     		<% String i = ("" + j).trim();%>
             	command += ''
     	          +'<tr>'
     	            +'<td><label style="text-transform: uppercase;">'+"<%out.print(request.getParameter("MobileInternetServiceName" + i));%>"+': </label></td>'
     	            +'<td style="padding: 5px;"><input type="number" name="<%out.print(request.getParameter("MobileInternetServiceName" + i));%>" min=0 max=1000 placeholder="0" value="0" /></td>'
     	          +'</tr>'
          <%}%>
          command += '</table>';
          container.innerHTML += command;
            
          container = document.getElementById('OptionalProduct');
          var command = '<table style="margin:auto;width:50%;margin-top: -15px;">';
    	  <%for (int j = 0; j < Integer.parseInt(request.getParameter("allOptionalProductSize")); j += 1) {%>
    			<% String i = ("" + j).trim();%>
            	command += ''
    	          +'<tr>'
    	            +'<td><label style="text-transform: uppercase;" for="<%out.print(request.getParameter("OptionalProductName" + i));%>">'+"<%out.print(request.getParameter("OptionalProductName" + i));%>"+': </label></td>'
    	            +'<td style="padding: 5px;"><input class="form-check-input" type="checkbox" value="" name="<%out.print(request.getParameter("OptionalProductName" + i));%>"></td>'
    	          +'</tr>'
          <%}%>
          command += '</table>';
          container.innerHTML += command;
    </script>

    <div class="col">
      <div class="card">
        <div class="card-body">
          <h5 style="color:#eb5d1e;text-transform: uppercase;text-align: center;" class="card-title"><b>Create a
              optional product</b></h5><br>
          <form method="POST" action="<%= request.getContextPath() %>/CreateOptionalProduct.do">
            <p class="card-text">
            <table style="margin:auto;width:40%;margin-top: -15px;">
              <tr>
                <td><label for="OptionalProductName">Name: </label></td>
                <td> </td>
                <td style="padding: 5px;"><input type="text" id="OptionalProductName" name="OptionalProductName"
                    maxlength="20" size="10" />
                </td>
              </tr>
              <tr>
                <td><label for="OptionalProductFee">Monthly fee: </label></td>
                <td> </td>
                <td style="padding: 5px;"><input type="number" id="OptionalProductFee" name="OptionalProductFee" min=0.1
                    max=1000 step=".01" /> $
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="OptionalProductGratis"
                      name="OptionalProductGratis" onclick="OptionalProductGra();">
                    <label class="form-check-label" for="OptionalProductGratis">
                      Gratis
                    </label>
                  </div>
                </td>
              </tr>
            </table>
            </p>
            <br>
            <div class="d-flex justify-content-center">
              <button class="btn btn-outline-primary" type="submit" formmethod="post">Add</button>
          </form>
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