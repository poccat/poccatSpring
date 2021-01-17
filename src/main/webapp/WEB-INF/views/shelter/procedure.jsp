<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>애니멀시 메인페이지</title>
<%@ include file="/common/bootstrap_common.jsp" %>
<link rel="stylesheet" href="../css/sidemenu.css"/>
</head>
<body>
		<!--==================== [[ top.jsp 시작 ]] ====================-->		
	    <div class="row top">
	    		  <div class="col-sm-12">
					    <%@include file="./top.jsp" %> 
	    		  </div>
	    </div>
	    <!--==================== [[ top.jsp 끝 ]] ====================-->		
	<div class="container"><!--  ===================[[ 컨테이너 시작 ]]====================  -->
	    <div class="row body">
		 <div class="col-sm-2"> <!-- body left  -->
		<!-- ========================[[ 사이드 메뉴바 시작]]============================= -->
					<div class="list-group ">
								<div>
										<h2>입양</h2>
								</div>
								  <a href="#" class="list-group-item borderless">입양공고</a>
								  <a href="#" class="list-group-item borderless">입양절차</a>
								  <a href="#" class="list-group-item borderless">입양후기</a>
					</div>
		<!-- ========================[[ 사이드 메뉴바 끝]]============================= -->
	    </div> <!-- body left  -->
	     <div class="col-sm-10"> <!-- body middle  -->
<!--==================================================절차게시판 시작=============================================== -->
<div class="media">
  <div class="media-left media-middle">
    <a href="#">
      <img class="media-object" src="../images/cat5_1.jpg" alt="입양 이미지">
    </a>
  	</div>
			  <div class="media-body">
			    <h2 class="media-heading">입양절차</h2>
			    
			 <h4>책임 가능한지 신원확인 가능한 성인인지 경제적 능력과 반려동물을 사랑하는 가정인지
			  입양 후 1년간 6회이내에 입양후기를 업로드 해주실수 있으신분을 한정으로 입양안내를 
			  해드리고 있습니다 </h4>
			 <h4>먼저 입양신청은 각 지점으로 문의해주세요 이후 보호소 방문을 통해
			  미팅을 하신후 상담 및 분양계약서를 작성해 주시길 바랍니다.</h4>
			  </div>
	</div>
<!--==================================================절차게시판 끝================================================= -->
	</div><!-- body middle  -->
	</div><!-- row body -->
	</div>><!--  ===================[[ 컨테이너 끝 ]]====================  -->
</body>
</html>