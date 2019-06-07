package util;

public class OraclePageMaker {

	private int page; // 현제 페이지
	private int perPage = 10; // 한번에 보여줄 게시물 수
	private int pageCount = 10; // 한번에 블럭에서 보여줄 페이지 수
	private int maxPage; // 전체 페이지 수
	private int startPage; // 페이지 블럭의 시작페이지
	private int endPage; // 페이지 블럭의 마지막 페이지
	private int listCount; // 전체 게시물 수
	private int startRow; // db 검색용 시작행의 값
	private int endRow; // db 검색용 마지막 행의 값

	public OraclePageMaker() {}

	public OraclePageMaker(int page, int listCount) {
		this.page = page;
		this.listCount = listCount;
		criteria();
	}

	public void criteria() {
		setStartPage();
		setMaxPage();
		setEndPage();
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
		criteria();
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
		criteria();
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setStartPage() {
		this.startPage = (page - 1) / this.pageCount * this.pageCount + 1;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setEndPage() {
		// int endPage = getStartPage()+(pageCount-1);
		int endPage = (page - 1) / this.pageCount * this.pageCount + this.pageCount;
		if (endPage > maxPage) endPage = maxPage;
		this.endPage = endPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage() {
		int maxPage = listCount / this.perPage;
		if (listCount % this.perPage != 0) maxPage++;
		this.maxPage = maxPage;
	}

	public int getListCount() {
		return this.listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getStartRow() {
		// (1 * 10) - (10-9) 10-9 1
		// (2 * 10) - (20-9) 20-9 11
		return (page * perPage) - (perPage - 1);
	}

	public int getEndRow() {
		return (page * perPage);
	}

	@Override
	public String toString() {
		return "OraclePageMaker [page=" + page + ", perPage=" + perPage + ", pageCount=" + pageCount + ", maxPage="
				+ maxPage + ", startPage=" + startPage + ", endPage=" + endPage + ", listCount=" + listCount
				+ ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
}
