<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<!-- Compiled and minified CSS -->
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<!-- Compiled and minified JavaScript -->
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<link rel="stylesheet" href="/css/login.css">


</head>
<body>
  <div class="managerlogin">
  		<div>
  			<a href="#" class="manager_a">관리자 로그인</a>
  		</div>
  </div>
  <div class="container">
    <div class="choose">

      <button class="applicant btn grey lighten-5" value="구직자 로그인">
        <div>구직자 로그인</div>
      </button> 
      <button class="company btn grey lighten-5" value="기업 로그인">
        <div>기업 로그인</div>
      </button>


    </div>
  </div>
  <div id="applicant_modal">
    <div id="applicant_login">
      <div class="x_box">
        <a href="#" class="x">x</a>
      </div>
      <div class="login_text">
        <b>구직자용 로그인</b>
      </div>
      <form action="/user/loginProc" method="POST" class="login_form">
        <div class="row">
          <div class="input-field col s12">
            <input id="applicantId" type="text" name="username"
              class="validate" value="applicant"> <label
              for="applicantId">아이디</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12">
            <input id="pw1" type="password" name="password" class="validate "
              value="applicant" /> <label for="userPassword">패스워드</label>
          </div>
        </div>
        <button class="btn waves-effect waves-light blue" type="submit"
          name="action">로그인</button>
      </form>
      <a href="/user/applicant/join"><p>구직자용 회원가입</p></a>
    </div>
  </div>

  <div id="company_modal">
    <div id="company_login">
      <div class="x_box">
        <a href="#" class="x">x</a>
      </div>
      <div class="login_text">
        <b>기업용 로그인</b>
      </div>
      <form action="/user/loginProc" method="POST" class="login_form">
        <div class="row">
          <div class="input-field col s12">
            <input id="applicantId" name="username" type="text"
              class="validate"> <label for="applicantId">아이디</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12">
            <input id="pw1" type="password" name="password" class="validate " />
            <label for="userPassword">패스워드</label>
          </div>
        </div>
        <button class="btn waves-effect waves-light blue" type="submit"
          name="action">로그인</button>
      </form>
      <a href="/user/company/join"><p>기업용 회원가입</p></a>
    </div>
  </div>
  
  <div id="manager_modal">
    <div id="manager_login">
      <div class="x_box">
        <a href="#" class="x">x</a>
      </div>
      <div class="login_text">
        <b>관리자용 로그인</b>
      </div>
      <form action="/user/loginProc" method="POST" class="login_form">
        <div class="row">
          <div class="input-field col s12">
            <input id="applicantId" name="username" type="text"
              class="validate"> <label for="applicantId">아이디</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12">
            <input id="pw1" type="password" name="password" class="validate " />
            <label for="userPassword">패스워드</label>
          </div>
        </div>
        <button class="btn waves-effect waves-light blue" type="submit"
          name="action">로그인</button>
      </form>
    </div>
  </div>



  <script>
    $(".applicant").click(function(){
        $("#applicant_modal").addClass("active");
    });
    $(".company").click(function(){
        $("#company_modal").addClass("active");
    });
    $(".manager_a").click(function(){
        $("#manager_modal").addClass("active");
    });
    $(".x").click(function(){
        $("#applicant_modal").removeClass("active");
        $("#company_modal").removeClass("active");
        $("#manager_modal").removeClass("active");
    });
</script>
<script>
	function company(){
		
	}
</script>
</body>
</html>