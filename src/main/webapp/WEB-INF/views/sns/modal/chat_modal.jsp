<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=path.toString() %>resources/js/chat_modal.js"></script>
<!-- 스크롤 -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.6.8-fix/jquery.nicescroll.min.js"></script> -->
<!-- css -->
<!-- <link rel="stylesheet" type="text/css" href="./chat.css"> -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!-- Modal -->
  <div class="modal fade" id="chatModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
			  <img src="../../img/image1.jpg" id="friendImg" class="img-circle center-block"  width="100" height="100"> 
			  <p class="text-center" id="modal_user_id" style="margin-top:30px;">아무개</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btn-sm" id="friendBtn" onclick="javascript:add_frd()">친구추가</button>
          <button type="button" class="btn btn-default btn-sm" id="chatBtn" onclick="javascript:chatRoom()">1:1채팅</button>
        </div>
      </div>
    </div>
  </div>
	<div class="modal fade" id="chatRoom" role="dialog">
	<div class="modal-dialog modal-lg">
			<div class="container" id="chatRoomBody">
			<div class="modal-header">
				<h4>1:1 대화창<a><button type="button" class="close" data-dismiss="modal">&times;</button></a></h4>
			</div>
			  <div class="row row-broken">
			    <div class="col-xs-12 chat" style="overflow: hidden; outline: none;" tabindex="5001">
			      <div class="col-inside-lg decor-default">
			        <div class="modal-body" >
			        <div class="chat-body">
				          <div class="answer left">
				            <div class="avatar">
				              <img src="../../img/9.jpg" alt="User name">
				            </div>
				            <div class="name">상대방</div>
				            <div class="text">ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</div>
				            <div class="time">ㅁㅁ</div>
				          </div>
				          <div class="answer right">
				            <div class="avatar">
				              <img src="../../img/9.jpg" alt="User name">
				            </div>
				            <div class="text">ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</div>
				            <div class="time">ㅁㅁ</div>
				          </div>
			          <div class="answer-add">
			          	<input type="text" placeholder="텍스트를 입력" onKeyDown="onKeyDown()">
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
	     </div>
      </div>
	</div>
</body>
</html>