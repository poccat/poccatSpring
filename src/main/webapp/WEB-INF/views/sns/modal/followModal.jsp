<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.List" %>
<%
	//팔로우 or 팔로워 정보
    List<Map<String,Object>> followList =(List<Map<String,Object>>)request.getAttribute("folList");
   Map<String,Object> followMap = new HashMap<>();
   

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
 <div class="modal fade" id="followModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div id="followFriendModal" class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
       팔로우 목록  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
     
      </div>
      <div class="modal-body">
        <div class="followFriend">
    		<article class="story">
                    <div id="follow_modal2" class="scroll_inner">
                    
                        <% for(int i=0;i<followList.size();i++){ 
                    	followMap=followList.get(i);
                    %>
                        <div class="thumb_user">
                            <div class="profile_thumb">
                                <img src="<%=followMap.get("FOL_PHOTO")%>" alt="프로필사진">
                            </div>
                            <div class="detail">
                                <div class="id"><%=followMap.get("FOL_NAME")%></div>
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