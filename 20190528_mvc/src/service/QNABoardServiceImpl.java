package service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.QNABoardDao;
import dao.QNABoardDaoImpl;
import util.OraclePageMaker;
import vo.BoardVo;
import vo.CommentVo;

public class QNABoardServiceImpl implements QNABoardService {
	
	private static QNABoardServiceImpl boardService;
	private QNABoardServiceImpl() {}
	public static QNABoardServiceImpl getInstance() {
		if(boardService == null) {
			boardService = new QNABoardServiceImpl();
		}		
		return boardService;
	}
	
	QNABoardDao dao = QNABoardDaoImpl.getInstance();

	@Override
	public ArrayList<BoardVo> getBoardList() {
		return dao.getBoardList();
	}

	@Override
	public ArrayList<BoardVo> getBoardList(HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) page = Integer.parseInt(request.getParameter("page"));
		
		int listCount = dao.getListCount();
		
		OraclePageMaker pageMaker = new OraclePageMaker(page, listCount);
		pageMaker.setPageCount(5);
		
		request.setAttribute("pageMaker", pageMaker);
		
		return dao.getBoardList(pageMaker);
	}

	@Override
	public void boardWrite(HttpServletRequest request) {
		String saveDirectory = "/upload";
		
		try {
			String realPath = request.getSession().getServletContext().getRealPath(saveDirectory);
			System.out.println("realPath : " + realPath);
			MultipartRequest multi = new MultipartRequest(request, realPath, 1024 * 1024 * 10, "utf-8",
					new DefaultFileRenamePolicy());
			
			String file = (String) multi.getFileNames().nextElement();
			String board_file = multi.getFilesystemName(file);
			String board_file_origin = multi.getOriginalFileName(file);
			
			BoardVo board = new BoardVo(multi.getParameter("board_name"), multi.getParameter("board_pass"),
					multi.getParameter("board_title"), multi.getParameter("board_content"),
					board_file, board_file_origin);
			dao.boardWrite(board);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public BoardVo getBoardVo(HttpServletRequest request) {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		dao.updateReadCount(board_num);
		return dao.getBoardVo(board_num);
	}

	@Override
	public void fileDown(HttpServletRequest request, HttpServletResponse response) {
		try {
			String realPath = request.getSession().getServletContext().getRealPath("/upload");
			String file_name = request.getParameter("board_file");
			String filePath = realPath + File.separator + file_name;
			System.out.println("filePath : " + filePath);
			String mimeType = request.getServletContext().getMimeType(filePath);
			System.out.println("mimeType : " + mimeType);
			
			if (mimeType == null) mimeType = "application/actet-stream";
			
			response.setContentType(mimeType);
			String agent = request.getHeader("User-Agent");
			System.out.println("agent : " + agent);
			
			boolean isBrowser = (agent.indexOf("MSIE") > -1 || agent.indexOf("Trident") > -1);
			System.out.println("isBrowser : " + isBrowser);
			
			if(isBrowser) file_name = URLEncoder.encode(file_name,"utf-8").replaceAll("\\+", "%20");
			else file_name = new String(file_name.getBytes("utf-8"),"iso-8859-1");
			
			response.setHeader("Content-Disposition", "attachment; filename=" + file_name);
			ServletOutputStream out = response.getOutputStream();
			
			int numRead;
			byte[] bytes = new byte[4096];
			FileInputStream fis = new FileInputStream(filePath);
			
			while ((numRead = fis.read(bytes, 0, bytes.length)) != -1) out.write(bytes, 0, numRead);
			out.flush();
			out.close();
			fis.close();
		} catch (IOException e) { e.printStackTrace(); }
	}

	@Override
	public BoardVo boardReply(HttpServletRequest request) {
		return dao.getBoardVo(Integer.parseInt(request.getParameter("board_num")));
	}

	@Override
	public void boardReplySubmit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		BoardVo board = new BoardVo(Integer.parseInt(request.getParameter("board_num")),
				request.getParameter("board_name"), request.getParameter("board_pass"),
				request.getParameter("board_title"), request.getParameter("board_content"),
				Integer.parseInt(request.getParameter("board_re_ref")),
				Integer.parseInt(request.getParameter("board_re_lev")),
				Integer.parseInt(request.getParameter("board_re_seq")));
		
		dao.boardReplySubmit(board);
		
		response.sendRedirect("boardList.bo");
	}

	@Override
	public BoardVo getBoardVoByUpdate(HttpServletRequest request) {
		return dao.getBoardVo(Integer.parseInt(request.getParameter("board_num")));
	}

	@Override
	public void boardUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		BoardVo board = new BoardVo(Integer.parseInt(request.getParameter("board_num")),
				request.getParameter("board_name"), request.getParameter("board_pass"),
				request.getParameter("board_title"), request.getParameter("board_content"));
		
		dao.boardUpdate(board);
		
		response.sendRedirect("boardDetail.bo?board_num=" + Integer.parseInt(request.getParameter("board_num")));
	}

	@Override
	public void boardDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		boolean isSuccess = dao.boardDelete(Integer.parseInt(request.getParameter("board_num")), request.getParameter("board_pass"));

		if(isSuccess) response.sendRedirect("boardList.bo");
		else response.sendRedirect("boardDeleteFrom.bo?board_num=" + Integer.parseInt(request.getParameter("board_num")));
	}
	
	@Override
	public void insertComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommentVo commentVo = new CommentVo(Integer.parseInt(request.getParameter("board_num")),
				request.getParameter("id"), request.getParameter("name"), request.getParameter("comment_content"));
		
		boolean isSuccess = dao.insertComment(commentVo);
		
		if(isSuccess) response.sendRedirect("boardDetail.bo?board_num=" + Integer.parseInt(request.getParameter("board_num")));
		else {
			// 작성 실패
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('댓글 등록 실패');");
			out.print("history.back();");
			out.print("<script>");
		}
	}
	
	@Override
	public ArrayList<CommentVo> getCommentList(HttpServletRequest request) {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		ArrayList<CommentVo> list = dao.getCommentList(board_num);
		
		int page = 1;
		if(request.getParameter("page") != null) page = Integer.parseInt(request.getParameter("page"));
		
		int commentListCount = dao.getCommentListCount(board_num);
		
		OraclePageMaker pageMaker = new OraclePageMaker(page,commentListCount);
		pageMaker.setPerPage(5);	// 한번에 보여줄 댓글의 개수가 5
		pageMaker.setPageCount(5);  // 한번에 보여줄 페이지 블럭의 개수가 5
		request.setAttribute("pageMaker", pageMaker);
		return list;
	}
	
	@Override
	public void deleteComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		dao.deleteComment(Integer.parseInt(request.getParameter("comment_num")));
		response.sendRedirect("boardDetail.bo?board_num=" + Integer.parseInt(request.getParameter("board_num")));
	}

}
