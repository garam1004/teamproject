package notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;

import bookboard.BookDAO;
@WebServlet("/notice/*")
public class notice extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String pageInfo = request.getPathInfo();
		String pageNext = ""; 
		int check = 0;
		
		if(pageInfo.equals("/morelist.do")) {
			
			noticeVO VO = new noticeVO();
			noticeDAO DAO = new noticeDAO();
			
			String id = (String)request.getSession().getAttribute("id");
			int number = 0;
			if(request.getParameter("number")!=null)number=Integer.parseInt(request.getParameter("number"));
			List<noticeVO> list = DAO.getnoticelist(id, number);
			JSONArray boardArray = new JSONArray();
			for(int i = 0; i < list.size(); i++){
				JSONObject boardInfo = new JSONObject();
				VO = list.get(i);
				SimpleDateFormat f = new SimpleDateFormat("yy.MM.dd HH:mm"); // date 형식 맞추기 위한 simpleDateFormat
				String dateString = f.format(VO.getInsertdate()); 
				boardInfo.put("id",VO.getId());
				boardInfo.put("insertdate", dateString);
				boardInfo.put("comment",VO.getComment());
				boardArray.add(boardInfo);
			}
			response.getWriter().print(boardArray);
			
		}else if(pageInfo.equals("/list.do")) {
			String id = (String)request.getSession().getAttribute("id");
			BookDAO BDAO = new BookDAO();
			BDAO.resDel();
			
			noticeDAO DAO = new noticeDAO();
			List<noticeVO> list = DAO.getnoticelist(id, 0);
			List BVO = DAO.getbook(id);
			request.setAttribute("BVO", BVO);
			request.setAttribute("list",list);
			pageNext="/mylib/notice.jsp";
			check=1;
		}
		
		if(check !=0) {
			request.getRequestDispatcher(pageNext).forward(request, response);
		}
		
	}
	
}
