<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_ok.jsp</title>
</head>
<jsp:useBean id="service" class="com.herbmall.member.model.MemberService" 
	scope="session"></jsp:useBean>
<body>
	<%
		//login.jsp에서 [로그인 ]버튼 클릭하면 post방식으로 submit됨
		//=> 로그인 처리 - 아이디와 비밀번호가 일치하는 데이터가 존재하는지 체크
		//1.
		request.setCharacterEncoding("utf-8");
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		String chkSaveId=request.getParameter("chkSaveId");
		
		//2.
		String msg="로그인 처리 실패", url="login.jsp";
		try{
			int result=service.procLogin(userid, pwd);
			
			//3.
			if(result==MemberService.LOGIN_OK){
				//로그인 성공한 경우
				//아이디에 해당하는 정보 조회하기
				MemberVO memberVO=service.selectMember(userid);
				
				//[1] 세션에 로그인 정보 저장
				session.setAttribute("userid", userid);
				session.setAttribute("userName", memberVO.getName());
				
				//[2]아이디 저장하기가 체크되었다면 쿠키에 아이디 저장
				Cookie ck=new Cookie("ck_userid", userid);
				ck.setPath("/");	// "/" 슬래시로 줬다는 얘기는 contextPath로 지정이 되어 /herbmall 전체가 포함됨
				if(chkSaveId !=null){	//체크하면 on, 체크하지 않으면 null
					//체크하면 쿠키에 저장
					ck.setMaxAge(1000*24*60*60);	//쿠키 유효시간 
					response.addCookie(ck);
				}else{
					//체크하지 않으면 쿠키 삭제
					ck.setMaxAge(0);	//쿠키 삭제
					response.addCookie(ck);
				}
				msg=memberVO.getName() + "님 로그인되었습니다.";
				url="../index.jsp";
			}else if(result==MemberService.DISAGREE_PWD){
				msg="비밀번호가 일치하지 않습니다.";
			}else if(result==MemberService.NONE_ID){
				msg="해당 아이디가 존재하지 않습니다.";
			}else{
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
	%>
	<jsp:forward page="../common/message.jsp"></jsp:forward>	<!-- forward : message.jsp와 request를 공유 -->
</body>
</html>
