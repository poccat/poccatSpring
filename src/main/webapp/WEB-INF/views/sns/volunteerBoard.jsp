<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.List,java.util.ArrayList,java.lang.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지</title>
<style type="text/css">	
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
	List<Map<String,Object>> nanumBoardList= new ArrayList<>();
	nanumBoardList = (List<Map<String,Object>>)request.getAttribute("rList");
			int    com_b_no 	=  0;
			int com_b_view 	=  0;
			String com_b_cnt		= null;
			String com_b_title 	= null;
			String com_photo 	= null;
			String com_b_date 	= null;
			String com_b_type 	= null;
			String com_b_author 	= null;
			System.out.println(nanumBoardList);
	if(nanumBoardList!=null){
		for (int i=0; i<nanumBoardList.size(); i++){
			com_b_no = Integer.parseInt(String.valueOf(nanumBoardList.get(i).get("COM_B_NO")));
			com_b_view = Integer.parseInt(String.valueOf(nanumBoardList.get(i).get("COM_B_VIEW")));
			com_b_cnt = (String)nanumBoardList.get(i).get("COM_B_CNT");
			com_b_title = (String)nanumBoardList.get(i).get("COM_TITLE");
			com_photo = (String)nanumBoardList.get(i).get("COM_PHOTO");
			com_b_date = (String)nanumBoardList.get(i).get("COM_B_DATE");
			com_b_type = (String)nanumBoardList.get(i).get("COM_B_TYPE");
			com_b_author = (String)nanumBoardList.get(i).get("MEM_NAME");
		}
	}
	
%>
<%@ include file="header.jsp" %>
<script>
	function writeBoard(){
		var mem_no = "<%=mem_no%>";
		var mem_id = "<%=mem_id%>";
		console.log("writeBoard에서 mem_id==>"+mem_id);
			if(mem_no>0 && mem_no!=null){
				location.href='nanumBoardInsert.jsp'
			} else{
				alert("로그인한 회원만 글을 작성할 수 있습니다.");
			}
	}
	function boardDetail(pcom_b_no){
		location.href="secondB/common_board_detail.foc?com_b_no="+pcom_b_no
	}
</script>
</head>
<body>
<script>
$(document).ready(function(){
	});
</script>
<div class="container">
<div class="col-md-12">
  <h1 class="title">봉사 게시판</h1>
  <div class="well well-lg" style="text-align:center">공지사항을 꼭 확인하세요</div>
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
			<%
				if(nanumBoardList != null) {
					for(int i=0; i<nanumBoardList.size(); i++){ %>
							<tr>
								<td><%= i+1%></td>
								<td><%=com_b_view %></td>
								<td><%=com_b_author %></td>
								<td>
								<a href="javascript:boardDetail(<%=com_b_no %>)"><%=com_b_title %></a>
								</td>
								<td><%=com_b_date %></td>
							</tr>      
					<% }
				}
				else { %>
					<tr>
						<td colspan="5">존재하는 회원이 없습니다.</td>
					</tr>
				<% } %>
		</tbody>
  </table>
  </div>
  <hr></hr>
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
								<button type="button" class="btn btn-primary" onclick="writeBoard()">
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