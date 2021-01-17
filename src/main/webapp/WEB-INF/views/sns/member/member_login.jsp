<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%     
	Map<String,Object> rLoginMap = new HashMap<>();
	rLoginMap = (Map<String,Object>)session.getAttribute("rLoginMap");   
		String smem_name = null;
		String smem_id = null;
		String smem_no = null;
				   System.out.println("rLoginMap null?===>" + rLoginMap);
		if(rLoginMap!=null){
			   smem_id   = rLoginMap.get("smem_id").toString(); 			   //r_memID
			   smem_name = rLoginMap.get("smem_name").toString(); //msg
			   System.out.println("smem_name===>" + smem_name);
			   if(rLoginMap.get("smem_no")!=null){ //비밀번호만 틀렸을 경우 smem_no는 null이기 때문에 null체크 필요
				   smem_no = rLoginMap.get("smem_no").toString(); //smem_no
				   System.out.println("smem_name===>" + smem_name);
			   }
		}else{
				   System.out.println("rLoginMap null?===>" + rLoginMap);
		   smem_name = "";
		   smem_id   = "";
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
		var smem_id="<%=smem_id%>";
		var smem_no="<%=smem_no%>";
		var smem_name="<%=smem_name%>";
		      //아이디 틀림       //비밀번호만 틀림
		if(smem_id=="-1" || smem_name==""){ // 로그인 실패의 경우 
			alert(smem_name);
			location.href="../mainPage.jsp";
		} else {															// 로그인 성공의 경우
			alert("로그인 성공!  "+msg+"님 환영합니다.");
			console.log("msg==>" + msg);
			location.href="../mainPage.jsp";
		}
</script>
</body>
</html>