<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.List, java.util.ArrayList, java.util.HashMap, com.google.gson.Gson"%>
<%
	List<Map<String,Object>> rList =  new ArrayList<>();
	rList = (List<Map<String,Object>>)request.getAttribute("rList");
	Gson gson = new Gson();
	String temp = gson.toJson(rList);
	out.print(temp);
%>