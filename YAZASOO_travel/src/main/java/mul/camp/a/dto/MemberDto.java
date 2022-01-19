package mul.camp.a.dto;

import java.io.Serializable;

public class MemberDto implements Serializable{	// = 吏곷젹�솕
	private String id;	
	private String pw;
	private String pwnew;
	private String name;
	private String gender;
	private String birth;
	private String email;
	private String phone;
	private String nickName;
	private String del;
	private int auth;
	
	public MemberDto() {	
	}
	
	public MemberDto(String id, String pw, String pwnew, String name, String gender, String birth, String email, String phone,
			String nickName, String del,int auth) {
		super();
		this.id = id;
		this.pw = pw;
		this.pwnew = pwnew;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.nickName = nickName;
		this.del = del;
		this.auth = auth;
	}

	public String getPwnew() {
		return pwnew;
	}

	public void setPwnew(String pwnew) {
		this.pwnew = pwnew;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pw=" + pw + ", pwnew=" + pwnew + ", name=" + name + ", gender=" + gender
				+ ", birth=" + birth + ", email=" + email + ", phone=" + phone + ", nickName=" + nickName + ", del="
				+ del + ", auth=" + auth + "]";
	}
	
}
