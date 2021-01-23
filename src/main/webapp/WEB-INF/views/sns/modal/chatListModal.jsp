<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal fade" id="chatListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div id="myChatListModal" class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
       메세지목록  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
     
      </div>
      <div class="modal-body">
        <div class="chatList">
    		<article class="story">
                    <div class="scroll_inner">
                     <%--      <% for(int i=0;i<frdList.size();i++){ 
                    	frdMap=frdList.get(i);
                    %> --%>
                        <div class="thumb_user">
                            <div class="profile_thumb">
                               <!--  <img src="" alt="프로필사진"> -->
                            </div>
                            <div class="detail">
                                <div class="id"></div>
                            </div>
                        </div>
                       <%--  <%} %> --%>
                    </div>
                </article>
            </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>