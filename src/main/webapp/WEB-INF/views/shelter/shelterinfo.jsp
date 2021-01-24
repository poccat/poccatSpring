<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.*" %>
 <%
	String area = "서울시 금천구"; //<- DB에서 가져올때 for문 + map.getValue로 바꿀 것
	String sheltername = "서울보호센터";
	String phonenum = "02-833-7777";
	String address = "서울시 금천구 가산디지털단지";
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../resources/common/bootstrap_common.jsp" %> 
<link rel="stylesheet" href="../css/sidemenu.css"/>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/> 

<meta charset="UTF-8">
<title>전국보호소정보</title>
<style>
/*  모달 시작*/
@media screen and (min-width: 768px) {
    .modal-dialog {
        left: 50%;
        right: auto;
        width: auto;
    }
}
.modal-dialog{
   position: absolute;
   /* now you must set a margin left under zero - value is a half width your window */
   margin-left: -312px;
   /* this same situation is with height - example */
   height: 500px;
   top: 50%;
   margin-top: -250px;
} 
/*  모달 끝*/
	/* 리스트그룹 시작 */
		.list-group-horizontal .list-group-item
		{
			display: inline-block;
		}
		.list-group-horizontal .list-group-item
		{
			margin-bottom: 0;
			margin-left:-4px;
			margin-right: 0;
		 	border-right-width: 0;
		}
		.list-group-horizontal .list-group-item:first-child
		{
			border-top-right-radius:0;
			border-bottom-left-radius:4px;
		}
		.list-group-horizontal .list-group-item:last-child
		{
			border-top-right-radius:4px;
			border-bottom-left-radius:0;
			border-right-width: 1px;
		}
	/* 리스트그룹 끝 */
	.form-control{
			width: 20%;
			display: inline-block;
	}
	.input-group{
			display: inline-table;
			width: 40%;
		    top: 10px;
		    left: 20px;
	}
	label {
		margin-left: 10px;
    	margin-bottom: 5px;
    	margin-right: 10px;
	}
</style>
<script>
	function openinfo(){
		alert("page");		
	}
</script>
</head>
<body>
  <script>
  document.addEventListener("DOMContentLoaded", function(){
	  var tbody = document.getElementById("tablebody");
	  //for (var i=0; i<shelterList.length(); i++){
	  tbody.innerHTML =
			                '<tr> <td>'
			                +"<%=area%>"
			                +'</td> <td  data-toggle="modal" data-target="#shelterInfo" style="cursor:pointer;">'
			                +"<%=sheltername%>"
			                +'</td> <td>'
			                +"<%=phonenum%>"
			                +'</td> <td>'
			                +"<%=address%>"
			                +'</td> </tr>'
			            	;
	});
	</script>
		<!--==================== [[ top.jsp 시작 ]] ====================-->		
	    <div class="row top">
	    		  <div class="col-sm-12">
					    <%@include file="./top.jsp" %> 
	    		  </div>
	    </div>
	    <!--==================== [[ top.jsp 끝 ]] ====================-->		
	<div class="container"><!-- container 시작 -->
	    <!--==================== [[ body 시작 ]] ====================-->		
	    <div class="row body"> <!-- row body 시작  -->
					 <div class="col-sm-2"> <!-- body left  -->
		<!-- ========================[[ 사이드 메뉴바 시작]]============================= -->
					<div class="list-group" id="sideMenu">
						<div>
						<h2>정보</h2>
						</div>
								  <a href="#" class="list-group-item borderless">전국보호소정보</a>
								  <a href="#" class="list-group-item borderless">유기동물정보</a>
					</div>
		<!-- ========================[[ 사이드 메뉴바 끝]]============================= -->
	    </div> <!-- body left  -->
			<br>
	     <div class="col-sm-10"> <!-- body middle  -->
			<h1 class="text-left">전국보호소정보</h1>
			<!-- =======================[[ 서치박스 시작]]===================== -->
		  <div class="panel-group">
		    <div class="panel panel-default">
		      <div class="panel-heading">전국보호소 정보 조회하기</div>
		      <div class="panel-body">
		      			<div class="form-group"><!-- ------------------------------------form-group -->
					    <label  for="dd_sido">시도</label>
						        <select id="dd_sido" class="form-control">
						          <option>전체</option>
						        </select> 
					    <label  for="dd_gu">군구</label>
						        <select id="dd_gu" class="form-control">
						          <option>전체</option>
						        </select> 
					    <div class="input-group">
					        <input type="text" class="form-control" placeholder="보호소명" id="txtSearch"/>
					        <div class="input-group-btn">
					          <button class="btn btn-default" type="submit">
					            <span class="glyphicon glyphicon-search"></span>
					          </button>
					        </div>
					      </div><!--  input-group -->
					    </div><!-- -------------------------------------------------------form-group -->
		      </div><!-- panel body-->
		    </div>
			</div><!-- panel-group -->
			<!-- =======================[[ 서치박스 끝]]===================== -->
			<br>
			        <table class="table table-bordered table-hover">
			            <thead>
			                <tr bgcolor="#BDBDBD" font color="white">
			                    <th>관할구역</th>
			                    <th>보호센터명</th>
			                    <th>전화번호</th>
			                    <th>주소</th>
			                </tr>
			            </thead>
			            <tbody  id="tablebody">
			            <!-- 자바스크립트 for문으로 내용들어감-->
			            </tbody>
			        </table>
		<!--==========================[[ 페이지네이션 시작]]=================================-->
						<div class="text-center">
							<ul class="pagination">
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">▶</a></li>
							</ul>
						</div>
		<!--==========================[[ 페이지네이션 끝]]=================================-->
