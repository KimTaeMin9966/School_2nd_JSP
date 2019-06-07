package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import util.GoogleAuthenticator;
import vo.MemberVo;
import vo.PageInfo;

public class MemberService {

	MemberDao dao = new MemberDao();

	public boolean memberLogin(HttpServletRequest request, HttpServletResponse response) {
		boolean isLogin = false;

		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String login = request.getParameter("login");

		MemberVo member = dao.memberLogin(id, pass);

		if (member != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			if (login != null) {
				Cookie cookie = new Cookie("id", member.getId());
				cookie.setMaxAge(60 * 60 * 24 * 7);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
			isLogin = true;
		}
		return isLogin;
	}

	public void memberJoin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");

		MemberVo member = new MemberVo(id, pass, name, age, gender);

		boolean isSuccess = dao.memberJoin(member);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String url = "login.mb";
		out.println("<script>");
		if (isSuccess)out.print("alert('회원가입 성공');");
		else {
			out.print("alert('회원가입 실패');");
			url = "join.mb";
		}
		out.print("location.href='" + url + "';");
		out.println("</script>");
	}

	public static void loginCheck(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("id")) {
					String id = cookies[i].getValue();
					MemberDao dao = new MemberDao();
					MemberVo member = dao.getMemberById(id);
					if (member != null) {
						HttpSession session = request.getSession();
						session.setAttribute("member", member);
					}
				}
			}
		}
	}

	public void logOut(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("id")) {
					Cookie cookie = new Cookie("id", "");
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
					System.out.println("Cookie 삭제 완료");
				}
			}
		}
	}

	public void memberUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberVo member = new MemberVo(request.getParameter("id"), request.getParameter("pass"),
				request.getParameter("name"), Integer.parseInt(request.getParameter("age")),
				request.getParameter("gender"));
		member.setNum(Integer.parseInt(request.getParameter("num")));
		System.out.println("memberUpdate : " + member);

		boolean isUpdate = dao.memberUpdate(member);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<script>");
		String url = "update.mb";
		if (isUpdate) {
			MemberVo memberUpdate = dao.getMemberById(member.getId());
			HttpSession session = request.getSession();
			session.setAttribute("member", memberUpdate);
			url = "info.mb";
			out.print("alert('수정완료');");
		} else out.print("alert('수정실패');");
		out.print("location.href='" + url + "';");
		out.print("</script>");

	}

	public void withdrawSubmit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String tempPass = request.getParameter("tempPass");
		System.out.println("tempPass : " + tempPass);
		HttpSession session = request.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");

		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();

		writer.print("<script>");

		if (member != null && tempPass.equals(member.getPass())) {
			// 회원정보 일치 삭제 진행
			dao.deleteMember(member.getNum());

			logOut(request, response);

			writer.print("alert('회원탈퇴 완료');");
			writer.print("location.href='test';");
		} else {
			// 정보가 일치하지않음
			writer.print("alert('회원탈퇴 실패!  정보가 일치하지 않습니다.');");
			writer.print("history.go(-1);");
		}
		writer.print("</script>");
	}

	public void findPassSubmit(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String id = request.getParameter("id");

		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < 5; i++) {
			// 0 ~ 9
			int random = (int) (Math.random() * 10);
			sb.append(random);
		}

		String code = sb.toString();
		System.out.println("code : " + code);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;

		try {
			out = response.getWriter();

			boolean isCheck = dao.checkMember(id, name);

			if (!isCheck) {
				System.out.println("일치하는 정보 없음");
				throw new NullPointerException("일치하는 계정 정보가 없음");
			}

			dao.addPassCode(id, code);
			System.out.println("코드 등록 완료");

			Properties props = System.getProperties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "587");

			Authenticator authenticator = new GoogleAuthenticator();
			Session session = Session.getDefaultInstance(props, authenticator);
			Message msg = new MimeMessage(session);
			msg.setHeader("Content-Type", "text/html; charset=utf-8");
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(id));
			msg.setSubject("FIND PASS!!");
			StringBuilder mail = new StringBuilder();
			mail.append("<!DOCTYPE html>");
			mail.append("<html>");
			mail.append("<head>");
			mail.append("<meta charset='utf-8'>");
			mail.append("<title>비밀번호 찾기</title>");
			mail.append("<script>function submitPass(){window.open('','w')}</script>");
			mail.append("</head>");
			mail.append("<body>");
			mail.append("<h1>@@@ 사이트 비밀번호 찾기 이메일 인증</h1>");
			mail.append("<form action='http://192.168.0.118" + request.getContextPath() + "/passAccept.mb' method='post' onsubmit='submitPass()' target='w'>");
			mail.append("<input type='hidden' name='id' value='" + id + "' />");
			mail.append("<input type='hidden' name='code' value='" + code + "' />");
			mail.append("<input type='submit' value='이메일 인증 완료' />");
			mail.append("</form>");
			mail.append("</body>");
			mail.append("</html>");

			String content = new String(mail);
			msg.setContent(content, "text/html;charset=utf-8");
			msg.setSentDate(new Date());

			Transport.send(msg);

			out.print("<script>alert('메일이 정상적으로 전송되었습니다. 메일을 확인해주세요');");
			out.print("location.href='test'");
			out.print("</script>");

		} catch (Exception e) {
			e.printStackTrace();
			out.print("<script>alert('서비스에 문제가 있습니다. 다시 이용해주세요!');");
			out.print("location.href='login.mb'");
			out.print("</script>");
		}
	}

	public void checkPassCode(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String code = request.getParameter("code");

		System.out.println("id : " + id + " code : " + code);

		boolean isCheck = dao.checkPassCode(id, code);
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out = response.getWriter();

			if (isCheck) {
				System.out.println("일치");
				request.setAttribute("id", id);
				request.setAttribute("code", code);
				request.getRequestDispatcher("/member/changePass.jsp").forward(request, response);
			} else {
				out.print("<script>");
				out.print("alert('잘못된 요청입니다.');");
				out.print("location.href='login.mb';");
				out.print("</script>");
			}
		} catch (Exception e) {}

	}

	public void chagePass(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		String code = request.getParameter("code");
		String pass = request.getParameter("pass");

		boolean isCheck = dao.checkPassCode(id, code);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<script>");
		if (isCheck) {
			// 비밀번호 변경
			dao.changePass(id, pass);
			out.print("alert('변경  요청 처리 완료');");
		} else {
			// 정보확인 요청
			out.print("alert('올바른 접근이 아닙니다.');");
		}
		out.print("location.href='login.mb'");
		out.print("</script>");
	}

	// 관리자 확인
	public boolean checkAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		boolean isCheck = false;
		MemberVo member = (MemberVo) request.getSession().getAttribute("member");

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (member == null) {
			out.print("<script>alert('로그인 이후에 사용이 가능합니다.');</script>");
			out.print("<script>location.href='login.mb';</script>");
			return isCheck;
		}

		if (!member.getId().equals("admin")) {
			out.print("<script>alert('접근권한이 없는 사용자입니다. 관리자에게 문의하세요');</script>");
			out.print("<script>location.href='test';</script>");
			return isCheck;
		}

		isCheck = true;
		return isCheck;
	}

	// 전체 회원 목록
	public ArrayList<MemberVo> getMemberList(HttpServletRequest request, HttpServletResponse response) {
		int defaultPage = 1;
		int pageCount = 10;

		String page = request.getParameter("page");

		if (page != null) defaultPage = Integer.parseInt(page);

		int listCount = dao.getMemberListCount();
		System.out.println("전체 회원수 : " + listCount);

		int startPage = (defaultPage - 1) / pageCount * pageCount + 1;
		System.out.println("시작 페이지 번호 : " + startPage);
		int endPage = startPage + (pageCount - 1);
		System.out.println("마지막 페이지 번호 : " + endPage);
		int maxPage = (listCount - 1) / pageCount + 1;
		System.out.println("전체페이지 개수  : " + maxPage);

		if (endPage > maxPage) endPage = maxPage;

		System.out.println("수정된 endPage : " + endPage);

		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(defaultPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setListCount(listCount);

		request.setAttribute("pageInfo", pageInfo);

		return dao.getPageMemberList(defaultPage, pageCount);
	}

}
