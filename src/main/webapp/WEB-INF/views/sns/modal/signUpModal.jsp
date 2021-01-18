<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
		function signUpModal(){
				$("#signUpModal").modal('show');
		}
</script>
</head>
<body>
<div class="modal fade" id="signUpModal" role="dialog" aria-labelledby="posting_modalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	        <div class="modal-header" style="padding:35px 50px;">
				<h1>회원가입</h1>
	        </div>
	        <div class="modal-body" style="padding:40px 50px;">
                <div class="col-12">
                    <form method="POST" action="member/member_join.foc">
                        <div class="form-group">
                            <label for="join_id">아이디</label>
                            <input type="text" class="form-control" id="join_id" placeholder="아이디" name="join_id" />
                        </div>
                        <div class="form-group">
                            <label for="join_email">이메일 주소</label>
                            <input type="text" class="form-control" id="join_email" placeholder="이메일 주소" name="join_email" />
                        </div>
                        <div class="form-group">
                            <label for="join_pw">비밀번호</label>
                            <input type="password" class="form-control" id="join_pw" placeholder="비밀번호" name="join_pw" />
                        </div>
                        <div class="form-group">
                            <label for="username">비밀번호 확인</label>
                            <input type="password" class="form-control" id="re-password" placeholder="비밀번호 확인" name="re-password" />
                        </div>
                        <button type="submit" class="btn btn-primary">등록</button>
                      <button type="button" data-dismiss="modal" class="btn" >취소</button>
                    </form>
                </div>
	        </div>
	      	</div>
	     </div>
	  </div>
</body>
</html>