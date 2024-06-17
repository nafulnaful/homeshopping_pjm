<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    if (session.getAttribute("UserId") == null) {
%>
<script>
function validateForm(from){
	if(!form.user_id.value){
		alert("아이디를 입력하세요.");
		return false;
	}
	if(!form.user_pw.value ==""){
		alert("비밀번호를를 입력하세요.");
		return false;		
	}
}
</script>
<h1>Login</h1>
    <form method="post" action="LoginProcess.jsp" name="loginFrm" onsubmit="return validateForm(this);">
        <label for="userID">Username:</label>
        <input type="text" id="user_id" name="user_id" required>
        <br>
        <label for="userPassword">Password:</label>
        <input type="password" id="user_pw" name="user_pw" required>
        <br>
        <input type="submit" value="Login">
    </form>
<%
} else {
%>
    <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
    <a href="../Logout.jsp">[로그아웃]</a>
<%
}
%>
</body>
</html>