<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
	
%>    
<link rel="shortcut icon" href="image/favicon.ico">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="<%=path.toString() %>resources/css/bootstrap.css">
<script type="text/javascript" src="<%=path.toString() %>resources/js/commons.js"></script>
<script type="text/javascript" src="<%=path.toString() %>resources/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<link rel="stylesheet" href="<%=path.toString() %>resources/css/modal.css">
<link rel="stylesheet" href="<%=path.toString() %>resources/css/postingModal.css">
<link rel="stylesheet" href="<%=path.toString() %>resources/css/icon.css">
<link rel="stylesheet" href="<%=path%>resources/css/photoList.css">
<link rel="stylesheet" href="<%=path%>resources/css/myPage.css">
<link rel="stylesheet" href="<%=path%>resources/css/chat_modal.css">
<script src="https://www.gstatic.com/firebasejs/8.2.2/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.2.2/firebase-database.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.23.0/firebase-auth.js"></script>
 <!-- The core Firebase JS SDK is always required and must be listed first -->
<!-- TODO: Add SDKs for Firebase products that you want to use
    https://firebase.google.com/docs/web/setup#available-libraries -->
<script src="https://www.gstatic.com/firebasejs/8.2.2/firebase-analytics.js"></script>
<script src="<%=path.toString()%>resources/js/firebaseConfig.js"></script>
