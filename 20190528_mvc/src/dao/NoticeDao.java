package dao;

import java.util.ArrayList;

import util.OraclePageMaker;
import vo.NoticeVo;

public interface NoticeDao {

	// 게시물 작성
	public boolean noticeWrite(NoticeVo NoticeVo);

	// 게시물 상세보기
	public NoticeVo getNoticeVo(int notice_num);

	// 게시물 수정
	public boolean noticeUpdate(NoticeVo NoticeVo);

	// 게시물 삭제
	public boolean noticeDelete(int notice_num);

	// 게시물 리스트
	public ArrayList<NoticeVo> getNoticeList(int startRow, int endRow);

	// 등록된 게시물의 개수
	public int getListCount();

	public int getSearchListCount(String searchName, String searchValue);

	public ArrayList<NoticeVo> getSearchNoticeList(String searchName, String searchValue, OraclePageMaker pageMaker);


}
