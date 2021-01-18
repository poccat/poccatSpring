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
	    <!--==================== [[ top.jsp 시작 ]] ====================-->		
<div class="container"><!--  ===================[[ 컨테이너 시작 ]]====================  -->
    <!--==================== [[ body 시작 ]] ====================-->		
	    <div class="row body"> <!-- row body 시작  -->
					 <div class="col-sm-2"> <!-- body left  -->
		<!-- ========================[[ 사이드 메뉴바 시작]]============================= -->
					<div class="list-group ">
								  <a href="#" class="list-group-item borderless">기관소개</a>
								  <a href="#" class="list-group-item borderless">공지사항</a>
					</div>
		<!-- ========================[[ 사이드 메뉴바 끝]]============================= -->
	    </div> <!-- body left  -->
			<br>
	     <div class="col-sm-10"> <!-- body middle  -->
<!--================================================ 기관소개 시작 ================================================== -->
  <h1>기관소개 </h1>
  <hr>
		  <h2 class="text-primary">포켓보호소에 오신걸 환영합니다.</h2>
			  <h4>저희 홈페이지는 배고픈 길냥이들의 정보, 보호소에 입양을 기다리는 고양이들을 위해 만들었습니다. </h4>
					 <div class="media">
					  			<div class="media-left media-middle">
								    <a href="#">
								      <img class="media-object" src="../images/catboho_2.jpg" alt="이미지">
								    </a>
					  			</div><!-- media-left  media-middle-->
					  			<div class="media-body">
									  <h4 class="text-primary">소중한 후원금은 길냥이들에 사료와 안식처 유지에 제공됩니다.</h4>
									  <h4 class="font-weight-normal">업체홍보를 통해 보호중인 길고양이들을 확인하실수 있으며 후원은 이들에게 큰 힘이 됩니다.  </h4>
									  <h4 class="text-primary">고양이 사지말고 입양으로 사랑을 실천하세요.</h4>
									  <h4>홈페이지에 입양신청을 클릭하세요 당신의 입양이 내일이 필요한 고양이들에게 미래를 줍니다.</h4>
									  <h4 class="text-primary">고양이에 대한 정보를 성심껏 답변해드립니다.</h4>
									  <h4>여러분이 몰랐던 고양이에 대한 정보를 제공하여 한층더 가까워지도록 노력하겠습니다.</h4>
								</div><!-- media-body  -->
						</div><!-- media  -->
					  <footer>포켓보호소 드림.</footer>
			</div><!--  body middle  -->
		</div> <!-- row body -->
	</div><!-- container  -->
<!--================================================ 기관소개 끝 ================================================== -->
</body>
</html>