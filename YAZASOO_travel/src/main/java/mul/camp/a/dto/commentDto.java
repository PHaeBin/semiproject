package mul.camp.a.dto;

import java.io.Serializable;

public class commentDto implements Serializable{
	private int idx; // 글 고유번호
	private int bidx;
	private String text;
	private String regDate;
	private String id;
	private String del;
	
	public commentDto(int idx, int bidx, String text, String regDate, String id, String del) {
		super();
		this.idx = idx;
		this.bidx = bidx;
		this.text = text;
		this.regDate = regDate;
		this.id = id;
		this.del = del;
	}
	
	public commentDto(int idx, String text, String id) {
		this.idx = idx;
		this.text = text;
		this.id = id;
	}

	public commentDto() {
		
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "commentDto [idx=" + idx + ", bidx=" + bidx + ", text=" + text + ", regDate=" + regDate + ", id=" + id
				+ ", del=" + del + "]";
	}
	
}
