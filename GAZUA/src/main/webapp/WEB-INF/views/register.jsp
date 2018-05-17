<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Register an Account</title>
<!-- Bootstrap core CSS-->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="resources/vendor/font-awesome/css/font-awesome.min.css"
   rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="resources/css/sb-admin.css" rel="stylesheet">

<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<script type="text/javascript">
   $(function() {
      $("#date1").datepicker({
         dateFormat : "yy-mm-dd",
         changeYear : true,
         changeMonth : true
      });
      $('#emailHelp').hide();
      $('#nameHelp').hide();
      $('#passwordHelp').hide();
      $('#dayHelp').hide();
      $('#sexHelp').hide();
    

      $('#reg').click(
            function(event) {
               if ($('input[name=ID]').val().length == 0) {
                  $('#emailHelp').show();
               } else {
                  $('#emailHelp').hide();
               }
               ;
               if ($('input[name=NAME]').val().length == 0) {
                  $('#nameHelp').show();
               } else {
                  $('#nameHelp').hide();
               }
               ;
               if ($('input[name=PASSWORD]').val().length == 0) {
                  $('#passwordHelp').show();
               } else {
                  $('#passwordHelp').hide();
               }
               ;
               if ($('input[name=BIRTHDAY]').val().length == 0) {
                  $('#dayHelp').show();
               } else {
                  $('#dayHelp').hide();
               }
               ;

               if ($('input[name=ID]').val().length == 0
                     || $('input[name=NAME]').val().length == 0
                     || $('input[name=PASSWORD]').val().length == 0
                     || $('input[name=BIRTHDAY]').val().length == 0) {
                  return false;
               }

            })
            
   });
   
   function check()
   {
	   $.ajax({
           url : 'checkId.do',
           type : 'get',
           data : $('input[name=id]').serialize(),
           success : function(getId) {       	   
              if ($('input[name="id"]').val() == ""){
                 alert("아이디를 확인해 주세요.");
              }else if(getId == 'get'){
                 alert("이미 사용하고 있는 아이디 입니다.");
              } else if(getId == 'no'){
                 alert("사용 가능한 아이디 입니다.");
                 $("#checkId").attr("result", "checked");
                 //$("#checkId").css("display", "none");
                 $("#comform").css("display", "inline");
              }
           },
        });
   }
 function emailCheck()
 {
	 alert('클릭');
     $.ajax({
         url: 'check.do',
         type: 'post',
         data: $('input[name=id]').serialize(),
         success:function(test){
        	 alert("비동기완료");
            $("#comform").css("display", "none");
            $("#cknum").css("display", "inline");
            $("#finalcheck").css("display", "inline");
            $('#finalcheck').click(function(){
               var number=document.getElementById('cknum').value;
               var ck=test
               if(ck==number){
                  alert("인증완료!");
                  $("#finalcheck").attr("result", "checked");
               }else{
                  alert("인증번호를 확인해주세요!");
                  
               }
            })
         } 
      });
 }
 
 function helpEmail()
 {
   $("#emailHelp").html("<div style='color:green'>입력완료</div>");
 }
 function helpName()
 {
   $("#nameHelp").html("<div style='color:green'>입력완료</div>");
 }
 function helpPass()
 {
   $("#passwordHelp").html("<div style='color:green'>입력완료</div>");
 }
</script>
</head>
<body class="bg-dark">
   <div class="container">
    <h1 class="mb-3"> <div style="position: relative; left: 55px; top: 30px"> 
    <input type="image" src="resources/image/gazua.png"></div></h1>
      <div class="card card-register mx-auto mt-5">
         <div class="card-header" style="color:black">회원가입</div>
         <div class="card-body">
            <form action="register.do" id="regForm">
               <div class="form-group">
                  <div class="form-row">
                     <label for="exampleInputEmail1" style="color:black">이메일</label> <input
                        class="form-control" name="id" type="email"
                        aria-describedby="emailHelp" placeholder="Enter email" onchange="helpEmail()">
                  </div>
                  <div id="emailHelp" style="color: red;" >이메일을 입력해주세요.</div>
                  <input type="button" id="checkId" class="btn btn-primary btn-block"
                         value="중복확인" style="display: inline;" onclick="check()">
                  <input type="button" id="comform" value="인증하기" result="unchecked"
                        style="display: none;" onclick="emailCheck()">
                  <input type="text" style="display: none;" id="cknum">
                  <input type="button" id="finalcheck" value="인증완료" result="unchecked"
                        style="display: none;">
               </div>
               
               <div class="form-group">
                  <div class="form-row">
                     <label for="exampleInputName" style="color:black">이름</label> <input
                        class="form-control" name="name" type="text"
                        aria-describedby="nameHelp" placeholder="Enter user name" onchange="helpName()">
                  </div>
                  <div id="nameHelp" style="color: red">이름을 입력해주세요.</div>
               </div>
               <div class="form-group">
                  <div class="form-row">
                     <label for="exampleInputPassword1" style="color:black" onchange="helpPass()">비밀번호</label> <input
                        class="form-control" name="password" type="password"
                        placeholder="Password">
                  </div>
                  <div id="passwordHelp" style="color: red">비밀번호를 입력해주세요.</div>
               </div>
               <div class="form-group">
                  <div class="form-row">
                     <label for="exampleInputPassword1" style="color:black">비밀번호 확인</label> <input
                        class="form-control" name="password2" type="password"
                        placeholder="Password">
                  </div>
                  <div id="passwordHelp1" style="color: red"></div>
               </div>
               <div class="form-group">
                  <div class="form-row">
                     <label for="exampleInputName" style="color:black">생일</label> <input
                        class="form-control" name="birthday" id="date1" type="text"
                        aria-describedby="dayHelp" placeholder="Enter user birthday">
                  </div>
                  <div id="dayHelp" style="color: red">생일를 입력해주세요.</div>
               </div>

               <div class="form-group">
                  <div class="form-row">
                     <div class="col-md-6">
                        <label style="color:black"><input class="form-control" name="sex"
                           type="radio" value="1" /> 남자</label>
                     </div>
                     <div class="col-md-6">
                        <label style="color:black"><input class="form-control" name="sex"
                           type="radio" value="2">여자 </label>
                     </div>

                  </div>
               </div>
               <input type="submit" class="btn btn-primary btn-block" id="reg"
                  value="회원등록">
            </form>
            <div class="text-center">
               <a class="d-block small mt-3" href="login.do">Login Page</a> <a
                  class="d-block small" href="forgot-password.html">Forgot
                  Password?</a>
            </div>
         </div>
      </div>
   </div>
   <!-- Bootstrap core JavaScript
   <script src="../../resources/vendor/jquery/jquery.min.js"></script>
   <script src="../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    Core plugin JavaScript
   <script src="../../resources/vendor/jquery-easing/jquery.easing.min.js"></script> -->
</body>
</html>

