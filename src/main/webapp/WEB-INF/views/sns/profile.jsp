<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.List, java.util.StringTokenizer" %>
<%
	StringBuilder subpath = new StringBuilder(request.getContextPath());
	subpath.append("/");
   List<Map<String,Object>> rList =(List<Map<String,Object>>)request.getAttribute("rList");
   List<Map<String,Object>> fbList =(List<Map<String,Object>>)request.getAttribute("fbList");
   Map<String,Object> rMap = new HashMap<>();
   Map<String,Object> catMap = new HashMap<>();
   catMap = rList.get(0);
   String lati=(String) catMap.get("CAT_LATITUDE");
   String longi=(String) catMap.get("CAT_LATITUDE");
  
   double cat_lat = Double.parseDouble(lati);
   double cat_long = Double.parseDouble(longi);
   
   String profile_mem_name ="";
   String profile_mem_no = "";
   String profile_mem_email = "";
   String profile_token = "";
   String profile_mem_uid="";
   Map<String,Object> profile_userMap = new HashMap<>();
   	if(session.getAttribute("userMap")!=null){
   		profile_userMap = (Map<String,Object>)session.getAttribute("userMap");
   			profile_mem_name = (String)profile_userMap.get("mem_name"); //==아이디, 비밀번호 틀릴 시 msg('아이디가 존재하지않습니다')
   			profile_mem_no = (String)profile_userMap.get("mem_no");
   			profile_mem_uid = (String)profile_userMap.get("mem_uid");
   			profile_token = (String)profile_userMap.get("token");
   			profile_mem_email = (String)profile_userMap.get("mem_email");
   	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/profile.css">
<link rel="stylesheet" href="/resources/css/photoList.css">
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmiObiCsNuOOBdwPgCRC_rQHvOzugUxWs&callback=initMap&libraries=&v=weekly" defer></script>
<style type="text/css">

	.parent {
    display: flex;
    flex-direction: column;
		}
	.body {
		display:flex;
		}
	.space {
	   flex-basis:15%;
		}

		.content{
      
  		 flex:70%;
		} 

	ul.nav-tabs {
	     text-align: center;
	}
	ul.nav-tabs li {
	     float: none;
	     display: inline-block;
	}
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 500px;
        width: 100%;
      }

      /* Optional: Makes the sample page fill the window. */
/*       html, */
/*       body { */
/*         height: 100%; */
/*         margin: 0; */
/*         padding: 0; */
/*       } */
    </style>
    <script type="text/javascript">
    var map;//google.api에 의해 생성된 맵 객체를 받아주기 위한 재사용하기위해서
	  var marker; //Marker객체 생성하기
    function initMap() {
		  var infowindow = new google.maps.InfoWindow();
  	  // google.maps.Map(Object<생성된 맵을 넣을객체>, 
      map = new google.maps.Map(document.getElementById("map"), {//"map" <--html영역에 있는 div
      	// map = 이부분이 없어도 사용에는 문제가 없으나 재사용성을 위한 부분
        center: { lat: 37.478887, lng: 126.878616 }, //lat 위도 lng 경도
        zoom: 16,
      });
  	  marker = new google.maps.Marker({
  		  position : new google.maps.LatLng(37.478887, 126.878616)
  	  , map: map
  	  , title: '현재 내 위치'
  		  
  	  });
    }
      
      function insert_follow(chk){
    	  var cat_no = $("#profile_cat_no").val();
    	  var chk = chk;
    	  $.ajax({
  			url:'<%=subpath%>cat/member_cat_follow_regist.foc'
  		   ,data : {cat_no : cat_no, mem_no : <%=profile_mem_no%>, chk : chk}
  		   ,method :'post'
  		   ,dataType : "json"
  		   ,success:function(data){
  			 $("#follow_cnt").text(data.length);
  			   if(chk==0){//chk0이면 팔로우가 아닌상태 이므로 팔로우를 인서트시키는 행위후에 해야할 작업
  				   $("#follow_btn").attr("style","display:none");
  				  $("#cancel_btn").attr("style","display:''");
  		   	  }else if(chk==1){//chk1이면 팔로우 상태에서 버튼클릭이 되었으므로 팔로우 취소행위후에 해야될 작업
  		   		  $("#cancel_btn").attr("style","display:none");
				  $("#follow_btn").attr("style","display:''");
  		   	  }
  			 $("#follow_modal2").empty();
  			 for(var i=0;i<data.length;i++){//팔로우리스트 내용 바꾸는 코드 
				   $("#follow_modal2").append($('<div class="thumb_user"><div class="profile_thumb"><img src="'+data[i].FOL_PHOTO+'" alt="프로필사진"></div><div class="detail"><div class="id">'+data[i].FOL_NAME+'</div></div></div>')); 
				   }
  			   
  			   
  			  }
  		   ,error:function(e){
  			   alert("에러 :"+e);
  			   }
  		   
  		});//end of ajax
    	  
      }
      </script>
