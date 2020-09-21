package myownlibrary;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bookboard.BookDAO;
import bookboard.BookVO;
import member.MemberDAO;
import member.MemberVO;

@WebServlet("/MyCon/*")
public class myownlibraryController extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		myownlibraryDAO myDAO = new myownlibraryDAO();
		//BookDAO bookDAO = new BookDAO();
		
		String pageinfo = request.getPathInfo(); 
		String pageNext = ""; //다음에 갈 페이지
		int check = 0 ; 

		if(pageinfo.equals("/mylibrary.do")) {
			//List<BookVO> reslist = bookDAO.reslist(id);
			check=1;
			
			String id = (String) request.getSession().getAttribute("id");
			List<myownlibraryVO> rentlist = myDAO.myrentlist(id);

			
			//페이징
			int total = myDAO.count(id);
			int pageSize = 8;
			int nowPage = 1;
			if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
			int pageFirst = (nowPage-1) * pageSize;
			int totalPage = total/pageSize + (total%pageSize==0?0:1);
			int blockSize = 10;
			int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
			int blockLast = blockFirst + blockSize -1;
			if(blockLast>totalPage) blockLast=totalPage;
			
			List<myownlibraryVO> rentedlist = myDAO.myrentedlist(id,pageFirst,pageSize);
			
			java.util.Date nowdate = new java.util.Date();
			SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
			
			//request.setAttribute("reslist", reslist);
			request.getSession().setAttribute("rentlist", rentlist);
			request.getSession().setAttribute("rentedlist", rentedlist);
			request.getSession().setAttribute("nowdate", s.format(nowdate));
			request.getSession().setAttribute("blockSize", blockSize);
			request.getSession().setAttribute("blockFirst", blockFirst);
			request.getSession().setAttribute("blockLast", blockLast);
			request.getSession().setAttribute("totalPage", totalPage);
			request.getSession().setAttribute("nowPage", nowPage);
			
			pageNext=request.getContextPath()+"/mylib/mylibrary.jsp";
			
			
			
		}else if(pageinfo.equals("/mylibrary2.do")) {
			check=1;
			 
			String id = (String) request.getSession().getAttribute("id");
			List<myownlibraryVO> rentlist = myDAO.myrentlist(id);

			Date sDate = Date.valueOf(request.getParameter("sDate"));
			Date eDate = Date.valueOf(request.getParameter("eDate"));

			

			//페이징
			int total = myDAO.count(id,sDate,eDate);
			int pageSize = 8;
			int nowPage = 1;
			if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
			int pageFirst = (nowPage-1) * pageSize;
			int totalPage = total/pageSize + (total%pageSize==0?0:1);
			int blockSize = 10;
			int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
			int blockLast = blockFirst + blockSize -1;
			if(blockLast>totalPage) blockLast=totalPage;
			
			
			List<myownlibraryVO> rentedlist = myDAO.myrentedlist(id,sDate,eDate,pageFirst,pageSize);

			request.getSession().setAttribute("rentlist", rentlist);
			request.getSession().setAttribute("rentedlist", rentedlist);
			request.getSession().setAttribute("sDate", sDate);
			request.getSession().setAttribute("eDate", eDate);
			request.getSession().setAttribute("blockSize", blockSize);
			request.getSession().setAttribute("blockFirst", blockFirst);
			request.getSession().setAttribute("blockLast", blockLast);
			request.getSession().setAttribute("totalPage", totalPage);
			request.getSession().setAttribute("nowPage", nowPage);

			pageNext=request.getContextPath()+"/mylib/mylibrary.jsp";
			
		}else if(pageinfo.equals("/extension.do")) {
			
			String id = (String) request.getSession().getAttribute("id");			
			int booknum = Integer.parseInt(request.getParameter("bookNum"));
						
			myDAO.updateReturnDate(id, booknum);					
								
			
			pageNext="/MyCon/mylibrary.do";
	
		}
		
		
		
		
		if(check == 0 ) {
		request.getRequestDispatcher(pageNext).forward(request, response);
		}else {
			response.sendRedirect(pageNext);
		}
		}
}
