<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.List" %>
<%
   List<Map<String,Object>> rList =(List<Map<String,Object>>)request.getAttribute("rList");
   List<Map<String,Object>> fbList =(List<Map<String,Object>>)request.getAttribute("fbList");
   Map<String,Object> rMap = new HashMap<>();
   Map<String,Object> catMap = new HashMap<>();
   catMap = rList.get(0);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/profile.css">
<link rel="stylesheet" href="../css/photoList.css">
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9vEGnLXmgisFdhIOc6TeWWRGErG1tLZU&callback=initMap&libraries=&v=weekly"
      defer
    ></script>
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
    <script>
      var map;
      var marker;//Marker객체 생성하기

      function initMap() {
         var infowindow = new google.maps.InfoWindow();
        map = new google.maps.Map(document.getElementById("map"), {
          center: { lat: 37.478870, lng: 126.878659 },
          zoom: 16
        });
        marker = new google.maps.Marker({
           position: new google.maps.LatLng(37.478870 , 126.878659),
           map: map,
           title: '현재 내 위치'
        });
        infoWindow.open(map,marker);
      }
    </script>
</head>
<body>
<div class="parent">
<div class="header">
<%@ include file="./header.jsp"%>
<%@ include file="./modal/followModal.jsp"%>
</div>
<div class="body">
<div class="space" ></div>
<div class="content">    
                         <div class="hori_cont">
                <div class="profile_wrap">
                    <div class="profile_img">
                        <img src="<%=catMap.get("CAT_PHOTO")%>" alt="고양이">
                    </div>
                </div>

                <div class="detail">
                    <div class="top">
                        <div class="user_name"><%=catMap.get("CAT_NAME")%></div>
                        <button class="btn" class="profile_edit">팔로우</button>
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
            	String f_id= "post_info"+i;
            	String postingModal="javascript:postingModal("+f_id.toString()+","+post_photo.toString()+")";
            %>
            <div class= "thumbnail-wrapper">

                	<div class="thumbnail"> 
                    <a href="<%=postingModal%>">
                    <img src="<%=rMap.get("POST_PHOTO1")%>" alt=""></a>
                    <form id="<%=f_id%>" method="post">
					<input id="<%=post_photo%>" type="hidden" value="<%=rMap.get("POST_PHOTO1")%>"/>
					<input type="hidden" name="cat_no" value="<%=rMap.get("CAT_NO")%>"/>
					<input type="hidden" name="post_no" value="<%=rMap.get("POST_NO")%>"/>
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