package model;

import common.DBConnPool;

public class memberDAO extends DBConnPool {

	public memberDAO() {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPW) {
		System.out.println("11111");
		String SQL = "SELECT userPW FROM MEMBER WHERE userID =?";
		try {
			System.out.println("3333");
			psmt =con.prepareStatement(SQL);
			psmt.setString(1, userID);
			rs = psmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					return 1; //로그인 성공
				}else {
					return 0; //비밀번호 불일치
				}
			}
			return -1; //아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //db 오류
	}
	
	public int join(memberDTO memberDTO) {
		String SQL = "INSERT INTO MEMBER VALUES (?,?,?,?,?)";
		try {
			psmt =con.prepareStatement(SQL);
			psmt.setString(1, memberDTO.getUserID());
			psmt.setString(2, memberDTO.getUserPW());
			psmt.setString(3, memberDTO.getUserName());
			psmt.setString(4, memberDTO.getUserGender());
			psmt.setString(5, memberDTO.getUserEmail());
			return psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
}
