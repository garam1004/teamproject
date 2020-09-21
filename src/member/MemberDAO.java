package member;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
		
		private Connection getConnection() throws Exception{
			conn=null;
			pstmt=null;
			rs=null;
			sql=null;
			Context init = new InitialContext();
			DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/library");
			conn = ds.getConnection();
			return conn;
		}
		
		public void freeResource() {
			if(conn != null){try{conn.close();}catch(SQLException e){e.printStackTrace();}}
			if(rs != null){try{rs.close();}catch(SQLException e){e.printStackTrace();}}
			if(pstmt != null){try{pstmt.close();}catch(SQLException e){e.printStackTrace();}}
		}
	
		public void insertmember(MemberVO VO) {
			
			try {
				
				conn = getConnection();
				sql= "insert into member(id,pwd,name,email,address1,address2,address3,address4,phone,joindate,userimage) values(?,?,?,?,?,?,?,?,?,now(),?)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, VO.getId());
				pstmt.setString(2, VO.getPwd());
				pstmt.setString(3, VO.getName());
				pstmt.setString(4, VO.getEmail());
				pstmt.setString(5, VO.getAddress1());
				pstmt.setString(6, VO.getAddress2());
				pstmt.setString(7, VO.getAddress3());
				pstmt.setString(8, VO.getAddress4());
				pstmt.setString(9, VO.getPhone());
				pstmt.setString(10, VO.getUserimage());
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("insertmember 메소드 내부에서 오류 :" + e);
			}finally {
				freeResource();
			}
		}
		
		
		public int idcheck(String id) {
			
			 
			int check = 0; 
			
			try {
				conn= getConnection();
				String sql= "select * from member where id=?";
				pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs= pstmt.executeQuery();
				if(rs.next()){
					check = 1;
				}else {
					check = 0;
				}
				
			} catch (Exception e) {
				System.out.println("idCheck메소드 예외발생:" + e);
			}finally {
				freeResource();
			}	
			return check;
			
		}//idcheck()메소드 끝
		
		
		public int login(String id, String pwd) {
			int check = 0;
			try {
				conn=getConnection();
				sql="select * from member where id = ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					if(pwd.equals(rs.getString("pwd"))) {
						check=2;
						
					}else {
						check=1;
					}
				}else {
					check=0;
				}
			}catch (Exception e) {
				System.out.println("login 오류 입니다 :" + e);
			}finally {
				freeResource();
			}
			return check;
		}
		
		
		public MemberVO memberInfo(String id){
			
			MemberVO VO = new MemberVO();
			try {
				conn = getConnection();
				String sql = "select * from member where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				
				if(rs.next()) {
				VO.setAddress1(rs.getString("address1"));
				VO.setAddress2(rs.getString("address2"));
				VO.setAddress3(rs.getString("address3"));
				VO.setAddress4(rs.getString("address4"));
				VO.setId(rs.getString("id"));
				VO.setPhone(rs.getString("phone"));
				VO.setName(rs.getString("name"));
				VO.setEmail(rs.getString("email"));
				VO.setPwd(rs.getString("pwd"));
				VO.setJoindate(rs.getTimestamp("joindate"));
				VO.setUserimage(rs.getString("userimage"));
				}	
			} catch (Exception e) {
				System.out.println("memberInfo메소드 내부에서 오류" + e);
				e.printStackTrace();
			} finally {
				freeResource();
			}
			
			return VO;
		}

		public void updatemember(MemberVO VO) {
			try {
				conn = getConnection();
				sql="update member set pwd=?,name=?,email=?, address1=?,address2=?,address3=?,address4=?,phone=?,userimage=? "
						+ " where id = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,VO.getPwd());
				pstmt.setString(2,VO.getName());
				pstmt.setString(3,VO.getEmail());
				pstmt.setString(4,VO.getAddress1());
				pstmt.setString(5,VO.getAddress2());
				pstmt.setString(6,VO.getAddress3());
				pstmt.setString(7,VO.getAddress4());
				pstmt.setString(8,VO.getPhone());
				pstmt.setString(9, VO.getUserimage());
				pstmt.setString(10,VO.getId());
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("updatemember메소드 내부에서 오류 : " + e);
			}finally {
				freeResource();
			}			
		}
		

		public MemberVO findID(String name, String email) {
			
			MemberVO VO = new MemberVO();
			try {
				conn = getConnection();
				String sql = "select id from member where name=? and email=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				rs = pstmt.executeQuery();
				
				
				if(rs.next()) {
				
				VO.setId(rs.getString("id"));
				
				}	
			} catch (Exception e) {
				System.out.println("findid 메소드 내부에서 오류" + e);
				e.printStackTrace();
			} finally {
				freeResource();
			}
			return VO;
		}
		
		/* 6자리 인증번호 생성 메서드 */
		public String authNum() {
			StringBuffer authNum = new StringBuffer();

			for (int i = 0; i < 6; ++i) {
				int randNum = (int) (Math.random() * 10.0D);
				authNum.append(randNum);
			}

			return authNum.toString();
		} //인증번호 생성 메서드 끝
		
		/* 인증메일 전송 메서드 */
		public boolean sendEmail(String email, String authNum) {
			boolean result = false;
			String sender = "ansqkdtkdn1@gmail.com";
			String subject = "도서관 인증번호입니다.";
			String content = "안녕하세요 " + email + "님, <br>" + "귀하의 인증번호는    [<b>" + authNum + "</b>]   입니다.";

			try {
				Properties properties = System.getProperties();
				properties.put("mail.smtp.starttls.enable", "true");
				properties.put("mail.smtp.host", "smtp.gmail.com");
				properties.put("mail.smtp.auth", "true");
				properties.put("mail.smtp.port", "587");
				Authenticator auth = new GoogleAuthentication();
				Session session = Session.getDefaultInstance(properties, auth);
				Message message = new MimeMessage(session);
				Address senderAd = new InternetAddress(sender);
				Address receiverAd = new InternetAddress(email);
				message.setHeader("content-type", "text/html;charset=UTF-8");
				message.setFrom(senderAd);
				message.addRecipient(RecipientType.TO, receiverAd);
				message.setSubject(subject);
				message.setContent(content, "text/html;charset=UTF-8");
				message.setSentDate(new Date());
				Transport.send(message);
				result = true;
			} catch (Exception var13) {
				result = false;
				System.out.println("Error in SendEmail()");
				var13.printStackTrace();
			} finally {
				freeResource();
			}

			return result;
		}//인증메일 전송 메서드 끝

		public int FindEmail(String email) {
			MemberVO VO = new MemberVO();
			int check = 0;
			try {
				conn = getConnection();
				String sql = "select email from member where  email=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
				
				
				if(rs.next()) {
				
				check = 1;
				
				}	
			} catch (Exception e) {
				System.out.println("findemail 메소드 내부에서 오류" + e);
				e.printStackTrace();
			} finally {
				freeResource();
			}
			return check;
		
		}

		public void changePwd(String pwd,String email) {
			
			try {
				conn = getConnection();
				String sql = "UPDATE member SET pwd=?  WHERE email=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pwd);
				pstmt.setString(2, email);
				
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("Error in changePwd");
				e.printStackTrace();
			}finally {
				freeResource();
			}
		}
		public List<MemberVO> getmemberinfo(String search) {
			List<MemberVO> list = new ArrayList<MemberVO>();
			try {
				conn=getConnection();
				sql = "select * from member where id like ? or name like ? or phone like ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setString(2, "%"+search+"%");
				pstmt.setString(3, "%"+search+"%");
				rs=pstmt.executeQuery();
				while(rs.next()) {
					MemberVO vo = new MemberVO();
					vo.setId(rs.getString("id"));
					vo.setName(rs.getString("name"));
					vo.setEmail(rs.getString("email"));
					vo.setJoindate(rs.getTimestamp("joindate"));
					vo.setPhone(rs.getString("Phone"));
					list.add(vo);
				}
			} catch (Exception e) {System.out.println("getmemberinfo메서드 오류"+e);}finally {freeResource();}
			return list;
		}
	
}
