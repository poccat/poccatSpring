<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<%@ include file="/common/bootstrap_common.jsp" %>
<link rel="stylesheet" href="../css/sidemenu.css"/>
<style>
	.btn-info{
		display: inline-block;
	}
	table {
		
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
	<div class="container">
	    <!--==================== [[ body 시작 ]] ====================-->		
	    <div class="row body">
	     <div class="col-sm-2"> <!-- body left  -->
		<!-- ========================[[ 사이드 메뉴바 시작]]============================= -->
					<div class="list-group ">
								  <a href="#" class="list-group-item borderless">기관소개</a>
								  <a href="#" class="list-group-item borderless">공지사항</a>
					</div>
		<!-- ========================[[ 사이드 메뉴바 끝]]============================= -->
	    </div> <!-- body left  -->
			<br>
	     <div class="col-sm-10"> <!-- body middle  -->
			<br>
			<h1 class="text-left">공지사항</h1>
			<br>
			        <table class="table table-bordered table-hover">
				        <colgroup>
									<col width = "20%">
									<col width = "20%">
									<col width = "600%">
						</colgroup>
			                <tr>
			                    <td colspan="3" ><h3><b>제목</b></h3></td>
			                    
			                </tr>
			                <tr>
			                    <td>관리자</td>
			                    <td>2020.12.30</td>
			                    <td>조회수 30</td>
			                </tr>
			                <tr>
			                    <td  colspan="3" >
			                    Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.
			                    </td>
			                </tr>
			        </table>
		<a href="board-noti.jsp" class="btn btn-info" role="button">목록</a>
		</div><!-- body middle  -->
		   <div class="col-sm-2"> <!-- body right -->
     		</div> <!-- body right -->
		</div><!-- end of container -->
	    </div><!-- end of row body -->
	    <!--==================== [[ body.jsp 끝 ]] ====================-->		
	    <!--==================== [[ bottom.jsp 시작 ]] ====================-->		
	    <div class="row bottom">
	    		 <div class="col-sm-12">
	    		 		
	    		 </div>
	    </div>
	    <!--==================== [[ bottom.jsp 끝 ]] ====================-->		
	</div>
</body>
</html>

