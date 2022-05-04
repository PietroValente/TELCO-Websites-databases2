<!doctype html>
<html lang="en">

<head>
  <title>TELCO | login</title>

  <!-- Favicons -->
  <link href="<%= request.getContextPath() %>/pages/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link rel="icon" href="<%= request.getContextPath() %>/pages/assets/img/apple-touch-icon.png">

  <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

  <!-- Google Fonts -->
  <link
    href="https:/fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i"
    rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="<%= request.getContextPath() %>/pages/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/pages/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/pages/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/pages/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/pages/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/pages/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="<%= request.getContextPath() %>/pages/assets/css/style.css" rel="stylesheet">

  <!-- Bootstrap core CSS -->
  <link href="pages/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
  <style type="text/css">
		html,
		body {
		  height: 100%;
		}
		
		body {
		  display: flex;
		  align-items: center;
		  padding-top: 40px;
		  padding-bottom: 40px;
		  background-color: #f5f5f5;
		}
		
		.form-signin {
		  width: 100%;
		  max-width: 330px;
		  padding: 15px;
		  margin: auto;
		}
		
		.form-signin .checkbox {
		  font-weight: 400;
		}
		
		.form-signin .form-floating:focus-within {
		  z-index: 2;
		}
		
		.form-signin input[type="email"] {
		  margin-bottom: -1px;
		  border-bottom-right-radius: 0;
		  border-bottom-left-radius: 0;
		}
		
		.form-signin input[type="password"] {
		  margin-bottom: 10px;
		  border-top-left-radius: 0;
		  border-top-right-radius: 0;
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
  
</head>

<body class="text-center">

  <main style="margin:auto;width:50%;width: 300px;" class="form-signin">
    <form method="POST" action="Login.do">
      <h1 style="color:#eb5d1e">Telco <br>employee</h1>
      <br>
      <div class="form-floating">
        <input type="text" class="form-control" id="username" name="username" placeholder="Username">
        <label style="color:grey" for="username">Username</label>
      </div>
      <br>
      <div class="form-floating">
        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
        <label style="color:grey" for="password">Password</label>
      </div>
      <br>
	    <div style="width: 200px;margin:auto;display:none;text-align:center;" id="dangerMessage"
	      class="alert alert-danger alert-dismissible fade show" role="alert1">
	      <p style="margin: 0;padding: 0;text-align:center;" id="dangerMessageM"></p>
	    </div>
	    <div style="width: 200px;margin:auto;display:none;text-align:center;" id="succcessMessage"
	      class="alert alert-success alert-dismissible fade show" role="alert2">
	      <p style="margin: 0;padding: 0;text-align:center;" id="successMessageM"></p>
	    </div>
      <br>
      <button class="btn btn-lg btn-outline-primary" type="submit">Log in</button>
    </form>
  </main>



</body>

</html>