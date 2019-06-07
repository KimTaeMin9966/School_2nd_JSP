package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import service.NoticeService;
import service.NoticeServiceImpl;

@WebServlet("*.do")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NoticeService service = new NoticeServiceImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		MemberService.loginCheck(request);
		
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestUri.substring(contextPath.length() + 1);
		System.out.println("공지 Controller 요청 정보 : " + command);

		String nextPage = null;

		boolean isSuccess = false;

		// 요청 처리 성공시 보여줄 화면
		String suc = "/board/notice/notice_success.jsp";
		// 요청 처리 실패 시 보여줄 화면
		String fail = "/board/notice/notice_fail.jsp";

		if (command.equals("notice.do")) {
			System.out.println("공지사항 목록 화면 요청");
			service.noticeList(request);
			nextPage = "/board/notice/notice_list.jsp";
		} else if (command.equals("noticeWriteForm.do")) {
			System.out.println("공지 작성 페이지 요청");
			nextPage = "/board/notice/notice_write.jsp";
		} else if (command.equals("noticeWrite.do")) {
			System.out.println("공지글 등록 요청");
			isSuccess = service.noticeWrite(request);
			if (isSuccess) nextPage = suc;
			else nextPage = fail;
		} else if (command.equals("noticeDetail.do")) {
			System.out.println("게시물 상세 보기 요청");
			service.noticeDetail(request);
			nextPage = "/board/notice/notice_detail.jsp";
		} else if (command.equals("noticeUpdateForm.do")) {
			System.out.println("수정 화면 요청");
			service.noticeDetail(request);
			nextPage = "/board/notice/notice_update.jsp";
		} else if (command.equals("noticeUpdate.do")) {
			System.out.println("게시물 수정요청");
			isSuccess = service.noticeUpdate(request);
			nextPage = (isSuccess) ? suc : fail;
			/*if (isSuccess) nextPage = suc;
			else nextPage = fail;*/
		} else if (command.equals("noticeDelete.do")) {
			System.out.println("게시물 삭제 요청");
			nextPage = service.noticeDelete(request) ? suc : fail;
		} else if (command.equals("noticeSearch.do")) {
			System.out.println("검색 요청");
			service.search(request);
			nextPage = "/board/notice/notice_list.jsp";
		}

		if (nextPage != null) {
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher(fail);
			rd.forward(request, response);
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
