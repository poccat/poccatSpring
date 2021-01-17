<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/resources/common/bootstrap_common.jsp" %>
<%
	String filename = "cat.jpg"; //<- DB에서 가져올때 for문 + req.getparameter로 바꿀 것
	String age = "1";
	String gender = "암";
	String date = "2020.12.31";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양공고 페이지</title>
<style type="text/css">
	.thumbnail {
		overflow: hidden;
		margin: 5px;
		padding: 0px;
	}
	.caption{
		margin-bottom: 10px;
		margin-left: 10px;
	}
	.list-group{
		margin-top: 50%;
		width: 100%;
	}
	a.borderless {
		border-left: 0 none; 
		border-right: 0 none; 
	}
	.col-sm-2{
	    padding-left: 0px;
	}
	#tb_left {
		width:50%;
		padding-top: 20px;
	}
	#tb_right{
		padding-top: 40px;
	}
</style>
</head>
<body>
		<!--==================== [[ top.jsp 시작 ]] ====================-->		
	    <div class="row top">
	    		  <div class="col-sm-12">
					    <%@include file="./top.jsp" %> 
	    		  </div>
	    </div>
	    <!--==================== [[ top.jsp 끝 ]] ====================-->		
		<div class="container"><!--  ===================[[ 컨테이너 시작 ]]====================  -->
	    <!--==================== [[ body 시작 ]] ====================-->		
	    <div class="row body">
		 <div class="col-sm-2"> <!-- body left  -->
		<!-- ========================[[ 사이드 메뉴바 시작]]============================= -->
					<div class="list-group ">
								<div>
										<h2>입양</h2>
								</div>
								  <a href="#" class="list-group-item borderless">입양공고</a>
								  <a href="#" class="list-group-item borderless">입양절차</a>
								  <a href="#" class="list-group-item borderless">입양후기</a>
					</div>
		<!-- ========================[[ 사이드 메뉴바 끝]]============================= -->
	    </div> <!-- body left  -->
	     <div class="col-sm-10"> <!-- body middle  -->
			     <h1> 입양공고</h1>
			     <table class="table table-borderless">
			     		<tr>
			     		<td id="tb_left">
			     		 <!-- =======================[[ 이미지 시작 ]]========================= -->		
									     <div class="thumbnail">        	
									     		  <a href="../images/cat.jpg"> 
									      			<img src="../images/cat.jpg" alt="1" style="width:100%">
									     			 </a>
									      </div>
			  			   <!-- =======================[[ 이미지 끝 ]]========================= -->		
			     		</td>
			     		<td id="tb_right">
			     		<!-- =====================[[ 정보테이블 시작]]=============================== -->
			     		 <table class="table table-striped">
						     		<tr>
						     			<td>공고번호</td>
						     			<td>"<%=" " %>"</td>
						     		</tr>	
						     		<tr>
						     			<td>품종</td>
						     			<td>"<%=" " %>"</td>
						     		</tr>	
						     		<tr>
						     			<td>색상</td>
						     			<td>"<%=" " %>"</td>
						     		</tr>	
						     		<tr>
						     			<td>성별</td>
						     			<td>"<%=" " %>"</td>
						     		</tr>	
						     		<tr>
						     			<td>나이</td>
						     			<td>"<%=" " %>"</td>
						     		</tr>	
						     		<tr>
						     			<td>체중</td>
						     			<td>"<%=" " %>"</td>
						     		</tr>	
						     		<tr>
						     			<td>특징</td>
						     			<td>"<%=" " %>"</td>
						     		</tr>	
						     		<tr>
						     			<td>접수일시</td>
						     			<td>"<%=" " %>"</td>
						     		</tr>	
			     </table>
			     		<!-- =====================[[ 정보테이블 끝]]=============================== -->
			     		</td>
			     		</tr>
			     </table>
				 <br>
				 <hr>
				  <a href="#" class="btn btn-info" role="button">목록</a>
				 </div> <!-- body middle  -->
				          <div class="col-sm-2"> <!-- body right -->
		     				   
		     			  </div> <!-- body right -->
		   </div> <!-- row middle -->
     	 <!--==================== [[ bottom.jsp 시작 ]] ====================-->		
	    <div class="row bottom">
	    		 <div class="col-sm-12">
	    		 		
	    		 </div>
	    </div>
	    <!--==================== [[ bottom.jsp 끝 ]] ====================-->		
		</div><!--  ===================[[ 컨테이너 끝 ]]====================  -->
</body>
</html>