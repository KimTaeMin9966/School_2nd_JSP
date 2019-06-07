package test;

public class Member2 {
	
	String name;
	String addr;
	String email;
	
	public Member2() {}

	public Member2(String name, String addr, String email) {
		this.name = name;
		this.addr = addr;
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
