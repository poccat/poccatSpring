<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.List" %>
<%@ include file="/resources/common/bootstrap_common.jsp" %>
<%

String mem_name = null;
String mem_no = null;
String mem_id = null;
Map<String,Object> userMap = new HashMap<>();
	if(session.getAttribute("userMap")!=null){
			userMap = (Map<String,Object>)session.getAttribute("userMap");
			mem_name = (String)userMap.get("mem_name"); //==아이디, 비밀번호 틀릴 시 msg('아이디가 존재하지않습니다')
			mem_no = (String)userMap.get("mem_no");
			mem_id = (String)userMap.get("mem_id");
	}

%>

<!DOCTYPE html>
<html>
<head>
 
<%@include file="./modal/postingModal.jsp" %>
<%@include file="./modal/logInModal.jsp" %>
<%@include file="./modal/signUpModal.jsp" %>
<%@include file="./modal/writeModal.jsp" %>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="icon" href="favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    *{
	font-family: 'Noto Sans KR', sans-serif;
	}
	#nav-drop{
		position:absolute;
		padding:20px;
	}
	#search{
		position:absolute;
		padding:20px;
	}
	#postingIcon {
    font-size:  30px;
	}
	#loginIcon {
    font-size:  30px;
	}
	
	@media screen and (max-width: 1000px){
		#searchbox {
			display: none;
			}
	 }
	.dropdown-menu{
		font-size: 20px;
	}
	.dropdown-menu > li{
		margin: 20px;
	}
	.dropdown-menu > li > a{
		font-weight: bold;
	}
</style>
<script type="text/javascript">
var setCookie = function(name, value, exp) {
	var date = new Date();
	date.setTime(date.getTime() + exp*24*60*60*1000);
	document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
	};

var getCookie = function(name) {
	var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	return value? value[2] : null;
	};

var deleteCookie = function(name) {
	document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
	}

function insert_or_del_like(chk){// chk = 1이면 insert 좋아요, 0이면 delete좋아요
	var f_id =getCookie("f_id");
	$('#'+f_id+' [name=chk]').val("");
	$('#'+f_id+' [name=chk]').val(chk);
/* 	$('#'+f_id+' [name=chk]').append($('<input type="hidden" name="chk" value="'+chk+'"/>')); */
	$.ajax({
		url:'<%=path%>firstB/insert_or_del_like.foc'
	   ,data : $('#'+f_id).serialize()
	   ,method :'post'
	   ,dataType : "text"
	   ,success:reload_like_cnt() // 좋아요 갯수 다시 불러오는 함수
	   ,error:function(e){
		   alert("로그인해주세요");
	   }
		}); // end of ajax
}

function reload_like_cnt(){// 좋아요 갯수 다시 불러오기
	console.log("reload_like_cnt호출");
	var f_id =getCookie("f_id");
	$.ajax({
		url:'<%=path%>cat/cat_search_ajax.foc'
	   ,data : $('#'+f_id).serialize()
	   ,method :'post'
	   ,dataType : "json"
	   ,success:function(data){
		   $("#like_count").text(data[0].LIKE_COUNT);//게시물좋아요수
		   if(data[0].LIKE_CHECK==1){
			   $(".sprite_heart_icon_outline").attr("style","display:none;");
			   $(".sprite_heart_icon_red").attr("style","display:inline-block;");
		   }else if(data[0].LIKE_CHECK==0||<%=mem_no%>=="no_login"){
			   $(".sprite_heart_icon_outline").attr("style","display:inline-block;");
			   $(".sprite_heart_icon_red").attr("style","display:none;");
			}	
	   }
	   ,error:function(e){
		   alert(e.responseText);
	   }
		}); // end of ajax
}

