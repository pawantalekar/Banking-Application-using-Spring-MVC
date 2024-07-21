package com.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Account {
	@Id
	private int id;
	private String fullName;
	private String address;
	private long aadharNO;
	private String gender;
	private String age;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getAadharNO() {
		return aadharNO;
	}
	public void setAadharNO(long aadharNO) {
		this.aadharNO = aadharNO;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	@Override
	public String toString() {
		return "Account [id=" + id + ", fullName=" + fullName + ", address=" + address + ", aadharNO=" + aadharNO
				+ ", gender=" + gender + ", age=" + age + "]";
	}
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Account(int id, String fullName, String address, long aadharNO, String gender, String age) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.address = address;
		this.aadharNO = aadharNO;
		this.gender = gender;
		this.age = age;
	}
	public void setAge(String age) {
		this.age = age;
	}

	//--------------------------------------
	
	

}
