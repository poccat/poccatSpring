<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>애니멀시 메인페이지</title>
<%@ include file="/common/bootstrap_common.jsp" %>
<link rel="stylesheet" href="../css/sidemenu.css"/>
<style>

</style>
</head>
<body>
<!--==================== [[ top.jsp 시작 ]] ====================-->		
	    <div class="row top">
	    		  <div class="col-sm-12">
					    <%@include file="./top.jsp" %> 
	    		  </div>
	    </div>
<!--==================== [[ top.jsp 시작 ]] ====================-->		
<!--================================================ 질문응답 시작 ================================================== -->
<div class="container"><!-- container 시작 -->
	    <!--==================== [[ body 시작 ]] ====================-->		
	    <div class="row body"> <!-- row body 시작  -->
					 <div class="col-sm-2"> <!-- body left  -->
		<!-- ========================[[ 사이드 메뉴바 시작]]============================= -->
					<div class="list-group ">
					<div>
						<h2>질문</h2>
					</div>
								  <a href="#" class="list-group-item borderless">자주묻는질문</a>
								  <a href="#" class="list-group-item borderless">질문게시판</a>
					</div>
		<!-- ========================[[ 사이드 메뉴바 끝]]============================= -->
				    </div> <!-- body left  -->
			<br>
	     <div class="col-sm-10"> <!-- body middle  -->
           <div class="panel panel-warning">
             <div class="panel-heading">
                <h3 class="panel-title">
                   <span class="glyphicon glyphicon-tags"></span>
                    &nbsp;&nbsp;질문응답
                </h3>
             </div>
              <div class="panel-body">
                 <div class="media">
                   <div class="media-left">
                     <a href="#">
                     </a>
                   </div>
                   <div class=media-body">
                           무엇이든 물어보세요.
              </div>
            </div>
          </div>
    <table class="table">
      <thead>
        <tr>
           <th>글번호</th>
           <th>닉네임</th>
           <th>글제목</th>
           <th>작성일</th>
         </tr>        
      </thead>
     <tbody>
        <tr>
           <td>01</td>
           <td>캣마미</td>
           <td><a href="lecture.html?lectureName=A">이유식은 몇개월까지 먹여야 되나요?</a></td>
           <td>2020-12-31</td>
         </tr>   
         <tr>
           <td>02</td>
           <td>갓냥이찬양</td>
           <td><a href="lecture.html?lectureName=B">입양했던 나비가 자꾸 물어요 친해질 방법 없나요?</a></td>
           <td>2021-01-02</td>
         </tr>  
         <tr>
           <td>03</td>
           <td>야옹해</td>
           <td><a href="lecture.html?lectureName=C">고양이가 먹지 말아야 하는 음식이 무엇무엇 있을까요?</a></td>
           <td>2021-01-05</td>
         </tr>         
      </tbody>
    </table>
    </div><!-- panel -->
    </div><!-- body middle  -->
    </div><!-- row body 끝  -->
    </div><!-- container 끝 -->
 <!--================================================ 질문응답 끝================================================== -->  
</body>
</html>