</head>

<body>
<div class="parent">
<div class="header">
<%@ include file="./header.jsp"%>
<%@ include file="./modal/followModal.jsp"%>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var cat_no = <%=catMap.get("CAT_NO")%>;
	$.ajax({
		url:'<%=subpath%>cat/member_cat_follow_list.foc'
	   ,data : { mem_no : <%=profile_mem_no%>}
	   ,method :'post'
	   ,dataType : "json"
	   ,success:function(data){
		   
		   for(var i=0;i<data.length;i++){
		   if(data[i].CAT_NO==cat_no){
			  $("#follow_btn").attr("style","display:none");
			  $("#cancel_btn").attr("style","display:''");
		   }else{
			   $("#cancel_btn").attr("style","display:none");
			   $("#follow_btn").attr("style","display:''"); 
		   }
		}
		  	  
	}
	   ,error:function(e){
		   alert("에러 :"+e);
		   }
	   
	});//end of ajax
	
	
	var infowindow = new google.maps.InfoWindow();
	  // google.maps.Map(Object<생성된 맵을 넣을객체>, 
   	 map = new google.maps.Map(document.getElementById("map"), {//"map" <--html영역에 있는 div
    	// map = 이부분이 없어도 사용에는 문제가 없으나 재사용성을 위한 부분
      center: { lat: <%=catMap.get("CAT_LATITUDE")%> , lng: <%=catMap.get("CAT_LONGITUDE")%> }, //lat 위도 lng 경도
      zoom: 14,
		});
    var infowindow = new google.maps.InfoWindow();
   	 $.ajax({
			url:'<%=subpath%>cat/cat_all.foc'
			, dataType:'json'
			, success:function(data){
				for(var i=0;i<data.length;i++){
					if(data[i].CAT_LATITUDE!=""){
					marker = new google.maps.Marker({
						id : i
			    		,position : new google.maps.LatLng(data[i].CAT_LATITUDE, data[i].CAT_LONGITUDE)
			    	  , map: map
			    	  , title: data[i].CAT_NAME
					});//end of marker
					google.maps.event.addListener(marker,'click',(function(marker, i){
						return function(){
							//infowindow.setContent('<img src='+jsonDoc[i].img+' width=400 height=200>');
							infowindow.setContent('<b>이름:</b>'+data[i].CAT_NAME+
									'<br><img src=<%=subpath%>'
											+data[i].CAT_PHOTO+' width=300 height=200>');
							infowindow.open(map,marker);
						}
					})(marker,i));
					if(marker){
						marker.addListener('click', function(){//마커를 누르면
	                           map.setZoom(15);
	                           map.setCenter(this.getPosition());//해당 마커 위치로이동
						});
					}
					/* marker.addListener("click", () => {
					    infowindow.open(map, marker);
					  }); */
					}
				}//end of for 
		}//end of success
  	  });
});

