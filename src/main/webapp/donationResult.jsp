<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/resources/common/bootstrap_common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 결과</title>
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
	if(status=='20'){
		$(".h1").text("결제 취소");
	} else if (status=='-20'){
		$(".h1").text("결제 실패");
	} else if (status=='-1'){
		$(".h1").text("결제 실패:: 오류로 인해 결제가 실패했습니다.");
	} else if (status=='-2'){
		$(".h1").text("결제 실패:: 결제 승인이 실패했습니다.");
	} else{
		$(".h1").text("후원 성공!");
	}
	
	//부모창의 데이터 가져오기
	var don_price		= opener.document.getElementById("ip_price").value;
	var payment_name 	= opener.document.getElementById("ip_payment_name").value;
	var don_noti_no 	= opener.document.getElementById("ip_don_noti_no").value;
	var order_id 		= opener.document.getElementById("ip_order_id").value;
	var purchased_at 	= opener.document.getElementById("ip_purchased_at").value;
	
	/*
	var don_price = opener.$("#ip_price").val();
	var payment_name = opener.$("#ip_payment_name").val();
	var don_noti_no = opener.$("#ip_don_noti_no").val();
	var order_id = opener.$("#ip_order_id").val();
	var purchased_at = opener.$("#ip_purchased_at").val();
	*/
	
	console.log("don_price ===> " + don_price);
	console.log("purchased_at ===> " + purchased_at);
	
	// 결과창에 표시
	$("#don_name").text(order_id);
	$("#don_price").text(don_price);
	$("#don_method").text(payment_name);
	$("#don_purchased_at").text(purchased_at);
	
	
	//후원결과 오라클 insert------------------------------------------------------------------------
	var don_noti_no = opener.$("#ip_don_noti_no").val();
	var mem_no = opener.$("#don_mem_no").val();
	var param = 'don_noti_no=' + don_noti_no + '&mem_no='+mem_no+'&don_noti_amount='+don_price
	
	$.ajax({
		url:'/secondB/donation_book.foc?' + param
	   ,method :'post'
	   ,dataType : "text"
	   ,success:function(result){
		   console.log("결과 ===> " + result);
	   }
	   ,error:function(e){
		   		   alert("실패" + e.toString());
	   }
		}); // end of ajax
});

</script>
<div class="panel panel-default">
	<h1> 후원 성공! </h1>
	<div class=space></div>

		<table class="table table-bordered">
		<colgroup>
		<col style="width:30%;">
		<col style="width:70%;">
		</colgroup>
			<tr>
				<td> 고양이 이름 </td>
				<td id="don_name">  </td>
			</tr>
			<tr>
				<td> 후원 금액 </td>
				<td id="don_price"> </td>
			</tr>
			<tr>
				<td> 결제 수단 </td>
				<td id="don_method"> </td>
			</tr>
			<tr>
				<td> 결제일시</td>
				<td id="don_purchased_at"> </td>
			</tr>
			<tr></tr>
		</table>
		
		<button type="button" class="btn btn-success" onClick="donationRclose()"> 닫기 </button>
</div>

</body>
</html>