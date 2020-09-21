package hopeboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HopeCon/*")
public class HopeController extends HttpServlet {
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
		int check = 0 ;
		String pageinfo = request.getPathInfo();
		String pageNext = "";			
		if(pageinfo.equals("/hopelist.do")) {			
			String search = "";
			String out="";
			HopeDAO hopeDAO = new HopeDAO();
			if(request.getParameter("search") != null)search = request.getParameter("search");
			int total = hopeDAO.getAllHopes();
			if(search != "")total = hopeDAO.getAllHopes(search);
			//페이징
			int pageSize = 10;
			int nowPage = 1;
			if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
			
			int pageFirst = (nowPage-1) * pageSize;
			int totalPage = total/pageSize + (total%pageSize==0?0:1);
			int blockSize = 3;
			int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
			int blockLast = blockFirst + blockSize -1;
			
			if(blockLast>totalPage) blockLast=totalPage;
			
			String id = (String)request.getSession().getAttribute("id");
		if(request.getSession().getAttribute("id")!=null) {	
			List<HopeVO> list = hopeDAO.getHopelist(id, pageFirst, pageSize);
			
			if(search!="")list = hopeDAO.getHopelist(id, pageFirst, pageSize, search);
			
			request.getSession().setAttribute("list", list);
		}else {
			List<HopeVO> list = hopeDAO.getHopelist(pageFirst, pageSize);
			
			if(search!="")list = hopeDAO.getHopelist(pageFirst, pageSize, search);

			request.getSession().setAttribute("list", list);
		}
			
			out+="<div class='col-la-12'><div class='classes__pagination'>";
			if(blockFirst!=1) {
				out+="<a href='"+request.getContextPath()+"/HopeCon/hopelist.do?nowPage="+(blockFirst-blockSize)+"'>"
						+ "<span class='arrow_carrot-left'></span></a>";
			}
			for(int i=blockFirst; i<=blockLast; i++) {
				out +="<a href='"+request.getContextPath()+"/HopeCon/hopelist.do?nowPage="+i+"'>"+i+"</a>";
			}
			if(blockLast!=totalPage) {
				out+="<a href='"+request.getContextPath()+"/HopeCon/hopelist.do?nowPage="+(blockLast+1)+"'>"
						+ "<span class='arrow_carrot-right'></span></a>";
			}
			out+="</div></div>";
			request.getSession().setAttribute("out", out);
			request.getSession().setAttribute("search", search);
			check = 1;
			pageNext = request.getContextPath() + "/hopebook/hopelist.jsp";
			
		}else if(pageinfo.equals("/write.do")) {
			pageNext ="/hopebook/bookWrite.jsp";
		}else if(pageinfo.equals("/insert.do")) {
			HopeVO hopeVO = new HopeVO(request.getParameter("title"),
								request.getParameter("writer"),
								request.getParameter("publisher"),
								request.getParameter("id"));
			HopeDAO hopeDAO = new HopeDAO();
			hopeDAO.insertHope(hopeVO);
			check = 1 ;
			pageNext = request.getContextPath() + "/HopeCon/hopelist.do";
			
		}else if(pageinfo.equals("/like.do")) {
			String id = (String)request.getSession().getAttribute("id");
			int num = Integer.parseInt(request.getParameter("num"));
			HopeDAO hopeDAO = new HopeDAO();
			hopeDAO.likeCount(id, num);
			
			pageNext ="/HopeCon/hopelist.do";	
		}else if(pageinfo.equals("/adminhope.do")) {			
			
			String out="";
			HopeDAO hopeDAO = new HopeDAO();
			int total = hopeDAO.getAdminHope();

			//페이징
			int pageSize = 20;
			int nowPage = 1;
			if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
			int pageFirst = (nowPage-1) * pageSize;
			int totalPage = total/pageSize + (total%pageSize==0?0:1);
			int blockSize = 10;
			int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
			int blockLast = blockFirst + blockSize -1;
			if(blockLast>totalPage) blockLast=totalPage;
			List<HopeVO> list = hopeDAO.getAdminList(pageFirst, pageSize);
			out+="<div class='col-la-12'><div class='classes__pagination'>";
			if(blockFirst!=1) {
				out+="<a href='"+request.getContextPath()+"/HopeCon/adminhope.do?nowPage="+(blockFirst-blockSize)+"'>"
						+ "<span class='arrow_carrot-left'></span></a>";
			}
			for(int i=blockFirst; i<=blockLast; i++) {
				out +="<a href='"+request.getContextPath()+"/HopeCon/adminhope.do?nowPage="+i+"'>"+i+"</a>";
			}
			if(blockLast!=totalPage) {
				out+="<a href='"+request.getContextPath()+"/HopeCon/adminhope.do?nowPage="+(blockLast+1)+"'>"
						+ "<span class='arrow_carrot-right'></span></a>";
			}
			out+="</div></div>";
			request.getSession().setAttribute("out", out);
			request.getSession().setAttribute("list", list);
			check=1;
			pageNext =request.getContextPath()+"/admin/hopebooklist.jsp";
		}
		if(check == 0 ) {
		request.getRequestDispatcher(pageNext).forward(request, response);
		}else {
			response.sendRedirect(pageNext);
		}
	}

}
