package membership;

import java.sql.PreparedStatement;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		StringBuffer query = new StringBuffer();
		
		query.append("SELECT * FROM member WHERE id=? AND pass=?");
		
		try {
			psmt = con.prepareStatement(query.toString());
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			System.out.println("query : "+query);
			System.out.println("query : "+uid);
			System.out.println("query : "+upass);
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}
}
