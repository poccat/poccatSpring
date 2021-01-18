<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.List" %>
    
<%
	Map<String,Object> userMap = new HashMap<>();
	userMap = (Map<String,Object>)session.getAttribute("userMap");
	String mem_id = (String)userMap.get("mem_name");
	String mem_no = (String)userMap.get("mem_no");
	out.print(mem_id);
	out.print(mem_no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<script type="text/javascript">
window.onload = function(){
	document.getElementById('login').submit();
	}
</script>
<form id="login" action="/firstB/poccat.foc">
	<input type="hidden" name="mem_no" value="<%=mem_no%>"/>
</form>

</body>
</html>