<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<%@ include file="/common/bootstrap_common.jsp" %>
<style>
	.jumbotron {
		background-image: url('../images/cat3.jpg');
		background-size: cover;
		color: white;
	}
</style>
</head>
<body>
	    <!--==================== [[ top.jsp 시작 ]] ====================-->		
	    <div class="row top"> <!-- row top  -->
	    		  <div class="col-sm-12">
					    <%@include file="./top.jsp" %> 
	    		  </div>
	    </div><!-- row top  -->
	    <!--==================== [[ top.jsp 끝 ]] ====================-->		
	<div class="container"><!--container 시작-->
	    <!--==================== [[ body.jsp 시작 ]] ====================-->		
	    <div class="row body"> <!-- row body  -->
				<!--================================================점보트론 시작=========================================== -->
					<div class="container">
					<div class="jumbotron">
					<h1 class="text-center">길고양이에 사랑을</h1>
					<p class="text-center">당신의 관심에 감사드립니다.</p>
					<p class="text-center">
					<a href="#" class="btn-primary btn-lg" role="button">후원하기</a>
					</p>
					</div>
					</div>
				<!--==================================================점보트론 끝================================================= -->
				 <div class="container">
					      <div class="row">
							        <div class="col-12">
							          <h1>단일정보 게시판</h1>
									          <ul class="list-group">
									            <li class="list-group-item">업체리소드 <span class="badge badge-primary">New</span></li>
									            <li class="list-group-item">자유게시판<span class="badge badge-danger">10</span></li>
									          </ul>
							        </div>
					      </div>
				  </div>
			</div>  <!-- row body  -->
	    <!--==================== [[ body.jsp 끝 ]] ====================-->		
	    <!--==================== [[ bottom.jsp 시작 ]] ====================-->		
	    <div class="row bottom"> <!-- row bottom -->
	    		 <div class="col-sm-12">
	    		 		
	    		 </div>
	    </div> <!-- row bottom -->
	    <!--==================== [[ bottom.jsp 끝 ]] ====================-->		
	</div>
</body>
</html>