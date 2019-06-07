package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import dao.NoticeDao;
import dao.NoticeDaoImpl;
import util.OraclePageMaker;
import vo.NoticeVo;

public class NoticeServiceImpl implements NoticeService {

	NoticeDao dao = new NoticeDaoImpl();

	@Override
	public boolean noticeWrite(HttpServletRequest request) {
		NoticeVo NoticeVo = new NoticeVo();
		NoticeVo.setNotice_author(request.getParameter("notice_author"));
		NoticeVo.setNotice_category(request.getParameter("notice_category"));
		NoticeVo.setNotice_title(request.getParameter("notice_title"));
		NoticeVo.setNotice_content(request.getParameter("notice_content"));
		System.out.println("noticeWrite : " + NoticeVo);
		return dao.noticeWrite(NoticeVo);
	}

	@Override
	public void noticeList(HttpServletRequest request) {
		int page = 1;

		if (request.getParameter("page") != null) page = Integer.parseInt(request.getParameter("page"));

		int listCount = dao.getListCount();

		OraclePageMaker pageMaker = new OraclePageMaker(page, listCount);
		pageMaker.setPerPage(5);
		pageMaker.setPageCount(5);

		System.out.println("getNoticeList : " + pageMaker);

		ArrayList<NoticeVo> noticeList = dao.getNoticeList(pageMaker.getStartRow(), pageMaker.getEndRow());
		System.out.println("getNoticeList : " + noticeList);
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("pageMaker", pageMaker);
	}

	@Override
	public void noticeDetail(HttpServletRequest request) {
		String num = request.getParameter("notice_num");
		int notice_num = Integer.parseInt(num);
		NoticeVo notice = dao.getNoticeVo(notice_num);
		request.setAttribute("notice", notice);
	}

	@Override
	public boolean noticeUpdate(HttpServletRequest request) {
		NoticeVo notice = new NoticeVo(Integer.parseInt(request.getParameter("notice_num")),
				request.getParameter("notice_category"), request.getParameter("notice_author"),
				request.getParameter("notice_title"), request.getParameter("notice_content"));
		return dao.noticeUpdate(notice);
	}

	@Override
	public boolean noticeDelete(HttpServletRequest request) {
		return dao.noticeDelete(Integer.parseInt(request.getParameter("notice_num")));
	}

	@Override
	public void search(HttpServletRequest request) {
		int page = 1;
		
		if(request.getParameter("page") != null) page = Integer.parseInt(request.getParameter("page"));
		
		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		
		System.out.println("searchName : " + searchName);
		System.out.println("searchValue : " + searchValue);
		
		int listCount = dao.getSearchListCount(searchName, searchValue);
		System.out.println("listCount : " + listCount);
		
		OraclePageMaker pageMaker = new OraclePageMaker(page, listCount);
		pageMaker.setPerPage(5);
		pageMaker.setPageCount(2);
		
		ArrayList<NoticeVo> noticeList =  dao.getSearchNoticeList(searchName, searchValue, pageMaker);
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("pageMaker", pageMaker);
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
	}
}
