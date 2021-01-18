<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.List,java.util.ArrayList,java.lang.*" %>
<%
	List<Map<String,Object>> BoardList= null;
BoardList = (List<Map<String,Object>>)request.getAttribute("rList");
			int    com_b_no 	=  0;
			int com_b_view 	=  0;
			String com_b_cnt		= null;
			String com_b_title 	= null;
			String com_photo 	= null;
			String com_b_date 	= null;
			String com_b_type 	= null;
			String com_b_author 	= null;
			String boardName 	= null;
	if(BoardList!=null){
			System.out.println(BoardList);
		for (int i=0; i<BoardList.size(); i++){
			com_b_cnt = (String)BoardList.get(i).get("COM_B_CNT");
			com_b_type = (String)BoardList.get(i).get("COM_B_TYPE");
		}
	}
	request.setAttribute("com_b_type", com_b_type);
	if (com_b_type.equals("0")){
		boardName = "공지사항";
	} else if (com_b_type.equals("3")){
		boardName = "나눔게시판";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title id="comboardTitle">공지</title>
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

<%@ include file="header.jsp" %>
<script>
	function writeBoard(){
		var mem_no = "<%=mem_no%>";
		var mem_id = "<%=mem_id%>";
		var com_b_type = "<%=com_b_type%>";
			if(mem_no>0 && mem_no!=null){
				location.href='<%=path%>sns/commonBoardInsert.jsp?com_b_type='+com_b_type;
			} else{
				alert("로그인한 회원만 글을 작성할 수 있습니다.");
			}
	}
	function boardDetail(pcom_b_no){
		location.href="<%=path%>common_board_detail.foc?com_b_no="+pcom_b_no;
	}
</script>
</head>
<body>
<script>
$(document).ready(function(){
	var boardTitle = "<%=boardName%>";
	$(".boardTitle").text(boardTitle);
	$("#comboardTitle").text(boardTitle);
	});
</script>
<div class="container">
<div class="col-md-12">
  <h1 class="title">공지게시판</h1>
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
				if(BoardList != null && BoardList.get(0).get("COM_TITLE")!=null) {
					for(int i=0; i<BoardList.size(); i++)
					{  %>
							<tr>
								<td><%= i+1%></td>
								<td>
								<a href="javascript:boardDetail(
								<%=Integer.parseInt(String.valueOf(BoardList.get(i).get("COM_B_NO")))%>)">
								<%=(String)BoardList.get(i).get("COM_TITLE")%></a>
								</td>
								<td><%=(String)BoardList.get(i).get("MEM_NAME")%></td>
								<td><%=(String)BoardList.get(i).get("COM_B_DATE")%></td>
								<td><%=Integer.parseInt(String.valueOf(BoardList.get(i).get("COM_B_VIEW")))%></td>
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