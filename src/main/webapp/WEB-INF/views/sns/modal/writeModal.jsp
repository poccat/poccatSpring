<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- ======================== [[ 포스팅, 신고, 입양후기를 쓰는 폼 ]] ============================ -->

<style>
	textarea { resize:none; }
	.thumbnail{
		display: inlne-block;
	}
	.img{
		width:100%;
		height: auto;
	}
	.postthumbnail {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;

		} 
</style>

</head>
<body>
<div class="modal fade" id="writeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <!--============================[[ 모달 헤더 시작]]==========================================  -->
    <div class="modal-header">
    	<h2>포스팅 작성하기</h2>
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
    <!--============================[[ 모달 헤더 끝]]==========================================  -->
    <!--============================[[ 모달 바디 시작]]==========================================  -->
      <div class="modal-body">
      <div id="main_container">
    <!--============================ <form>==========================================  -->
           <form name="f_posting" method="post" action="firstB/posting_write.foc" accept-charset="utf-8">
                     <div class="postthumbnail">
						   <img src="" >
					</div>
					<input type=hidden name='mem_no' value='<%=mem_no%>'>
																	<!-- 01.07 고양이번호 일단 상수값 -->
					<input type=hidden name='cat_no' value='2'> 
					<input type=hidden name='post_type' value='1'> 
			        <div class="form-group">
			              <label for="exampleFormControlInput1">제목</label>
			            <input name="post_title" type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목을 작성해주세요.">
			          </div>
			          <div class="form-group">
			            <label for="exampleFormControlTextarea1">내용</label>
			            <textarea name="post_cnt" class="form-control" id="exampleFormControlTextarea1" name="contents" rows="20" placeholder="내용을 적어주세요."></textarea>
			          </div>
				        <div class="custom-file">
				            <input name="post_photo1" type="file" class="custom-file-input" id="customFile">
				            <label class="custom-file-label" for="customFile"></label>
				        </div>
			        <button type="submit" class="btn btn-secondery btn-link" type="button">등록하기</button>
		    </form>
		</div><!-- main_container  -->
		</div> <!-- modal-body -->
    <!--============================[[ 모달 바디 시작]]==========================================  -->
		</div><!-- modal-content  -->
	</div><!-- modal-dialog  -->
</div><!-- modal  -->

</body>
</html>