<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.List,java.util.ArrayList,java.lang.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title class="comboardTitle">Insert title here</title>
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
			padding-top:20px;
			padding-bottom:30px;
	}
	.form-comment{
		padding-top:20px;
		padding-bottom:30px;
	}
	#detailTitle{
		padding-left:15px;
	}
	.boardButtons{
		float:right;
		padding-right : 20px;
	}
	.boardButtons_left{
		float:left;
		padding-left : 20px;
	}
	input[readonly] {
	    background-color: transparent;
	    border: 0;
	    box-shadow: none;
	}
	.form-control[readonly].no-gray {
  		background-color:white;
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
			String boardName = null;
			System.out.println(nanumBoardList);
	if(nanumBoardList!=null){
			com_b_no = Integer.parseInt(String.valueOf(nanumBoardList.get(0).get("COM_B_NO")));
			com_b_view = Integer.parseInt(String.valueOf(nanumBoardList.get(0).get("COM_B_VIEW")));
			com_b_cnt = (String)nanumBoardList.get(0).get("COM_B_CNT");
			com_b_title = (String)nanumBoardList.get(0).get("COM_TITLE");
			com_photo = (String)nanumBoardList.get(0).get("COM_PHOTO");
			com_b_date = (String)nanumBoardList.get(0).get("COM_B_DATE");
			com_b_type = (String)nanumBoardList.get(0).get("COM_B_TYPE");
			com_b_author = (String)nanumBoardList.get(0).get("MEM_NAME");
	}
	if (com_b_type.equals("0")){
		boardName = "공지사항";
	} else if (com_b_type.equals("3")){
		boardName = "나눔게시판";
	}
%>
</head>
<body>
<%@ include file="header.jsp" %>
<script>
	document.addEventListener("DOMContentLoaded", function(){
	var detailCnt = document.getElementById("detailCnt");
	detailCnt.readOnly = true;
	$(".comboardTitle").text(<%=boardName%>);
	});
</script>
<div class="container-fluid">
	<div class="container">
		<div class="col-md-12">
			<div class="page">
			<!-- ============[[ 게시판 이름]]================= -->
			<h1 class="title" ><%=boardName %></h1>
				<h4>
				<%=com_b_title %>
					<small>(5)</small><!-- 댓글 수 -->
				</h4>
			<!-- ============[[ 글 제목]]================= -->
					  <ul class="list-inline">
			<!-- ============[[ 글 작성자]]================= -->
					    <li><%=com_b_author %></li>
			<!-- ============[[ 글 작성일]]================= -->
					    <li><%=com_b_date %></li>
			<!-- ============[[ 글 조회수]]================= -->
					    <li><%=com_b_view %></li>
					  </ul>
				<hr></hr>
				</div>
				<div class="col-md-12">
				</div>
				<div class="col-md-12">
				<!-- ==========[[ 글내용 ]]============= -->
				<textarea readonly id="detailCnt"class="form-control no-gray" rows="25" name="text-box" readonly="readonly" style="cursor:auto">
				<%=com_b_cnt %>
				</textarea>
				</div>
			<hr></hr>
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12" id="comment-layout">
							<div class="row">
								<div class="boardButtons">
									<button id="page-revise" type="button" class="btn btn-primary"
									onclick="location.href='common_board_modi.foc?com_b_no=<%=com_b_no%>'">
									 수정
									</button>
									<button id="page-delete" type="button" class="btn btn-primary" 
									onclick="location.href='common_board_del.foc?com_b_no=<%=com_b_no%>&com_b_type=<%=com_b_type%>'">
									삭제
									</button>
								</div>
							</div>
							<div class="form-comment">
      							<input type="text" class="form-control" placeholder="댓글을 적어주세요.">
   							</div>
							<div class="row">
			        			<button type="submit" class="btn btn-primary btn-link" type="button">댓글쓰기</button>
							</div>
						</div>
					</div>
				</div>
							<div class="boardButtons_left">
								<button type="button" class="btn btn-outline-secondary" onclick="location.href='#'">
									<span class="glyphicon glyphicon-chevron-left"></span>
									 이전 글
									</button>
									<button type="button" class="btn btn-outline-secondary" onclick="location.href='#'">
									<span class="glyphicon glyphicon-chevron-right"></span>
									다음 글
								</button>
								</div><!--  boardButtons_left  -->
								<div class="boardButtons">
										<button type="button" class="btn btn-primary" onclick="location.href='common_board_list.foc?com_b_type=<%=com_b_type%>'">
										 글목록
										</button>
										<button type="button" class="btn btn-primary" onclick="location.href='#top-page'">
										<div class="glyphicon glyphicon-chevron-up"></div>
										TOP
										</button>
								</div>	<!-- boardButtons -->
					</div><!-- col-md-12 -->
			</div> <!-- conatainer -->
	</div><!-- container-fluid -->
</body>
</html>