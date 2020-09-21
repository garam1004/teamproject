package bookboard;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import hopeboard.HopeDAO;

@WebServlet("/BookCon/*")
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String pageinfo = request.getPathInfo(); //전 경로 => /BoardCon/* 중 *나타냄
		String pageNext = ""; //다음에 갈 페이지
		int check = 0 ; 
		if(pageinfo.equals("/booklist.do")) {
			String sort = request.getParameter("sort");
			
			String search = "";
			String searchField = "";
			BookDAO bookDAO = new BookDAO();
			if(request.getParameter("search") != null) {
				search = request.getParameter("search");
				searchField = request.getParameter("searchField");
			}
			int total = bookDAO.getAllBooks();
			if(search != "")total = bookDAO.getAllBooks(search, searchField);
			//페이징
			int pageSize = 8;
			int nowPage = 1;
			if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
			
			int pageFirst = (nowPage-1) * pageSize;
			int totalPage = total/pageSize + (total%pageSize==0?0:1);
			int blockSize = 10;
			int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
			int blockLast = blockFirst + blockSize -1;
			
			if(blockLast>totalPage) blockLast=totalPage;
			
			String id = (String)request.getSession().getAttribute("id");
		if(request.getSession().getAttribute("id")!=null) {	
			List<BookVO> list = bookDAO.getBooklist(id, pageFirst, pageSize , sort);
			
			if(search!="")list = bookDAO.getBooklist(id, pageFirst, pageSize, searchField, search ,sort);
			
			request.getSession().setAttribute("list", list);
		}else {
			List<BookVO> list = bookDAO.getBooklist(pageFirst, pageSize , sort);
			
			if(search!="")list = bookDAO.getBooklist(pageFirst, pageSize, searchField, search ,sort);
			
			request.getSession().setAttribute("list", list);
		}
			request.setAttribute("sort", sort);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("blockFirst", blockFirst);
			request.setAttribute("blockLast", blockLast);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("searchField", searchField);
			request.setAttribute("search", search);
			
			pageNext = "/book/booklist.jsp";
			
		}else if(pageinfo.equals("/bookInfo.do")) {
			int bookNum = Integer.parseInt(request.getParameter("bookNum"));
			BookDAO bookDAO = new BookDAO();
			BookVO bookVO = new BookVO();
			bookDAO.resDel();
			bookVO = bookDAO.getBookInfo(bookNum);
			request.setAttribute("bookVO", bookVO);
			
			
			pageNext = "/book/read.jsp";
			
			
		}else if(pageinfo.equals("/bookRe.do")) {
			int bookNum = Integer.parseInt(request.getParameter("bookNum"));
			Date resDate = Date.valueOf(request.getParameter("startDate"));
			String id = request.getParameter("id");
			BookDAO bookDAO = new BookDAO();
			BookVO bookVO = new BookVO();
			bookDAO.resDel();
			bookVO = bookDAO.updateRes(bookNum, resDate, id);
			bookVO = bookDAO.getBookInfo(bookNum);
			
			
			request.setAttribute("bookVO", bookVO);
		
			pageNext = "/book/read.jsp";
			
		}else if(pageinfo.equals("/AddBook.do")) {
			BookDAO bookDAO = new BookDAO();
			
			ServletContext ctx = getServletContext();
			String realPath =  ctx.getRealPath("/bookimg/");
			int max = 10 * 1024 * 1024;
			MultipartRequest multi = new MultipartRequest(request, realPath, max, "utf-8", new DefaultFileRenamePolicy());
			String bookimage = multi.getFilesystemName("bookimage");	
			String title = multi.getParameter("title");
			String writer = multi.getParameter("writer");
			String publisher = multi.getParameter("publisher");
			String genre = multi.getParameter("genre");
			BookVO VO = new BookVO(title, writer, publisher,genre, bookimage);
			bookDAO.insertBook(VO);
			check = 1 ;
			pageNext = request.getContextPath() + "/admin/writebook.jsp";
			
		}else if(pageinfo.equals("/rentid.do")) {
			String rentid = request.getParameter("rentid");
			request.getSession().setAttribute("rentid",rentid);
			
			pageNext = "/BookCon/booklist2.do";
			
		}else if(pageinfo.equals("/booklist2.do")) { //관리자가 보는 책목록
			
			String sort = request.getParameter("sort");
			String rentid = (String) request.getSession().getAttribute("rentid");
			String search = "";
			String searchField = "";
			BookDAO bookDAO = new BookDAO();
			if(request.getParameter("search") != null) {
				search = request.getParameter("search");
				searchField = request.getParameter("searchField");
			}
			int total = bookDAO.getAllBooks();
			if(search != "")total = bookDAO.getAllBooks(search, searchField);
			//페이징
			int pageSize = 5;
			int nowPage = 1;
			if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
			
			int pageFirst = (nowPage-1) * pageSize;
			int totalPage = total/pageSize + (total%pageSize==0?0:1);
			int blockSize = 10;
			int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
			int blockLast = blockFirst + blockSize -1;
			
			if(blockLast>totalPage) blockLast=totalPage;
			
			List<BookVO> list = bookDAO.getBooklist(pageFirst, pageSize , sort);
			
			if(search!="")list = bookDAO.getBooklist(pageFirst, pageSize, searchField, search ,sort);
			
			request.setAttribute("list", list);
			
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("blockFirst", blockFirst);
			request.setAttribute("blockLast", blockLast);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("searchField", searchField);
			request.setAttribute("search", search);
			
			pageNext = "/admin/rentalpage2.jsp";
			
		}else if(pageinfo.equals("/bookRent.do")) {
			String msg = "";
			int bookNum = Integer.parseInt(request.getParameter("bookNum"));
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			String resdate = request.getParameter("resdate");
			String rentid = (String) request.getSession().getAttribute("rentid");
			BookDAO bookDAO = new BookDAO();
			int count = bookDAO.rentCount(rentid);
			
			if(count <= 2) {
				bookDAO.rentBook(bookNum,rentid,resdate);
			}else {
				msg = "책대여는 3권까지 가능합니다.";
			}
			request.setAttribute("msg", msg);
			
			pageNext = "/BookCon/booklist2.do?nowPage="+nowPage;
		}else if(pageinfo.equals("/bookReturn.do")) {

			int bookNum = Integer.parseInt(request.getParameter("bookNum"));
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));

			String rentid = (String) request.getSession().getAttribute("rentid");
			BookDAO bookDAO = new BookDAO();
			bookDAO.returnBook(bookNum,rentid);
			pageNext = "/BookCon/booklist2.do?nowPage="+nowPage;
			
		}else if(pageinfo.equals("/like.do")) {
			check=1;
			String id = (String)request.getSession().getAttribute("id");
			int booknum = Integer.parseInt(request.getParameter("bookNum"));
			String sort = request.getParameter("sort");
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			BookDAO bookDAO = new BookDAO();
			bookDAO.likeCount(id, booknum); 
			
			pageNext = request.getContextPath()+"/BookCon/booklist.do?sort="+sort+"&nowPage="+nowPage;
			
		}else if(pageinfo.equals("/bookProf.do")) {
			check=1;
			BookDAO bookDAO = new BookDAO();
				    	
			String id = (String) request.getSession().getAttribute("id");
			
	    	//내가 읽은 도서 장르 Percentage 
			double programming = bookDAO.getGenre("programming", id);
	    	double database = bookDAO.getGenre("database", id);
	    	double server = bookDAO.getGenre("server", id);
	    	double network = bookDAO.getGenre("network", id);
	    	double totalBooks = programming + database + server + network;
	    	
	    	if(totalBooks!=0) {
		    	double percentP = Math.round((programming/totalBooks) * 100);
		    	double percentD = Math.round((database/totalBooks) * 100);
		    	double percentS = Math.round((server/totalBooks) * 100);
		    	double percentN = Math.round((network/totalBooks) * 100); 
		    	request.getSession().setAttribute("percentP", percentP);
		    	request.getSession().setAttribute("percentD", percentD);
		    	request.getSession().setAttribute("percentS", percentS);
		    	request.getSession().setAttribute("percentN", percentN);
	    	}
	    		    	
	    	//추천도서1~3
	    	List list = bookDAO.getRecBooklist(0, 3);
	    
	    	request.getSession().setAttribute("list", list);
	    	
	    	pageNext = request.getContextPath()+"/mylib/readprofiling.jsp";
			
		}else if(pageinfo.equals("/main.do")) {
			check=1;
			BookDAO bookDAO = new BookDAO();
			List RecList = bookDAO.getRecBooklist(0, 2);
			List PopList = bookDAO.getPopBookList(0, 2);
			List NewList = bookDAO.getNewBook(0, 2);
			
			request.getSession().setAttribute("RecList", RecList);
			request.getSession().setAttribute("PopList", PopList);
			request.getSession().setAttribute("NewList", NewList);
			
			pageNext = request.getContextPath()+"/index/index.jsp";
			
		}
		
		
		
		if(check == 0 ) {
		request.getRequestDispatcher(pageNext).forward(request, response);
		}else {
			response.sendRedirect(pageNext);	
		}
		
		
	}

}
