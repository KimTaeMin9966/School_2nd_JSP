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
import service.QNABoardService;
import service.QNABoardServiceImpl;
import vo.BoardVo;
import vo.CommentVo;

@WebServlet("*.bo")
public class QNABoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	QNABoardService service = QNABoardServiceImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		MemberService.loginCheck(request);
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length() + 1);
		System.out.println("요청 URI : " + command);

		String nextPage = null;

		if (command.equals("boardList.bo")) {
			ArrayList<BoardVo> list = service.getBoardList(request);
			request.setAttribute("boardList", list);
			nextPage = "/board/qna/qna_list.jsp";
		} else if (command.equals("boardWrite.bo")) {
			nextPage = "/board/qna/qna_write.jsp";
		} else if (command.equals("boardWriteSubmit.bo")) {
			System.out.println("게시글 등록 요청");
			service.boardWrite(request);
			response.sendRedirect("boardList.bo");
		} else if (command.equals("boardDetail.bo")) {
			System.out.println("게시글 상세보기");
			BoardVo boardVo = service.getBoardVo(request);
			request.setAttribute("boardVo", boardVo);
			
			// 게시물의 comment 목록
			ArrayList<CommentVo> commentList = service.getCommentList(request);
			request.setAttribute("commentList", commentList);
			
			nextPage = "/board/qna/qna_detail.jsp";
		} else if (command.equals("boardReplyForm.bo")) {
			System.out.println("답변글 작성 화면 요청");
			BoardVo boardVo = service.boardReply(request);
			request.setAttribute("boardVo", boardVo);
			nextPage = "/board/qna/qna_reply.jsp";
		} else if (command.equals("boardReplySubmit.bo")) {
			service.boardReplySubmit(request, response);
		} else if (command.equals("boardUpdateForm.bo")) {
			System.out.println("수정 화면 요청");
			BoardVo boardVo = service.getBoardVoByUpdate(request);
			request.setAttribute("boardVo", boardVo);
			nextPage = "/board/qna/qna_update.jsp";
		} else if (command.equals("boardDeleteForm.bo")) {
			System.out.println("삭제 화면 요청");
			request.setAttribute("board_num", request.getParameter("board_num"));
			nextPage = "/board/qna/qna_delete.jsp";
		} else if (command.equals("boardUpdate.bo")) {
			System.out.println("수정처리 요청");
			service.boardUpdate(request, response);
		} else if (command.equals("boardDelete.bo")) {
			System.out.println("삭제 처리 요청");
			service.boardDelete(request, response);
		} else if (command.equals("file_down.bo")) {
			System.out.println("파일 다운로드 요청");
			service.fileDown(request, response);
		} else if(command.equals("commentWrite.bo")) {
			System.out.println("댓글 작성 요청");
			service.insertComment(request, response);
		} else if(command.equals("commentDelete.bo")) {
			System.out.println("댓글 삭제 요청");
			service.deleteComment(request, response);
		}

		if (nextPage != null && !nextPage.equals("")) {
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST 요청");
		doGet(request, response);
	}

}
