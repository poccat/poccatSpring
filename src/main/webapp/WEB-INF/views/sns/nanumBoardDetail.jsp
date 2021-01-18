<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.Enumeration,java.lang.*" %> 
<%
	Map<String,Object> target = new HashMap<>();
	 Enumeration<String> en = request.getParameterNames();//getParameter로 받아오는 값의 리턴타입은 String이므로 Enumeration의 타입도 String으로 한다.
 	 while(en.hasMoreElements()) {//hasMoreElement는 boolean타입 메서드
	    String name = (String) en.nextElement();
		String[] values = request.getParameterValues(name);		
		for (String value : values) {
			target.put(name,value);
		}
 	 }
%>
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
	.form-comment{
		padding-top:30px;
		padding-bottom:30px;
	}
	#comment-layout{
			padding-top:30px;
			padding-bottom:30px;
	}
	.btn{
		float:right;
	}
	.list_inline{
		list_style:none;
		margin : 0;
		padding : 0;
	}
	.list_inline li {
		float :right;
	}
</style>

</head>
<body>
<%@ include file="header.jsp" %>

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
			<h1 class="title" >나눔 글 상세보기</h1>
				<div id="detailTitle">
				<div class="col-md-12">
					<h4>히든에 넣어둔 글번호와 type=<%=target.get("com_b_no")%>,<%=target.get("com_b_type")%>
					<small>(5)</small><!-- 댓글 수 어떻게 가져올것인지 생각해보기 -->
					<!--리스트에서 글을 눌렀을때 글 디테일과, 댓글목록가져오기(해당글의 번호랑 type넘기면됨)  -->
					<!-- 나눔보드에서 아작스로 디테일 div생성시키고 처리하면서 댓글만? 불러온다? -->
					</h4>
				</div>
				<div style="text-align:right; padding-right:30px;">
					  <ul class="list-inline">
					    <li>Cat1</li>
					    <li>2020-02-20</li>
					    <li>355</li>
					  </ul>
					  </div>
					<!-- 반복문 받아오기 -->
				</div>
				<div class="col-md-12">
<textarea class="form-control" rows="25" name="text-box" readonly="readonly" style="cursor:auto">
캣타워! 신선하다! 별이 다섯개!
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
</body>
</html>