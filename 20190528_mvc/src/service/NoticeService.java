package service;

import javax.servlet.http.HttpServletRequest;

public interface NoticeService {

	// 게시물 작성
	public boolean noticeWrite(HttpServletRequest request);

	// 게시물 목록
	public void noticeList(HttpServletRequest request);

	// 게시물 상세보기
	public void noticeDetail(HttpServletRequest request);

	// 게시물 정보 수정
	public boolean noticeUpdate(HttpServletRequest request);

	// 게시물 정보 삭제
	public boolean noticeDelete(HttpServletRequest request);

	public void search(HttpServletRequest request);

}
