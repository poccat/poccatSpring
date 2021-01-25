<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.List" %>
<%
    List<Map<String,Object>> frdList =(List<Map<String,Object>>)request.getAttribute("frdList");
   Map<String,Object> frdMap = new HashMap<>();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function friendModal(){
	$("#friendModal").modal('show');
}
function start_chat(mem_uid){
  
	chatRoom(mem_uid);
}
</script>
</head>
<body>
<div class="modal fade" id="friendModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div id="followFriendModal" class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
       친구 목록  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
     
      </div>
      <div class="modal-body">
        <div class="followFriend">
    		<article class="story">
                    <div class="scroll_inner">
                          <% for(int i=0;i<frdList.size();i++){ 
                    	frdMap=frdList.get(i);
                    %>
                        <div class="thumb_user">
                            <div class="profile_thumb">
                              <img src="<%=frdMap.get("MEM_PHOTO")%>" alt="프로필사진">
                            </div>
                            <div class="detail">
                                <div class="id" onclick="javascript:start_chat('<%=frdMap.get("MEM_UID")%>')"><%=frdMap.get("MEM_ID")%></div>
                            </div>
                        </div>
                        <%} %>
                    </div>
                </article>
            </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>