<!-- =========================[[ modal시작 ]]======================================== -->
		<div id="shelterInfo" class="modal fade" role="dialog">
		  <div class="modal-dialog modal-lg">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">동물보호센터 상세정보</h4>
		      </div>
		      <div class="modal-body">
		        	   <div class="boardDetail1">
            <table class="table table-striped" summary="보호센터명, 전화번호, 보호센터주소, 평일운영시각, 주말운영시각, 평일분양시각, 주말분양시각, 휴무일, 수의사수, 사양관리사수, 진료실수, 사육실수, 격리실수, 사료보관실수 순으로 구성된 정보">
                <colgroup>
                    <col width="20%" />
                    <col width="*" />
                    <col width="20%" />
                    <col width="*" />
                </colgroup>
                <tr>
                    <th>보호센터명</th>
                    <td>C.T종합동물병원</td>
                    <th>전화번호</th>
                    <td>02-6375-0075</td>
                </tr>
                <tr>
                    <th>관리기관명</th>
                    <td>서울특별시 마포구</td>
                    <th>동물보호센터유형</th>
                    <td>동물병원</td>
                </tr>
                <tr>
                    <th>구조대상동물</th>
                    <td>개+고양이+토끼+기니피그+페럿+햄스터</td>
                    <th>동물보호센터지정일자</th>
                    <td>2020-01-01</td>
                </tr>
                <tr>
                    <th>보호센터주소</th>
                    <td colspan="3">서울특별시 마포구 만리재로 74 (신공덕동, 신공덕2차삼성래미안) 삼성 래미안상가 117호</td>
                </tr>
                <tr>
                    <th>위도</th>
                    <td>37.546859734</td>
                    <th>경도</th>
                    <td>126.958384698</td>
                </tr>
                <tr>
                    <th>평일운영시작시각</th>
                    <td>09:30</td>
                    <th>평일운영종료시각</th>
                    <td>19:30</td>
                </tr>
                <tr>
                    <th>휴무일</th>
                    <td></td>
                    <th>데이타기준일자</th>
                    <td>2020-06-03</td>
                </tr>
                <tr>
                    <th>수의사수</th>
                    <td></td>
                    <th>사양관리사수</th>
                    <td></td>
                </tr>
            </table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		
		  </div>
		</div>	<!-- modal dialog -->
		</div> <!-- modal -->	
<!-- =========================[[ modal끝 ]]======================================== -->		
		</div><!-- body middle  -->
		</div><!-- row body 끝  -->
		 <!--==================== [[ bottom.jsp 시작 ]] ====================-->		
	    <div class="row bottom">
	    		 <div class="col-sm-12">
	    		 		
	    		 </div>
	    </div>
	    <!--==================== [[ bottom.jsp 끝 ]] ====================-->		
</div><!-- container 끝 -->
</body>
</html>