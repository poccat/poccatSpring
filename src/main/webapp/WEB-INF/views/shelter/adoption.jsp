<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String filename = "cat.jpg"; //<- DB에서 가져올때 for문 + map.getValue로 바꿀 것
	String age = "1";
	String gender = "암";
	String date = "2020.12.31";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/common/bootstrap_common.jsp" %>
<link rel="stylesheet" href="../css/sidemenu.css"/>
<title>입양공고 페이지</title>
<style type="text/css">
	img {
			  width: 200px;
			  height: 200px;
			  overflow: hidden;
			}
	.thumbnail {
		margin: 5px;
		padding: 0px;
	}
	.caption{
		margin-bottom: 10px;
		margin-left: 10px;
	}
</style>
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
	    <!--==================== [[ body 시작 ]] ====================-->		
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
				     <h1> 입양공고 </h1>
				     <div class="well well-lg"> 입양신청전 절차를 반드시 확인해주세요 </div>
									 <script>
									 for (var i= 0 ; i<3 ; i++){
											document.write(' <div class="row">')
											for (var i2= 0 ; i2<3 ; i2++){
														document.write(
														'	<div class="col-sm-4">                          	'
														+'<table class="table table-bordered"> 										'
														+'<tr>'
														+'<td>'
														+'	 <!--======썸네일 이미지 시작=====-->                         				'
													    +'		<div class="thumbnail">                                             '
														+'			      <a href="adoption_detail.jsp">                              '
														<%-- +'<a href="<%=filename%>">'	 <- db연동시 위 라인과 교체		 --%>	
														+'			        <img src="../images/cat.jpg"								'
														+'alt="1" style="width:100%">'
														+'			      </a>                                                      '
														+'		 </div>                                                             '
														+'			        <div class="caption">                                   '
														+'			          	<li>나이:                                       	'
														+'<%=age%>																			' 
														+'	</li>                                   							'
														+'			          	<li>성별:                                       	'
														+'<%=gender%>															' 
														+'	</li>                                   								'
														+'			          	<li>구조일자: '
														+'<%=date%>																		' 
														+'	</li>                                   								'
														+'			        </div>                                                  '
														+'</td>'
														+'</tr>'
														+'			        </table>                                                  '
														+'	 <!--======썸네일 이미지 끝=====-->                                    		'
														+' </div>'  
														)
											}
											document.write(' </div>')
									 }
									 </script>
					<!--==========================[[ 페이지네이션 시작]]=================================-->
					<div class="text-center">
						<ul class="pagination">
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
						</ul>
					</div>
					<!--==========================[[ 페이지네이션 끝]]=================================-->
		        </div> <!-- body middle  -->
		        <div class="col-sm-2"> <!-- body right -->
     			</div> <!-- body right -->
	    </div>
	    <!--==================== [[ body 끝 ]] ====================-->		
	    <!--==================== [[ bottom.jsp 시작 ]] ====================-->		
	    <div class="row bottom">
	    		 <div class="col-sm-12">
	    		 		
	    		 </div>
	    </div>
	    <!--==================== [[ bottom.jsp 끝 ]] ====================-->		
		</div><!--  ===================[[ 컨테이너 끝 ]]====================  -->
</body>
</html>