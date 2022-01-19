package mul.camp.a.dto;

import java.io.Serializable;

public class boardDto implements Serializable{
	private int idx; // 글 고유번호
	private String title;//제목
	private String content;//내용
	private String id;//작성자
	private String regDate;//작성일자
	private String text;//댓글
	private int cnt;//조회수
	private String del;//삭제여부
	private String spot;//지역
	
	public boardDto() {}

	public boardDto(String title, String content, String id, String spot) {
		super();
		this.title = title;
		this.content = content;
		this.id = id;
		this.spot = spot;
	}
	
	public boardDto(int idx, String text, String id) {
		super();
		this.idx = idx;
		this.text = text;
		this.id = id;
	}
	
	public boardDto(int idx, String title, String content, String id, String regDate, String text, int cnt, String del,
			String spot) {
		super();
		this.idx = idx;
		this.title = title;
		this.content = content;
		this.id = id;
		this.regDate = regDate;
		this.cnt = cnt;
		this.del = del;
		this.spot = spot;
		this.text = text;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public String getSpot() {
		return spot;
	}

	public void setSpot(String spot) {
		this.spot = spot;
	}

	@Override
	public String toString() {
		return "boardDto [idx=" + idx + ", title=" + title + ", content=" + content + ", id=" + id + ", regDate="
				+ regDate + ", cnt=" + cnt + ", del=" + del + ", spot=" + spot + "]";
	}
	
	
}

