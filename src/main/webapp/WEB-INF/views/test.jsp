<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.List" %>
<% 
	List<Map<String,Object>> rList = (List<Map<String,Object>>)request.getAttribute("boardList");
out.print(rList);

%>