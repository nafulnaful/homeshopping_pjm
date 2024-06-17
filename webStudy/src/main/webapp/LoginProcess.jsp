<%@ page import="membership.MemberDTO" %>
<%@ page import="membership.MemberDAO" %>

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
	String userID = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");

	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePwd = application.getInitParameter("OraclePwd");
	
	System.out.println(oracleDriver+"\\"+oracleURL+"\\"+oracleId+"\\"+oraclePwd);
	
	MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
	MemberDTO memberDTO = dao.getMemberDTO(userID, userPwd);
	dao.close();
	
	Boolean loginOK = false; 
	try{
		if(memberDTO.getId() != null){
			out.println("Success");
			session.setAttribute("UserId", memberDTO.getId());
			session.setAttribute("UserName", memberDTO.getName());
			response.sendRedirect("login.jsp");
		}else{
			out.println("Please try again");			
		}
	}catch (Exception e){
		
	}
%>
</body>
</html>