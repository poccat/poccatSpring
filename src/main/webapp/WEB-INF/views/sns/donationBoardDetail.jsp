<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.table {
			text-align: center;
			border:1px;
			font-size:15px;
	}
	.table > thread{
			text-align: center;
			border:1px;
			font-size:15px;
	}
	.table > tbody{
			text-align: center;
			border:1px;
			font-size:15px;
	}
	.title{
			margin-bottom:10px;
			text-align:center;	
			font-size:30px;	
	}
	#comment-layout{
			padding-top:30px;
			padding-bottom:30px;
	}
	.btn{
		float:right;
	}
	.form-comment{
		padding-top:30px;
		padding-bottom:30px;
	}
	#detailTitle{
		padding-left:15px;
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
<%@ include file="header.jsp" %>
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
	var detailTitle = document.getElementById("detailTitle");
	detailTitle.readOnly = true;
	
</script>
<div class="container-fluid">
	<div class="container">
		<div class="col-md-12">
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
								</div>
								<div class="col-md-1">
										<div class="button">
										<button type="button" class="btn btn-outline-secondary" onclick="location.href='#'">
										<span class="glyphicon glyphicon-chevron-left"></span>
										 이전 글
										</button>
								    	</div>	
								</div>
								<div class="col-md-1">
										<div class="button">
										<button type="button" class="btn btn-outline-secondary" onclick="location.href='#'">
										<span class="glyphicon glyphicon-chevron-right"></span>
										다음 글
										</button>
										</div>	
								</div>
							</div>
			<div class="page">
			<h1 class="title" >후원 글 상세보기</h1>
				<div id="detailTitle">
				<div class="col-md-12">
					<h4>신*영님께서 간식, 마스크, 구강관리용품 등 후원해주셨습니다~
					<small>(5)</small><!-- 댓글 수 -->
					</h4>
					  <ul class="list-inline">
					    <li>관리자</li>
					    <li>2020-02-20</li>
					    <li>355</li>
					  </ul>
				<hr></hr>
				</div>
				<div class="col-md-12">
					<!-- 반복문 받아오기 -->
				</div>
				<div class="col-md-12">
<div contentEditable="true">
    <img src="./img/123.jpg" />
</div>
<textarea class="form-control" rows="25" name="text-box" readonly="readonly" style="cursor:auto">
* 후원일: 2월 20일
* 후원품: 간식, 마스크, 구강관리용품 등




신*영님께서 간식, 마스크, 구강관리용품 후원해주셨습니다~

보내주신 후원물품, 아이들을 위해 감사히 사용하겠습니다.

(아이들용품뿐만 아니라 활동가들을 위해 보내주신 마스크 또한 감사히 사용하겠습니다)

 

다시 한번 후원해주셔서 감사합니다. ^^
</textarea>
				</div>
			<hr></hr>
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12" id="comment-layout">
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
								</div>
								<div class="col-md-1">
									<div>
									<button id="page-revise" type="button" class="btn btn-outline-secondary">
									 수정
									</button>
									</div>	
								</div>
								<div class="col-md-1">
									<div>
									<button id="page-delete" type="button" class="btn btn-outline-secondary">
									삭제
									</button>
									</div>	
								</div>
							</div>
							<div class="form-comment">
      							<input type="text" class="form-control" placeholder="댓글을 적어주세요.">
   							</div>
							<div class="row">
			        			<button type="submit" class="btn btn-secondery btn-link" type="button">댓글쓰기</button>
							</div>
						</div>
					</div>
				</div>
					<table class="table table-sm">
					    <thead>
					      <tr>
					        <th class="text-center">번호</th>
					        <th class="text-center">제목</th>
					        <th class="text-center">작성자</th>
					        <th class="text-center">작성일</th>
					        <th class="text-center">조회수</th>
					      </tr>
					    </thead>
					    <tbody id="tbody">
							<!-- 자바스크립트 for문으로 내용들어감-->
					    </tbody>
					</table>
					<hr></hr>
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
						<div class="col-md-1">
						</div>
					</div>
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
								</div>
								<div class="col-md-1">
							<div>
									<button type="button" class="btn btn-outline-secondary" onclick="location.href='nanumBoard.jsp'">
									 등록
									</button>
							</div>	
								</div>
								<div class="col-md-1">
							<div>
									<button type="button" class="btn btn-outline-secondary" onclick="location.href='#top-page'">
									<span class="glyphicon glyphicon-chevron-up"></span>
									TOP
									</button>
							</div>	
								</div>
							</div>
					</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>