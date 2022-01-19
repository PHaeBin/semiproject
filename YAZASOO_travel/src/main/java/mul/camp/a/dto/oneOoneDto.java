package mul.camp.a.dto;

import java.io.Serializable;

public class oneOoneDto implements Serializable {
	private String id;
	private String qtype;
	private String qtitle;
	private String qcontent;
	private String del;
	private int idx;
	private String regdate;
	private String answerYn;
	private String answer;
	
	
	public oneOoneDto() {
	}
	
	public oneOoneDto(String id, String qtype, String qtitle, String qcontent, String del, int idx, String regdate, String answerYn, String answer) {
		this.id = id;
		this.qtype = qtype;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.del = del;
		this.idx = idx;
		this.regdate = regdate;
		this.answerYn = answerYn;
		this.answer = answer;
	}	
	
	public oneOoneDto(String id, String qtype, String qtitle, String qcontent, String del, String regdate, String answerYn, String answer) {
		this.id = id;
		this.qtype = qtype;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.del = del;
		this.regdate = regdate;
		this.answerYn = answerYn;
		this.answer = answer;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQtype() {
		return qtype;
	}
	public void setQtype(String qtype) {
		this.qtype = qtype;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	public String getAnswerYn() {
		return answerYn;
	}

	public void setAnswerYn(String answerYn) {
		this.answerYn = answerYn;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "oneOoneDto [id=" + id + ", qtype=" + qtype + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", del="
				+ del + ", idx=" + idx + ", regdate=" + regdate + ", answerYn=" + answerYn + ", answer=" + answer + "]";
	}

	
}
