<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.Enumeration,java.util.ArrayList,java.lang.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원게시판상세</title>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>
<link rel="stylesheet" href="../resources/css/board.css">
<%

StringBuilder dpath = new StringBuilder(request.getContextPath());
dpath.append("/");

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
 String catNo = target.get("CAT_NO").toString();
 String catName = target.get("CAT_NAME").toString();
 String catPhoto = target.get("CAT_PHOTO").toString();
 String catAge = target.get("CAT_AGE").toString();
 String catLocal = target.get("CAT_LOCAL").toString();
 String catCMT = target.get("CAT_CMT").toString();
 String nullcheck = "";
 	Map<String,Object> donMap = (Map<String,Object>)session.getAttribute("userMap");
 	if(donMap!=null){
		nullcheck = (String)donMap.get("mem_name");
 	}
 
%>
<script>
function isLogined(){
	console.log("지금 세션의 userMap===>" + "<%=donMap%>" + "   ,    " + "<%=nullcheck%>" );
	if("<%=nullcheck%>" == null || "<%=nullcheck%>".length < 1){
		alert("로그인 후 가능합니다");
	} else{
		doDonation();
	} // end of if
	
}

function doDonation(){
	
	//선택한 금액 가져오기	
    var price = $("#sel_price").val();
    
    // 고양이 프로필과 연동 후 이름 받아오기
    //var catname = catname;
    
    var android_application_id = '6007f31c5b2948001d0b05d4'
    
	BootPay.request({
		price: price, //실제 결제되는 가격
		application_id: "6007f31c5b2948001d0b05d3",
		name: '고양이 후원', //결제창에서 보여질 이름
		pg: 'payletter',
		show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
		items: [
			{
				item_name: '나는 아이템', //상품명
				qty: 1, //수량
				unique: '123', //해당 상품을 구분짓는 primary key
				price: 1000 //상품 단가
			}
		],
		user_info: {
			username: '사용자 이름',
			email: '사용자 이메일',
			addr: '사용자 주소',
			phone: '010-1234-4567'
		},
		order_id: '고양이이름', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
		params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
		account_expire_at: '2020-10-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧 )
		extra: {
			/* 정기결제
		    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
			end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
	        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
	        quota: '0,2,3', // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용,
			theme: 'purple', // [ red, purple(기본), custom ]
			custom_background: '#00a086', // [ theme가 custom 일 때 background 색상 지정 가능 ]
			custom_font_color: '#ffffff' // [ theme가 custom 일 때 font color 색상 지정 가능 ]
			*/
		}
	}).error(function (data) {
		console.log("에러발생" + data);
	}).cancel(function (data) {
		console.log("결제취소" + data);
	}).ready(function (data) {
		// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
		console.log(data);
	}).confirm(function (data) {
	}).close(function (data) {
	    console.log(data + "결제창 닫음");
//===============================================================[[ 결제 완료시 실행 ]]===================	    
	}).done(function (data) {
		//결제가 정상적으로 완료되면 수행됩니다
		$("#ip_purchased_at").val(data.purchased_at);
		$("#ip_payment_name").val(data.payment_name);
		$("#ip_order_id").val(data.order_id);
	    //자식창으로 후원금액 input으로 넘기기
	    $("#ip_price").val(data.price);
		console.log(data);
		console.log(data.purchased_at);
		console.log(data.method_name);
		
		var increasedPercent = 2;
		$.ajax({
			url:'<%=dpath%>secondB/donation_book.foc?don_noti_no=<%=target.get("DON_NOTI_NO")%>&don_noti_amount='
					+data.price+'&mem_no=<%=Integer.parseInt(String.valueOf(donMap.get("mem_no")))%>'
		   ,method :'post'
		   ,success:function(result){
			   console.log("  success result ===> " + result);
		   }
		   ,error:function(e){
			   		 console.log(" error result ===> " + result);
		   }
			}); // end of ajax
			
		window.open('../../../donationResult.jsp','후원결과창','width=430,height=500,location=no,status=no,scrollbars=yes');
		location.reload();
		
		var currentTotal = '';
		$('#donealert').html(" <strong>Success!</strong> 후원 감사합니다.");
		$('#donealert').alert();
	});// end of bootpay 
}

</script>
</head>
<body>
<%@ include file="header.jsp" %>
<script>
$(document).ready(function(){
	var detailTitle = document.getElementById("detailTitle");
	detailTitle.readOnly = true;
	var currentTotal = '';
	$.ajax({
		url:'<%=path%>secondB/donation_getTotal.foc?don_noti_no=<%=target.get("DON_NOTI_NO")%>'
	   ,method :'post'
	   ,dataType : "JSON"
	   ,success:function(result){
		   currentTotal = result[0].DON_TOTAL;
		   var goalAmount =  '<%=target.get("DON_GOAL_AMT")%>';
			//$("#dona_progress").attr("aria-valuenow", currentTotal*100/goalAmount);
			$("#dona_progress").css("width", currentTotal*100/goalAmount+'%');
			$("#dona_progress").text(currentTotal*100/goalAmount + '%');
		   console.log("현재 모금액은 ===> " + currentTotal); 
		   console.log("현재 달성율은 ===> " + currentTotal*100/goalAmount+'%');
	   }
	   ,error:function(e){
		   		   alert("실패" + e.toString() + '<%=path%>secondB/donation_getTotal.foc');
	   }
		}); // end of ajax
	
	});
	

	
