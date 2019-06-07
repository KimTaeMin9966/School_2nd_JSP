package vo;

import java.util.Date;

public class BoardVo {
	private int board_num;
	private String board_name;
	private String board_pass;
	private String board_title;
	private String board_content;
	private String board_file;
	private String board_file_origin;
	private int board_re_ref;
	private int board_re_lev;
	private int board_re_seq;
	private int board_readcount;
	private Date board_date;
	
	public BoardVo(int board_num, String board_name, String board_pass, String board_title, String board_content) {
		this.board_num = board_num;
		this.board_name = board_name;
		this.board_pass = board_pass;
		this.board_title = board_title;
		this.board_content = board_content;
	}

	public BoardVo(int board_num, String board_name, String board_title, int board_re_ref, int board_re_lev,
			int board_re_seq, int board_readcount, Date board_date) {
		this.board_num = board_num;
		this.board_name = board_name;
		this.board_title = board_title;
		this.board_re_ref = board_re_ref;
		this.board_re_lev = board_re_lev;
		this.board_re_seq = board_re_seq;
		this.board_readcount = board_readcount;
		this.board_date = board_date;
	}

	public BoardVo(int board_num, String board_name, String board_pass, String board_title, String board_content,
			int board_re_ref, int board_re_lev, int board_re_seq) {
		this.board_num = board_num;
		this.board_name = board_name;
		this.board_pass = board_pass;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_re_ref = board_re_ref;
		this.board_re_lev = board_re_lev;
		this.board_re_seq = board_re_seq;
	}

	public BoardVo(int board_num, String board_name, String board_title, String board_content, String board_file,
			String board_file_origin) {
		this.board_num = board_num;
		this.board_name = board_name;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
		this.board_file_origin = board_file_origin;
	}

	public BoardVo(String board_name, String board_pass, String board_title, String board_content, String board_file, String board_file_origin) {
		this.board_name = board_name;
		this.board_pass = board_pass;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
		this.board_file_origin = board_file_origin;
	}
	
	public BoardVo(int board_num, String board_name, String board_title, String board_content, String board_file,
			String board_file_origin, int board_re_ref, int board_re_lev, int board_re_seq) {
		this.board_num = board_num;
		this.board_name = board_name;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
		this.board_file_origin = board_file_origin;
		this.board_re_ref = board_re_ref;
		this.board_re_lev = board_re_lev;
		this.board_re_seq = board_re_seq;
	}

	public BoardVo(int board_num, String board_name, String board_pass, String board_title, String board_content,
			String board_file, String board_file_origin, int board_re_ref, int board_re_lev, int board_re_seq,
			int board_readcount, Date board_date) {
		this.board_num = board_num;
		this.board_name = board_name;
		this.board_pass = board_pass;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
		this.board_file_origin = board_file_origin;
		this.board_re_ref = board_re_ref;
		this.board_re_lev = board_re_lev;
		this.board_re_seq = board_re_seq;
		this.board_readcount = board_readcount;
		this.board_date = board_date;
	}
	
	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}

	public String getBoard_pass() {
		return board_pass;
	}

	public void setBoard_pass(String board_pass) {
		this.board_pass = board_pass;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_file() {
		return board_file;
	}

	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}

	public String getBoard_file_origin() {
		return board_file_origin;
	}

	public void setBoard_file_origin(String board_file_origin) {
		this.board_file_origin = board_file_origin;
	}

	public int getBoard_re_ref() {
		return board_re_ref;
	}

	public void setBoard_re_ref(int board_re_ref) {
		this.board_re_ref = board_re_ref;
	}

	public int getBoard_re_lev() {
		return board_re_lev;
	}

	public void setBoard_re_lev(int board_re_lev) {
		this.board_re_lev = board_re_lev;
	}

	public int getBoard_re_seq() {
		return board_re_seq;
	}

	public void setBoard_re_seq(int board_re_seq) {
		this.board_re_seq = board_re_seq;
	}

	public int getBoard_readcount() {
		return board_readcount;
	}

	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	@Override
	public String toString() {
		return "BoardVO [board_num=" + board_num + ", board_name=" + board_name + ", board_pass=" + board_pass
				+ ", board_title=" + board_title + ", board_content=" + board_content + ", board_file=" + board_file
				+ ", board_file_origin=" + board_file_origin + ", board_re_ref=" + board_re_ref + ", board_re_lev="
				+ board_re_lev + ", board_re_seq=" + board_re_seq + ", board_readcount=" + board_readcount
				+ ", board_date=" + board_date + "]";
	}

}
