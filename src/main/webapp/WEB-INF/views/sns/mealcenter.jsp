<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/resources/common/bootstrap_common.jsp" %>
    <%@ page import="java.util.Map,java.util.HashMap,java.util.Enumeration,java.util.ArrayList,java.util.List,java.lang.*" %> 
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

 StringBuilder mpath = new StringBuilder(request.getContextPath());
 mpath.append("/");

 String mealCMT = target.get("MEAL_CMT").toString();
 String mealDate = target.get("MEAL_DATE").toString();
 String mealFood = target.get("MEAL_FOOD").toString();
 String mealWater = target.get("MEAL_WATER").toString();
 String mealPhoto = target.get("MEAL_PHOTO").toString();
 int mealNo = Integer.parseInt(String.valueOf(target.get("MEAL_NO")));
 
%>


<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/> 
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>급식소 정보</title>
<style>
    *{
	font-family: 'Noto Sans KR', sans-serif;
	}
	.panel{
		margin: 30px;
	}
	h1{
		text-align: center;
	}
	td {
		text-align: center;
	}
	.space{
		hegith: 30%;
		width: 100%;
		padding-bottom: 20%;
	}
	.btngroup{
		margin-bottom: 10%;
		float: right;
	}
    .dropdown-menu {
	  left: 50%;
	  right: auto;
	  text-align: center;
	  transform: translate(-50%, 0);
	}
	.form-control {
    display: inline-block;
    width: fit-content;
    }
    
    .editlabel{
        font-weight: 100;
    }
    
    .currvals{
    	font-size: 20px;
    	font-weight: 700;
    }
    
    .table > tbody > tr > td{
    	vertical-align: middle;
    }
    
	// 모바일
	@media all and (max-width: 768px) {
   td {
   	font-size: 20px;
    font-weight: bold;
   }
}
</style> 
<script>
	function donationRclose(){
		window.self.close();
	}
	
	function mc_update(){
		var meal_food	= $("#list_food").val();
		var meal_water  = $("#list_water").val();
		var meal_no    = "<%=mealNo%>";
		
		console.log('meal_food='+meal_food+'  &meal_water= '+meal_water+' &meal_no= '+meal_no);
		
		$.ajax({
			url:'<%=mpath.toString()%>cat/mealcenter_update.foc?meal_food='+meal_food+'&meal_water='+meal_water+'&meal_no='+meal_no
		   ,method :'post'
		   ,success:function(result){
			   console.log("급식소 수정결과 ===> " + result); 
			   $("#txt_water").text(meal_water);
			   $("#txt_food").text(meal_food);
			   alert("수정 성공!");
		   }
		   ,error:function(e){
			   		   alert("실패" + e.toString());
		   }
			}); // end of ajax
	}
	
</script>
</head>
<body>
<script>
$(document).ready(function () {
	});
</script>
<div class="panel panel-default">
	<h1> 급식소 정보 </h1>
	<div style = "width : 50%; margin-left: 25%;">
				<div class="thumbnail" style="position: inherit;"> 
		                    <img id="post_photo"  src="<%=path.toString() %><%=mealPhoto%>" alt="">
		   		</div>
		 </div>
					<table class="table table-bordered">
					<colgroup>
					<col style="width:30%;">
					<col style="width:70%;">
					</colgroup>
						<tr>
							<td> 급식소 코멘트 </td>
							<td> <%=mealCMT%></td>
						</tr>
						<tr>
							<td> 마지막 업데이트 일자 </td>
							<td> <%=mealDate%></td>
						</tr>
						<tr>
						<tr>
							<td> 음식 상태 </td>
							<td >
			            	<!--============ td 시작 ============== -->
					    		<div class="form-group">
					    		<div class="currvals"   id="txt_food" > <%=mealFood%> </div>
									  <label class="editlabel" for="sel1">수정하기: </label>
											  <select class="form-control" id="list_food">
													    <option>없음</option>
													    <option>부족</option>
													    <option>양호</option>
											  </select>
								</div>
							<!--============== td 끝 ============== -->
							</td>
						</tr>
						<tr>
						<tr>
							<td> 물 상태 </td>
							<td> 
							<!--============ td 시작 ============== -->
								<div class="form-group">
								<div class="currvals" id="txt_water" > <%=mealWater%> </div>
									  <label class="editlabel" for="sel1">수정하기: </label>
											  <select class="form-control" id="list_water">
													    <option>없음</option>
													    <option>부족</option>
													    <option>양호</option>
											  </select>
								</div>
							<!--============== td 끝 ============== -->
							</td>
						</tr>
					</table>
		 
		<div class = "btngroup">
		<button type="button" class="btn btn-success" onClick="donationRclose()"> 닫기 </button>
		<button type="button" class="btn btn-success" onClick="mc_update()"> 수정하기 </button>
		</div>
</div>

</body>
</html>