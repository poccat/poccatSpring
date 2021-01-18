<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/common/bootstrap_common.jsp" %>
<head>
<meta charset="UTF-8">
<title>자주묻는 질문</title>
<link rel="stylesheet" href="../css/sidemenu.css"/>
<style>
	
</style>
</head>
<body>
		<!--==================== [[ top.jsp 시작 ]] ====================-->		
	    <div class="row top">
	    		  <div class="col-sm-12">
					    <%@include file="./top.jsp" %> 
	    		  </div>
	    </div>
	    <!--==================== [[ top.jsp 시작 ]] ====================-->		
<div class="container"><!-- container 시작 -->
	    <!--==================== [[ body 시작 ]] ====================-->		
	    <div class="row body"> <!-- row body 시작  -->
					 <div class="col-sm-2"> <!-- body left  -->
		<!-- ========================[[ 사이드 메뉴바 시작]]============================= -->
					<div class="list-group ">
					<div>
						<h2>질문</h2>
					</div>
								  <a href="#" class="list-group-item borderless">자주묻는질문</a>
								  <a href="#" class="list-group-item borderless">질문게시판</a>
					</div>
		<!-- ========================[[ 사이드 메뉴바 끝]]============================= -->
				    </div> <!-- body left  -->
			<br>
	     <div class="col-sm-10"> <!-- body middle  -->
			<h1 class="text-left">자주묻는질문</h1>
				 		<div class="well well-sm">
						<h5>자주 묻는 질문을 정리해놓았습니다.</h5>
						</div> 
		<!-- =========================[[ 자주묻는 질문 시작 ]]================================ -->
				 <!-- ------------------------------------ 질문 시작 -------------------------------------------------- -->
				  <a href="#q1" class="btn btn-info" data-toggle="collapse"><h5>입양 신청을 하려면 어떤 자격이 있어야 하나요?</h5></a>
						  <div id="q1" class="collapse">
						  		<div class="panel panel-default">
								 	 <div class="panel-body">
										    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
										    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
										    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
								 	 </div>
								</div>
						  </div>
				 <!-- ------------------------------------ 질문 끝 -------------------------------------------------- -->
				 <!-- ------------------------------------ 질문 시작 -------------------------------------------------- -->
				  <a href="#q2" class="btn btn-info" data-toggle="collapse"><h5>입양 신청을 하려면 어떤 자격이 있어야 하나요?</h5></a>
						  <div id="q2" class="collapse">
						  		<div class="panel panel-default">
								 	 <div class="panel-body">
										    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
										    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
										    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
								 	 </div>
								</div>
						  </div>
				 <!-- ------------------------------------ 질문 끝 -------------------------------------------------- -->
		<!-- =========================[[ 자주묻는 질문 끝 ]]================================ -->
		</div><!-- body middle  -->
		 <div class="col-sm-2"> <!-- body right  -->
		 </div> <!-- body right  -->
		</div><!-- row body 끝  -->
		 <!--==================== [[ bottom.jsp 시작 ]] ====================-->		
	    <div class="row bottom">
	    		 <div class="col-sm-12">
	    		 		
	    		 </div>
	    </div>
	    <!--==================== [[ bottom.jsp 끝 ]] ====================-->		
</div><!-- container 끝 -->
</body>
</html>