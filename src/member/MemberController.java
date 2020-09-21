package member;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


	class GoogleAuthentication extends Authenticator {
		PasswordAuthentication passAuth = new PasswordAuthentication("ansqkdtkdn1", "wjdfo7123");

		public PasswordAuthentication getPasswordAuthentication() {
			return this.passAuth;
		}
	}

@WebServlet("/member2/*")
public class MemberController extends HttpServlet{
	
	
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
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String nextPage = "";
		String action = request.getPathInfo();
		int redirect = 0 ;
		if(action.equals("/memjoin.do")) {
			MemberDAO DAO = new MemberDAO();
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");
			String phone = request.getParameter("phone");
			String userimage = "basic.jpg";
			MemberVO VO = new MemberVO(id, pwd, name, email, address1, address2, address3, address4, phone, userimage);
			DAO.insertmember(VO);
			redirect = 1 ;
			nextPage=request.getContextPath()+"/member/login.jsp";
		}else if(action.equals("/memlogin.do")) {
			MemberDAO DAO = new MemberDAO();
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String msg ="";
			int check = DAO.login(id,pwd);
			if(check ==0) {
				 msg="ID를 확인 해주세요";
				nextPage="/member/login.jsp";
			}else if(check==1) {
				msg ="PASSWORD를 확인 해주세요";
				nextPage="/member/login.jsp";
			}else {
				MemberVO VO = DAO.memberInfo(id);
				request.getSession().setAttribute("id",id);
				String name = VO.getName();
				request.getSession().setAttribute("name", name);
				String userimage = VO.getUserimage();
				request.getSession().setAttribute("userimage", userimage);
				nextPage="/index/index.jsp";
			}
			request.setAttribute("msg",msg);
		}else if(action.equals("/memconfirm.do")) {
			nextPage="/member/m_confirm.jsp";
		}else if(action.equals("/fid.do")) {
			nextPage="/member/FindID.jsp";
		}else if(action.equals("/memfid.do")) {
			MemberDAO DAO = new MemberDAO();
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			MemberVO VO = DAO.findID(name,email);
			String id = VO.getId();
			request.setAttribute("id", id);
			nextPage="/member/FindID2.jsp";
		}else if(action.equals("/fpwd.do")) {
			nextPage="/member/FindPwd.jsp";
		}else if(action.equals("/emailcheck.do")) {
			MemberDAO DAO = new MemberDAO();
			String email = request.getParameter("email");
			int check = DAO.FindEmail(email);
			request.setAttribute("check", check);
			request.setAttribute("email", email);
			if(check==1) {
			String authNum = DAO.authNum();
			boolean result = DAO.sendEmail(email, authNum);
			request.setAttribute("authNum", authNum);
			}
			nextPage="/member/EmailCheck.jsp";
		}else if(action.equals("/pwdd.do")) {
			String email = request.getParameter("email");
			request.setAttribute("email", email);
			nextPage="/member/NewPwd.jsp";
		}else if(action.equals("/pwddd.do")) {
			MemberDAO DAO = new MemberDAO();
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			DAO.changePwd(pwd,email);
			nextPage="/member/login.jsp";
		}else if(action.equals("/memlogout.do")) {
			request.getSession().invalidate();
			nextPage="/BookCon/main.do";
		}else if(action.contentEquals("/edit.do")) {
			MemberDAO DAO = new MemberDAO();
			String id = (String)request.getSession().getAttribute("id");
			MemberVO VO = DAO.memberInfo(id);
			request.setAttribute("VO",VO);
			nextPage="/mylib/edit.jsp";
		}else if(action.equals("/memedit.do")) {
			MemberDAO DAO = new MemberDAO();
			ServletContext ctx = getServletContext();
			String realPath =  ctx.getRealPath("userimage");
			int max = 10 * 1024 * 1024;
			MultipartRequest multi = new MultipartRequest(request, realPath, max, "utf-8", new DefaultFileRenamePolicy());
			Enumeration e =	multi.getFileNames();
			String f = (String)e.nextElement();
			String userimage_new = multi.getFilesystemName(f);			
			String id = multi.getParameter("id");
			String pwd = multi.getParameter("pwd");
			String name = multi.getParameter("name");
			String email = multi.getParameter("email");
			String address1 = multi.getParameter("address1");
			String address2 = multi.getParameter("address2");
			String address3 = multi.getParameter("address3");
			String address4 = multi.getParameter("address4");
			String phone = multi.getParameter("phone");
			String userimage = multi.getParameter("userimage"); //기존 프로필사진
			if(userimage_new !=null)userimage=userimage_new;
			MemberVO VO = new MemberVO(id, pwd, name, email, address1, address2, address3, address4, phone, userimage);
			DAO.updatemember(VO);
			request.getSession().setAttribute("userimage",userimage);
			nextPage="/index/index.jsp";
		}else if(action.equals("/user.do")) {
			MemberDAO DAO = new MemberDAO();
			String id = request.getParameter("id");
			id = (String)request.getSession().getAttribute("id");
			MemberVO VO = DAO.memberInfo(id);
			request.getSession().setAttribute("VO",VO);
			redirect = 1 ;
			nextPage=request.getContextPath()+"/member/user.jsp";
		}else if(action.equals("/meminfo.do")) {
			MemberDAO DAO = new MemberDAO();
			List<MemberVO> list = DAO.getmemberinfo(request.getParameter("search"));
			request.setAttribute("list", list);
			nextPage = "/admin/rentalpage.jsp";
		}else if(action.equals("/tempId.do")) {
			request.getSession().setAttribute("tempid",request.getParameter("temtid"));
			nextPage="";
		}
		if(redirect == 0 ) {
		request.getRequestDispatcher(nextPage).forward(request, response);
		}else{
		response.sendRedirect(nextPage);
		}
	}	
	
	
	
}
