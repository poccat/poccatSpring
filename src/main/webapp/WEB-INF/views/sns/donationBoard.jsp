<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나눔게시판</title>
<style type="text/css">	
	.container {
	margin-top:50px;
	}
	.table{
			border:1px;
			text-align: center;
			font-size:15px;
	}
	.title{
			margin-bottom:10px;
			text-align:center;	
			font-size:30px;	
	}
	.pg-center { 
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    justify-content: flex-start;
	}
</style>
<%
	int bNum = 1; //<- DB에서 가져올때 for문 + map.getValue로 바꿀 것
	String bTitle = "신*영님께서 간식, 마스크, 구강관리용품 등 후원해주셨습니다~";
	String bWriter = "관리자";
	String bDate = "2020-02-20";
	int bView = 355;
%>
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
			                +'			      <a href="donationBoardDetail.jsp">                              '
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
<%@ include file="header.jsp" %>
<div class="col-md-12">
  <h1 class="title">후원 게시판</h1>
  <div class="well well-lg" style="text-align:center">마음이 따뜻해지는 후원</div>
  <hr></hr>
  <table class="table table-hover">
    <thead>
      <tr>
        <th style="width: 10%" class="text-center">글번호</th>
        <th style="width: 60%" class="text-center">제목</th>
        <th style="width: 10%" class="text-center">작성자</th>
        <th style="width: 10%" class="text-center">작성일</th>
        <th style="width: 10%" class="text-center">조회수</th>
      </tr>
    </thead>
		<tbody id="tbody">
			<!-- 자바스크립트 for문으로 내용들어감-->
		</tbody>
  </table>
  </div>
    		<div class="row">
				<div class="col-md-4">
				</div>
				<div class="col-md-4">
				</div>
				<div class="col-md-4">
					<div class="row">
						<div class="col-md-2">
						</div>
						<div class="col-md-2">
						</div>
						<div class="col-md-2">
						
						</div>
						<div class="col-md-2">
						</div>
						<div class="col-md-2">
								<div class="button">
								<button type="button" class="btn btn-outline-secondary" onclick="location.href='nanumBoardInsert.jsp'">
								<span class="glyphicon glyphicon-pencil"></span>
								 글쓰기
								</button>
						    	</div>	
						</div>
						<div class="col-md-2">
						</div>
					</div>
				</div>
			</div>
					<div class="row">
						<div class="col-md-4">
						</div>
						<div class="col-md-auto">
							<nav class="pagination">
								<ul class="pagination">
									<li class="page-item disabled">
										<a class="page-link" href="#">이전 페이지</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">1</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">2</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">3</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">4</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">5</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">다음 페이지</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
</div>
</body>
</html>