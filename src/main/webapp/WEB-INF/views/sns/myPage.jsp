<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.List" %>
<%
	StringBuilder subpath = new StringBuilder(request.getContextPath());
	subpath.append("/");
%>   
<%
	//유저정보
	List<Map<String,Object>> rList =(List<Map<String,Object>>)request.getAttribute("rList");
    //게시물 
	List<Map<String,Object>> fbList =(List<Map<String,Object>>)request.getAttribute("fbList");
	//그룹
    List<Map<String,Object>> grpList =(List<Map<String,Object>>)request.getAttribute("folList");
   Map<String,Object> fbMap = new HashMap<>();
   Map<String,Object> profileMap = new HashMap<>();
   Map<String,Object> grpMap = new HashMap<>();
   Map<String,Object> myinfoMap = new HashMap<>();
   
   profileMap = rList.get(0);
   myinfoMap = (Map<String,Object>)session.getAttribute("userMap");
   String mymem_no=(String)myinfoMap.get("mem_no");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.parent {
    display: flex;
    flex-direction: column;
}
.body{
   display:flex;
}
.space{
flex-basis:15%;

}
 .content{
   flex:70%;
} 

} 
ul.nav-tabs li {
	 font-size : 20px;
     float: left;
     display: inline-block;
}
.table{
			border:1px;
			text-align: center;
			font-size:15px;
	}
.title{
			margin-bottom:10px;
			text-align:center;	
			font-size:30px;	
}
div.dropdown .btn{
			font-weight:700;
			font-size:17px;
	}
ul.dropdown-menu{
		font-size:16px;
}
div.btn-group .btn{
		font-weight:700;
		font-size:14px;
}
</style>
<script type="text/javascript">
/* 	function open_board(group_no){
		console.log(group_no);
		$("#grp_b_tab").attr('style','display:""');
		
	} */
function open_close(num){
	console.log(num);
	$(".board_group").attr('style','display:none;');
	$("#group"+num).attr('style','display:"";');
	
}

function open_close_grp(num){
	$(".grp_boardList").attr('style','display:none;');
	$("#grp_boardList"+num).attr('style','display:"";');
	
}
	
function load_grp(num){
	console.log("grp"+num);
	$.ajax({
		url:'<%=subpath%>member/group_board_list.foc?grp_no='+$("#grp_no"+num).val() 
	   ,method :'get'
	   ,dataType : "json"
	   ,success:function(data){
		   if(data.length>0){
			   $(".tbodies").empty();
		   for(var i=0;i<data.length;i++){
			   if(data[i].GRP_B_TYPE==0){
			   $("#tbody"+$("#grp_no"+num).val()+"0").append($('<tr><td>'+data[i].GRP_B_TITLE+'</td></tr>'));
		   		}//end of if
		   		else if(data[i].GRP_B_TYPE==1){
			   $("#tbody"+$("#grp_no"+num).val()+"1").append($('<tr><td>'+data[i].GRP_B_TITLE+'</td></tr>'));
		   		}//end of if
		   		else if(data[i].GRP_B_TYPE==2){
			   $("#tbody"+$("#grp_no"+num).val()+"2").append($('<tr><td>'+data[i].GRP_B_TITLE+'</td></tr>'));
		   		}//end of if
		   	}//end of for
		   }else{
			   alert("생성된 게시판이 없습니다. ")
		   }
		}//end of success
	   ,error:function(e){
		   alert(e.responseText);
	   }
	}); // end of 
	
}
</script>
</head>
<body>


