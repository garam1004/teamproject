package ReadRoom;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hopeboard.HopeVO;

public class ReadRoomDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	private Connection getConnection() throws Exception{
		con=null;
		pstmt=null;
		rs=null;
		sql=null;
		Context init = new InitialContext();
		DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/library");
		con = ds.getConnection();
		return con;
	}
	private void freeresource() {
		try {
			if(con!=null)con.close();
			if(pstmt!=null)con.close();
			if(rs!=null)con.close();
		} catch (Exception e) {
			System.out.println("freeresource메서드 내부 오류"+e);
		}
	}
	public void resrroom(ReadRoomVO readRoomVO) {

		try {
			con=getConnection();
			sql= "insert into readingroom values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, readRoomVO.getId());
			pstmt.setInt(2, readRoomVO.getYear());
			pstmt.setInt(3, readRoomVO.getMonth());
			pstmt.setInt(4, readRoomVO.getDay());
			pstmt.setInt(5, readRoomVO.getRoomnumber());
			pstmt.setInt(6, readRoomVO.getReservation());
			pstmt.executeUpdate();
			String content = readRoomVO.getId()+" 님!! " + readRoomVO.getRoomnumber() + " 번방 열람실이 " + readRoomVO.getYear() 
			+ " 년" + readRoomVO.getMonth() + " 월" + readRoomVO.getDay() +" 일에 예약되셨습니다.";
			sql = "insert into notice(id,insertdate,comment) values(?,now(),?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, readRoomVO.getId());
			pstmt.setString(2, content);
			pstmt.executeUpdate();
		} catch (Exception e) {System.out.println("resrroom 메서드 내부 오류"+e);}finally {freeresource();}
	}
	public int getalreadyres(int year , int month , int date , int roomnumber) {
		int check=0;
		try {
			con=getConnection();
			sql = "select * from readingroom where year=? and month =? and day = ? and roomnumber = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, year);
			pstmt.setInt(2, month);
			pstmt.setInt(3, date);
			pstmt.setInt(4, roomnumber);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				check++;
			}
			} catch (Exception e) {
				System.out.println("getalreadyres메서드 내부 오류"+e);}finally {freeresource();}
		return check;
	}
	public int resrcount(String id) {
		int count = 0;
		try {
			con=getConnection();
			sql="select count(reservation) from readingroom where id = ? and concat(year,'-',month,'-',day) >= date(now())";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}catch (Exception e) {
			System.out.println("resrcount메소드 오류"+e);
		}finally {
			freeresource();
		}
		return count;
	}
	
	public int daycount(String id, int year , int month , int day) {
		int daycount = 0;
		try {
			con=getConnection();
			sql="select count(reservation) from readingroom where id=? and year=? and month=? and day=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, year);
			pstmt.setInt(3, month);
			pstmt.setInt(4, day);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				daycount=rs.getInt(1);
			}
		}catch (Exception e) {
			System.out.println("daycount메소드 오류"+e);
		}finally {
			freeresource();
		}
		return daycount;
	}
	
	public int getAdminres() {
		int count = 0;
		try {
			con = getConnection();
			sql = "select * from readingroom";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count++;
			}
		} catch (Exception e) {
			System.out.println("getAdminHope()메소드에서 예외 발생" + e);
		} finally {
			freeresource();
		}
		return count;		
	}
	
	public List<ReadRoomVO> getAdminList(int pageFirst, int pageSize) {
		List<ReadRoomVO> list = new ArrayList<ReadRoomVO>();
		try {
			con=getConnection();
			sql = "select * from readingroom order by day desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReadRoomVO readRoomVO = new ReadRoomVO(rs.getString(1),
											rs.getInt(2), rs.getInt(3),
											rs.getInt(4), rs.getInt(5),
											rs.getInt(6));
				
			list.add(readRoomVO);
			}
			
		}catch (Exception e) {
			System.out.println("getAdminList메소드 내부 오류 "+e);
		}finally {
			freeresource();
		}
		return list;
	}
	
	
}
