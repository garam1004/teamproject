package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONArray;

import com.sun.jmx.snmp.Timestamp;

import bookboard.BookVO;

public class noticeDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	private Connection getConnection() throws Exception {
		con=null;
		pstmt=null;
		rs=null;
		sql=null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/library");
		con = ds.getConnection();
		return con;
	}

	// 자원해제 메소드
	private void freeResource() {
		try {
			if (rs != null)rs.close();
			if (pstmt != null)pstmt.close();
			if (con != null)con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<noticeVO> getnoticelist(String id ,int number){
		List<noticeVO> list = new ArrayList<noticeVO>();
		try {
			con=getConnection();
			sql = "select * from notice where id=? order by insertdate desc limit ?,3";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, number);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				noticeVO VO = new noticeVO();
				VO.setId(rs.getString(1));
				VO.setComment(rs.getString(3));
				VO.setInsertdate(rs.getTimestamp(2));
				list.add(VO);
			}
		} catch (Exception e) {e.printStackTrace();}finally {freeResource();}
		return list;
	}
	
	public List getbook(String id) {
		BookVO BVO = new BookVO();
		List list = new ArrayList(); 
		try {
			con = getConnection();
			sql = "select * from book where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BVO = new BookVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getInt(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getDate(10),
						rs.getDate(11), rs.getDate(12));
			

				list.add(BVO);
			}
			

		} catch (Exception e) {
			System.out.println("getbook()메소드 내부 오류" + e);
		} finally {
			freeResource();
		}
		
		return list;
	}
	
}
