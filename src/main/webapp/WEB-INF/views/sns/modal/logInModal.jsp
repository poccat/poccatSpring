<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.HashMap" %>  
<%
/*
String mem_name = null;
String mem_no = null;
String mem_id = null;
String token = null;
Map<String,Object> userMap = new HashMap<>();
if(session.getAttribute("userMap")!=null){
	userMap = (Map<String,Object>)session.getAttribute("userMap");
		mem_name = (String)userMap.get("mem_name"); //==아이디, 비밀번호 틀릴 시 msg('아이디가 존재하지않습니다')
		mem_no = (String)userMap.get("mem_no");
		mem_id = (String)userMap.get("mem_id");
		token = (String)userMap.get("token");
	}
	*/
	%>
	<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<script type="text/javascript">
		    firebase.auth().onAuthStateChanged((user) => {
	            if(user){
	                const messaging = firebase.messaging();
									messaging.requestPermission().then(function(){
										return messaging.getToken();
									}).then(function(token){
										console.log(user.uid);
										console.log(token);
										firebase.database().ref('users/'+user.uid).child('pushToken').set(token);
										
										
									});
	            }
	            else{
	            }
	    });

	function logInModal(){
			$("#logInModal").modal('show');
	}
	function logoutModal(){
			$("#logoutModal").modal('show');
	}
	//로그인할때
	function do_login(){
		var token = "<%=token%>";
		console.log(token);
		$.ajax({
			url:'<%=path%>member/member_login.foc'
		   ,data : $("#loginForm").serialize()
		   ,dataType : "json"
		   ,success:function(data){
			   
				if(data[0].mem_no>0 && data[0].mem_no!=null){
					
						
					 
				  
					
					    location.href="<%=path%>loginsub.jsp"
					 						
			}
				else {
					alert(data[0].mem_name);
					//아이디가 틀립니다, 비밀번호가 틀립니다 .출력.
					}
				}// end of success
		   ,error:function(e){
			   alert(e.responseText);
		   }
			}); // end of ajax
	}
	//로그아웃할때
	function do_logout(){

		firebase.auth().signOut();
		location.href ="../member/member_logout.foc";
 		$.ajax({
			url:'<%=path%>/sns/member/member_logout.jsp'
		   ,success:function(data){
				//로그아웃 모달-로그아웃 클릭시 세션에 있는 값 모두 삭제하기
					console.log("로그아웃:: 세션 삭제함");
					location.href="poccat.foc";
				}
		   ,error:function(e){
			   alert(e.responseText);
		   }
			}); // end of ajax --%>
	}
	function writeModal(){
		var mem_no = "<%=mem_no%>";
		var mem_email = "<%=mem_email%>";
		console.log("writeModal에서 mem_id==>"+mem_id);
			if(mem_no>0 && mem_no!=null){
				$("#writeModal").modal('show');
			} else{
				alert("로그인한 회원만 포스팅을 작성할 수 있습니다.");
			}
		}


</script>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
		// 세션 확인
			var mem_id = "<%=mem_name%>";
			var mem_email = "<%=mem_email%>";
			var mem_no = "<%=mem_no%>";
			var token = "<%=token%>";
			console.log(token.length);

			if(token!=null && token.length>0){
				firebase.auth().signInWithCustomToken(token)
						  .then((user) => {

						  })
						  .catch((error) => {
						    var errorCode = error.code;
						    var errorMessage = error.message;
						    console.log(errorCode+"    "+errorMessage);
						  });

			}


			console.log("mem_email===>" + mem_email);
			//로그인 할 때
		if(mem_no>0 && mem_no!=null){
				// 화면에 로그아웃 버튼이 그려짐	
				$("#loginIcon").children().first().attr("class", "glyphicon glyphicon-log-out");
				$("#loginIcon").children().first().attr("style", "color: red");
				$("#loginIcon").attr("data-target", "#logoutModal");
				$("#loginIcon").attr("href", "javascript:logoutModal()");
				$("#logined").html(mem_id+"님 안녕하세요");
				$("#signupIcon").children().first().attr("class", "glyphicon glyphicon-user");
				$("#signupIcon").children().first().attr("style", "font-size:30px;");
				$("#signupIcon").attr("href", "<%=path.toString()%>member/member_mypage.foc?mem_no="+mem_no);
			}
		else {
			$("#logined").empty();
			// 화면에 로그인 버튼이 그려짐
			$("#loginIcon").attr("data-target", "#logInModal");
			$("#loginIcon").attr("href", "javascript:logInModal()");
			$("#loginIcon").children().first().attr("class", "glyphicon glyphicon-log-in");
			console.log("로그인 안함");
		}
	});
</script>
	  <div class="modal fade" id="logInModal" role="dialog" aria-labelledby="posting_modalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	        <div class="modal-header" style="padding:35px 50px;">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4><span class="glyphicon glyphicon-lock"></span> 로그인</h4>
	        </div>
	        <div class="modal-body" style="padding:40px 50px;">
	          <form id="loginForm" role="form" >
	            <div class="form-group">
	              <label for="mem_id"><span class="glyphicon glyphicon-user"></span> 이메일</label>
	              <input type="text" class="form-control" id="mem_email" name="mem_email"  value="test1@gmail.com">
	            </div>
	            <div class="form-group">
	              <label for="mem_pw"><span class="glyphicon glyphicon-eye-open"></span> 비밀번호</label>
	              <input type="text" class="form-control" id="mem_pw" name="mem_pw"  value="123123">
	            </div>
	            <div class="checkbox">
	              <label><input type="checkbox" value="" checked>아이디 기억하기</label>
	            </div>
	              <button type="button" onclick="do_login()" class="btn btn-success btn-block"><span class="glyphicon glyphicon-log-in"></span> 로그인</button>
	          </form>
	        </div>
	        <div class="modal-footer">
	           <button type="button"  class="btn btn-danger btn-default pull-left"  data-dismiss="modal" class="btn" >
	           <span class="glyphicon glyphicon-remove"></span>취소</button>
	          <p>아이디가 없나요? <a href="signPage.jsp">회원가입</a></p>
	          <p>비밀번호를 잃어버렸나요? <a href="passwordPage.jsp">비밀번호 찾기</a></p>
	        </div>
	      	</div>
	     </div>
	  </div>
	  <!-- ============================ [[ 로그인 모달 끝 ]] ============================ -->
	  <!-- =============================[[로그아웃 확인 창 시작]] =============================-->
	<div id="logoutModal" class="modal" role="dialog">
	 <div class="modal-dialog">
        <div class="modal-content">
		  <div class="modal-body">
		   		 정말 로그아웃 하시겠어요?
		  </div>
			  <div class="modal-footer">
				    <button type="button" data-dismiss="modal" class="btn btn-primary"  onclick="do_logout()">로그아웃</button>
				    <button type="button" data-dismiss="modal" class="btn" >취소</button>
			  </div>
		  </div>
	 </div>
	</div>
	  <!-- =============================[[로그아웃 확인 창 끝]] =============================-->
</body>
</html>