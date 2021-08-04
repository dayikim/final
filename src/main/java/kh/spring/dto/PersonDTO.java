package kh.spring.dto;

import java.sql.Date;

public class PersonDTO {
	private int seq;
	private String id;
	private String pw;
	private String phone;
	private String email;
	private String birth;
	private String postcode;
	private String address1;
	private String address2;
	private int chargingMoney;
	private Date regDate;
	
	public PersonDTO() {}
	public PersonDTO(int seq, String id, String pw, String phone, String email,String birth, String postcode, String address1, String address2, int chargingMoney,Date regDate) {
		this.seq = seq;
		this.id = id;
		this.pw = pw;
		this.phone = phone;
		this.email = email;
		this.birth = birth;
		this.postcode = postcode;
		this.address1 = address1;
		this.address2 = address2;
		this.chargingMoney = chargingMoney;
		this.regDate = regDate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
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
	public int getChargingMoney() {
		return chargingMoney;
	}
	public void setChargingMoney(int chargingMoney) {
		this.chargingMoney = chargingMoney;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
