<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/common/bootstrap_common.jsp" %>
 <%
	int bNum = 1; //<- DB에서 가져올때 for문 + map.getValue로 바꿀 것
	String bTitle = "공지사항입니다 필독";
	String bWriter = "보호소관리자";
	String bDate = "2021.01.02";
	int bView = 10;
%>
<head>
<link rel="stylesheet" href="../css/sidemenu.css"/>
<meta charset="UTF-8">
<title>공지사항 게시판</title>
<style>

</style>
</head>
<body>
 <script>
  document.addEventListener("DOMContentLoaded", function(){
	  var tbody = document.getElementById("tbody");
	  tbody.innerHTML =
		  //for (var i=0; i<bList.length(); i++){
			                '<tr> <td>'
			                +"<%=bNum%>"
			                +'</td> <td>'
			                +'			      <a href="board-noti_detail.jsp">                              '
			                +"<%=bTitle%>"
			                +'			      </a>                              '
			                +'</td> <td>'		               
			                +"<%=bWriter%>"
			                +'</td> <td>'
			                +"<%=bDate%>"
			                +'</td> <td>'
			                +"<%=bView%>"
			                +'</td> </tr>'
			            	;
	});
	</script>
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
								  <a href="#" class="list-group-item borderless">기관소개</a>
								  <a href="#" class="list-group-item borderless">공지사항</a>
					</div>
		<!-- ========================[[ 사이드 메뉴바 끝]]============================= -->
	    </div> <!-- body left  -->
			<br>
	     <div class="col-sm-10"> <!-- body middle  -->
			<h1 class="text-left">공지사항</h1>
			<br>
			        <table class="table table-bordered table-hover">
			            <thead>
			                <tr bgcolor="#BDBDBD" font color="white">
			                    <th>글번호</th>
			                    <th>제목</th>
			                    <th>글쓴이</th>
			                    <th>작성일</th>
			                    <th>조회수</th>
			                </tr>
			            </thead>
			            <tbody id="tbody">
			            <!-- 자바스크립트 for문으로 내용들어감-->
			            </tbody>
			        </table>
		<a class="btn btn-default pull-right"> 글쓰기</a>
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
		</div><!-- body middle  -->
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