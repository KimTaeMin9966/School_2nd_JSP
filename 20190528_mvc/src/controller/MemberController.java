package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import vo.MemberVo;

@WebServlet("*.mb")
public class MemberController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	MemberService service = new MemberService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController GET 요청");

		request.setCharacterEncoding("UTF-8");

		MemberService.loginCheck(request);

		String requestPath = request.getRequestURI();
		System.out.println("전체 요청 경로 : " + requestPath);
		String contextPath = request.getContextPath();
		System.out.println("요청 프로젝트 경로 : " + contextPath);
		String command = requestPath.substring(contextPath.length());
		System.out.println("실제 요청(command) 경로 : " + command);

		String nextPage = "";

		if (command.equals("/login.mb")) {
			System.out.println("로그인 화면 요청");
			nextPage = "/member/login.jsp";
		} else if (command.equals("/memberLogin.mb")) {
			System.out.println("로그인 처리 요청");
			if (service.memberLogin(request, response)) {
				response.sendRedirect(request.getContextPath() + "/test");
				System.out.println("로그인 성공");
			} else {
				response.sendRedirect(request.getContextPath() + "/login.mb");
				System.out.println("로그인 실패");
			}
		} else if (command.equals("/join.mb")) {
			System.out.println("회원가입 화면 요청");
			nextPage = "/member/join.jsp";
		} else if (command.equals("/memberJoin.mb")) {
			System.out.println("회원가입 처리 요청");
			service.memberJoin(request, response);
		} else if (command.equals("/info.mb")) {
			System.out.println("회원정보 요청");
			nextPage = "/member/info.jsp";
		} else if (command.equals("/logOut.mb")) {
			service.logOut(request, response);
			nextPage = "/common/main.jsp";
		} else if (command.equals("/update.mb")) {
			System.out.println("회원정보 수정 페이지 요청 ");
			nextPage = "/member/update.jsp";
		} else if (command.equals("/memberUpdate.mb")) {
			System.out.println("회원정보 수정 요청");
			service.memberUpdate(request, response);
		} else if (command.equals("/withdraw.mb")) {
			System.out.println("회원탈퇴 페이지 요청");
			nextPage = "/member/withdraw.jsp";
		} else if (command.equals("/withdrawSubmit.mb")) {
			System.out.println("회원탈퇴 요청");
			service.withdrawSubmit(request, response);
		} else if (command.equals("/findPass.mb")) {
			System.out.println("비밀번호 찾기 화면 요청!");
			nextPage = "/member/findPass.jsp";
		} else if (command.equals("/findPassSubmit.mb")) {
			System.out.println("비밀번호 찾기 메일 전송 요청!");
			service.findPassSubmit(request, response);
		} else if (command.equals("/passAccept.mb")) {
			System.out.println("코드 확인 요청");
			service.checkPassCode(request, response);
		} else if (command.equals("/changePass.mb")) {
			System.out.println("비밀번호 변경 요청");
			service.chagePass(request, response);
		} else if (command.equals("/managementPage.mb")) {
			System.out.println("회원관리 정보 페이지 요청");

			boolean isCheck = service.checkAdmin(request, response);
			if (!isCheck) return;
			
			ArrayList<MemberVo> list = service.getMemberList(request, response);
			request.setAttribute("memberList", list);
			nextPage = "/member/management.jsp";
		}

		if (nextPage != null && !nextPage.equals("")) {
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
