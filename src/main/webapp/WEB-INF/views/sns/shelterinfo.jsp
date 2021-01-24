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
<meta charset="UTF-8">
<title>급식소 정보</title>
<style>
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
	.btn{
		margin-top: 25%;
		float: right;
	}
</style>
<script>
	function donationRclose(){
		window.self.close();
	}
</script>
</head>
<body>
<script>
window.addEventListener('DOMContentLoaded', function(){
		
	console.log("<%=mealCMT%>");
	
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
				<td > <%=mealFood%></td>
			</tr>
			<tr>
			<tr>
				<td> 물 상태 </td>
				<td> <%=mealWater%></td>
			</tr>
		</table>
		
		<button type="button" class="btn btn-success" onClick="donationRclose()"> 닫기 </button>
</div>

</body>
</html>