</script>
<div class="container-fluid">
	<div class="container">
		<div class="col-md-12"  id="mobilecol">
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
										<div class="button boardButtons">
										<button type="button" class="btn btn-primary" onclick="location.href='#'">
										<span class="glyphicon glyphicon-chevron-right"></span>
										다음 글
										</button>
										</div>	
								</div>
							</div>
			<div class="page">
				<div id="detailTitle">
				<div class="col-md-12"  id="mobilecol">
					<h4><%=target.get("DON_NOTI_TITLE")%>
					<small>(5)</small><!-- 댓글 수 -->
					</h4>
					  <ul class="list-inline">
					    <li><%=target.get("DON_NOTI_TYPE")%></li>
					    <li><%=target.get("DON_NOTI_DATE")%></li>
					  </ul>
				<hr></hr>
				</div>
				<div class="col-md-12"  id="mobilecol">
					<!-- 반복문 받아오기 -->
				</div>
				<div class="col-md-12"  id="mobilecol">
	<div contentEditable="true">
    <img src="" />
</div>

<!-- ==========================[[ 결제 후 알림창 ]]====================================== -->
<div id = "donealert" class="alert alert-success alert-dismissible" style="display:none;">
		 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	    </div>
<!-- ==========================[[ 고양이 프로필 ]]====================================== -->
<div class="panel panel-default profilepanel">
		<table class="table borderless">
			<colgroup>
			<col style="width:40%;">
			<col style="width:60%;">
			</colgroup>
			<tr>
					<!-- 사진이 들어감  -->
					<td>
					  <div class="img-thumbnail"> 
								<div id="wrapper_div" class="align_left">
				                    <a href="<%=path%>/cat/cat_search.foc?cat_no=<%=catNo%>">
				                    <img id="post_photo"  class="img-cropped" src="<%=path%><%=catPhoto%>"alt=""></a>
                    			</div>	
                    </div>
					</td>			
					<!-- 고양이 정보가 들어감 -->
					<td>
						<div class="don_profileinfo">
						<label for="don_cat_name">이름:</label>
                                    <div id="don_cat_name"><a id="nick_name" href=""><%=catName%></a></div>
						<label for="don_local">지역:</label>
                                    <div id="don_local"><%=catLocal%></div>
						<label for="don_age">나이:</label>
                                    <div id="don_age"><%=catAge%></div>
                                    <hr>
									<h2>
									"<%=catCMT%>"
									</h2>
						</div>
					</td>			
			</tr>
		</table>
</div><!-- profilepanel -->
<!-- ==========================[[ 고양이 프로필 ]]====================================== -->

<!-- ==========================[[ 달성율 ]]====================================== -->
목표금액 : <%=target.get("DON_GOAL_AMT")%> 
<div class="progress">
  <div id="dona_progress" class="progress-bar progress-bar-striped active" role="progressbar"
  aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width:40%">
    40%
  </div>
</div>
<!-- ==========================[[ 달성율 ]]====================================== -->

<!-- ==========================[[ 후원하기 버튼 ]]====================================== -->

      <label for="sel1">후원 금액</label>
      <select class="form-control" id="sel_price">
        <option>1000</option>
        <option>5000</option>
        <option>10000</option>
        <option>30000</option>
        <option>50000</option>
      </select>
      <div class="btnDoDonation">
		<button id="btn_donation" type="button" class="btn btn-primary" onClick="isLogined()"> 후원하기 </button>
      </div>


	<input type="hidden" id="don_mem_no" name="mem_no" value="<%=mem_no%>"/>
	<input type="hidden" id="ip_don_noti_no"  name="don_noti_no" value="<%=target.get("DON_NOTI_NO")%>" />
	<input type="hidden" id="ip_price"  name="ip_price"  />
	<input type="hidden" id="ip_payment_name"  name="ip_payment_name"  />
	<input type="hidden" id="ip_purchased_at"  name="ip_purchased_at"  />
	<input type="hidden" id="ip_order_id"  name="ip_order_id"  />

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
									<button id="page-revise" type="button" class="btn btn-primary btnBoard">
									 수정
									</button>
									</div>	
								</div>
								<div class="col-md-1">
									<div>
									<button id="page-delete" type="button" class="btn btn-primary btnBoard">
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