function postingModal(f_id, photo_id){

	var photo = $('#'+photo_id.id).val();//포스팅 상세 모달의 메인 포토 주소가져오고 img태그안에 셋팅
	$("#post_main").attr("src",photo);
	$("#post_main").attr("class","img-cropped");
	setCookie("f_id",f_id.id,"1");
	console.log(f_id.id);
	console.log(photo);
	//그리고 cat_no를 서버를 넘겨주고 고양이 이름, 프로필사진 지역을,가져와야함.
		//var f_id='#'.concat(form_id);
		$.ajax({
			url:'<%=path%>cat/cat_search_ajax.foc'//고양이테이블에서 고양이 이름, 프로필 사진, 지역정보를 가져와야한다.
		   ,data : $('#'+f_id.id).serialize()   
		   ,method :'post'
		   ,dataType : "json"
		   ,success:function(data){
			   console.log($(".post_no").val());
			   $("#post_profile").attr("src",'<%=path%>'+data[0].CAT_PHOTO);//고양이정보 사진컬럼이름
			   $("#nick_name").text(data[0].CAT_NAME);//고양이 이름
			   $("#nick_name").attr('href',"<%=path%>cat/cat_search.foc?cat_no="+data[0].CAT_NO);//고양이 이름
			   console.log(data[0].CAT_NO);
			   $(".country").text(data[0].CAT_LOCAL);//고양이 지역
			   $("#like_count").text(data[0].LIKE_COUNT);//게시물좋아요수
			   if(data[0].LIKE_CHECK==1){
				   $(".sprite_heart_icon_outline").attr("style","display:none;");
				   $(".sprite_heart_icon_red").attr("style","display:inline-block;");
			   }else if(data[0].LIKE_CHECK==0||<%=mem_no%>=="no_login"){
				   $(".sprite_heart_icon_outline").attr("style","display:inline-block;");
				   $(".sprite_heart_icon_red").attr("style","display:none;");
				}
		   }
		   ,error:function(e){
			   alert(e.responseText);
		   }
			}); // end of ajax
			//댓글리스트 추가하기
		 $.ajax({
			url:'<%=path%>firstB/posting_cmt_list.foc'//회원테이블에서 회원프로필사진주소도 불러와야함
			//글번호로 댓글테이블에서 댓글 불러올 메소드로 연결할 주소입력 그리고 리턴주소는 jsonprint.jsp
			//댓글테이블에 작성자와 작성시간,댓글내용
		   ,data : $('#'+f_id.id).serialize()
		   ,method :'post'
		   ,dataType : "json"
		   ,success:function(data){
			   $("#cmt_area").empty();
			   for(var i=0;i<data.length;i++){ 
				   $("#cmt_area").append($('<div class="user_container-detail">')); 
				   $("#cmt_area").append($('<div style="float:left;" class="user"><img src='+'<%=path%>resources/common/pds/'+data[i].MEM_PHOTO+'></div>'));
				   $("#cmt_area").append($('<div style="float:left;" class="comment">'));
				   $("#cmt_area").append($('<span class="user_id">'+data[i].CMT_MEM_ID+'</span><span>'+data[i].CMT_CNT+'</span>'));
				   $("#cmt_area").append($('<div class="time">'+data[i].CMT_DATE+'</div>'));
				   $("#cmt_area").append($('<div class="icon_wrap">'));
				   $("#cmt_area").append($('<div class="more_trigger">'));
				   $("#cmt_area").append($('<div class="sprite_more_icon" style="float: right;"></div>'));
/* 				   $("#cmt_area").append($('</div><div><div class="sprite_small_heart_icon_outline">')); */
				   $("#cmt_area").append($('</div></div></div></div></div>'));
				   }
			}
		   ,error:function(e){
			   alert(e.responseText);
		   }
			}); // end of ajax  
	$("#postingModal").modal('show');
}
</script>
</head>
<body>

<div id="Allheader" style="width:100%; ">
        <div class="navbar navbar-expand-md navbar-light bg-light" style="width: calc(100% - 250px); float:left;" id="top-page">
       
            	<div class="col-md-2">
		        	<a class="navbar-brand" href="<%=path.toString()%>firstB/poccat.foc"><i class="fas fa-cat fa-2x"></i></a>
		       	</div>
		       	<div  class="col-md-5">
		       	<div id="logined" style="float:right; padding-top:20px;"></div>
		       	</div>
            	<div id="searchbox" class="col-md-5" onclick="location.href='<%=path.toString()%>firstB/poccat.foc?all=all'">
            		<nav class="navbar navbar-light bg-light">
					  <form class="form-inline" id="search">
					    <input class="form-control" type="search" placeholder="검색" aria-label="Search">
					    <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
					  </form>
					</nav>	
				</div>	
				
							
            	</div>
            	 <div id="small-toggle" style="width:250px; float:left; padding-right:10px; position:relative;">
		       		<a id="postingWrite"  class="navbar-brand" href="javascript:writeModal()"  data-target="#writeModal"><i class="glyphicon glyphicon-pencil" id="postingIcon"></i></a>
            		<a class="navbar-brand"  data-toggle="modal"  id="loginIcon"><i></i></a>

		       		<a  id="signupIcon" class="navbar-brand" href="javascript:signUpModal()"  data-target="#signUpModal"><i class="fas fa-user-cog fa-2x"></i></a>

		       	<!-- =================================[[ 드롭다운 메뉴 시작]]============================================= -->		   
					 <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="nav-drop"><i class="fas fa-sort-amount-down fa-2x style="position:absolute; left:5px;"></i>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu dropdown-menu-right" style="position:absolute; top:60px; margin-right:5px;">
						<li><a href="<%=path.toString()%>secondB/common_board_list.foc?com_b_type=0">공지</a></li>
						<li><a href="#">후원</a>                                       </li>
						<li><a href="<%=path.toString()%>secondB/common_board_list.foc?com_b_type=3">나눔</a></li>
						<li><a href="#">신고</a>                                       </li>
            			<li><a href="#">봉사</a>                                       </li>
						<li><a href="<%=path.toString()%>shelter/main.jsp">포캣보호소</a></li>                  
					</ul>
<!-- =================================[[ 드롭다운 메뉴 시작]]============================================= -->		   
            	</div> 

            	</div>


     
<!-- 헤더 -->
            

</body>
</html>