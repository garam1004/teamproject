package hopeboard;

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

public class HopeDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;

	//DB연결
	private Connection getConnection() throws Exception {
		con=null;
		pstmt=null;
		rs=null;
		sql=null;
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/library");
		con = ds.getConnection();
		return con;}
	
	//자원해제 메소드
	private void freeResource() {
		try {
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}
		} catch (Exception e) {e.printStackTrace();}
	}

	//모든 책 정보 출력
	public int getAllHopes() {

		int count = 0;
		try {
			con = getConnection();
			sql = "select * from hope";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count++;
			}
		} catch (Exception e) {
			System.out.println("getAllHopes()메소드에서 예외 발생" + e);
		} finally {
			freeResource();
		}
		return count;
		
	}
	
	//검색어값이 포함된 모든 도서 출력 + 출력된 도서 개수 구하는 메소드
	public int getAllHopes(String search) {
		int count = 0;
		try {
			con = getConnection();
			sql = "select * from hope where title like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search +"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count++;
			}
		} catch (Exception e) {
			System.out.println("getAllHopes()메소드에서 예외 발생" + e);
		} finally { freeResource();}
		return count;
	}//getSearchedBooks()메소드 끝
	
	public List<HopeVO> getHopelist(String id, int pageFirst, int pageSize){

		List<HopeVO> list = new ArrayList<HopeVO>();
		try {
			con=getConnection();
			sql = "select h.num, h.title, h.writer, h.publisher, h.id, count(g.num) " + 
					"from hope h join good g on g.num=h.num " + 
					"group by h.num, h.title, h.writer, h.publisher, h.id " + 
					"order by count(g.num) desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HopeVO hopeVO = new HopeVO(rs.getInt(1),
											rs.getString(2),
											rs.getString(3),
											rs.getString(4),
											rs.getString(5));
				hopeVO.setGood(rs.getInt(6));
				List idlist = goodId(rs.getInt(1));
				
				for(int i=0; i<idlist.size(); i++) {
					String idc = (String)idlist.get(i);
					if(id.equals(idc)) {
						hopeVO.setCheck(true);
					}
				}
				
			list.add(hopeVO);
			}
			
		}catch (Exception e) {
			System.out.println("getHopelist메소드 내부 오류 "+e);
		}finally {
			freeResource();
		}
		return list;
	}
					
	public List<HopeVO> getHopelist(String id, int pageFirst, int pageSize, String search){

		List<HopeVO> list = new ArrayList<HopeVO>();
		try {
			con=getConnection();
			sql = "select h.num, h.title, h.writer, h.publisher, h.id, count(g.num) " + 
					"from hope h join good g on g.num=h.num " + 
					"where h.title like ? " +
					"group by h.num, h.title, h.writer, h.publisher, h.id " + 
					"order by count(g.num) desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, pageFirst);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HopeVO hopeVO = new HopeVO(rs.getInt(1), rs.getString(2),
										   rs.getString(3), rs.getString(4),
										   rs.getString(5));
				hopeVO.setGood(rs.getInt(6));
				List idlist = goodId(rs.getInt(1));
				
				for(int i=0; i<idlist.size(); i++) {
					String idc = (String)idlist.get(i);
					if(id.equals(idc)) {
						hopeVO.setCheck(true);
					}
				}
				
				list.add(hopeVO);
			}
			
		}catch (Exception e) {
			System.out.println("getHopelist메소드 내부 오류"+e);
		}finally {
			freeResource();
		}
		return list;
	}

	public List<HopeVO> getHopelist(int pageFirst, int pageSize){

		List<HopeVO> list = new ArrayList<HopeVO>();
		try {
			con=getConnection();
			sql = "select h.num, h.title, h.writer, h.publisher, h.id, count(g.num) " + 
					"from hope h join good g on g.num=h.num " + 
					"group by h.num, h.title, h.writer, h.publisher, h.id " + 
					"order by count(g.num) desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HopeVO hopeVO = new HopeVO(rs.getInt(1),
											rs.getString(2),
											rs.getString(3),
											rs.getString(4),
											rs.getString(5));
				hopeVO.setGood(rs.getInt(6));
				hopeVO.setCheck(true);
				
			list.add(hopeVO);
			}
			
		}catch (Exception e) {
			System.out.println("getHopelist메소드 내부 오류 "+e);
		}finally {
			freeResource();
		}
		return list;
	}
					
	public List<HopeVO> getHopelist(int pageFirst, int pageSize, String search){

		List<HopeVO> list = new ArrayList<HopeVO>();
		try {
			con=getConnection();
			sql = "select h.num, h.title, h.writer, h.publisher, h.id, count(g.num) " + 
					"from hope h join good g on g.num=h.num " + 
					"where h.title like ? " +
					"group by h.num, h.title, h.writer, h.publisher, h.id " + 
					"order by count(g.num) desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, pageFirst);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HopeVO hopeVO = new HopeVO(rs.getInt(1), rs.getString(2),
										   rs.getString(3), rs.getString(4),
										   rs.getString(5));
				hopeVO.setGood(rs.getInt(6));
				hopeVO.setCheck(true);
				list.add(hopeVO);
			}
			
		}catch (Exception e) {
			System.out.println("getHopelist메소드 내부 오류"+e);
		}finally {
			freeResource();
		}
		return list;
	}

	
	public void insertHope(HopeVO hopeVO) {	
		int num = 0;
		try {			
			con=getConnection();
			sql = "select max(num) from hope";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt(1)+1;
			}else {
				num=1;
			}
			
			sql = "insert into hope values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, hopeVO.getTitle());
			pstmt.setString(3, hopeVO.getWriter());
			pstmt.setString(4, hopeVO.getPublisher());
			pstmt.setString(5, hopeVO.getId());
			pstmt.executeUpdate();
			
			sql="insert into good values(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, hopeVO.getId());
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("insertHope메소드 내부 오류"+e);
		}finally {
			freeResource();
		}
		
	}

	public void likeCount(String id, int num) {

		try {
			con = getConnection();
			sql = "insert into good values(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("likeCount메소드 내부 오류"+e);
		}finally {
			freeResource();
		}
	}
	
	public List goodId(int num) {
		List list = new ArrayList();
		try {
			Connection con2=getConnection();
			String sql2 = "select id from good where num=?";
			PreparedStatement pstmt2 = con2.prepareStatement(sql2);
			pstmt2.setInt(1, num);
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

	public int getAdminHope() {
		int count = 0;
		try {
			con = getConnection();
			sql = "select * from hope";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count++;
			}
		} catch (Exception e) {
			System.out.println("getAdminHope()메소드에서 예외 발생" + e);
		} finally {
			freeResource();
		}
		return count;		
	}

	public List<HopeVO> getAdminList(int pageFirst, int pageSize) {
		List<HopeVO> list = new ArrayList<HopeVO>();
		try {
			con=getConnection();
			sql = "select h.num, h.title, h.writer, h.publisher, h.id, count(g.num) " + 
					"from hope h join good g on g.num=h.num " +
					"group by h.num, h.title, h.writer, h.publisher, h.id " + 
					"having count(g.num)>=10 " +
					"order by count(g.num) desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HopeVO hopeVO = new HopeVO(rs.getInt(1),
											rs.getString(2),
											rs.getString(3),
											rs.getString(4),
											rs.getString(5));
				hopeVO.setGood(rs.getInt(6));
				List idlist = goodId(rs.getInt(1));
				
			list.add(hopeVO);
			}
			
		}catch (Exception e) {
			System.out.println("getAdminList메소드 내부 오류 "+e);
		}finally {
			freeResource();
		}
		return list;
	}
	
}