<div class="parent">
<div class="header">
<%@ include file="./header.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
		$("#mygroup_tab").one("click", function(){
		$.ajax({
			url:'<%=path%>member/group_mem_mygroup.foc?mem_no=<%=mymem_no%>'//고양이테이블에서 고양이 이름, 프로필 사진, 지역정보를 가져와야한다.
		   ,method :'get'
		   ,dataType : "json"
		   ,success:function(data){
			   $("#grp_boardList").empty();
			   if(data.length>0){
				   $("#grp_boardList_master").append($('<div class="grp_boardList" id="grp_boardList0" style="display:none;"><div class="row"><div id="btn-group0" class="btn-group" role="group" aria-label="..."></div></div></div>'));
				   for(var i =0; i<data.length;i++){
						 $("#grp_boardList_master").append($('<div class="grp_boardList" id="grp_boardList'+(i+1)+'" style="display:none;"> <div class="row"><div id="btn-group'+(i+1)+'" class="btn-group" role="group" aria-label="..."></div></div></div>'));
					}
			   for(var i=0;i<data.length;i++){
				   $("#grp_boardList").append($('<div class="dropdown" style="margin-bottom:10px; text-align:left; width:100%;"><button onclick="javascript:load_grp('+i+')" class="btn btn-default dropdown-toggle" style=" width:100%;" type="button"  data-toggle="dropdown" aria-expanded="true">'+data[i].GRP_NAME+'<input id="grp_no'+i+'"  type="hidden" value="'+data[i].GRP_NO+'"/><span class="caret"></span></button><ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1"><li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:open_close_grp('+i+')">게시판</a></li><li role="presentation"><a role="menuitem" tabindex="-1" href="#">그룹회원목록모달로?</a></li></ul></div>'));
			   	}//end of for
				    for(var i=0;i<data.length;i++){
				    	if(data[i].GRP_B_NAME1==null){
				    		$("#btn-group"+i).append($('게시판이 없습니다.'));
				    	}
				    	
				    	else if(data[i].GRP_B_NAME1!=null){
				    	 $("#btn-group"+i).append($('<button type="button" onclick="open_close(1'+i+')" class="btn btn-default">'+data[i].GRP_B_NAME1+'</button>'));
				    	 	if(data[i].GRP_B_NAME2!=null){	
					    	 $("#btn-group"+i).append($('<button type="button" onclick="open_close(2'+i+')" class="btn btn-default">'+data[i].GRP_B_NAME2+'</button>'));
					    	 	if(data[i].GRP_B_NAME3!=null){	
						    	 $("#btn-group"+i).append($('<button type="button" onclick="open_close(3'+i+')" class="btn btn-default">'+data[i].GRP_B_NAME3+'</button>'));
					    	 	}
				    	 	}
				    	 }
				    }
			   for(var i=0;i<data.length;i++){
			   		if(data[i].GRP_B_NAME1!=""){
			   		 $("#grp_boardList"+i).append($('<div class="board_group" id="group1'+i+'" style="display:none;"><h1 class="title">'+data[i].GRP_B_NAME1+'</h1><table class="table table-hover" style="width:100%"><thead><tr><th style="width: 10%" class="text-center">글번호</th><th style="width: 60%" class="text-center">제목</th><th style="width: 10%" class="text-center">작성자</th><th style="width: 10%" class="text-center">작성일</th><th style="width: 10%" class="text-center">조회수</th></tr></thead><tbody class="tbodies" id="tbody'+(i+1)+'0"></tbody></table></div>'));
					   if(data[i].GRP_B_NAME2!=""){
						   $("#grp_boardList"+i).append($('<div class="board_group" id="group2'+i+'" style="display:none;"><h1 class="title">'+data[i].GRP_B_NAME2+'</h1><table class="table table-hover" style="width:100%"><thead><tr><th style="width: 10%" class="text-center">글번호</th><th style="width: 60%" class="text-center">제목</th><th style="width: 10%" class="text-center">작성자</th><th style="width: 10%" class="text-center">작성일</th><th style="width: 10%" class="text-center">조회수</th></tr></thead><tbody class="tbodies" id="tbody'+(i+1)+'1"></tbody></table></div>'));
						   
						   if(data[i].GRP_B_NAME3!=""){
							   $("#grp_boardList"+i).append($('<div class="board_group" id="group3'+i+'" style="display:none;"><h1 class="title">'+data[i].GRP_B_NAME3+'</h1><table class="table table-hover" style="width:100%"><thead><tr><th style="width: 10%" class="text-center">글번호</th><th style="width: 60%" class="text-center">제목</th><th style="width: 10%" class="text-center">작성자</th><th style="width: 10%" class="text-center">작성일</th><th style="width: 10%" class="text-center">조회수</th></tr></thead><tbody class="tbodies" id="tbody'+(i+1)+'2"></tbody></table></div>'));
						    }
					  	  }
				   		}
			  		 }
			   }else{
				   $("#mygroup").append($('<div>가입된 그룹이 없습니다.</div>'));
			   }
			}//end of success
		   ,error:function(e){
			   alert(e.responseText);
		   }
		}); // end of ajax
	});//end of function 
	
});

