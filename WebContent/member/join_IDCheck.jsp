<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		MemberDAO dao = new MemberDAO();
		int check = dao.idcheck(id);
		if(id==""){
			 %>
			 <span></span>
			 <input type="text" id ="idc" name="idc" value="1" >
			 <%
		}else if(id.length()<4 || id.length()>12){
			%>
				<span style="color:red;"><i class="fa fa-remove"></i>최소 4자리 최대 12자리 </span>
				<input type ="text" id="idc" value="1">
			<%
		}else if(id.contains("admin")){
			 %>
			 <span style="color:red;" ><i class="fa fa-remove"></i>admin은 사용 불가</span>
			 <input type ="text" id="idc" value="1">
			 <%
		}else{
			if(check == 1){
				%>
				<span style="color:red;"><i class="fa fa-remove"></i></span>
				<input type ="text" id="idc" value="1">
				<%
			}else{
				%>
				<span style="color:blue;"><i class="fa fa-check"></i></span>
				<input type ="text" id="idc" value="0">
				<%
			}
		}
	%>
</body>
</html>