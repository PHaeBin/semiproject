package mul.camp.a.dto;

import java.io.Serializable;

public class MyParam implements Serializable {
	private String sort, ansChk, id;
	
	public MyParam() {
		
	}

	public MyParam(String sort, String ansChk, String id) {
		super();
		this.sort = sort;
		this.ansChk = ansChk;
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getAnsChk() {
		return ansChk;
	}

	public void setAnsChk(String ansChk) {
		this.ansChk = ansChk;
	}

	@Override
	public String toString() {
		return "MyParam [sort=" + sort + ", ansChk=" + ansChk + ", id=" + id + "]";
	}

}
