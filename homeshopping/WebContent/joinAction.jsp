<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "model.memberDAO"%>
<%@ page import= "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="model.memberDTO" scope="page"/>
<jsp:setProperty name="member" property="userID"/>
<jsp:setProperty name="member" property="userPW"/>
<jsp:setProperty name="member" property="userName"/>
<jsp:setProperty name="member" property="userGender"/>
<jsp:setProperty name="member" property="userEmail"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	String userID = null;
	if(session.getAttribute("userID") != null) userID = (String) session.getAttribute("userID");
	if (userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script");
	}
 
 	if(member.getUserID() == null || member.getUserPW() == null || member.getUserName() == null || member.getUserGender() == null || member.getUserEmail() == null){
 		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script");
 	} else {
 		memberDAO MemeberDAO = new memberDAO();
 		int result = MemeberDAO.join(member);
 		if(result == -1 ){
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('이미 존재하는 아이디입니다.')");
 			script.println("history.back()");
 			script.println("</script");
 		}else {
 			session.setAttribute("userID", member.getUserID());
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("location.href = 'main.jsp'");
 			script.println("</script");
 		}
 	}
 %>
</body>
</html>