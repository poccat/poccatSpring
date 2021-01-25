<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Map,java.util.HashMap,java.util.List,java.util.ArrayList,java.lang.*" %>
<%
	List<Map<String,Object>> BoardList= null;
	BoardList = (List<Map<String,Object>>)request.getAttribute("rList");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/boardList.css">
<meta charset="UTF-8">
<title>후원 게시판</title>
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
</head>
<body>
<script>
  document.addEventListener("DOMContentLoaded", function(){
	});
</script>
<%@ include file="header.jsp" %>
<div class="container">
<div class="col-md-12">
  <h1 class="title">후원 게시판</h1>
  <div class="well well-lg" style="text-align:center">마음이 따뜻해지는 후원</div>
  <hr></hr>
  <table class="table table-hover">
    <thead>
      <tr>
        <th style="width: 10%" class="text-center">글번호</th>
        <th style="width: 50%" class="text-center">제목</th>
        <th style="width: 20%" class="text-center">작성자</th>
        <th style="width: 10%" class="text-center">작성일</th>
        <th style="width: 10%" class="text-center">조회수</th>
      </tr>
    </thead>
		<tbody id="tbody">
			<%
				if(BoardList != null && BoardList.get(0).get("DON_NOTI_TITLE")!=null) {
					for(int i=0; i<BoardList.size(); i++)
					{  %>
							<tr>
								<td><%= i+1%></td>
								<td>
								<a href="/secondB/donation_noti_detail.foc?don_noti_no=<%=Integer.parseInt(String.valueOf(BoardList.get(i).get("DON_NOTI_NO")))%>">
								<%= (String)BoardList.get(i).get("DON_NOTI_TITLE")%></a>
								</td>
								<td><%=(String)BoardList.get(i).get("DON_NOTI_TYPE")%></td>
								<td><%= (String)BoardList.get(i).get("DON_NOTI_DATE")%></td>
								<td>0</td>
							</tr>      
					<% }
				}
				else { %>
					<tr>
						<td colspan="5">존재하는 게시글이 없습니다.</td>
					</tr>
				<% } %>
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