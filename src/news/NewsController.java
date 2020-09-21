package news;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import sun.rmi.server.Dispatcher;

@WebServlet("/NewsCon/*")
public class NewsController extends HttpServlet {
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

		if(pageinfo.equals("/news.do")) {
			String url = "https://news.naver.com/main/list.nhn?mode=LS2D&mid=shm&sid1=105&sid2=230"; //크롤링할 url지정
			Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다
			String[] list = new String[10];
			
			try {
				doc = Jsoup.connect(url).get();
			} catch (IOException e) {
				e.printStackTrace();
			}
			//select를 이용하여 원하는 태그를 선택한다. select는 원하는 값을 가져오기 위한 중요한 기능이다.
			Elements element = doc.select("ul.type06_headline"); //div=태그 ,.sect-movie-chart=클래스명   

			//Iterator을 사용하여 하나씩 값 가져오기
			Iterator<Element> ie1 = element.select("li").iterator();

			for(int i=0; i<list.length; i++){
				list[i] = ie1.next().html()+"<br>";
				element.next();
			}
			request.setAttribute("list", list);
			

			pageNext = "/search/news.jsp";
		
			request.getRequestDispatcher(pageNext).forward(request, response);
			
		}else if(pageinfo.equals("/confer.do")) {
			String url = "https://conference.etnews.com/"; //크롤링할 url지정
			Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다
			String[] list = new String[10];
			
			try {
				doc = Jsoup.connect(url).get();
			} catch (IOException e) {
				e.printStackTrace();
			}
			//select를 이용하여 원하는 태그를 선택한다. select는 원하는 값을 가져오기 위한 중요한 기능이다.
			Elements element = doc.select("ul.conference_list"); //div=태그 ,.sect-movie-chart=클래스명   

			//Iterator을 사용하여 하나씩 값 가져오기
			Iterator<Element> ie1 = element.select("li").iterator();
			
			for(int i=0; i<list.length; i++){
				list[i] = ie1.next().html()+"<br>";
				ie1.hasNext();
			}
			request.setAttribute("list", list);
			
			pageNext="/libnews/conference.jsp";
			
			request.getRequestDispatcher(pageNext).forward(request, response);
		
		}else if(pageinfo.equals("/search.do")) {	
			String keyword = request.getParameter("key");
	    	if(keyword != null && keyword != ""){

			String url = "https://book.naver.com/search/search.nhn?query=" + keyword; //크롤링할 url지정
			Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다
			String[] list = new String[9];
			
				try {
					doc = Jsoup.connect(url).get();
				} catch (IOException e) {
					e.printStackTrace();
				}
			
			Elements element = doc.select("ul.basic"); 

			Iterator<Element> iterator1 = element.select("li").iterator(); //통합

			
				for(int i=0; i<list.length; i++){
					list[i] = iterator1.next().html()+"<br>";
				}
				request.setAttribute("list", list);
				pageNext="/search/Search.jsp";	
				request.getRequestDispatcher(pageNext).forward(request, response);
				
			}else {	
				pageNext="/search/Search.jsp";		
				request.getRequestDispatcher(pageNext).forward(request, response);
			}
		}
	
	}
	
	
}