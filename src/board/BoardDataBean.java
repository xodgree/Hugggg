package board;

import java.util.Date;	//Date를 import함.
//DB에 등록한 테이블의 컬럼들을 private변수로 등록.
public class BoardDataBean {
	private int num;
	private String name;
	private String email;
	private String passwd;
	private Date regdate;
	
	//getter setter 이용해서 가져옴.
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "BoardDataBeen [num=" + num + ", name=" + name + ", email=" + email + ", passwd=" + passwd + ", regdt="
				+ regdate + "]";
	}
	
	/*
	 The toString() 은 문자열을 반환하는 object의 대표적인 방법이다.
	 toString() 함수는 어떠한 객체를 나타내는 문자열을 return한다.
	 */
					//마우스 오른쪽-> source-> toString 누르면 됨.
	

}
