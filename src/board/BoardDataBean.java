package board;

import java.util.Date;	//Date�� import��.
//DB�� ����� ���̺��� �÷����� private������ ���.
public class BoardDataBean {
	private int num;
	private String name;
	private String email;
	private String passwd;
	private Date regdate;
	
	//getter setter �̿��ؼ� ������.
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
	 The toString() �� ���ڿ��� ��ȯ�ϴ� object�� ��ǥ���� ����̴�.
	 toString() �Լ��� ��� ��ü�� ��Ÿ���� ���ڿ��� return�Ѵ�.
	 */
					//���콺 ������-> source-> toString ������ ��.
	

}
