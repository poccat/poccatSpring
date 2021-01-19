<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.List" %>
   
<%
   List<Map<String,Object>> rList =(List<Map<String,Object>>)request.getAttribute("rList");
   Map<String,Object> rMap = new HashMap<>();
  
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>My Instagram Cat</title>

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
   flex-basis:20%;
}
</style>
<script>
function getImageSise(src) {
    var img = new Image();
    var _width, _height;
 
    img.src = src;
    _width= img.width;
    _height= img.height;
                
    console.log(_width + "*" + _height);
}
</script>


</head>
<body>
<script>
document.addEventListener("DOMContentLoaded", function(){
	var cats = document.querySelectorAll(".img-cropped");
	var width = cats[0].clientWidth;
	console.log(width);
	for (var i = 0; i < cats.length; i++) {
	  cats[i].style.height = width + "px";
	}
	
});
</script>

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
     <div class = "postingBox">
               <header class="top">
                            <div class="user_container">
                                <div class="profile_img">
                                    <img id="post_profile" src="<%=path%><%=rMap.get("CAT_PHOTO")%>">
                                </div>
                                <div class="user_name">
                                    <div class="nick_name"><a id="nick_name" href=""><%=rMap.get("CAT_NAME")%></a></div>
                                    <div class="countryMain"><%=rMap.get("CAT_LOCAL")%></div>
                                </div>
                            </div>
              </header>
            <div  class= "thumbnail-wrapper">
                	<div class="thumbnail"> 
				<div class="bottomLine"  style="border-bottom: 1px solid #eeeeee; margin-bottom: 5px;"></div>
						<div id="wrapper_div"class="centered">
		                    <a href="<%=postingModal%>">
		                    <img id="post_photo"  class="img-cropped" src="../<%=rMap.get("POST_PHOTO1")%>" alt=""></a>
			                    <form id="<%=f_id%>" method="post">
								<input id="<%=post_photo%>" type="hidden" value="../<%=rMap.get("POST_PHOTO1")%>"/>
								<input type="hidden" name="cat_no" value="<%=rMap.get("CAT_NO")%>"/>
								<input type="hidden" name="post_no" value="<%=rMap.get("POST_NO")%>"/>
								<input type="hidden" name="mem_no" value="<%=mem_no%>"/>
								<input type="hidden" name="chk" value=""/>
								</form>
                    </div>	
                    </div>																				
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