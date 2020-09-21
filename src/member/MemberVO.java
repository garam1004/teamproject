package member;

import java.sql.Timestamp;

public class MemberVO {
	
	private String id;
	private String pwd;
	private String name;
	private String email;	
	private Timestamp joindate;
	private String address1;
	private String address2;
	private String address3;
	private String address4;	
	private String phone;
	private String userimage;
	
	
	
	public MemberVO() {}
	
	public MemberVO(String id, String pwd, String name, String email,  String address1,
			String address2, String address3, String address4, String phone, String userimage) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.address4 = address4;
		this.phone = phone;
		this.userimage = userimage;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public Timestamp getJoindate() {
		return joindate;
	}
	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getAddress4() {
		return address4;
	}
	public void setAddress4(String address4) {
		this.address4 = address4;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserimage() {
		return userimage;
	}
	public void setUserimage(String userimage) {
		this.userimage = userimage;
	}	
	
	
	
}