</script>
<div class="body">
<div class="space" ></div>
<div class="content">    
                         <div class="hori_cont">
                <div class="profile_wrap">
                    <div class="profile_img">
                        <img src="<%=path %><%=catMap.get("CAT_PHOTO")%>" alt="고양이">
                    </div>
                </div>

                <div class="detail">
                    <div class="top">
                        <div class="user_name"><%=catMap.get("CAT_NAME")%></div>
                        <button class="btn" class="profile_edit" id="follow_btn"  onclick="javascript:insert_follow(0);">팔로우</button>
                        <button class="btn" class="profile_edit" id="cancel_btn"  style="display:none;" onclick="javascript:insert_follow(1);">팔로우취소</button>
                        <input type="hidden" id="profile_cat_no" value="<%=catMap.get("CAT_NO")%>"/>
                                               <div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    ..
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li><a href="javascript:catInfoModal()">정보</a></li>
     <li role="separator" class="divider"></li>
    <li><a href="#">신고</a></li>
  </ul>
</div>
                    </div>

                    <ul class="middle">
                        <li>
                            <span>게시물</span>
                            <%=fbList.size()%>
                        </li>
                        <li>
                            <span><a href="javascript:followModal()" data-toggle="modal" data-target="#followModal">팔로워</a></span>                       
                            <span id="follow_cnt"><%=followList.size()%></span>
                        </li>
                    </ul>
                    <ul class="bottom">
                       <li>
                          <span id="cat_cmt"><%=catMap.get("CAT_CMT") %></span>
                    </ul>
                    
                </div>
            </div>

                          
            
              <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#photo" aria-controls="photo" role="tab" data-toggle="tab">사진</a></li>
    <li role="presentation"><a href="#info" aria-controls="info" role="tab" data-toggle="tab">정보</a></li>
  </ul>

  
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="photo">
	                  <div class="photoList">
            
            <% for(int i=1;i<=fbList.size();i++)
            {rMap = fbList.get(i-1);
            	String post_photo = "post_photo"+i;
            	String f_id= "catpost_info"+i;
            	String postingModal="javascript:postingModal("+f_id.toString()+","+post_photo.toString()+")";
            
            	 String photourl =rMap.get("POST_PHOTO1").toString();
           	  
           	  StringTokenizer st = new StringTokenizer(photourl, "/");
           	  String firstToken = st.nextToken();
           	  
           	  String rightUrl = "";
           	  
           	  if(firstToken.equals("resources")){
           		  rightUrl = "../" + rMap.get("POST_PHOTO1").toString();
           	  } else {
           		  rightUrl = rMap.get("POST_PHOTO1").toString();
           	  }
            %>
            <div class= "thumbnail-wrapper">

                	<div class="thumbnail"> 
                    <a href="<%=postingModal%>">
                    <img src="<%=rightUrl%>" alt=""></a>
                    <form id="<%=f_id%>" method="post">
					<input id="<%=post_photo%>" type="hidden" value="<%=rightUrl%>"/>
					<input type="hidden" name="cat_no" value="<%=rMap.get("CAT_NO")%>"/>
					<input type="hidden" name="post_no" value="<%=rMap.get("POST_NO")%>"/>
					<input type="hidden" name="mem_no" value="<%=mem_no%>"/>
					<input type="hidden" name="writer_no" value="<%=rMap.get("MEM_NO")%>"/>
					<input type="hidden" name="chk" value=""/>
					<input type="hidden" name="cmt_cnt" value=""/>
					</form>
                    </div>																					

             </div>

                <% 
            }
                %>
               </div>


 </div>
    <div role="tabpanel" class="tab-pane" id="info">


    <div class="canInfo">
    <div id="map"></div>
       <div id="cat_type">타입&nbsp;:&nbsp;<%=catMap.get("CAT_TYPE")%></div>
       <div id="cat_age">나이&nbsp;:&nbsp;<%=catMap.get("CAT_AGE")%></div>
       <div id="cat_gender">성별&nbsp;:&nbsp;<%=catMap.get("CAT_GENDER")%></div>
       <div id="cat_color">모색&nbsp;:&nbsp;<%=catMap.get("CAT_COLOR")%></div>
       <div id="cat_nfc">NFC&nbsp;:&nbsp;</div>
       <div id="cat_neu">중성화&nbsp;:&nbsp;<%=catMap.get("CAT_NEU")%></div>

       </div>   
    </div>
    </div>
    </div>
    <div class="space"></div>
  </div>
  </div>

            
</body>
</html>