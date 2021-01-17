<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container {
	margin-top:50px;
	}
	.table{
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
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
		// 세션 확인
			var mem_no = "<%=mem_no%>";
			var mem_name = "<%=mem_name%>";
			$("#com_b_mem_name").val(mem_name);
			$("#com_b_mem_no").val(mem_no);
	});
</script>
<div class="container-fluid">
	<div class="container">
		<div class="col-md-12">
		<div class="page">
			<h1 class="title">게시판 글 쓰기</h1>
		</div>
		<hr></hr>
			<div class="page">
			</div>
				<form method="post" action="secondB/common_board_write.foc">
					<input type=hidden name='mem_no'  id='com_b_mem_no'> 
					<input type=hidden name='com_b_type' value='3'> 
			        <div class="form-group">
			              <label for="exampleFormControlInput1">제목</label>
			            <input name="com_title" type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목을 작성해주세요.">
			          </div>
			        <div class="form-group">
			            <label for="exampleFormControlInput1">작성자</label>
			            <input type="text" class="form-control"  name="mem_name" id="com_b_mem_name">
			          </div>
			          <div class="form-group">
			            <label for="exampleFormControlTextarea1">내용</label>
			            <textarea class="form-control" id="exampleFormControlTextarea1" name="com_b_cnt" rows="20" placeholder="내용을 적어주세요."></textarea>
			          </div>
			          <!--================ 이미지 첨부 ================ -->
					        <div class="custom-file">
					            <label class="custom-file-label" for="customFile"></label>
					            <input name="com_photo" type="file" class="custom-file-input"  accept="image/*" id="com_photo">
					        </div>
			          <!--================ 이미지 첨부 ================ -->
			        <button type="submit" class="btn btn-primary" type="button">등록하기</button>
				    </form>
			</div>
			<div class="page">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12" id="comment-layout">
						<hr></hr>
						</div>
					</div>
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
</body>
</html>