package ReadRoom;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hopeboard.HopeDAO;
import hopeboard.HopeVO;
import member.MemberDAO;
import member.MemberVO;
@WebServlet("/ReadRoomCont/*")
public class ReadRoomCont extends HttpServlet{
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
		HttpSession session = request.getSession();
		ReadRoomDAO readRoomDAO = new ReadRoomDAO();
		if(pageInfo.equals("/roomlist.do")) {
			String id = (String)session.getAttribute("id");
			MemberDAO memberDAO = new MemberDAO();
			MemberVO memberVO = memberDAO.memberInfo(id);
			request.setAttribute("memberVO", memberVO);
			String out="";
			if(request.getAttribute("out")!=null)out+=request.getAttribute("out");
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int todayyear = year;
		if(request.getParameter("year")!=null)year = Integer.parseInt(request.getParameter("year"));
		int month = cal.get(Calendar.MONTH)+1;
		int todaymonth = month;
		if(request.getParameter("month")!=null)month = Integer.parseInt(request.getParameter("month"));
		int nextmonth = month+1;
		if(month==13) {
			year++;
			month=1;
			nextmonth=month+1;
		}
		int beformonth = month -1;
		if(month==0) {
			year--;
			month=12;
			beformonth = month -1;
		}
		int date = cal.get(Calendar.DATE);
		cal.set(year, month-1, 1);
		//해당 월의 마지막 일자
		int startDay = cal.getMinimum(java.util.Calendar.DATE);
		//년 월의 마지막 날짜 구하기
		int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
		//년 월의 1일의 요일 구하기
		int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
		int newline = 0;
		
		if(todaymonth != month || todayyear != year) {
			out += "<a href='"+request.getContextPath()+"/ReadRoomCont/roomlist.do?year="+year+"&month="+beformonth+"'>이전달</a>";
		}
		out +=year+" 년 " + month + "월";
		out +="<a href='"+request.getContextPath()+"/ReadRoomCont/roomlist.do?year="+year+"&month="+nextmonth+"'> 다음달</a>";
		out +="<table border='1' cellspacing='1' cellpadding='1' bgcolor='#FFFFFF'><tr bgcolor='#ececec'>";
		out +="<th width='150px'><div align='center'><font color='red'>일</font></div></th>";
		out +="<th width='150px'><div align='center'>월</div></th>";
		out +="<th width='150px'><div align='center'>화</div></th>";
		out +="<th width='150px'><div align='center'>수</div></th>";
		out +="<th width='150px'><div align='center'>목</div></th>";
		out +="<th width='150px'><div align='center'>금</div></th>";
		out +="<th width='150px'><div align='center'><font color='#529dbc'>토</font></div></th></tr><tr>";
		for(int i = 1 ; i < start ; i++) {
			out+="<td>&nbsp;</td>";
			newline++;
		}

		for(int i = 1 ; i <=endDay ; i++) {
			if(newline==0) {
				if(todayyear==year&&todaymonth==month&&date>i) {
					out+="<td class='a'>예약불가</td>";
				}else {
				out += "<tr><td><font color='red'>"+i+"</font><br>";
					if(readRoomDAO.getalreadyres(year,month,i,1)==1) {
					out+="<font color='red'>예약중</font><br>";
					}else{
					out+= "<a href='"+request.getContextPath()+"/ReadRoomCont/roomres.do?roomnumber=1"
						+ "&year="+year+"&month="+month+"&day="+i+"'>1번방</a><br>";
					}
					if(readRoomDAO.getalreadyres(year,month,i,2)==1) {
					out +="<font color='red'>예약중</font><br>";
					}else {
					out += "<a href='"+request.getContextPath()+"/ReadRoomCont/roomres.do?roomnumber=2"
						+ "&year="+year+"&month="+month+"&day="+i+"'>2번방</a><br>";
					}
					if(readRoomDAO.getalreadyres(year,month,i,3)==1) {
					out +="<font color='red'>예약중</font><br>";
					}else {
					out	+= "<a href='"+request.getContextPath()+"/ReadRoomCont/roomres.do?roomnumber=3"
						+ "&year="+year+"&month="+month+"&day="+i+"'>3번방</a>";
					}
					out += "</td>";
				}
				newline++;
			}else if(newline==6) {
				if(todayyear==year&&todaymonth==month&&date>i) {
					out+="<td class='a'>예약불가</td></tr>";
				}else {
				out += "<td><font color='blue'>"+i+"</font><br>";
				if(readRoomDAO.getalreadyres(year,month,i,1)==1) {
				out+="<font color='red'>예약중</font><br>";
				}else{
				out+= "<a href='"+request.getContextPath()+"/ReadRoomCont/roomres.do?roomnumber=1"
					+ "&year="+year+"&month="+month+"&day="+i+"'>1번방</a><br>";
				}
				if(readRoomDAO.getalreadyres(year,month,i,2)==1) {
				out +="<font color='red'>예약중</font><br>";
				}else {
				out += "<a href='"+request.getContextPath()+"/ReadRoomCont/roomres.do?roomnumber=2"
					+ "&year="+year+"&month="+month+"&day="+i+"'>2번방</a><br>";
				}
				if(readRoomDAO.getalreadyres(year,month,i,3)==1) {
				out +="<font color='red'>예약중</font><br>";
				}else {
				out	+= "<a href='"+request.getContextPath()+"/ReadRoomCont/roomres.do?roomnumber=3"
					+ "&year="+year+"&month="+month+"&day="+i+"'>3번방</a>";
				}
				out += "</td></tr>";
				}
				newline = 0 ;
			}else {
				if(todayyear==year&&todaymonth==month&&date>i) {
					out+="<td class='a'>예약불가</td>";
				}else {
				out += "<td>"+i+"<br>";
				if(readRoomDAO.getalreadyres(year,month,i,1)==1) {
				out+="<font color='red'>예약중</font><br>";
				}else{
				out+= "<a href='"+request.getContextPath()+"/ReadRoomCont/roomres.do?roomnumber=1"
					+ "&year="+year+"&month="+month+"&day="+i+"'>1번방</a><br>";
				}
				if(readRoomDAO.getalreadyres(year,month,i,2)==1) {
				out +="<font color='red'>예약중</font><br>";
				}else {
				out += "<a href='"+request.getContextPath()+"/ReadRoomCont/roomres.do?roomnumber=2"
					+ "&year="+year+"&month="+month+"&day="+i+"'>2번방</a><br>";
				}
				if(readRoomDAO.getalreadyres(year,month,i,3)==1) {
				out +="<font color='red'>예약중</font><br>";
				}else {
				out	+= "<a href='"+request.getContextPath()+"/ReadRoomCont/roomres.do?roomnumber=3"
					+ "&year="+year+"&month="+month+"&day="+i+"'>3번방</a>";
				}
				out += "</td>";
				}
				newline++;
			}
		}
		while(newline > 0 && newline <7) {
			out+="<td>&nbsp</td>";
			newline++;
		}
		out +="</tr></table>";
		request.setAttribute("out",out);
		
		check=0;
		pageNext="/research/readroom.jsp";
		
		}else if(pageInfo.equals("/roomres.do")){
			String msg = "";
			int roomnumber=Integer.parseInt(request.getParameter("roomnumber"));
			int year = Integer.parseInt(request.getParameter("year"));
			int month = Integer.parseInt(request.getParameter("month"));
			int day = Integer.parseInt(request.getParameter("day"));
			String id = (String)session.getAttribute("id");
			int resrvation = 1;
			ReadRoomVO readRoomVO = new ReadRoomVO(id, year, month, day, roomnumber, resrvation);
			
			int count = readRoomDAO.resrcount(id);
			int daycount = readRoomDAO.daycount(id, year, month, day);
				
			if(count==3){
				msg = "열람실 예약은 3번까지 가능합니다.";
				
			}else if(daycount==1){
				msg = "하루에 한 번만 예약할 수 있습니다.";
				
			}else{
				readRoomDAO.resrroom(readRoomVO);
				msg = "예약이 완료되었습니다.";
			}
			check=0;
			request.setAttribute("msg", msg);
			pageNext="/ReadRoomCont/roomlist.do";
			
		}else if(pageInfo.equals("/adminres.do")) {
			
			String out="";
			int total = readRoomDAO.getAdminres();

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
			List<ReadRoomVO> list = readRoomDAO.getAdminList(pageFirst, pageSize);
			out+="<div class='col-la-12'><div class='classes__pagination'>";
			if(blockFirst!=1) {
				out+="<a href='"+request.getContextPath()+"/ReadRoomCont/adminres.do?nowPage="+(blockFirst-blockSize)+"'>"
						+ "<span class='arrow_carrot-left'></span></a>";
			}
			for(int i=blockFirst; i<=blockLast; i++) {
				out +="<a href='"+request.getContextPath()+"/ReadRoomCont/adminres.do?nowPage="+i+"'>"+i+"</a>";
			}
			if(blockLast!=totalPage) {
				out+="<a href='"+request.getContextPath()+"/ReadRoomCont/adminres.do?nowPage="+(blockLast+1)+"'>"
						+ "<span class='arrow_carrot-right'></span></a>";
			}
			out+="</div></div>";
			request.getSession().setAttribute("out", out);
			request.getSession().setAttribute("list", list);
			check=1;
			pageNext =request.getContextPath()+"/admin/reslist.jsp";
		
		}
		
		
		if(check == 0 ) {
		request.getRequestDispatcher(pageNext).forward(request, response);
		}else {
			response.sendRedirect(pageNext);
		}
	}

}
