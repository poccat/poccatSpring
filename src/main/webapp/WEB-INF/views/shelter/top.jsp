<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
	*{
	font-family: 'Noto Sans KR', sans-serif;
	}
	.container{
		padding: 0px;
	}
	.navbar-brand{
		padding-left: 0px;
		padding-top:20px;
	}
	.navbar-nav > li > a{
	    padding-top:30px !important; padding-bottom:20px !important;
	    margin-bottom:20px;
	}
	.navbar > .container-fluid {
	margin-left: 20%;
	min-height:30px !important;
	padding-left: 0;
	}
	#loginForm{
	margin-right: 20%;
	padding-top:20px;
	}
	.navbar-brand > h1 {
		margin:0;
	}
	.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
	}
	ul > li > a {
	font-size: 16px;
	font-weight: bold;
	}
</style>
</head>
<body>
 <!-- ===================================[[상단바 시작]]================================= -->
 <nav class="navbar navbar-default">
  <!-- ===================================[[상단로그인 시작]]================================= -->
	<div id="loginForm" class="nav navbar-nav navbar-right">
	     <form class="navbar-form navbar-right">
		      <div class="form-group">
		        <input type="text" class="form-control" id="mem_id" name="mem_id" 
		               size="10" placeholder="아이디">
		      </div>
		      <div class="form-group">
		        <input type="text" class="form-control" id="mem_pw" name="mem_pw" 
		               size="10" placeholder="비밀번호">
		      </div>
	      <button type="button" class="btn btn-danger" onclick="loginAction()">로그인</button>
	      <button type="button" class="btn btn-danger" onclick="regidterForm()">회원가입</button>
	    </form>
    </div>
 <!-- ===================================[[상단로그인 끝]]================================= -->
  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="main.jsp"><h1>포캣 보호소</h1></a>
	    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown"> <!-- ------------- dropdown1 --------------- -->
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">소개
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="introduction.jsp">기관소개</a></li>
          <li><a href="board-noti.jsp">공지사항</a></li>
        </ul>
      </li><!---------------------- ------------- dropdown1 --------------- -->
      <li class="dropdown"> <!-- ------------- dropdown2 --------------- -->
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">입양
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="adoption.jsp">입양공고</a></li>
          <li><a href="procedure.jsp">입양절차</a></li>
          <li><a href="#">입양후기</a></li>
        </ul>
      </li><!---------------------- ------------- dropdown2 --------------- -->
      <li class="dropdown"> <!-- ------------- dropdown3 --------------- -->
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">정보
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">동물건강정보</a></li>
          <li><a href="#">유기동물현황</a></li>
          <li><a href="shelterinfo.jsp">전국보호소정보</a></li>
        </ul>
      </li><!---------------------- ------------- dropdown3 --------------- -->
      <li class="dropdown"> <!-- ------------- dropdown4 --------------- -->
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">질문
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="FAQ.jsp">자주하는질문</a></li>
          <li><a href="question.jsp">문의게시판</a></li>
        </ul>
      </li><!---------------------- ------------- dropdown4 --------------- -->
       <li><a href="#">업체홍보</a></li>
    </ul>
  </div>
</nav>
 <!-- ===================================[[상단바 끝]]================================= -->

</body>
</html>