<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.List" %>
   
<%
   List<Map<String,Object>> rList =(List<Map<String,Object>>)request.getAttribute("rList");
   Map<String,Object> rMap = new HashMap<>();
  

%>
<!DOCTYPE html>
<html>
<head>
<title>My Instagram Cat</title>
<link rel="stylesheet" href="../css/photoList.css">
<style type="text/css">
.parent {
    display: flex;
    flex-direction: column;
}
.body {
	display:flex;
}
.content {
 flex:80%;
}
.space {
   flex-basis:10%;
}
</style>



</head>
<body>
<div class="parent">
<div class="header">
<%@ include file="./header.jsp" %>
</div>
<div class="body">
<div class="space"></div>
<div class ="content">
          <div class="photoList">
            
            <% for(int i=1;i<=rList.size();i++)
            {rMap = rList.get(i-1);
            	String post_photo = "post_photo"+i;
            	String f_id= "post_info"+i;
            	String cat_no= "cat_no"+i;
            	String post_no= "post_no"+i;
            	String postingModal=
            			"javascript:postingModal("+f_id.toString()+","+post_photo.toString()+")";
            %>
            <div  class= "thumbnail-wrapper">

                	<div class="thumbnail"> 
                    <a href="<%=postingModal%>">
                    <img src="<%=rMap.get("POST_PHOTO1")%>" alt=""></a>
                    <form id="<%=f_id%>" method="post">
					<input id="<%=post_photo%>" type="hidden" value="<%=rMap.get("POST_PHOTO1")%>"/>
					<input type="hidden" name="cat_no" value="<%=rMap.get("CAT_NO")%>"/>
					<input type="hidden" name="post_no" value="<%=rMap.get("POST_NO")%>"/>
					<input type="hidden" name="mem_no" value="<%=mem_no%>"/>
					<input type="hidden" name="chk" value=""/>
					</form>
                    </div>																					
             </div>

                <% 
            }
                %>
               </div>
               </div>	
<div class="space"></div>
</div>
</div>
   </body>
</html>