</script>
<%@ include file="./modal/friendModal.jsp"%>
<%@ include file="./modal/followModal.jsp"%>
<%@ include file="./modal/chatListModal.jsp"%>
</div>
                  <div class="body">
                  <div class="space"></div>
                  <div class="content">
                         <div class="hori_cont">
                <div class="profile_wrap">
                    <div class="profile_img">
                        <img src="<%=path%>resources/common<%=profileMap.get("MEM_PHOTO")%>">
                    </div>
                </div>

                <div class="detail">
                    <div class="top">
                        <div class="user_name"><%=profileMap.get("MEM_NAME")%></div>                     
                    </div>

                    <ul class="middle">
                        <li>
                            <span>게시물</span>
                            <%=fbList.size()%>
                        </li>
                        <li>
                            <span><a href="javascript:followModal()" data-toggle="modal" data-target="#followModal">팔로우</a></span>
                            <%=followList.size()%>
                        </li>
                        <li>
                           <span><a href="javascript:friendModal()" data-toggle="modal" data-target="#friendModal">친구</a></span>
                            <%=frdList.size()%>
                        </li>
                         <li>
                           <span><a href="javascript:chatListModal()" data-toggle="modal" data-target="#chatListModal">메세지목록</a></span>
                        </li>
                    </ul>

                </div>
            </div>

            
            


  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#activity" aria-controls="activity" role="tab" data-toggle="tab">내활동</a></li>
    <li role="presentation"><a id ="mygroup_tab" href="#mygroup"  aria-controls="mygroup" role="tab" data-toggle="tab">내그룹</a></li>
    <li role="presentation"><a id ="myinf_tab" href="#myinfo" aria-controls="myinfo" role="tab" data-toggle="tab">내정보</a></li>
    <li role="presentation"><a id ="volunter_tab" href="#volunteer" aria-controls="volunteer" role="tab" data-toggle="tab">volunteer</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content" style="width:100%;">
    <div role="tabpanel" class="tab-pane active" id="activity">
    	<div class="photoList">
            
            <% for(int i=1;i<=fbList.size();i++)
            {fbMap = fbList.get(i-1);
            	String post_photo = "post_photo"+i;
            	String f_id= "post_info"+i;
            	String postingModal="javascript:postingModal("+f_id.toString()+","+post_photo.toString()+")";
            %>
            <div class= "thumbnail-wrapper">

                	<div class="thumbnail"> 
                    <a href="<%=postingModal%>">
                    <img src="<%=path%><%=fbMap.get("POST_PHOTO1")%>" alt=""></a>
                    <form id="<%=f_id%>" method="post">
					<input id="<%=post_photo%>" type="hidden" value="<%=fbMap.get("POST_PHOTO1")%>"/>
					<input type="hidden" name="cat_no" value="<%=fbMap.get("CAT_NO")%>"/>
					<input type="hidden" name="post_no" value="<%=fbMap.get("POST_NO")%>"/>
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
    <div role="tabpanel" class="tab-pane" id="mygroup">
    <div class="container"><div class="col-md-12">
				  <div class="row">
				  <div id="grp_boardList" class="col-md-2" style="margin-top:20px; "> md3</div>
				  <div  class="col-md-10" style="margin-top:20px;">
				  
				  <div id="grp_boardList_master" class="col-md-auto" style="margin-bottom:20px;">
				  </div>
				  </div>
				  </div></div></div>
    </div>
    <div role="tabpanel" class="tab-pane" id="myinfo">내정보</div>
    <div role="tabpanel" class="tab-pane" id="volunteer">volunteer</div>
  </div>
  

</div><!-- end of content -->
<div class="space"></div>
</div>
</div>
            
</body>
</html>