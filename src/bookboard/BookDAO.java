package bookboard;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookDAO {
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql=null;

	private Connection getConnection() throws Exception {

		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/library");
		con = ds.getConnection();
		return con;
	}

	private void freeResource() {
		
		try {
			if (rs != null)rs.close();
			if (pstmt != null)pstmt.close();
			if (con != null)con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getAllBooks() {
		int count = 0;
		try {
			con = getConnection();
			sql = "select * from book";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count++;
			}
		} catch (Exception e) {
			System.out.println("getAllBooks()메소드에서 예외 발생" + e);
		} finally {
			freeResource();
		}
		return count;

	}// getAllBooks()메소드 끝

	// 검색어값이 포함된 모든 도서 출력 + 출력된 도서 개수 구하는 메소드
	public int getAllBooks(String search, String searchField) {
		int count = 0;
		try {
			con = getConnection();
			sql = "select * from book where " + searchField + " like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count++;
			}
		} catch (Exception e) {
			System.out.println("getAllBooks()메소드에서 예외 발생" + e);
		} finally {
			freeResource();
		}
		return count;
	}// getSearchedBooks()메소드 끝

	public List<BookVO> getBooklist(String id, int pageFirst, int pageSize, String sort) {
		List<BookVO> list = new ArrayList<BookVO>();
		try {
			con = getConnection();
			sql = "select b.booknum, b.title, b.writer, b.publisher, b.genre, b.rentcount, b.bookimage, " + 
					"b.id, b.rentdate, b.returndate, b.publishdate, b.resdate, count(g.num) " + 
					"from book b join bookgood g on g.num=b.booknum " + 
					"group by b.booknum, b.title, b.writer, b.publisher, b.genre, b.rentcount, b.bookimage, " + 
					"b.id, b.rentdate, b.returndate, b.publishdate, b.resdate order by " + sort + " desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BookVO bookVO = new BookVO(rs.getInt("booknum"), rs.getString("title"), rs.getString("writer"), rs.getString("publisher"),
						rs.getString("genre"), rs.getInt("rentcount"), rs.getString("bookimage"), rs.getString("id"), rs.getDate("rentdate"),
						rs.getDate("returndate"), rs.getDate("publishdate"), rs.getDate("resdate"));
				bookVO.setGood(rs.getInt(13));
				List idlist = goodId(rs.getInt(1));
				
				for(int i=0; i<idlist.size(); i++) {
					String idc = (String)idlist.get(i);
					if(id.equals(idc)) {
						bookVO.setCheck(true);
					}
				}
				
				list.add(bookVO);
			}

		} catch (Exception e) {
			System.out.println("getBooklist메소드 내부 오류 " + e);
		} finally {
			freeResource();
		}
		return list;
	}

	public List<BookVO> getBooklist(String id, int pageFirst, int pageSize, String searchField, String search, String sort) {
		List<BookVO> list = new ArrayList<BookVO>();
		try {
			con = getConnection();
			sql = "select b.booknum, b.title, b.writer, b.publisher, b.genre, b.rentcount, b.bookimage, " + 
					"b.id, b.rentdate, b.returndate, b.publishdate, b.resdate, count(g.num) " + 
					"from book b join bookgood g on g.num=b.booknum " +
					"where " + searchField + " like ? " +
					"group by b.booknum, b.title, b.writer, b.publisher, b.genre, b.rentcount, b.bookimage, " + 
					"b.id, b.rentdate, b.returndate, b.publishdate, b.resdate order by " + sort + " desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, pageFirst);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookVO bookVO = new BookVO(rs.getInt("booknum"), rs.getString("title"), rs.getString("writer"), rs.getString("publisher"),
						rs.getString("genre"), rs.getInt("rentcount"), rs.getString("bookimage"), rs.getString("id"), rs.getDate("rentdate"),
						rs.getDate("returndate"), rs.getDate("publishdate"), rs.getDate("resdate"));
				bookVO.setGood(rs.getInt(13));
				List idlist = goodId(rs.getInt(1));
				
				for(int i=0; i<idlist.size(); i++) {
					String idc = (String)idlist.get(i);
					if(id.equals(idc)) {
						bookVO.setCheck(true);
					}
				}
				
				list.add(bookVO);
			}

		} catch (Exception e) {
			System.out.println("getBooklist메소드 내부 오류" + e);
		} finally {
			freeResource();
		}
		return list;
	}

	public List<BookVO> getBooklist(int pageFirst, int pageSize, String sort) {
		List<BookVO> list = new ArrayList<BookVO>();
		try {
			con = getConnection();
			sql = "select b.booknum, b.title, b.writer, b.publisher, b.genre, b.rentcount, b.bookimage, " + 
					"b.id, b.rentdate, b.returndate, b.publishdate, b.resdate, count(g.num) " + 
					"from book b join bookgood g on g.num=b.booknum " + 
					"group by b.booknum, b.title, b.writer, b.publisher, b.genre, b.rentcount, b.bookimage, " + 
					"b.id, b.rentdate, b.returndate, b.publishdate, b.resdate order by " + sort + " desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BookVO bookVO = new BookVO();
				bookVO.setBooknum(rs.getInt(1));
				bookVO.setTitle(rs.getString(2));
				bookVO.setWriter(rs.getString(3));
				bookVO.setPublisher(rs.getString(4));
				bookVO.setGenre(rs.getString(5));
				bookVO.setRentcount(rs.getInt(6));
				bookVO.setBookimage(rs.getString(7));
				bookVO.setId(rs.getString(8));
				bookVO.setRentdate(rs.getDate(9));
				bookVO.setReturndate(rs.getDate(10));
				bookVO.setPublishdate(rs.getDate(11));
				bookVO.setResdate(rs.getDate(12));
				
				bookVO.setGood(rs.getInt(13));
				bookVO.setCheck(true);
				list.add(bookVO);
			}

		} catch (Exception e) {
			System.out.println("getBooklist메소드 내부 오류 " + e);
		} finally {
			freeResource();
		}
		return list;
	}

	public List<BookVO> getBooklist(int pageFirst, int pageSize, String searchField, String search, String sort) {
		List<BookVO> list = new ArrayList<BookVO>();
		try {
			con = getConnection();
			sql = "select b.booknum, b.title, b.writer, b.publisher, b.genre, b.rentcount, b.bookimage, " + 
					"b.id, b.rentdate, b.returndate, b.publishdate, b.resdate, count(g.num) " + 
					"from book b join bookgood g on g.num=b.booknum " +
					"where " + searchField + " like ? " +
					"group by b.booknum, b.title, b.writer, b.publisher, b.genre, b.rentcount, b.bookimage, " + 
					"b.id, b.rentdate, b.returndate, b.publishdate, b.resdate order by " + sort + " desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, pageFirst);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookVO bookVO = new BookVO();
				bookVO.setBooknum(rs.getInt(1));
				bookVO.setTitle(rs.getString(2));
				bookVO.setWriter(rs.getString(3));
				bookVO.setPublisher(rs.getString(4));
				bookVO.setGenre(rs.getString(5));
				bookVO.setRentcount(rs.getInt(6));
				bookVO.setBookimage(rs.getString(7));
				bookVO.setId(rs.getString(8));
				bookVO.setRentdate(rs.getDate(9));
				bookVO.setReturndate(rs.getDate(10));
				bookVO.setPublishdate(rs.getDate(11));
				bookVO.setResdate(rs.getDate(12));
				bookVO.setGood(rs.getInt(13));
				bookVO.setCheck(true);
				
				list.add(bookVO);
				}
				
		} catch (Exception e) {
			System.out.println("getBooklist메소드 내부 오류" + e);
		} finally {
			freeResource();
		}
		return list;
	}

	
	
	public BookVO getBookInfo(int booknum) {
		BookVO bookVO = new BookVO();

		try {
			con = getConnection();
			sql = "select * from book where booknum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, booknum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bookVO = new BookVO(rs.getInt("booknum"), rs.getString("title"), rs.getString("writer"), rs.getString("publisher"),
						rs.getString("genre"), rs.getInt("rentcount"), rs.getString("bookimage"), rs.getString("id"), rs.getDate("rentdate"),
						rs.getDate("returndate"), rs.getDate("publishdate"), rs.getDate("resdate"));
			}

		} catch (Exception e) {
			System.out.println("getBookInfo()메소드 내부 오류" + e);
		} finally {
			freeResource();
		}
		return bookVO;
	}

	public BookVO updateRes(int bookNum, Date resDate, String id) {
		BookVO bookVO = new BookVO();

		try {
			con = getConnection();
			sql = "update book set resdate=?, id=? where booknum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1, resDate);
			pstmt.setString(2, id);
			pstmt.setInt(3, bookNum);
			pstmt.executeUpdate();
			
			sql = "select * from book where id = ? and booknum = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, bookNum);
			rs = pstmt.executeQuery();
			rs.next();
			Date resdate = rs.getDate(12);
			String title = rs.getString(2);
			
			String content = id+"님이 예약하신 ["+title+"] 책의 예약 날짜는 "+resdate+ "입니다 .";
			sql = "insert into notice(id,insertdate,comment) values(?,now(),?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, content);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("updateres메소드 내부 오류" + e);
		} finally {
			freeResource();
		}
		return bookVO;
	}

	public void insertBook(BookVO VO) {
		int num=0;
		try {
			int booknum = 0;
			con = getConnection();
			sql = "select max(booknum) from book";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				booknum = rs.getInt("max(booknum)") + 1;
			} else {
				booknum = 1;
			}
			sql = "insert into book(booknum, title, writer, publisher,  genre, bookgood,"
					+ "rentcount,  bookimage) values(?,?,?,?,?,0,0,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, booknum);
			pstmt.setString(2, VO.getTitle());
			pstmt.setString(3, VO.getWriter());
			pstmt.setString(4, VO.getPublisher());
			pstmt.setString(5, VO.getGenre());
			pstmt.setString(6, VO.getBookimage());
			pstmt.executeUpdate();
			
			sql="insert into bookgood values(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "admin"); 
			pstmt.setInt(2, booknum); 
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("insertBook메소드 내부 오류 " + e);
		} finally {
			freeResource();
		}
	}

	public void rentBook(int booknum, String rentid, String resdate) {
			
		try {
			con = getConnection();
			
			

			if (resdate == null) { // 예약일이 없을때
				sql = "update book set rentcount=rentcount+1, resdate=null, id=?, rentdate = now(),returndate=DATE_ADD(NOW(),INTERVAL 1 WEEK ) where booknum=?";
			} else { // 예약일이 있을때 반납 날짜 업데이트 안함
				sql = "update book set rentcount=rentcount+1, resdate=null, id=?, rentdate = now() where booknum=?";

			}

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rentid);
			pstmt.setInt(2, booknum);
			pstmt.executeUpdate();

			sql = "insert into myownlibrary(id,booknum,rentdate,returndate) values(?,?,now(),DATE_ADD(NOW(),INTERVAL 1 WEEK ))";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rentid);
			pstmt.setInt(2, booknum);
			pstmt.executeUpdate();
			
			sql = "select m.id , m.booknum , m.rentdate , b.returndate , b.title " + 
					"from myownlibrary m join book b on (m.booknum = b.booknum) " + 
					"where m.id =? and m.booknum = ? and m.rentdate = (select curdate()); ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, rentid);
			pstmt.setInt(2, booknum);
			rs = pstmt.executeQuery();
			rs.next();
			String id = rs.getString(1);
			booknum = rs.getInt(2);
			Date rentdate = rs.getDate(3);
			Date returndate = rs.getDate(4);
			String title = rs.getString(5);
			String content = id+"님이 빌리신 ["+title+"] 책의 빌린 날짜는 "+rentdate+"이며 반납일은 "+returndate+"입니다 .";
			sql = "insert into notice(id,insertdate,comment) values(?,now(),?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, content);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("rentBook 메소드 내부 오류" + e);
		} finally {
			freeResource();
		}

	}

	public void returnBook(int booknum, String rentid) {
		try {
			con = getConnection();
			sql = "update book set id=null, rentdate = null , returndate=null where booknum=?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, booknum);
			pstmt.executeUpdate();
			
			sql="select m.id , m.booknum , m.rentdate , b.returndate , b.title " +
					"from myownlibrary m join book b on (m.booknum = b.booknum) " +
					"where m.id =? and m.booknum = ? and m.r_returndate is null"; 
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, rentid);
			pstmt.setInt(2, booknum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			String id = rs.getString(1);
			String title = rs.getString("title");
			Date rentdate = rs.getDate("rentdate");
			String comment = id +" 님이 "+rentdate+"날 빌리신 ["+title+"] 책은 금일 반납 되었습니다 .";
			sql="insert into notice(id,insertdate,comment) values(?,now(),?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, comment);
			pstmt.executeUpdate();
			
			sql = "update myownlibrary set returndate = null, r_returndate = now() where id=? && booknum =?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rentid);
			pstmt.setInt(2, booknum);
			pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("returnBook 메소드 내부 오류" + e);
		} finally {
			freeResource();
		}
	}

	public void likeCount(String id, int booknum) {
			try {
				con = getConnection();
				sql = "insert into bookgood values(?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, booknum);
				pstmt.executeUpdate();
			}catch (Exception e) {
				System.out.println("likeCount메소드 내부 오류"+e);
			}finally {
				freeResource();
			}
		}
	
	public List goodId(int booknum) {
		List list = new ArrayList();
		try {
			Connection con2=getConnection();
			String sql2 = "select id from bookgood where num=?";
			PreparedStatement pstmt2 = con2.prepareStatement(sql2);
			pstmt2.setInt(1, booknum);
			ResultSet rs2 = pstmt2.executeQuery();
			
			while(rs2.next()) {
				list.add(rs2.getString("id"));
			}		
			rs2.close();
			pstmt2.close();
			con2.close();
		}catch (Exception e) {
			System.out.println("goodId메소드 내부 오류"+e);
		}
		return list;
	}
	
	public double getGenre(String genre, String id) {
		double count = 0;
		try {
			con = getConnection();
			sql = "select b.genre from book b join myownlibrary m on b.bookNum=m.bookNum where b.genre=? and m.id=?; ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, genre);
			pstmt.setString(2, id);
			
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count++;
				
			}
		} catch (Exception e) {
			System.out.println("getGenre()메소드에서 예외 발생" + e);
		} finally {
			freeResource();
		}
		
		return count;

	}//getGenre(String genre)메소드 끝
	
	
	public List<BookVO> getRecBooklist(int pageFirst, int pageSize) {
		List<BookVO> list = new ArrayList<BookVO>();
		try {
			con = getConnection();
			sql = "select b.booknum, b.title, b.writer, b.publisher, b.genre, b.rentcount, b.bookimage, " + 
					"b.id, b.rentdate, b.returndate, b.publishdate, b.resdate, count(g.num) " + 
					"from book b join bookgood g on g.num=b.booknum " + 
					"group by b.booknum, b.title, b.writer, b.publisher, b.genre, b.rentcount, b.bookimage, " + 
					"b.id, b.rentdate, b.returndate, b.publishdate, b.resdate order by count(g.num) desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BookVO bookVO = new BookVO(rs.getInt("booknum"), rs.getString("title"), rs.getString("writer"), rs.getString("publisher"),
						rs.getString("genre"), rs.getInt("rentcount"), rs.getString("bookimage"), rs.getString("id"), rs.getDate("rentdate"),
						rs.getDate("returndate"), rs.getDate("publishdate"), rs.getDate("resdate"));
				bookVO.setGood(rs.getInt(13));
				list.add(bookVO);
			}

		} catch (Exception e) {
			System.out.println("getRecBooklist메소드 내부 오류 " + e);
		} finally {
			freeResource();
		}
		return list;
	}//getRecBooklist()메소드 끝
		
	public List<BookVO> getPopBookList(int pageFirst, int pageSize) {
		List<BookVO> popList = new ArrayList<BookVO>();
		try {
			con = getConnection();
			sql = "select * from book order by rentcount desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookVO bookVO = new BookVO(rs.getInt("booknum"), rs.getString("title"), rs.getString("writer"), rs.getString("publisher"),
						rs.getString("genre"), rs.getInt("rentcount"), rs.getString("bookimage"), rs.getString("id"), rs.getDate("rentdate"),
						rs.getDate("returndate"), rs.getDate("publishdate"), rs.getDate("resdate"));
				popList.add(bookVO);
			}

		} catch (Exception e) {
			System.out.println("getPopBookList메소드 내부 오류 " + e);
		} finally {
			freeResource();
		}
		return popList;
	}//getPopBookList()메소드 끝

	//신간도서
	public List getNewBook(int pageFirst, int pageSize) {	
			List<BookVO> newList = new ArrayList<BookVO>();
			try {
				con = getConnection();
				sql = "select * from book order by bookNum desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, pageFirst);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					BookVO bookVO = new BookVO(rs.getInt("booknum"), rs.getString("title"), rs.getString("writer"), rs.getString("publisher"),
							rs.getString("genre"), rs.getInt("rentcount"), rs.getString("bookimage"), rs.getString("id"), rs.getDate("rentdate"),
							rs.getDate("returndate"), rs.getDate("publishdate"), rs.getDate("resdate"));
					newList.add(bookVO);
				}

			} catch (Exception e) {
				System.out.println("getNewBook메소드 내부 오류 " + e);
			} finally {
				freeResource();
			}
			return newList;
		}//getNewBook()메소드 끝

	public int rentCount(String rentid) {
		int count = 0;
		try {
			con = getConnection();
			sql="select count(rentdate) from book where id = ? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, rentid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("rentCount메소드 오류 "+ e);
		}finally {
			freeResource();
		}
		return count;
	}

	public void resDel() {
		try {
			con = getConnection();
			sql="select * from book where datediff(now(),resdate) >= 2;";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {

			int booknum = rs.getInt(1);
			String title = rs.getString(2);
			String id = rs.getString(8);
			
			sql = "update book set resdate = null, id = null where booknum = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, booknum);
			pstmt.executeUpdate();
			
			String content = id+"님이 빌리신 ["+title+"] 책의 예약하신 날짜가 2일이 넘어서  삭제 되었습니다.";
			sql = "insert into notice(id,insertdate,comment) values(?,now(),?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, content);
			pstmt.executeUpdate();
			System.out.println("예약 삭제 완료");
			}
							
		} catch (Exception e) {
			System.out.println("resDel메소드 오류 "+ e);
		}finally {
			freeResource();
		}
	
	}
	
	
	}

