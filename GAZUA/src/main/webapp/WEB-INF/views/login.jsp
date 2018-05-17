<!DOCTYPE html>
<html lang="en">
<style>
body {
   margin: 0;
   padding: 0;
   background: url(img.jpg) center center fixed no-repeat;
  
}

video {
   position: fixed;
   top: 0;
   left: 0;
   min-width: 100%;
   min-height: 100%;
   width: auto;
   height: auto;
   z-index: -1;
}

</style>
 <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Coming Soon - Start Bootstrap Theme</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/login/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <link href="resources/login/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/login/css/coming-soon.min.css" rel="stylesheet">
   
   
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin.css" rel="stylesheet">
  </head>

  <body class="bg-dark">

    <div class="overlay"></div>

    <div class="masthead">
      <div class="masthead-bg"></div>
      <div class="container h-100">
        <div class="row h-100">
          <div class="col-12 my-auto">
            <div class="masthead-content text-white py-5 py-md-0">
            
              <h1 class="mb-3"><div style="position: relative; left: 65px;  bottom: 30px"><a href="mainHomeView.do"><input type="image" src="resources/image/gazua.png"></a></div></h1>
              <p class="mb-5">
                <strong>Share Travel Information For You,Guiding</strong></p>
              <div class="container">
             <div class="card card-login mx-auto mt-5">
               <div class="card-header" style="color:black">Login</div>
               <div class="card-body">
                 <form action="loginCheck.do" method="post">
                   <div class="form-group">
                     <label for="exampleInputEmail1" style="color:black">Email address</label>
                     <input class="form-control" name="id" type="email" aria-describedby="emailHelp" placeholder="Enter email">
                   </div>
                   <div class="form-group">
                     <label for="exampleInputPassword1" style="color:black">Password</label>
                     <input class="form-control" name="password" type="password" placeholder="Password">
                   </div>
                   <div class="form-group">
                     <div class="form-check">
                       <label class="form-check-label">
                         <input class="form-check-input" type="checkbox" style="color:black"> Remember Password</label>
                     </div>
                   </div>
         <!--           <a class="btn btn-primary btn-block" href="index.html">Login</a> -->
                  <input type="submit" class="btn btn-primary btn-block" value="Login">
                 </form>
                 <div class="text-center">
                   <a class="d-block small mt-3" href="#" onclick="register()">Register an Account</a>
                   <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
                 </div>
               </div>
             </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="social-icons">
      <ul class="list-unstyled text-center mb-0">
        <li class="list-unstyled-item">
          <a href="https://www.instagram.com/?hl=ko">
            <i class="fa fa-twitter"></i>
          </a>
        </li>
        <li class="list-unstyled-item">
          <a href="https://www.facebook.com/campaign/landing.php?&campaign_id=178693329167367&extra_1=s|c|239070957732|e|%ED%8E%98%EC%9D%B4%EC%8A%A4%EB%B6%81|&placement=&creative=239070957732&keyword=%ED%8E%98%EC%9D%B4%EC%8A%A4%EB%B6%81&partner_id=googlesem&extra_2=campaignid%3D355034439%26adgroupid%3D26321955999%26matchtype%3De%26network%3Dg%26source%3Dnotmobile%26search_or_content%3Ds%26device%3Dc%26devicemodel%3D%26adposition%3D1t1%26target%3D%26targetid%3Dkwd-19214981017%26loc_physical_ms%3D1009871%26loc_interest_ms%3D%26feeditemid%3D%26param1%3D%26param2%3D&gclid=EAIaIQobChMI57Xx9-ak2QIVwX-9Ch39dQv3EAAYASAAEgLESvD_BwE">
            <i class="fa fa-facebook"></i>
          </a>
        </li>
        <li class="list-unstyled-item">
          <a href="https://twitter.com/?lang=ko">
            <i class="fa fa-instagram"></i>
          </a>
        </li>
      </ul>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="resources/login/vendor/jquery/jquery.min.js"></script>
    <script src="resources/login/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="resources/login/vendor/vide/jquery.vide.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="resources/login/js/coming-soon.min.js"></script>
     
   <video autoplay loop poster = "img.jpg">
      <source src ="resources/login/mp4/bg.mp4" type ="video/mp4">
   </video>
   
   
     <!-- Bootstrap core JavaScript-->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <script type="text/javascript">
     function register()
     {
       $.ajax({
         url : 'registerForm.do',
         success : function(data) {
            $(".masthead-content").html(data);   
         }
      })
     }
  </script>
  </body>
</html>