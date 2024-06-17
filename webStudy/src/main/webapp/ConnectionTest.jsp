<%@ page import="common.DBConnPool" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>커넥션 풀 테스트</h2>
	<%
	DBConnPool pool = new DBConnPool();
	pool.close();
	%>
</body>
</html>