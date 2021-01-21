<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.Enumeration,java.util.ArrayList,java.lang.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원게시판상세</title>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>
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
List<Map<String,Object>> bDetail= new ArrayList<>();
bDetail = (List<Map<String,Object>>)request.getAttribute("rList");
Map<String,Object> target = new HashMap<>();
target = bDetail.get(0);
Enumeration<String> en = request.getParameterNames();//getParameter로 받아오는 값의 리턴타입은 String이므로 Enumeration의 타입도 String으로 한다.
 while(en.hasMoreElements()) {//hasMoreElement는 boolean타입 메서드
   String name = (String) en.nextElement();
	String[] values = request.getParameterValues(name);		
	for (String value : values) {
		target.put(name,value);
	}
 }
%>
</head>
<body>
<%@ include file="header.jsp" %>
<script>
	document.addEventListener("DOMContentLoaded", function(){
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
										<div class="button boardButtons">
										<button type="button" class="btn btn-primary" onclick="location.href='#'">
										<span class="glyphicon glyphicon-chevron-left"></span>
										 이전 글
										</button>
								    	</div>	
								</div>
								<div class="col-md-1">
										<div class="button">
										<button type="button" class="btn btn-primary" onclick="location.href='#'">
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
					<h4><%=target.get("DON_NOTI_CNT")%>
					<small>(5)</small><!-- 댓글 수 -->
					</h4>
					  <ul class="list-inline">
					    <li><%=target.get("DON_NOTI_CNT")%></li>
					    <li><%=target.get("DON_NOTI_DATE")%></li>
					  </ul>
				<hr></hr>
				</div>
				<div class="col-md-12">
					<!-- 반복문 받아오기 -->
				</div>
				<div class="col-md-12">
<div contentEditable="true">
    <img src="" />
</div>
<!-- ==========================[[ 달성율 ]]====================================== -->
<div class="progress">
  <div class="progress-bar progress-bar-striped active" role="progressbar"
  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
    40%
  </div>
</div>
<!-- ==========================[[ 달성율 ]]====================================== -->

<!-- ==========================[[ 후원하기 버튼 ]]====================================== -->
	<!-- <button id="btn_donation" type="button" class="btn btn-primary" onClick="do_donation()"> 후원하기 </button> -->
<!-- 	<button onclick="window.open('../../../donation_do.jsp','후원 결제창','width=430,height=500,location=no,status=no,scrollbars=yes');">후원하기</button> -->
    	<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"
    	     data-client-id="u86j4ripEt8LRfPGzQ8"
		    data-mode="production"
		    data-merchant-user-key="아이디"
		    data-merchant-pay-key="가맹점 주문 번호"
		    data-product-name="후원"
		    data-total-pay-amount="1000"
		    data-tax-scope-amount="1000"
		    data-tax-ex-scope-amount="0"
    	    data-return-url='../../../donationResult.jsp'>
    	</script>

<!-- ==========================[[ 후원하기 버튼 ]]====================================== -->

<textarea class="form-control no-gray" rows="25" name="text-box" readonly="readonly" style="cursor:auto">
<%=target.get("DON_NOTI_CNT")%>
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
									<button id="page-revise" type="button" class="btn btn-primary">
									 수정
									</button>
									</div>	
								</div>
								<div class="col-md-1">
									<div>
									<button id="page-delete" type="button" class="btn btn-primary">
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
					<hr></hr>
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