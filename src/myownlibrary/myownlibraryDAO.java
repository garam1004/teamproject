package myownlibrary;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bookboard.BookVO;

public class myownlibraryDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;

	// DB연결
	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/library");
		con = ds.getConnection();
		return con;
	}

	// 자원해제 메소드
	private void freeResource() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	public List<myownlibraryVO> myrentlist(String id) {
		// TODO Auto-generated method stub
		Map list =new HashMap();		
		
		List<myownlibraryVO> rentlist = new ArrayList<myownlibraryVO>();
		
				
		try {
			con = getConnection();
			sql = "select m.id, m.booknum, m.rentdate, m.r_returndate, m.returndate,b.title, b.writer, b.publisher, b.genre, b.bookimage, m.extension from myownlibrary m join book b on(m.booknum = b.booknum) where m.id = ? and r_returndate is null;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				myownlibraryVO myownlibraryVO = new myownlibraryVO(	rs.getInt("booknum"), rs.getString("title"), rs.getString("writer"), rs.getString("publisher"), 
																	rs.getString("genre"), rs.getString("bookimage"), rs.getString("id"), rs.getDate("rentdate"), 
																	rs.getDate("returndate"), rs.getDate("r_returndate"), rs.getInt("extension"));
						
						
				
				
//				myownlibraryVO myownlibraryVO = new myownlibraryVO(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getDate(4),
//						rs.getDate(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11));
				
				rentlist.add(myownlibraryVO);
			}

		} catch (Exception e) {
			System.out.println("myrentlist메소드 내부 오류 " + e);
		} finally {
			freeResource();
		}
		return rentlist;
	}
	
	
	
	
	
	public List<myownlibraryVO> myrentedlist(String id, int pageFirst, int pageSize) {
		// TODO Auto-generated method stub
		Map list =new HashMap();		
		
		List<myownlibraryVO> rentedlist = new ArrayList<myownlibraryVO>();
		
				
		try {
			con = getConnection();
			sql = "select m.id, m.booknum, m.rentdate, m.r_returndate, m.returndate,b.title, b.writer, b.publisher, b.genre, b.bookimage from myownlibrary m join book b on(m.booknum = b.booknum)"
					+ "where m.id = ? and m.r_returndate is not null  order by m.r_returndate desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pageFirst);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				myownlibraryVO myownlibraryVO = new myownlibraryVO(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getDate(4),
						rs.getDate(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
				
				rentedlist.add(myownlibraryVO);
			}
			

		} catch (Exception e) {
			System.out.println("myrentedlist메소드 내부 오류 " + e);
		} finally {
			freeResource();
		}
		return rentedlist;
	}
	
	public int count(String id) {
		int count = 0;
		try {
			con = getConnection();
			sql = "select * from myownlibrary m join book b on(m.booknum = b.booknum)"
					+ "where m.id = ? and m.r_returndate is not null";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				count++;
			}
			

		} catch (Exception e) {
			System.out.println("count메소드 내부 오류 " + e);
		} finally {
			freeResource();
		}
		return count;
	}
	
	public int count(String id,Date sDate, Date eDate) {
		int count = 0;
		try {
			con = getConnection();
			sql = "select * from myownlibrary m join book b on(m.booknum = b.booknum)"
					+ "where m.id = ? and m.r_returndate is not null and m.rentdate  between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setDate(2, sDate);
			pstmt.setDate(3, eDate);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				count++;
			}
			

		} catch (Exception e) {
			System.out.println("count메소드 내부 오류 " + e);
		} finally {
			freeResource();
		}
		return count;
	}

	public List<myownlibraryVO> myrentedlist(String id, Date sDate, Date eDate, int pageFirst, int pageSize) {
		// TODO Auto-generated method stub
		Map list =new HashMap();		
		
		List<myownlibraryVO> rentedlist = new ArrayList<myownlibraryVO>();
		
				
		try {
			con = getConnection();
			sql = "select m.id, m.booknum, m.rentdate, m.r_returndate, m.returndate,b.title, b.writer, b.publisher, b.genre, b.bookimage from myownlibrary m join book b on(m.booknum = b.booknum)"
					+ "where m.id = ? and m.r_returndate is not null and m.rentdate  between ? and ? order by m.r_returndate desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setDate(2, sDate);
			pstmt.setDate(3, eDate);;
			pstmt.setInt(4, pageFirst);
			pstmt.setInt(5, pageSize);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				myownlibraryVO myownlibraryVO = new myownlibraryVO(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getDate(4),
						rs.getDate(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
				
				rentedlist.add(myownlibraryVO);
			}
			

		} catch (Exception e) {
			System.out.println("myrentedlist메소드 내부 오류 " + e);
		} finally {
			freeResource();
		}
		return rentedlist;
	}
	
	
	public  void updateReturnDate(String id, int booknum) {
		BookVO bookVO = new BookVO();
		myownlibraryVO myVO = new myownlibraryVO();			
		
		try {
			con = getConnection();
			sql = "update myownlibrary set returndate=DATE_ADD(returndate, INTERVAL 1 WEEK), extension=1 where id=? and booknum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, booknum);
			pstmt.executeUpdate();				
			
			
			sql = "update book set returndate=DATE_ADD(returndate, INTERVAL 1 WEEK) where id=? and booknum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, booknum);
			pstmt.executeUpdate();					
			
			
			
		} catch (Exception e) {
			System.out.println("updateReturnDate()메소드에서 예외 발생: " + e);
		} finally {
			freeResource();
		}
		
	}//updateReturnDate()메소드 끝

	
}
